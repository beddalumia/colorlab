n=3000;
[R,T]=ndgrid(linspace(0,1,n),linspace(-2,20*pi,n));
x=1-(.5)*((5/4)*(1-mod(3.6*T,2*pi)/pi).^2-.25).^2;
U=2*exp(-T/(8*pi));L=sin(U);J=cos(U);
y=1.99*(R.^2).*(1.2*R-1).^2.*L;
K=x.*(R.*L+y.*J);X=K.*sin(T);
Y=K.*cos(T);Z=x.*(R.*J-y.*L);
surf(X,Y,Z,'LineStyle','none');
grid,axis('off','equal');


addpath ../../colorlab/
colorlab.enter
import palette.*

colormap(magma)
save_fig magma 

colormap(cubehelix)
save_fig helix

colormap(crameri('batlow'))
save_fig wales


function save_fig(name)
    file = [name,'.png'];
    res  = '-r228.3298'; % -> 1080px wide
    pad  = '-p0.20000';
    %export_fig(file,res,pad);
end