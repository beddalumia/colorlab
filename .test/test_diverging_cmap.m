build_diverging_colormaps()

function build_diverging_colormaps()

    disp('TESTING diverging_cmap [also str2rgb]')

    colorlab.enter
    close all
    clear

    map1 = diverging_cmap('matlab1','matlab2');
    cols = lines(2);
    map2 = diverging_cmap(cols(1,:),cols(2,:));
    assert(isequal(map1,map2));

    mapN = diverging_cmap('pyplot1','strawberry',16);
    [X,Y,Z] = peaks(50);
    surf(X,Y,Z); colormap(mapN);

    % Near colors
    diverging_cmap('pyplot1','matlab1'); 
    diverging_cmap('g','y');

    % Extreme case
    diverging_cmap('w','k');

    close(gcf)

    disp('>> All good!')
    disp('------------')

end