import palette.*

%% MIXED

set(0,'DefaultAxesColorOrder','default')
legoland('default')
set(0,'DefaultAxesColorOrder',tab20)
legoland('tab20')
set(0,'DefaultAxesColorOrder',brewer([],'Pastel2'))
legoland('Pastel2')
set(0,'DefaultAxesColorOrder',brewer([],'Accent'))
legoland('Accent')
set(0,'DefaultAxesColorOrder',brewer([],'Paired'))
legoland('Paired')
set(0,'DefaultAxesColorOrder',brewer([],'Set1'))
legoland('Set1')
set(0,'DefaultAxesColorOrder',brewer([],'Dark2'))
legoland('Dark2')
set(0,'DefaultAxesColorOrder',crameri('batlowS'))
legoland('batlowS')

function legoland(name)

    figure('Name',name)
    Z = max(round(membrane*24),0);
    b = bar3(Z);
    view([35 30]);
    cmap = lines(8);
    colormap([1,1,1; cmap])
    axis equal off
    for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    end
    colorbar()

end