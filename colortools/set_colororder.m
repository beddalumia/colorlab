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
    end

    map = get_palette(varargin{:});

    if isempty(map)
        return
    end
    
    colororder(map)

end