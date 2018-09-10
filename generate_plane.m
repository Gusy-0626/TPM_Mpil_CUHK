%%
clc;
clear;

%% planes
stepz = 7;
Points = cube(38, 0, 0, 3, 3, 1, 1, 1, stepz);

% plot3(Points(:,1),Points(:,2),Points(:,3),'ro');
% set(gcf,'color','w');
% set(gca,'FontSize',20)
% xlabel('X/\mum', 'FontSize', 20);
% ylabel('Y/\mum', 'FontSize', 20);
% zlabel('Z/\mum', 'FontSize', 20);
% axis equal;

%%
Path_File = 'D:\test\';
suffixChar = 'C';

% image = TrajectoryByPoints_3000_withcor_withoutblack(Points, Path_File, suffixChar);
image = TrajectoryByPoints_3000_withcor_withoutblack(Points, [0,0,0]);