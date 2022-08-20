all_docstrings()

function all_docstrings()

    disp('TESTING all examples in docstrings.')

    colorlab.enter
    close all
    clear

    disp COLORNAMES 

    disp colorshow
    import rgb.*
    X11('show')
    xkcd('show')
    disp '...done!'

    disp X11
    X11('navyblue') 
    X11('SpringGreen','CornflowerBlue','sapphire','radioactive green')
    x = -pi:.1:pi;
    y = cos(x);
    plot(x,y,'linewidth',4,'color',X11('CornflowerBlue'))
    hold on
    plot(x,y-1,'*','color',X11('Brown1'))
    plot(x,y-2,'linewidth',4,'color',X11('SeaGreen'))
    legend('cornflower','brown1 (wtf?!)','SeaGreen') 
    set(gca,'color',X11('seashell'))
    text(-1,-2,'This text is chocolate (wtf?!).','fontweight','bold','color',...
            X11('chocolate')); 
    close all
    disp '...done!'

    disp xkcd
    xkcd('baby blue') 
    xkcd('wintergreen','sunflower yellow','sapphire','radioactive green')
    x = -pi:.1:pi;
    y = cos(x);
    plot(x,y,'linewidth',4,'color',xkcd('cornflower'))
    hold on
    plot(x,y-1,'*','color',xkcd('strawberry'))
    plot(x,y-2,'linewidth',4,'color',xkcd('puke green'))
    legend('cornflower','strawberry','puke green') 
    set(gca,'color',xkcd('eggshell'))
    text(-1,-2,'This text is burnt orange.','fontweight','bold','color',...
            xkcd('burnt orange')); 
    close all
    disp '...done!'

    disp('>> All good!')
    disp('------------')

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
    preset_palette(@palette.cubehelix,[3,-0.5,1.5,1]); % preselect the map.
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

    disp CPRINTF
    cprintf;   % displays the demo
    cprintf('text',   'regular black text');
    cprintf('hyper',  'followed %s','by');
    cprintf('key',    '%d colored', 4);
    cprintf('-comment','& underlined');
    cprintf('err',    'elements\n');
    cprintf('cyan',   'cyan');
    cprintf('_green', 'underlined green');
    cprintf(-[1,0,1], 'underlined magenta');
    cprintf([1,0.5,0],'and multi-\nline orange\n');
    cprintf('*blue',  'and *bold* (R2011b+ only)\n');
    cprintf('string');  % same as fprintf('string') and cprintf('text','string')
    disp '...DONE!'

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