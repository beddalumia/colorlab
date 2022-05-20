function N = cmDefaultN()
% Get the colormap size from the current figure or default colormap.
    try
        F = get(groot,'CurrentFigure');
    catch %#ok<CTCH> pre HG2
        N = size(get(gcf,'colormap'),1);
        return
    end
    if isempty(F)
        N = size(get(groot,'DefaultFigureColormap'),1);
    else
        N = size(F.Colormap,1);
    end
end
