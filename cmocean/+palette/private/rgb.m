function Image = rgb(Image,SrcSpace)
% Convert to sRGB from 'SrcSpace'
switch SrcSpace
case 'rgb'
   return;
case 'hsv'
   % Convert HSV to sRGB
   Image = huetorgb((1 - Image(:,:,2)).*Image(:,:,3),Image(:,:,3),Image(:,:,1));
case 'hsl'
   % Convert HSL to sRGB
   L = Image(:,:,3);
   Delta = Image(:,:,2).*min(L,1-L);
   Image = huetorgb(L-Delta,L+Delta,Image(:,:,1));
case {'xyz','lab','luv','lch','cat02lms'}
   % Convert to CIE XYZ
   Image = xyz(Image,SrcSpace);
   % Convert XYZ to RGB
   T = [3.2406, -1.5372, -0.4986; -0.9689, 1.8758, 0.0415; 0.0557, -0.2040, 1.057];
   R = T(1)*Image(:,:,1) + T(4)*Image(:,:,2) + T(7)*Image(:,:,3);  % R
   G = T(2)*Image(:,:,1) + T(5)*Image(:,:,2) + T(8)*Image(:,:,3);  % G
   B = T(3)*Image(:,:,1) + T(6)*Image(:,:,2) + T(9)*Image(:,:,3);  % B
   % Desaturate and rescale to constrain resulting RGB values to [0,1]   
   AddWhite = -min(min(min(R,G),B),0);
   R = R + AddWhite;
   G = G + AddWhite;
   B = B + AddWhite;
   % Apply gamma correction to convert linear RGB to sRGB
   Image(:,:,1) = gammacorrection(R);  % R'
   Image(:,:,2) = gammacorrection(G);  % G'
   Image(:,:,3) = gammacorrection(B);  % B'
otherwise  % Conversion is through an affine transform
   T = gettransform(SrcSpace);
   temp = inv(T(:,1:3));
   T = [temp,-temp*T(:,4)];
   R = T(1)*Image(:,:,1) + T(4)*Image(:,:,2) + T(7)*Image(:,:,3) + T(10);
   G = T(2)*Image(:,:,1) + T(5)*Image(:,:,2) + T(8)*Image(:,:,3) + T(11);
   B = T(3)*Image(:,:,1) + T(6)*Image(:,:,2) + T(9)*Image(:,:,3) + T(12);
   Image(:,:,1) = R;
   Image(:,:,2) = G;
   Image(:,:,3) = B;
end
% Clip to [0,1]
Image = min(max(Image,0),1);
return;