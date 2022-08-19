function test_all_docstrings()

    disp('TESTING all examples in docstrings.')

    colorlab.enter
    close all
    clear

    disp COLORTOOLS

    disp view_color
    view_color({'r','g','b','c','m','y','k','w'},'squares')
    view_color({'strawberry','apple','blueberry',"banana"})
    view_color({'matlab1','matlab2','matlab3','matlab4'},'hbars')
    view_color({'pyplot1',"pyplot2",'pyplot3'},'vbars')
    view_color(palette.tab20(16),'hbars')
    view_color(palette.cubehelix(36))
    close all; clear
    disp '...done!'

    disp str2rgb
    evalc('str2rgb("yellow","red")');                               % Nasty
    evalc("str2rgb('yellow','red')");                               % trick
    evalc("str2rgb({'yellowish'})");                                % to
    evalc("str2rgb({'yellow','red2','reddish',""yellowish""})");    % suppress
    evalc("str2rgb('matlab1','matlab2','matlab3','matlab4')");      % stdout
    evalc("str2rgb({'pyplot1',""pyplot2"",'pyplot3'})");            % from
    evalc("str2rgb('#ff00ff','de56f0')"); clear                     % str2rgb
    disp '...done!'

    disp hex2rgb
    rgb = [0.2000,0.3020,0.4000];
    assert(norm(rgb-hex2rgb('#334D66'))<1e10)
    assert(norm(rgb-hex2rgb('334D66'))<1e10)
    RGB = [51,77,102];
    assert(norm(rgb-hex2rgb('#334D66',256))<1e10)
    hexmatrix = ['#334D66';'#8099B3';'#CC9933';'#3333E6'];
    hexchcell = {'#334D66';'#8099B3';'#CC9933';'#3333E6'};
    hexstrarr = ["#334D66","#8099B3","#CC9933","#3333E6"]; 
    assert(isequal(hex2rgb(hexmatrix),hex2rgb(hexchcell)))
    assert(isequal(hex2rgb(hexmatrix),hex2rgb(hexstrarr)))
    clear
    disp '...done!'

    disp rgb2hex
    hex = '#00FF00';
    rgb = [0 1 0];
    RGB = [0 255 0];
    assert(isequal(hex,rgb2hex(rgb)));
    assert(isequal(hex,rgb2hex(RGB)));
    rgb = [.2 .3 .4;
        .5 .6 .7; 
        .8 .6 .2;
        .2 .2 .9];
    hex = ['#334D66';
        '#8099B3';
        '#CC9933';
        '#3333E6'];
    assert(isequal(hex,rgb2hex(rgb)))
    clear
    disp '...done!'

    disp PALETTES

    disp palette.brewer
    S = load('spine');
    image(S.X)
    colormap(palette.brewer([],"YlGnBu"))
    close
    [X,Y,Z] = peaks(30);
    surfc(X,Y,Z)
    colormap(palette.brewer([],'RdYlGn'))
    close
    rgbplot(palette.brewer(NaN, 'Blues'))
    rgbplot(palette.brewer(NaN,'-Blues'))
    close
    [~,num,typ] = palette.brewer(NaN,'Paired');
    assert(num==12&isequal(typ,'Qualitative'))
    clear
    preset_palette(@palette.brewer,'Spectral');
    cmap = palette.brewer([],'Spectral');
    assert(isequal(cmap,preset_palette))
    clear
    N = 6;
    axes('ColorOrder',palette.brewer(N,'Pastel2'))
    set(0,'DefaultAxesColorOrder',palette.brewer(NaN,'Accent'))
    clear; close
    disp '...done!'

    disp palette.cmocean
    S = load('spine');
    image(S.X)
    colormap(palette.cmocean('-rain'))
    close
    [X,Y,Z] = peaks(30);
    surfc(X,Y,Z+4)
    palette.cmocean('curl','pivot',4)
    preset_palette(@palette.cmocean,'topo'); % preselect the map.
    cmap = palette.cmocean('-topo');
    assert(isequal(cmap(end:-1:1,:),preset_palette))
    clear; close
    disp '...done!'

    disp palette.crameri
    S = load('spine');
    image(S.X)
    colormap(palette.crameri('oslo'))
    close
    [X,Y,Z] = peaks(30);
    surfc(X,Y,Z+4)
    palette.crameri('bam','pivot',4)
    preset_palette(@palette.crameri,'oleron'); % preselect the map.
    cmap = palette.crameri('-oleron');
    assert(isequal(cmap(end:-1:1,:),preset_palette))
    clear; close
    set(0,'DefaultAxesColorOrder',palette.crameri('actonS'))
    N = 6;
    axes('ColorOrder',palette.crameri('turkuS'))
    clear; close
    disp '...done!'

    disp palette.cubehelix
    S = load('spine');
    image(S.X)
    colormap(palette.cubehelix)
    close
    [X,Y,Z] = peaks(30);
    surfc(X,Y,Z)
    cmap = palette.cubehelix([],0.7,-0.7,2,1,[0.1,0.9],[0.1,0.9]);
    colormap(cmap)
    preset_palette(@palette.cubehelix, 3,-0.5,1.5,1); % preselect the map.
    cmap = palette.cubehelix([],3,-0.5,1.5,1);
    assert(isequal(cmap,preset_palette))
    clear; close
    N = 6;
    cmap = palette.cubehelix(N+1,1.5,2,3,1,[0.2,1],[0,0.9]);                     % Set...
    clear; close
    disp '...done!'

    disp MATPLOTLIB

    names = matplotlib_names;

    for i = 1:length(names)

        disp(['palette.',names{i}])
        eval(['cmap = palette.',names{i},';']); % this is worse than
        eval(['preset_palette(@palette.',names{i},')']); % a goto...
        assert(isequal(cmap,preset_palette))
        disp '...done!'

    end

    disp paletteshow
    paletteshow.brewer
    paletteshow.cmocean
    paletteshow.crameri
    %paletteshow.matplotlib TODO!
    close all force % brewer is nasty
    disp '...done!'

    disp('>> All good!')
    disp('------------')

end

function names = matplotlib_names()

    names = {
        'cividis';
        'viridis';
        'inferno';
        'magma';
        'plasma';
        'tab10';
        'tab20';
        'tab20b';
        'tab20c';
        'twilight';
        'twilight_shifted'
    };

end