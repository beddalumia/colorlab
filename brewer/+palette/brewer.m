function [map,num,typ,scheme] = brewer(N,scheme)
% The complete selection of ColorBrewer colorschemes/palettes (RGB colormaps).
%
% (c) 2014-2022 Stephen Cobeldick, 2022 Gabriele Bellomia (package adaptation)
%
% Returns any RGB colormap from the ColorBrewer colorschemes, especially
% intended for mapping and plots with attractive, distinguishable colors.
%
%%% Basic Syntax:
% palette.brewer() % print summary
% map = palette.brewer(N,scheme)
%
%%% Preset Syntax:
% old = palette.brewer(scheme)
% map = palette.brewer()
% map = palette.brewer(N)
%
% [...,num,typ] = palette.brewer(...)
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
% >> colormap(palette.brewer([],"YlGnBu"))
%
%%% New colors for the SURF example:
% >> [X,Y,Z] = peaks(30);
% >> surfc(X,Y,Z)
% >> colormap(palette.brewer([],'RdYlGn'))
% >> axis([-3,3,-3,3,-10,5])
%
%%% Plot a colorscheme's RGB values:
% >> rgbplot(palette.brewer(NaN, 'Blues')) % standard
% >> rgbplot(palette.brewer(NaN,'-Blues')) % reversed
%
%%% View information about a colorscheme:
% >> [~,num,typ] = palette.brewer(NaN,'Paired')
% num = 12
% typ = 'Qualitative'
%
%%% Multi-line plot using matrices:
% >> N = 6;
% >> axes('ColorOrder',palette.brewer(N,'Pastel2'),'NextPlot','replacechildren')
% >> X = linspace(0,pi*3,1000);
% >> Y = bsxfun(@(x,n)n*sin(x+2*n*pi/N), X(:), 1:N);
% >> plot(X,Y, 'linewidth',4)
%
%%% Multi-line plot in a loop:
% set(0,'DefaultAxesColorOrder',palette.brewer(NaN,'Accent'))
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
% See also PALETTE PALETTEDITOR PALETTESHOW PRESET_PALETTE CUBEHELIX MAXDISTCOLOR
% LBMAP PARULA LINES RGBPLOT COLORMAP COLORBAR PLOT PLOT3 AXES SET CONTOURF

%% Input Wrangling %%
%
persistent bmc scm txt
%
if isempty(bmc)
	bmc = bmColors();
end
%
if nargin==0
	N = [];
end
%
err = 'First input <N> must be a real positive scalar numeric or [] or NaN.';
%
if nargout==0 && nargin==0
	hdr = {   'Type'; 'Scheme'; 'Nodes'};
	tsn = [{bmc.typ};{bmc.str};{bmc.num}];
	fprintf('%-12s %-9s %s\n',hdr{:});
	fprintf('%-12s %-9s %u\n',tsn{:});
	return
elseif isnumeric(N)
	if isequal(N,[])
		% Default N is the same as MATLAB colormaps:
		N = cmDefaultN();
	else
		assert(isscalar(N),...
			'SC:colorbrewer:N:NotScalarNumeric',err)
		assert(isnan(N) || isreal(N) && isfinite(N) && fix(N)==N && N>=0,...
			'SC:colorbrewer:N:NotWholeRealNotNaN',err)
	end
	if nargin<2
		assert(~isempty(scm),...
			'SC:colorbrewer:scheme:NotPreset',...
			'Colorscheme must be preset before this call: BREWERMAP(SCHEME)')
		scheme = scm;
	else
		scheme = bm1s2c(scheme);
		assert(ischar(scheme) && ismatrix(scheme) && size(scheme,1)==1,...
			'SC:colorbrewer:scheme:NotText',...
			'Input <scheme> must be a character vector or string scalar.')
	end
else % preset
	scheme = bm1s2c(N);
	assert(ischar(scheme) && ismatrix(scheme) && size(scheme,1)==1,...
		'SC:colorbrewer:N:NotText',...
		'To preset the scheme <N> must be a character vector or string scalar.')
	if strcmpi(scheme,'list')
		map = {bmc.str};
		num = [bmc.num];
		typ = {bmc.typ};
		return
	end
end
%
isr = strncmp(scheme,'-',1) || strncmp(scheme,'*',1);
isd = strncmp(scheme,'+',1) || isr; % direction
ids = strcmpi(scheme(1+isd:end),{bmc.str});
assert(any(ids),...
	'SC:colorbrewer:scheme:UnknownColorscheme',...
	'Unknown colorscheme name: "%s"',scheme)
%
num = bmc(ids).num;
typ = bmc(ids).typ;
%
if ~isnumeric(N) % preset
	map = txt;
	txt = N;
	scm = scheme;
	return
elseif N==0
	map = nan(0,3);
	return
elseif isnan(N)
	N = num;
end
%
% Downsample:
[idx,itp] = bmIndex(N,num,typ);
%
map = bmc(ids).rgb(idx,:)/255;
%
% Interpolate:
if itp
	%
	M = [... High-precision sRGB to XYZ matrix:
		0.4124564,0.3575761,0.1804375;...
		0.2126729,0.7151522,0.0721750;...
		0.0193339,0.1191920,0.9503041];
	% Source: http://brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
	%
	wpt = [0.95047,1,1.08883]; % D65
	%
	map = bmRGB2Lab(map,M,wpt); % optional
	%
	% Extrapolate a small amount beyond the end nodes:
	%ido = linspace(0,num+1,N+2);
	%ido = ido(2:end-1);
	% Interpolation completely within the end nodes:
	ido = linspace(1,num,N);
	%
	switch typ
		case 'Diverging'
			mid = ceil(num/2);
			ida =   1:mid;
			idz = mid:num;
			map = [...
				interp1(ida,map(ida,:),ido(ido<=mid),'pchip');...
				interp1(idz,map(idz,:),ido(ido>mid),'pchip')];
		case 'Sequential'
			map = interp1(1:num,map,ido,'pchip');
		otherwise
			error('SC:colorbrewer:NoInterp','Cannot interpolate this type.')
	end
	%
	map = bmLab2RGB(map,M,wpt); % optional
	%
end
%
% Limit output range:
map = max(0,min(1,map));
%
% Reverse row order:
if isr
	map = map(end:-1:1,:);
end
%
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%palette.brewer
% Code and Implementation:
% Copyright (c) 2014-2022 Stephen Cobeldick, original BREWERMAP function
% Copyright (c) 2022 Gabriele Bellomia, PALETTE package adaptation and embedding
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