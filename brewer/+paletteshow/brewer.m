function brewer(varargin)
% Simple plot of all ColorBrewer colorscheme nodes in one static figure.
%
% (c) 2014-2022 Stephen Cobeldick, 2022 Gabriele Bellomia (package adaptation)
%
%%% Syntax:
% paletteshow.brewer()
%
% See also 	PALETTE PALETTEDITOR PALETTESHOW CUBEHELIX MAXDISTCOLOR
% LBMAP PARULA LINES RGBPLOT COLORMAP COLORBAR PLOT PLOT3 AXES SET

if nargin > 0
			fprintf(2,'Warning: you might want to call palette.brewer instead.\n');
end

[mcs,nmn,pyt] = palette.brewer('list');
%
persistent cbh axh
%
xmx = max(nmn);
ymx = numel(pyt);
%
if ishghandle(cbh)
	figure(cbh);
	delete(axh);
else
	cbh = figure('HandleVisibility','callback', 'IntegerHandle','off',...
		'NumberTitle','off', 'Name','Brewer: palette','Color','white',...
		'MenuBar','figure', 'Toolbar','none', 'Tag',mfilename);
	set(cbh,'Units','pixels')
	pos = get(cbh,'Position');
	pos(1:2) = pos(1:2) - 123;
	pos(3:4) = max(pos(3:4),[842,532]);
	set(cbh,'Position',pos)
end
%
axh = axes('Parent',cbh, 'Color','none',...
	'XTick',0:xmx, 'YTick',0.5:ymx, 'YTickLabel',mcs, 'YDir','reverse');
title(axh,'ColorBrewer Palette', 'Interpreter','none')
xlabel(axh,'Scheme Nodes')
ylabel(axh,'Scheme Name')
axf = get(axh,'FontName');
%
for y = 1:ymx
	N = nmn(y);
	M = palette.brewer(N,mcs{y});
	for x = 1:N
		patch([x-1,x-1,x,x],[y-1,y,y,y-1],1, 'FaceColor',M(x,:), 'Parent',axh)
	end
	text(xmx+0.1,y-0.5,pyt{y}, 'Parent',axh, 'FontName',axf)
end
%
drawnow()
%
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%paletteshow.brewer
% Copyright (c) 2014-2022 Stephen Cobeldick, original BREWERMAP_PLOT function
% Copyright (c) 2022 Gabriele Bellomia, PALETTE package adaptation and embedding
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