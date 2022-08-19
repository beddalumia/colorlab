function test_worldmaps()

    disp('TESTING interaction with Mapping Toolbox [preset_palette]')

    colorlab.enter
    close all
    clear

    % build the worldmap 
    topographer()
    % preselect the colorscheme.
    preset_palette(@palette.viridis); 
    % apply the preselected colormap
    colorizer('viridis')
    % preselect the colorscheme.
    preset_palette(@palette.cubehelix,3,-0.5,1.5,1	); 
    % apply the preselected colormap
    colorizer('cubehelix')
    % preselect the colorscheme.
    preset_palette(@palette.brewer,'-PuOr'); 
    % apply the preselected colormap
    colorizer('-PuOr')
    % preselect the colorscheme.
    preset_palette(@palette.cmocean,'topo'); 
    % apply the preselected colormap
    colorizer('topo')
    % preselect the colorscheme.
    preset_palette(@palette.crameri,'oleron'); 
    % apply the preselected colormap
    colorizer('oleron')

    disp('>> All good!')
    disp('------------')

end

function topographer()
    load topo
    load coastlines
    figure()
    disp('Worldmap building...')
    worldmap(topo, topolegend);
    contourfm(topo, topolegend);
    disp('Worldmap inking...')
    plotm(coastlat, coastlon, 'k'); 
    disp('Worldmap painting...')
end

function colorizer(name)
    disp(name)
    contourcmap('preset_palette', 'Colorbar','on', 'Location','horizontal',...
    'TitleString','Contour Intervals in Meters'); pause(0.5)
    disp('...done!')
end