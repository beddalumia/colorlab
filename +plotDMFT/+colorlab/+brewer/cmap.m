function varargout = cmap(varargin)
% The complete selection of ColorBrewer colorschemes/palettes (RGB colormaps).
%
% (c) 2014-2022 Stephen Cobeldick, 2022 Gabriele Bellomia (package adaptation)
%
% Returns any RGB colormap from the ColorBrewer colorschemes, especially
% intended for mapping and plots with attractive, distinguishable colors.
%
%%% Basic Syntax:
% brewer.cmap() % print summary
% map = brewer.cmap(N,scheme)
%
%%% Preset Syntax:
% old = brewer.cmap(scheme)
% map = brewer.cmap()
% map = brewer.cmap(N)
%
% [...,num,typ] = brewer.cmap(...)
%
%% Colorschemes %%
%
% This product includes color specifications and designs developed by Cynthia Brewer.
% See the ColorBrewer website for further information about each colorscheme,
% colour-blind suitability, licensing, and citations: http://colorbrewer.org/
% Each colorscheme is defined by a set of hand-picked RGB values (nodes).
%
% To reverse the colormap sequence prefix the colorscheme name with '-'.
%
% Diverging | Qualitative | Sequential
% ----------|-------------|------------------
%  BrBG     |  Accent     |  Blues    PuBuGn
%  PiYG     |  Dark2      |  BuGn     PuRd
%  PRGn     |  Paired     |  BuPu     Purples
%  PuOr     |  Pastel1    |  GnBu     RdPu
%  RdBu     |  Pastel2    |  Greens   Reds
%  RdGy     |  Set1       |  Greys    YlGn
%  RdYlBu   |  Set2       |  OrRd     YlGnBu
%  RdYlGn   |  Set3       |  Oranges  YlOrBr
%  Spectral |             |  PuBu     YlOrRd
%
% If <N> is greater than the requested colorscheme's defining nodes then:
%  - Diverging and Sequential colorschemes are interpolated in Lab colorspace.
%  - Qualitative colorschemes repeat the nodes (i.e. just like LINES does).
% Else:
%  - Exact values from the ColorBrewer colorschemes are returned.
%
%% Examples %%
%
%%% New colors for the COLORMAP example:
% >> S = load('spine');
% >> image(S.X)
% >> colormap(brewer.cmap([],"YlGnBu"))
%
%%% New colors for the SURF example:
% >> [X,Y,Z] = peaks(30);
% >> surfc(X,Y,Z)
% >> colormap(brewer.cmap([],'RdYlGn'))
% >> axis([-3,3,-3,3,-10,5])
%
%%% Plot a colorscheme's RGB values:
% >> rgbplot(brewer.cmap(NaN, 'Blues')) % standard
% >> rgbplot(brewer.cmap(NaN,'-Blues')) % reversed
%
%%% View information about a colorscheme:
% >> [~,num,typ] = brewer.cmap(NaN,'Paired')
% num = 12
% typ = 'Qualitative'
%
%%% Multi-line plot using matrices:
% >> N = 6;
% >> axes('ColorOrder',brewer.cmap(N,'Pastel2'),'NextPlot','replacechildren')
% >> X = linspace(0,pi*3,1000);
% >> Y = bsxfun(@(x,n)n*sin(x+2*n*pi/N), X(:), 1:N);
% >> plot(X,Y, 'linewidth',4)
%
%%% Multi-line plot in a loop:
% set(0,'DefaultAxesColorOrder',brewer.cmap(NaN,'Accent'))
% N = 6;
% X = linspace(0,pi*3,1000);
% Y = bsxfun(@(x,n)n*sin(x+2*n*pi/N), X(:), 1:N);
% for n = 1:N
%     plot(X(:),Y(:,n), 'linewidth',4);
%     hold all
% end
%
%% Input and Output Arguments %%
%
%%% Inputs:
% N = NumericScalar, N>=0, an integer to specify the colormap length.
%   =  [], same length as the current figure's colormap (see COLORMAP).
%   = NaN, same length as the defining RGB nodes (useful for line ColorOrder).
% scheme = CharRowVector or StringScalar, a ColorBrewer colorscheme name.
%
%%% Outputs:
% map = NumericMatrix, size Nx3, a colormap of RGB values between 0 and 1.
% num = NumericVector, the number of nodes defining the ColorBrewer colorscheme.
% typ = CharRowVector, the colorscheme type: 'Diverging'/'Qualitative'/'Sequential'.
%
% See also BREWER.SHOW BREWER.GUI PRESET_COLORMAP CUBEHELIX MAXDISTCOLOR
% LBMAP PARULA LINES RGBPLOT COLORMAP COLORBAR PLOT PLOT3 AXES SET CONTOURF

	%% Wrap the private brewermap function
	[varargout{1:nargout}] = brewermap(varargin{:});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%brewer.cmap
%
% Code and Implementation:
% Copyright (c) 2014-2022 Stephen Cobeldick, original BREWERMAP function
% Copyright (c) 2022 Gabriele Bellomia, BREWER package adaptation and embedding
% Color Values Only:
% Copyright (c) 2002 Cynthia Brewer, Mark Harrower, and The Pennsylvania State University.
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
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
%
% 1. Redistributions as source code must retain the above copyright notice, this
% list of conditions and the following disclaimer.
%
% 2. The end-user documentation included with the redistribution, if any, must
% include the following acknowledgment: "This product includes color
% specifications and designs developed by Cynthia Brewer
% (http://colorbrewer.org/)." Alternately, this acknowledgment may appear in the
% software itself, if and wherever such third-party acknowledgments normally appear.
%
% 4. The name "ColorBrewer" must not be used to endorse or promote products
% derived from this software without prior written permission. For written
% permission, please contact Cynthia Brewer at cbrewer@psu.edu.
%
% 5. Products derived from this software may not be called "ColorBrewer", nor
% may "ColorBrewer" appear in their name, without prior written permission of Cynthia Brewer.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%license