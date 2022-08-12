function set_palette(input_name,varargin)
%% Generic wrapper to set all available colormaps
%
%  >> set_palette(cmap_name,varargin)
%
%  To see all available colormap names just call:
%  >> set_palette('list') or set_palette list
%
%  Though you will find that such option would prove
%  unnecessary most of the time: thanks to a powerful
%  string-search engine, set_palette can suggest you
%  a bunch of "near matches" if the given cmap_name 
%  is not valid. Example:
%  >> set_palette grey
%  Palette "grey" not found!
%  Consider one of these options:
%      {'Greys'}
%      {'RdGy' }
%      {'gray' }
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
% See also palette, paletteshow, paletteditor, preset_palette
%
% Copyright (c) 2022 Gabriele Bellomia
% MIT License

    if nargin < 1
        help set_palette
        return
    end

    % First we retrieve all available colormap names
    namelist = build_namelist();
    %load('/home/gbellomia/Dropbox/GitHub/colorlab/+rgb/private/X11_rgb_data.mat','namelist')

    if strcmpi(input_name,'list')
       disp('Available palettes:')
       disp(namelist)
       return
    end

    % If a palette is not found in the database, display error message
    % and look for near matches: 
    if sum(strcmp(namelist,input_name))==0 % Crameri calls for case!
        disp(['Palette "',input_name,'" not found!'])
        disp(['Consider one of these options:'])

        % Special thanks to C. Wannaz for writing this snippet. He came up with
        % quite a clever solution wherein the spectrum of the input palette
        % name is compared to the spectra of available options. So cool. 
        spec = @(name) accumarray(upper(name.')-31, ones(size(name)), [100 1]) ;
        spec_mycol = spec(input_name); % spectrum of input palette name 
        spec_dist = cellfun(@(name) norm(spec(name)-spec_mycol), namelist);
        [sds,idx]   = sort(spec_dist) ;
        nearbyNames = namelist(idx(sds<=1.5));
        if isempty(nearbyNames)
            nearbyNames = namelist(idx(1:3));
        end
        disp(nearbyNames); 
        return
    end

    % Depending on where we match, we call different libraries
    position = find(strcmp(namelist,input_name)); % Crameri calls for case!
    switch true
    case ismember(position, 1:11)
        matplotlib_dispatch(input_name);
        fprintf('Set through palette.%s\n',input_name)
    case ismember(position, 12)
        map = palette.cubehelix(varargin{:});
        colormap(map)
        fprintf('Set through palette.%s\n',input_name)
    case ismember(position, 13:46)
        if nargin > 1
            map = palette.brewer(varargin{1},input_name);
        else
            map = palette.brewer(256,input_name);
        end
        colormap(map)
        fprintf('Set through palette.brewer\n')
    case ismember(position, 47:68)
        palette.cmocean(input_name,varargin{:});
        fprintf('Set through palette.cmocean\n')
    case ismember(position, 69:121)
        palette.crameri(input_name,varargin{:});
        fprintf('Set through palette.crameri\n')
    case ismember(position, 122:140)
        colormap(input_name); % built-ins
        fprintf('Set through built-in colormap()\n')
    end

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

function matplotlib_dispatch(name)
    switch name
    case 'cividis'
        map = palette.cividis;
    case 'inferno'
        map = palette.inferno;
    case 'magma'
        map = palette.magma;
    case 'plasma'
        map = palette.plasma;
    case 'twilight'
        map = palette.twilight;
    case 'twilight_shifted'
        map = palette.twilight_shifted;
    case 'viridis'
        map = palette.viridis;
    case 'tab10'
        map = palette.tab10;
    case 'tab20'
        map = palette.tab20;
    case 'tab20b'
        map = palette.tab20b;
    case 'tab20c'
        map = palette.tab20c;
    end
    colormap(gcf,map)
end