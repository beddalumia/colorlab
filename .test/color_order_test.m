disp('TESTING set_colororder')

colorlab.enter
close all
clear

N = 7

palettes = build_namelist();

plot_sines(N)

for i = 1:length(palettes)
    set_colororder(palettes{i},N)
    title('Sines',palettes{i})
    pause(0.1)
end

pause(1)

disp('>> All good!')
disp('------------')

close gcf

function plot_sines(N)
    X = linspace(0,pi*3,1000);
    Y = bsxfun(@(x,n)n*sin(x+2*n*pi/N), X.', 1:N);
    for n = 1:N
    plot(X(:),Y(:,n), 'linewidth',4);
    hold all
    end
    xlim([0,3*pi]);
end

function list = build_namelist()
    % All colormap names available:
        list = {
        % matplotlib continuous
        'cividis',
        'inferno',
        'magma',
        'plasma',
        'twilight',
        'twilight_shifted',
        'viridis',
        % matplotlib discrete
        'tab10',
        'tab20',
        'tab20b',
        'tab20c',
        % cubehelix
        'cubehelix',
        % brewer diverging
        'BrBG',
        'PiYG',
        'PRGn',
        'PuOr',
        'RdBu',
        'RdGy',
        'RdYlGn',
        'Spectral',
        % brewer qualitative
        'Accent',
        'Dark2',
        'Paired',
        'Pastel1',
        'Pastel2',
        'Set1',
        'Set2',
        % brewer sequential
        'Blues',
        'BuGn',
        'BuPu',
        'GnBu',
        'Greens',
        'Greys',
        'OrRd',
        'Oranges',
        'PuBu',
        'PuBuGn',
        'PuRd',
        'Purples',
        'RdPu',
        'Reds',
        'YlGn',
        'YlGnBu',
        'YlOrBr',
        'YlOrRd',
        % cmocean sequential
        'thermal',
        'haline',
        'solar',
        'ice',
        'gray',
        'oxy',
        'deep',
        'dense',
        'algae',
        'matter',
        'turbid',
        'speed',
        'amp',
        'tempo',
        'rain',
        'phase',
        % cmocean diverging
        'topo',
        'balance',
        'delta',
        'curl',
        'diff',
        'tarn',
        % crameri
        'acton',
        'actonS',
        'bam',
        'bamO',
        'bamako',
        'bamakoS',
        'batlow',
        'batlowK',
        'batlowKS',
        'batlowS',
        'batlowW',
        'batlowWS',
        'berlin',
        'bilbao',
        'bilbaoS',
        'broc',
        'brocO',
        'buda',
        'budaS',
        'bukavu',
        'cork',
        'corkO',
        'davos',
        'davosS',
        'devon',
        'devonS',
        'fes',
        'grayC',
        'grayCS',
        'hawaii',
        'hawaiiS',
        'imola',
        'imolaS',
        'lajolla',
        'lajollaS',
        'lapaz',
        'lapazS',
        'lisbon',
        'nuuk',
        'nuukS',
        'oleron',
        'oslo',
        'osloS',
        'roma',
        'romaO',
        'tofino',
        'tokyo',
        'tokyoS',
        'turku',
        'turkuS',
        'vanimo',
        'vik',
        'vikO',
        % matlab built-ins
        'parula',
        'turbo',
        'hsv',
        'hot',
        'cool',
        'spring',
        'summer',
        'autumn',
        'winter',
        'gray',
        'bone',
        'copper',
        'pink',
        'jet',
        'lines',
        'colorcube',
        'prism',
        'flag',
        'white'
        };
    end