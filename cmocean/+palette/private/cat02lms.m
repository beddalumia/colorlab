function Image = cat02lms(Image,SrcSpace)
% Convert to CAT02 LMS
Image = xyz(Image,SrcSpace);
T = [0.7328, 0.4296, -0.1624;-0.7036, 1.6975, 0.0061; 0.0030, 0.0136, 0.9834];
X = Image(:,:,1);
Y = Image(:,:,2);
Z = Image(:,:,3);
Image(:,:,1) = T(1)*X + T(4)*Y + T(7)*Z;  % L
Image(:,:,2) = T(2)*X + T(5)*Y + T(8)*Z;  % M
Image(:,:,3) = T(3)*X + T(6)*Y + T(9)*Z;  % S
return;