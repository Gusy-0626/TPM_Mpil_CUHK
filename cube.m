function Points_Cube = cube(Central_X, Central_Y, Base_Z, Len_X, Len_Y, Len_Z, Step_X, Step_Y, Step_Z)
% All in unit micron
% Parameters: Central_X, Central_Y, Base_Z, Len_X, Len_Y, Len_Z, Step_X, Step_Y, Step_Z
% Central_X, Central_Y, Base_Z are the reference points. 

PointsNum_X = Len_X/Step_X;
PointsNum_Y = Len_Y/Step_Y;

%For z, PointsNum_Z need to be equal or greater than 1.
if Len_Z<Step_Z
     PointsNum_Z = 1;
else     
     PointsNum_Z = Len_Z/Step_Z;
end

if PointsNum_X > 1
    StartPoint_X = Central_X - Len_X/2;
else 
    StartPoint_X = Central_X;
end

if PointsNum_Y > 1
    StartPoint_Y = Central_Y - Len_Y/2;
else 
    StartPoint_Y = Central_Y;
end

StartPoint_Z = Base_Z;

Num_Row = PointsNum_X * PointsNum_Y * PointsNum_Z;
Points_Cube = zeros(Num_Row, 3);
i = 1;
for t0 = 1:PointsNum_Z
    z = StartPoint_Z + Step_Z*(t0-1);
    
    for t1=1:PointsNum_Y
        y = StartPoint_Y + Step_Y*(t1-1);
        
        for t2=1:PointsNum_X
            x = StartPoint_X + Step_X*(t2-1);
            Points_Cube(i,:) = [x y z];
            i = i+1;       
        end
    end
    
   
end