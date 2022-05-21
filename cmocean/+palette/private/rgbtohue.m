function H = rgbtohue(Image)
% Convert RGB to HSV or HSL hue
[M,i] = sort(Image,3);
i = i(:,:,3);
Delta = M(:,:,3) - M(:,:,1);
Delta = Delta + (Delta == 0);
R = Image(:,:,1);
G = Image(:,:,2);
B = Image(:,:,3);
H = zeros(size(R));
k = (i == 1);
H(k) = (G(k) - B(k))./Delta(k);
k = (i == 2);
H(k) = 2 + (B(k) - R(k))./Delta(k);
k = (i == 3);
H(k) = 4 + (R(k) - G(k))./Delta(k);
H = 60*H + 360*(H < 0);
H(Delta == 0) = nan;
return;