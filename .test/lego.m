import palette.*

%% MIXED

set(0,'DefaultAxesColorOrder','default')
legoland('default')
save_fig('default')
set(0,'DefaultAxesColorOrder',tab20)
legoland('tab20')
save_fig('tab20')
set(0,'DefaultAxesColorOrder',brewer([],'Pastel2'))
legoland('Pastel2')
save_fig('Pastel2')
set(0,'DefaultAxesColorOrder',brewer([],'Accent'))
legoland('Accent')
save_fig('Accent')
set(0,'DefaultAxesColorOrder',brewer([],'Paired'))
legoland('Paired')
save_fig('Paired')
set(0,'DefaultAxesColorOrder',brewer([],'Set1'))
legoland('Set1')
save_fig('Set1')
set(0,'DefaultAxesColorOrder',brewer([],'Dark2'))
legoland('Dark2')
save_fig('Dark2')
set(0,'DefaultAxesColorOrder',crameri('batlowS'))
legoland('batlowS')
save_fig('batlowS')

function legoland(name)

    figure('Name',name)
    Z = max(round(membrane*24),0);
    b = bar3(Z);
    view([50 30]);
    cmap = lines(8);
    colormap([1,1,1; cmap])
    axis equal off
    for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    end
    colorbar()

end

function save_fig(name)
    file = ['lego_',name,'.png'];
    res  = '-r228.3298'; % -> 1080px wide
    export_fig(file,res);
end