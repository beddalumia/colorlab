function varargout = cmap(varargin)
% Generate an RGB colormap of Dave Green's CubeHelix colorscheme. With range and domain control.
%
% (c) 2013-2022 Stephen Cobeldick, 2022 Gabriele Bellomia (package adaptation)
%
% Returns a colormap with colors defined by Dave Green's CubeHelix colorscheme.
% The colormap nodes are selected along a tapered helix in the RGB color cube,
% with a continuous increase in perceived intensity. Black-and-white printing
% using postscript results in a monotonically increasing grayscale colorscheme.
%
% This function offers two extra controls over the CubeHelix colorscheme:
%  <irange> specifies the intensity levels of the colormap's endnodes (lightness).
%  <domain> subsamples a part of the helix, so the endnodes are color (not gray).
% These options are both explained in the section below 'Range and Domain'.
%
%%% Syntax:
%  map = cubehelix.cmap;
%  map = cubehelix.cmap(N);
%  map = cubehelix.cmap(N,start,rots,satn,gamma);
%  map = cubehelix.cmap(N,start,rots,satn,gamma,irange);
%  map = cubehelix.cmap(N,start,rots,satn,gamma,irange,domain);
%  map = cubehelix.cmap(N,[start,rots,satn,gamma],...)
%  map = cubehelix.cmap([],...)
% [map,lo,hi] = cubehelix.cmap(...)
%
% CubeHelix is defined here: http://astron-soc.in/bulletin/11June/289392011.pdf
% For more information and examples: http://www.mrao.cam.ac.uk/~dag/CUBEHELIX/
%
% Note: The original specification (the links above) misnamed the saturation
% option as "hue". In this function the saturation option is named "satn".
%
%% Range and Domain %%
%
% Using the default <irange> and <domain> vectors ([0,1]) creates colormaps
% exactly the same as Dave Green's original algorithm: from black to white.
%
% The option <irange> sets the intensity level of the colormap's endnodes:
%  cubehelix.cmap(3, [0.5,-1.5,1,1], [0.2,0.8]) % irange=[0.2,0.8]
%  ans = 0.2          0.2          0.2     % <- gray, not black
%        0.62751      0.47498      0.28642
%        0.8          0.8          0.8     % <- gray, not white
%
% The option <domain> sets the sampling window for the CubeHelix, such
% that the tapered-helix does not taper all the way to unsaturated (gray).
% This allows the colormap to end with colors rather than gray shades:
%  cubehelix.cmap(3, [0.5,-1.5,1,1], [0.2,0.8], [0.3,0.7]) % domain=[0.3,0.7]
%  ans = 0.020144     0.29948      0.15693 % <- color, not gray shade
%        0.62751      0.47498      0.28642
%        0.91366      0.71351      0.95395 % <- color, not gray shade
%
% The function CUBEHELIX.GUI demonstrates the effects of these options.
%
%% Examples %%
%
%%% New colors for the COLORMAP example:
% >> S = load('spine');
% >> image(S.X)
% >> colormap(cubehelix.cmap)
%
%%% New colors for the SURF example:
% [X,Y,Z] = peaks(30);
% surfc(X,Y,Z)
% colormap(cubehelix.cmap([],0.7,-0.7,2,1,[0.1,0.9],[0.1,0.9]))
% axis([-3,3,-3,3,-10,5])
%
%% Input and Output Arguments %%
%
%%% Inputs (**=default):
%  N     = NumericScalar, an integer to specify the colormap length.
%        = []**, same length as the current figure's colormap (see COLORMAP).
%  start = NumericScalar, +0.5**, the helix's start color (modulus 3): R=1, G=2, B=3.
%  rots  = NumericScalar, -1.5**, the number of R->G->B rotations over the scheme length.
%  satn  = NumericScalar,  1.0**, controls how saturated the colors are.
%  gamma = NumericScalar,  1.0**, change the gamma to emphasize low or high intensity values.
%  irange = NumericVector, [0,1]**, range of brightness levels of the scheme's endnodes.
%  domain = NumericVector, [0,1]**, domain of the CubeHelix calculation (endnode positions).
%
%%% Outputs:
%  map = NumericMatrix, a colormap of RGB values between 0 and 1. Size Nx3
%  lo  = LogicalMatrix, true where <map> values<0 were clipped to 0. Size Nx3
%  hi  = LogicalMatrix, true where <map> values>1 were clipped to 1. Size Nx3
%
% See also CUBEHELIX.GUI PRESET_COLORMAP BREWER.MAP MAXDISTCOLOR LBMAP
% PARULA LINES RGBPLOT COLORMAP COLORBAR PLOT PLOT3 AXES SET CONTOURF

	%% Wrap the private cubehelix function
	[varargout{1:nargout}] = cubehelix(varargin{:});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%cubehelix.cmap
%
% Copyright (c) 2013-2022 Stephen Cobeldick, original CUBEHELIX function
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