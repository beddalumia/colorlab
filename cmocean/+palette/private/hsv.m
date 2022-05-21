function Image = hsv(Image,SrcSpace)
% Convert to HSV
Image = rgb(Image,SrcSpace);
V = max(Image,[],3);
S = (V - min(Image,[],3))./(V + (V == 0));
Image(:,:,1) = rgbtohue(Image);
Image(:,:,2) = S;
Image(:,:,3) = V;
return;