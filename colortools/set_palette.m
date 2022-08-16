function set_palette(varargin)
%% Generic wrapper to set all available colormaps
%
%  >> set_palette(cmap_name,N,varargin)
%
%     cmap_name: string, the input colormap name
%     N: optional int, the number of requested levels
%     varargin: optional, to request low level API
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

    map = get_palette(varargin{:});
    colormap(map)

end