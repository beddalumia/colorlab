function Rp = gammacorrection(R)
Rp = zeros(size(R));
i = (R <= 0.0031306684425005883);
Rp(i) = 12.92*R(i);
Rp(~i) = real(1.055*R(~i).^0.416666666666666667 - 0.055);
return;