function cmap = crameri(ColormapName,varargin) 
% PALETTE.CRAMERI returns perceptually-uniform scientific colormaps created
% by Fabio Crameri. 
% 
%% Syntax 
%
%  cmap = palette.crameri('ColormapName') 
%  cmap = palette.crameri('-ColormapName') 
%  cmap = palette.crameri(...,NLevels)
%  cmap = palette.crameri(...,'pivot',PivotValue) 
%  palette.crameri(...)
% 
%% Description 
% 
% cmap = palette.crameri('ColormapName') returns a 256x3 colormap.  
% For a visual depiction of valid colormap names, type paletteshow.crameri.
%
% cmap = palette.crameri('-ColormapName') a minus sign preceeding any 
% ColormapName flips the order of the colormap. 
%
% cmap = crameri(...,NLevels) specifies a number of levels in the colormap.
% Default value is 256. 
%
% cmap = palette.crameri(...,'pivot',PivotValue) centers a diverging
% colormap such that white corresponds to a given value and maximum extents 
% are set using current caxis limits. If no PivotValue is set 0 is assumed. 
%
% palette.crameri(...) without any output sets the current colormap to the current axes.  
% 
%% Author Info 
% The original CRAMERI function was written by Chad A. Greene of the University of Texas
% Institute for Geophysics (UTIG), August 2018, using Fabio Crameri's 
% scientific colormaps, version 4.0. http://www.fabiocrameri.ch/colourmaps.php
% The present implementation upgrades to version 7.0.1 of such colormaps. 
% The packaging end embedding in +PALETTE has been curated by Gabriele Bellomia.
% 
%% Citing this colormap: 
% Please acknowledge the free use of these colormaps by citing
% 
% Crameri, F. et al. (2020), The misuse of colour in science communication, 
% Nature Communications, 11, 5444. http://doi.org/10.1038/s41467-020-19160-7
%
% Crameri, F. (2018). Scientific colour-maps. Zenodo. http://doi.org/10.5281/zenodo.1243862
% 
%
% See also PALETTESHOW PRESET_PALETTE CUBEHELIX BREWER and CRAMERI_UPDATE.
  

%% Display colormap options: 

if nargin==0
   figure('menubar','none','numbertitle','off','Name','Crameri: palette')
   crameritable = load('CrameriShowPalette.mat','im');
   try
      imshow(crameritable.im); 
   catch
      axes('pos',[0 0 1 1])
      image(crameritable.im); 
      axis image off
   end
   return
end

%% Error checks: 

assert(isnumeric(ColormapName)==0,'Input error: ColormapName must be a string.') 

%% Set defaults: 

NLevels = 256; 
autopivot = false; 
PivotValue = 0; 
InvertedColormap = false; 

%% Parse inputs: 

% Does user want to flip the colormap direction? 
dash = strncmp(ColormapName,'-',1); 
if any(dash) 
   InvertedColormap = true; 
   ColormapName(dash) = []; 
end

% Does the user want to center a diverging colormap on a specific value? 
% This parsing support original 'zero' syntax and current 'pivot' syntax. 
tmp = strncmpi(varargin,'pivot',3); 
if any(tmp) 
   autopivot = true; 
   try
      if isscalar(varargin{find(tmp)+1})
         PivotValue = varargin{find(tmp)+1}; 
         tmp(find(tmp)+1) = 1; 
      end
   end
   varargin = varargin(~tmp); 
end

% Has user requested a specific number of levels? 
tmp = isscalar(varargin); 
if any(tmp) 
   NLevels = varargin{tmp}; 
end

%% Load RGB values and interpolate to NLevels: 

try
   S = load('CrameriColourMaps.mat',ColormapName); 
   cmap = S.(ColormapName);
catch 
   warning('off','last')
   try % Standardize colormap name to lowercase
       ColormapName = lower(ColormapName);
       wmsg = lastwarn; fprintf(2,'Warning: %s\n',wmsg)
       fprintf(2,"> trying with '%s'\n",ColormapName)
       % Retry loading from the .mat dataset
       S = load('CrameriColourMaps.mat',ColormapName); 
       cmap = S.(ColormapName); 
   catch
       fprintf(2,['ERROR: Unknown colormap name ''',ColormapName,...
            '''. Try typing paletteshow.crameri to check the options and try again.\n'])
       return
   end
end

% Interpolate if necessary: 
if NLevels~=size(cmap,1) 
   cmap = interp1(1:size(cmap,1), cmap, linspace(1,size(cmap,1),NLevels),'linear');
end

%% Invert the colormap if requested by user: 

if InvertedColormap
   cmap = flipud(cmap); 
end

%% Adjust values to current caxis limits? 

if autopivot
   clim = caxis; 
   maxval = max(abs(clim-PivotValue)); 
   cmap = interp1(linspace(-maxval,maxval,size(cmap,1))+PivotValue, cmap, linspace(clim(1),clim(2),size(cmap,1)),'linear');
end

%% Clean up 

if nargout==0
   colormap(gca,cmap) 
   clear cmap  
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%palette.crameri
% Copyright (c) 2018 Fabio Crameri, original colormap values
% Copyright (c) 2018 Chad Greene, original CRAMERI function 
% Copyright (c) 2022 Gabriele Bellomia, PALETTE package adaptation and embedding
% All rights reserved.
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
%
% * Redistributions of source code must retain the above copyright notice, this
%  list of conditions and the following disclaimer.
%
% * Redistributions in binary form must reproduce the above copyright notice,
%  this list of conditions and the following disclaimer in the documentation
%  and/or other materials provided with the distribution
%
% * Neither the name of The University of Texas at Austin nor the names of its
%  contributors may be used to endorse or promote products derived from this
%  software without specific prior written permission.
%
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
% DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
% FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
% DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
% SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
% CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
% OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
% OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%license