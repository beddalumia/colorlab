clearvars

%figure('color','k')

%tree(0,0,90,10)
%axis equal off 

import plotDMFT.colorlab.*
set(0,'DefaultAxesColorOrder',palette.tab20)

for j = 1:10
    for i=1:1000
        xclip(i) = clipgauss();
        yclip(i) = clipgauss();
        xnorm(i) = randn();
        ynorm(i) = randn();
        xrand(i) = -rand();
        yrand(i) = -rand();
    end
    hold on
    scatter(xnorm,ynorm,'filled');
    %scatter(xclip,yclip,'filled');
    %scatter(xrand,yrand,'filled');
    axis equal off
    set(gcf,'Color','k')
end
    




function tree(x1,y1,t,d)
x2=x1+cosd(t)*d;
y2=y1+sind(t)*d;
if d~=0
line([x1 x2],[y1 y2],'color',clipgauss(1,3),'LineWidth',2);
tree(x2,y2,t+20,d-1);
tree(x2,y2,t-20,d-1);
end
end

function tensor = clipgauss(varargin)
    
    % Generate Gaussian
    tensor = randn(varargin{:});
    % Only Potivie Axis
    tensor = abs(tensor);
    % Clip Inside Unit Circle
    tensor(tensor > 1) = rand;
end