function set_colororder(varargin)
%% Generic wrapper to set all available colormaps
%
%  >> set_colororder(cmap_name,N,varargin)
%
%     cmap_name: string, the input colormap name
%     N: optional int, the number of requested levels
%     varargin: optional, to request low level API
%
%  To see all available colormap names just call:
%  >> set_colororder('list')
%
%  Though you will find that such option would prove
%  unnecessary most of the time: thanks to a powerful
%  string-search engine, set_colororder can suggest
%  a bunch of "near matches" if the given cmap_name 
%  is not valid. Example:
%  >> set_colororder tab
%  Palette "tab" not found!
%  Consider one of these options:
%      {'tab10'}
%      {'tab20'}
%      {'bam'  }
%
%  Finally you can exploit the varargin to pass 
%  additional options to the colormap generators,
%  when available (different generators could have
%  different internal APIs and different options).
%  Take it as experimental functionality, which 
%  has not been tested thoroughly. 
%  For safer custom calls refer to the explicit 
%  generator APIs as:
%  >> palette.crameri()
%  >> palette.brewer()
%  >> palette.cmocean()
%  >> palette.cubehelix()
%  >> palette.viridis()
%  >> etcetera...
%
% See also palette, paletteshow, paletteditor, colororder
%
% Copyright (c) 2022 Gabriele Bellomia
% MIT License

    if nargin < 1
        help set_colororder
        return
    end

    if isequal(varargin{1},'default')
        colororder default
        return
    elseif isequal(varargin{1},'show')
        if nargin < 2
            N = 7;
        else
            N = varargin{2};
        end
        showreel(N)
        return
    end

    map = get_palette(varargin{:});

    if isempty(map)
        return
    end
    
    colororder(map)

end

function showreel(N)

    palettes = build_namelist();

    plot_sines(N)

    for i = 1:length(palettes)
        set_colororder(palettes{i},N)
        title('Sines',palettes{i})
        pause(0.1)
    end

    close(gcf)

end

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