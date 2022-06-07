function map = preset_palette(N,varargin)
% Wrapper for any COLORMAP function, to provide preset parameter values.
%
% (c) 2020-2022 Stephen Cobeldick, Apache 2.0 License
%
%%% Syntax:
% preset_palette(@fun,p1,p2,...,pN)  % store function and any parameters
% map = preset_palette(N)            % generate colormap
%
%%% Examples %%%
%
% >> preset_palette(@cubehelix.map,0.25,-0.67,1.5,1)
% >> colormap(preset_palette)
% or
% >> preset_colormap(5)
% ans =
%          0         0         0
%     0.1055    0.2788    0.4895
%     0.1660    0.6705    0.4961
%     0.6463    0.8479    0.5076
%     1.0000    1.0000    1.0000
%
%
% See Also PALETTE COLORMAP COLORMAPEDITOR

persistent fnh arg
%
if nargin==0 % Default N same as MATLAB colormaps.
	N = cmDefaultN();
elseif nargin==1 && isnumeric(N)
	assert(isscalar(N) && isreal(N) && fix(N)==N,...
		'SC:preset_colormap:N:NotRealScalarNumeric',...
		'First input <N> must be a real scalar numeric of the colormap size.')
	N = double(N);
else % Store function handle and parameter values.
	assert(isa(N,'function_handle'),...
		'SC:preset_colormap:N:NotFunctionHandle',...
		'First input <N> must be a function handle to a colormap function.')
	fnh = N;
	arg = varargin;
	return
end
%
try
    map = fnh(N,arg{:});
catch
    map = fnh(arg{:});
    map = map(1:N,:);
end
%
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%preset_colormap
function N = cmDefaultN()
% Get the colormap size from the current figure or default colormap.
try
	F = get(groot,'CurrentFigure');
catch %#ok<CTCH> pre HG2
	N = size(get(gcf,'colormap'),1);
	return
end
if isempty(F)
	N = size(get(groot,'DefaultFigureColormap'),1);
else
	N = size(F.Colormap,1);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%cmDefaultN