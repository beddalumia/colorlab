function Image = lab(Image,SrcSpace)
% Convert to CIE L*a*b* (CIELAB)
WhitePoint = [0.950456,1,1.088754];

switch SrcSpace
case 'lab'
   return;
case 'lch'
   % Convert CIE L*CH to CIE L*ab
   C = Image(:,:,2);
   Image(:,:,2) = cos(Image(:,:,3)*pi/180).*C;  % a*
   Image(:,:,3) = sin(Image(:,:,3)*pi/180).*C;  % b*
otherwise
   Image = xyz(Image,SrcSpace);  % Convert to XYZ
   % Convert XYZ to CIE L*a*b*
   X = Image(:,:,1)/WhitePoint(1);
   Y = Image(:,:,2)/WhitePoint(2);
   Z = Image(:,:,3)/WhitePoint(3);
   fX = f(X);
   fY = f(Y);
   fZ = f(Z);
   Image(:,:,1) = 116*fY - 16;    % L*
   Image(:,:,2) = 500*(fX - fY);  % a*
   Image(:,:,3) = 200*(fY - fZ);  % b*
end
return;