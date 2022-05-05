function varargout = gui(varargin)
% An interactive figure for CubeHelix colormap parameter selection. With demo!
%
% (c) 2013-2022 Stephen Cobeldick, 2022 Gabriele Bellomia (package adaptation)
%
% View Dave Green's CubeHelix colorschemes in a figure.
%
% * Two colorbars give the colorscheme in color and grayscale.
% * A button toggles between 3D-cube and 2D-lineplot of the RGB values.
% * A button toggles an endless demo of randomly generated colorschemes.
% * Nine sliders allow real-time adjustment of the CubeHelix parameters.
% * Warning text if any RGB values are clipped.
% * Warning text if the grayscale is not monotonic increasing/decreasing.
%
%%% Syntax:
%  cubehelix.gui
%  cubehelix.gui(N)
%  cubehelix.gui(N,start,rots,satn,gamma)
%  cubehelix.gui(N,start,rots,satn,gamma,irange)
%  cubehelix.gui(N,start,rots,satn,gamma,irange,domain)
%  cubehelix.gui(N,[start,rots,satn,gamma],...)
%  cubehelix.gui([],...)
%  cubehelix.gui(axes/figure handles,...) % see "Adjust Colormaps"
%  [map,lo,hi] = cubehelix.gui(...)
%
% Calling the function with an output argument blocks MATLAB execution until
% the figure is deleted: the final colormap and parameters are then returned.
%
% CubeHelix is defined here: http://astron-soc.in/bulletin/11June/289392011.pdf
% For more information and examples: http://www.mrao.cam.ac.uk/~dag/CUBEHELIX/
%
% Note: The original specification (the links above) misnamed the saturation
% option as "hue". In this function the saturation option is named "satn".
%
%% Adjust Colormaps of Figures or Axes %%
%
% Only R2014b or later. Provide axes or figure handles as the first input
% and their colormaps will be updated in real-time by CUBEHELIX_VIEW.
%
%%% Example:
%
% >> S = load('spine');
% >> image(S.X)
% >> cubehelix.gui(gca)
%
%% Input and Output Arguments %%
%
%%% Inputs (*=default):
%  N     = NumericScalar, an integer to define the colormap length.
%        = *[], colormap length of two hundred and fifty-six (256).
%        = Array of axes/figure handles. R2014b or later only.
%  start = NumericScalar, the helix's start color, with R=1, G=2, B=3 (modulus 3).
%  rots  = NumericScalar, the number of R->G->B rotations over the scheme length.
%  satn  = NumericScalar, saturation controls how saturated the colors are.
%  gamma = NumericScalar, gamma can be used to emphasize low or high intensity values.
%  irange = NumericVector, range of brightness levels of the colormap's endnodes. Size 1x2.
%  domain = NumericVector, domain of the cubehelix calculation (endnode positions). Size 1x2.
%
%%% Outputs (these block code execution until the figure is closed!):
% map = NumericMatrix, the cubehelix colormap defined when the figure is closed.
% lo  = LogicalMatrix, true where <map> values<0 were clipped to 0. Size Nx3
% hi  = LogicalMatrix, true where <map> values>1 were clipped to 1. Size Nx3
%
% See also CUBEHELIX.CMAP BREWER PRESET_COLORMAP CRAMERI MATPLOTLIB
% RGBPLOT COLORMAP COLORMAPEDITOR COLORBAR UICONTROL ADDLISTENER

	%% Wrap the private cubehelix_view function
	[varargout{1:nargout}] = cubehelix_view(varargin{:});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%cubehelix.gui
%
% Copyright (c) 2013-2022 Stephen Cobeldick, original CUBEHELIX_VIEW function
% Copyright (c) 2022 Gabriele Bellomia, CUBEHELIX package adaptation and embedding
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
% http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and limitations under the License.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%license