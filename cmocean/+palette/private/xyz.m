function Image = xyz(Image,SrcSpace)
% Convert to CIE XYZ from 'SrcSpace'
WhitePoint = [0.950456,1,1.088754];  
switch SrcSpace
case 'xyz'
   return;
case 'luv'
   % Convert CIE L*uv to XYZ
   WhitePointU = (4*WhitePoint(1))./(WhitePoint(1) + 15*WhitePoint(2) + 3*WhitePoint(3));
   WhitePointV = (9*WhitePoint(2))./(WhitePoint(1) + 15*WhitePoint(2) + 3*WhitePoint(3));
   L = Image(:,:,1);
   Y = (L + 16)/116;
   Y = invf(Y)*WhitePoint(2);
   U = Image(:,:,2)./(13*L + 1e-6*(L==0)) + WhitePointU;
   V = Image(:,:,3)./(13*L + 1e-6*(L==0)) + WhitePointV;
   Image(:,:,1) = -(9*Y.*U)./((U-4).*V - U.*V);                  % X
   Image(:,:,2) = Y;                                             % Y
   Image(:,:,3) = (9*Y - (15*V.*Y) - (V.*Image(:,:,1)))./(3*V);  % Z
case {'lab','lch'}
   Image = lab(Image,SrcSpace);
   % Convert CIE L*ab to XYZ
   fY = (Image(:,:,1) + 16)/116;
   fX = fY + Image(:,:,2)/500;
   fZ = fY - Image(:,:,3)/200;
   Image(:,:,1) = WhitePoint(1)*invf(fX);  % X
   Image(:,:,2) = WhitePoint(2)*invf(fY);  % Y
   Image(:,:,3) = WhitePoint(3)*invf(fZ);  % Z
case 'cat02lms'
    % Convert CAT02 LMS to XYZ
   T = inv([0.7328, 0.4296, -0.1624;-0.7036, 1.6975, 0.0061; 0.0030, 0.0136, 0.9834]);
   L = Image(:,:,1);
   M = Image(:,:,2);
   S = Image(:,:,3);
   Image(:,:,1) = T(1)*L + T(4)*M + T(7)*S;  % X 
   Image(:,:,2) = T(2)*L + T(5)*M + T(8)*S;  % Y
   Image(:,:,3) = T(3)*L + T(6)*M + T(9)*S;  % Z
otherwise   % Convert from some gamma-corrected space
   % Convert to sRGB
   Image = rgb(Image,SrcSpace);
   % Undo gamma correction
   R = invgammacorrection(Image(:,:,1));
   G = invgammacorrection(Image(:,:,2));
   B = invgammacorrection(Image(:,:,3));
   % Convert RGB to XYZ
   T = inv([3.2406, -1.5372, -0.4986; -0.9689, 1.8758, 0.0415; 0.0557, -0.2040, 1.057]);
   Image(:,:,1) = T(1)*R + T(4)*G + T(7)*B;  % X 
   Image(:,:,2) = T(2)*R + T(5)*G + T(8)*B;  % Y
   Image(:,:,3) = T(3)*R + T(6)*G + T(9)*B;  % Z
end
return;