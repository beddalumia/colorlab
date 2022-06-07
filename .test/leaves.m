t=0:0.01:pi;
r=@rand;
c=@(f)cos(f*t);
s=@(f)sin(f*t);
hold on
for i=1:300
x=.01*c(1).^9.*c(5).^10+s(2)/4.*(1-s(10).^2/2).*(1-(c(1).*c(3)).^8);
y=s(1).*(1-s(10).^2/5.*(.5+s(2).^2))-.5;
rotate(fill(r()*5+x,r()*5+y,r(),'Linewidth',1),[0 0 1],r()*360);
end
axis equal off
colorlab.enter
import palette.crameri
colormap autumn
pause
crameri lajollaS
set(gca,'Pos',[0 0 1 1])