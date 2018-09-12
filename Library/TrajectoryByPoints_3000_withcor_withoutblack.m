function bigPic = TrajectoryByPoints_3000_withcor_withoutblack(Points,Order,Amp,WCMode) 
%%
% 'Points' is an array with a dimension of Num*3. All the points need to be
% fabricated are contained in the 'Points' array.

%% Initial parameters

%radius of light spot on DMD
wf_r = 4*10^-3;

% wavelength, nm
wl = 780*10^-9; 

% spherical wavefront, for beam shaping, you can replace it by other functions
% P, optical power, equals to 1/f, unit m^-1
fi = @(x,y,P) pi*(x.^2+y.^2).*(-P)./wl;

% control the width of the fringes
q = 1;

% pixels of the DMD
m = 1024; n = 768;

% size of a pixel, um
pSize = 13.68*10^-6;

[row,col] = meshgrid(1:m,1:n);

% original point where x=0, y=0, z=0
% u, v, P are x and y diretion's spatial frequency of DMD pattern, and  optical power, respectively
u0 = 0.1;
v0 = 0;
P0 = 0;


%% scanning trajactories 2
% under the system in area 39 lab328, the x scan range is (0 um ,83 um), y scan range is (-106 um ,106 um),z scan range is (-40 um ,40 um)

% The unit is micron for the positions.
 [Num, Useless] = size(Points);


 
bigPic = zeros(768 * Num, 128, 'uint8');


pic_cnt_pack = 0;

%total_pack=20
%suffixChar = 'C';

%Zernike mode
[theta,r] = cart2pol((row-(m+1)/2)*pSize/wf_r,(col-(n+1)/2)*pSize/wf_r);
Zer = [2,-2;2,2;3,-1;3,1;4,0;3,-3;3,3;2,0;4,-2;4,2;4,-4;4,4;5,-1;5,1;5,-3;5,3;5,-5;5,5;6,0;6,-2;6,2;6,-4;6,4;6,-6;6,6];
cor = zeros(n,m);

if WCMode ==2
    for Zerorder = 1:size(Amp')
        if Zerorder ==3
            cor = cor + 2*Amp(3)*zernfun(1,-1,r,theta,'norm')-0.3*Amp(3)*zernfun(2,0,r,theta,'norm')+Amp(3)*zernfun(3,-1,r,theta,'norm');
        else if Zerorder ==4
                cor = cor + 2*Amp(4)*zernfun(1,1,r,theta,'norm')-0.7*Amp(4)*zernfun(2,0,r,theta,'norm')+Amp(4)*zernfun(3,1,r,theta,'norm');
            else if Zerorder == 5
                    cor = cor + 2.8*Amp(5)*zernfun(2,0,r,theta,'norm')+Amp(5)*zernfun(4,0,r,theta,'norm');
                else
                cor = cor + Amp(Zerorder)*zernfun(Zer(Zerorder,1),Zer(Zerorder,2),r,theta,'norm');
                end
            end
        end
        
       
       
    end
else if WCMode ==3
        if Order ==3
            cor = 2*Amp*zernfun(1,-1,r,theta,'norm')-0.3*Amp*zernfun(2,0,r,theta,'norm')+Amp*zernfun(3,-1,r,theta,'norm');
        else if Order ==4
                cor = 2*Amp*zernfun(1,1,r,theta,'norm')-0.7*Amp*zernfun(2,0,r,theta,'norm')+Amp*zernfun(3,1,r,theta,'norm');
            else if Order == 5
                    cor = 2.8*Amp*zernfun(2,0,r,theta,'norm')+Amp*zernfun(4,0,r,theta,'norm');
                else
                cor = Amp*zernfun(Zer(Order,1),Zer(Order,2),r,theta,'norm');
                end
            end
        end
    
    else
    end
end
    
for t=1:Num
        x = Points(t,1);
        y = Points(t,2);
        z = Points(t,3);
% accordingly parameters
%         u = x/206.79;
%         v = y/206.79;
%         P = z/38;
        
         u = x/199.05;
         v = y/199.05;
         P = z/32.50;

% desired grating spatial frequency for X and Y direction
        FreX = u+u0;
        FreY = v+v0;

% calculate grating period for X0 and Y0 direction
        FreX0 = (FreX-FreY)/2;
        FreY0 = (FreX+FreY)/2;

% tilted phase 
        X0 = col*FreX0;
        Y0 = row*FreY0;

        XY = (X0+ Y0);

% computer spherical wavefront
       A = fi((row-(m+1)/2)*pSize,(col-(n+1)/2)*pSize,P+P0);
%         A = 0;
  

% add titled phase
        C = A./(2*pi)+cor+ XY;
%         C= A+XY;
        M = C-floor(C);
        Mf = abs(M);

% according to the Lee Holography
        Mf(Mf < q/2) = 0;
        Mf(Mf >= q/2) = 1;
        R = 1-Mf;

% transfer to DLP4100 required mode
       stride=128;
       im = uint8(zeros(n,stride));
        for ij=1:stride
               im(:,ij)=128*R(:,8*ij-7)+64*R(:,8*ij-6)+32*R(:,8*ij-5)+16*R(:,8*ij-4)+8*R(:,8*ij-3)+4*R(:,8*ij-2)+2*R(:,8*ij-1)+R(:,8*ij);
        end

% save each binary patterns as bmp file, each file is around 96 KB
    
        
        pic_cnt_pack = pic_cnt_pack + 1;
        
        bigPic(((pic_cnt_pack - 1) * 768 + 1) : pic_cnt_pack * 768, :) = im;

end      




%% Mr.Geng's code
%% Modified by Mindan