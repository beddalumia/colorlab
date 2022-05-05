function varargout = gui(varargin)
% An interactive figure for ColorBrewer colorscheme selection (RGB colormaps)
%
% (c) 2014-2022 Stephen Cobeldick, 2022 Gabriele Bellomia (package adaptation)
%
% View Cynthia Brewer's ColorBrewer colorschemes in a figure.
%
% * Two colorbars give the colorscheme in color and grayscale.
% * A button toggles between 3D-cube and 2D-lineplot of the RGB values.
% * A button toggles an endless demo cycle through the colorschemes.
% * A button reverses the colormap.
% * 35 buttons select any ColorBrewer colorscheme.
% * Text with the colorscheme's type (Diverging/Qualitative/Sequential)
% * Text with the colorscheme's number of nodes (defining colors).
%
%%% Syntax:
% brewer.gui
% brewer.gui(N)
% brewer.gui(N,scheme)
% brewer.gui([],...)
% brewer.gui(axes/figure handles,...) % see "Adjust Colormaps"
% [map,num,typ] = brewer.gui(...)
%
% Calling the function with an output argument blocks MATLAB execution until
% the figure is deleted: the final colormap and colorscheme are then returned.
%
%% Adjust Colormaps of Figures or Axes %%
%
% Only R2014b or later. Provide axes or figure handles as the first input
% and their colormaps will be updated in real-time by BREWER.GUI.
%
%%% Example:
%
% >> S = load('spine');
% >> image(S.X)
% >> brewer.gui(gca)
%
%% Input and Output Arguments %%
%
%%% Inputs (*=default):
% N = NumericScalar, an integer to define the colormap length.
%   = *[], colormap length of two hundred and fifty-six (256).
%   = NaN, same length as the defining RGB nodes (useful for Line ColorOrder).
%   = Array of axes/figure handles. R2014b or later only.
% scheme = CharRowVector or StringScalar, a ColorBrewer colorscheme name.
%
%%% Outputs (these block code execution until the figure is closed!):
% map = NumericMatrix, the colormap defined when the figure is closed.
% num = NumericVector, the number of nodes defining the ColorBrewer colorscheme.
% typ = CharRowVector, the colorscheme type: 'Diverging'/'Qualitative'/'Sequential'.
%
% See also BREWER.CMAP BREWER.SHOW CUBEHELIX PRESET_COLORMAP MATPLOTLIB
% RGBPLOT COLORMAP COLORMAPEDITOR COLORBAR UICONTROL ADDLISTENER

	%% Wrap the private brewermap_view function
	[varargout{1:nargout}] = brewermap_view(varargin{:});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%brewer.gui
%
% Copyright (c) 2014-2022 Stephen Cobeldick, original BREWERMAP_VIEW function
% Copyright (c) 2022 Gabriele Bellomia, BREWER package adaptation and embedding
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