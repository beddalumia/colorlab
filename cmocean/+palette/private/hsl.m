function Image = hsl(Image,SrcSpace)
% Convert to HSL 
switch SrcSpace
case 'hsv'
   % Convert HSV to HSL   
   MaxVal = Image(:,:,3);
   MinVal = (1 - Image(:,:,2)).*MaxVal;
   L = 0.5*(MaxVal + MinVal);
   temp = min(L,1-L);
   Image(:,:,2) = 0.5*(MaxVal - MinVal)./(temp + (temp == 0));
   Image(:,:,3) = L;
otherwise
   Image = rgb(Image,SrcSpace);  % Convert to sRGB
   % Convert sRGB to HSL
   MinVal = min(Image,[],3);
   MaxVal = max(Image,[],3);
   L = 0.5*(MaxVal + MinVal);
   temp = min(L,1-L);
   S = 0.5*(MaxVal - MinVal)./(temp + (temp == 0));
   Image(:,:,1) = rgbtohue(Image);
   Image(:,:,2) = S;
   Image(:,:,3) = L;
end
return;