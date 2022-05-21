function cmap = cmocean(ColormapName,varargin) 
% CMOCEAN provides perceptually-uniform colormaps created by Kristen Thyng. 
% 
%% Syntax 
% 
%  palette.cmocean 
%  cmap = palette.cmocean('ColormapName') 
%  cmap = palette.cmocean('-ColormapName') 
%  cmap = palette.cmocean(...,NLevels)
%  cmap = palette.cmocean(...,'pivot',PivotValue) 
%  cmap = palette.cmocean(...,'negative') 
%  palette.cmocean(...)
% 
%% Description 
% 
% cmap = palette.cmocean('ColormapName') returns a 256x3 colormap. 
% ColormapName can be any of of the following: 
% 
%          SEQUENTIAL:                DIVERGING: 
%          'thermal'                  'balance'
%          'haline'                   'delta'
%          'solar'                    'curl'
%          'ice'                      'diff'
%          'gray'                     'tarn'
%          'oxy' 
%          'deep'                     CONSTANT LIGHTNESS:
%          'dense'                    'phase'
%          'algae'                
%          'matter'                   OTHER:
%          'turbid'                   'topo'
%          'speed'                    
%          'amp'
%          'tempo'
%          'rain'
%
% For a visual depiction, type paletteshow.cmocean.
%
% cmap = palette.cmocean('-ColormapName') a minus sign preceeding any ColormapName flips the
% order of the colormap. 
%
% cmap = palette.cmocean(...,NLevels) specifies a number of levels in the colormap.  Default
% value is 256. 
%
% cmap = palette.cmocean(...,'pivot',PivotValue) centers a diverging colormap such that white 
% corresponds to a given value and maximum extents are set using current caxis limits. 
% If no PivotValue is set, 0 is assumed. Early versions of this function used 'zero'
% as the syntax for 'pivot',0 and the old syntax is still supported. 
%
% cmap = palette.cmocean(...,'negative') inverts the lightness profile of the colormap. This can be 
% useful particularly for divergent colormaps if the default white point of divergence
% gets lost in a white background. 
% 
% palette.cmocean(...) without any outputs sets the current colormap to the current axes.  
% 
%% Examples 
% Using this sample plot: 
% 
%   imagesc(peaks(1000)+1)
%   colorbar
% 
% Set the colormap to 'algae': 
% 
%   palette.cmocean('algae') 
% 
% Same as above, but with an inverted algae colormap: 
% 
%   palette.cmocean('-algae')
% 
% Set the colormap to a 12-level 'solar': 
% 
%   palette.cmocean('solar',12)
% 
% Get the RGB values of a 5-level thermal colormap: 
% 
%   RGB = palette.cmocean('thermal',5)
% 
% Some of those values are below zero and others are above. If this dataset represents
% anomalies, perhaps a diverging colormap is more appropriate: 
% 
%   palette.cmocean('balance') 
% 
% It's unlikely that 1.7776 is an interesting value about which the data values 
% diverge.  If you want to center the colormap on zero using the current color 
% axis limits, simply include the 'pivot' option:  
% 
%   palette.cmocean('balance','pivot',0) 
%
%% Author Info 
% This function was written by Chad A. Greene of the Institute for Geophysics at the 
% University of Texas at Austin (UTIG), June 2016, using colormaps created by Kristen
% Thyng of Texas A&M University, Department of Oceanography. More information on the
% palette.cmocean project can be found at http://matplotlib.org/palette.cmocean/. 
% The packaging end embedding in +PALETTE has been curated by Gabriele Bellomia.
% 
%% Citing this colormap: 
% If you find an occasion to cite these colormaps for any reason, or if you just want
% some nice beach reading, check out the following paper from the journal Oceanography: 
% 
% Thyng, K.M., C.A. Greene, R.D. Hetland, H.M. Zimmerle, and S.F. DiMarco. 2016. True 
% colors of oceanography: Guidelines for effective and accurate colormap selection. 
% Oceanography 29(3):9?13, http://dx.doi.org/10.5670/oceanog.2016.66.
% 
% See also PALETTE PALETTESHOW PRESET_PALETTE, COLORMAP and CAXIS.  

%% Display colormap options: 

if nargin==0
   figure('menubar','none','numbertitle','off','Name','palette.cmocean options:')
   cmoceantable = load('CMoceanShowPalette.mat','im');
   try
      imshow(cmoceantable.im); 
   catch
      axes('pos',[0 0 1 1])
      image(cmoceantable.im); 
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
dash = regexp(ColormapName,'-'); 
if any(dash) 
   InvertedColormap = true; 
   ColormapName(dash) = []; 
end

% Forgive the British: 
if strncmpi(ColormapName,'grey',4)
   ColormapName = 'gray'; 
end

% Does the user want a "negative" version of the colormap (with an inverted lightness profile)? 
tmp = strncmpi(varargin,'negative',3); 
if any(tmp) 
   negativeColormap = true; 
   varargin = varargin(~tmp); 
else
   negativeColormap = false; 
end

% Does the user want to center a diverging colormap on a specific value? 
% This parsing support original 'zero' syntax and current 'pivot' syntax. 
 tmp = strncmpi(varargin,'pivot',3) | strncmpi(varargin,'zero',3); % Thanks to Phelype Oleinik for this suggestion. 
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

cmap = cmoceanRawRGB(ColormapName); % a subfunction provided below with RGB values of all maps. 

if negativeColormap
   
   % Convert RGB to LAB colorspace: 
   LAB = colorspace('RGB->LAB',cmap); 

   % Operate on the lightness profile: 
   L = LAB(:,1); 

   % Flip the lightness profile and set the lowest point to black:
   L = max(L) - L; 

   % Stretch the lightness profile to make the lightest bits 95% white. (Going 100% white
   % would make the ends of a divergent profile impossible to distinguish.)
   L = L*(95/max(L)); 

   % Make a new LAB matrix: 
   LAB = [L LAB(:,2:3)]; 
   
   % Convert LAB back to RGB: 
   cmap = colorspace('LAB->RGB',LAB); 
end

%% Invert the colormap if requested by user: 

if InvertedColormap
   cmap = flipud(cmap); 
end

%% Adjust values to current caxis limits? 

if autopivot
   clim = caxis; 
   assert(PivotValue>=clim(1) & PivotValue<=clim(2),'Error: pivot value must be within the current color axis limits.') 
   maxval = max(abs(clim-PivotValue)); 
   cmap = interp1(linspace(-maxval,maxval,size(cmap,1))+PivotValue, cmap, linspace(clim(1),clim(2),size(cmap,1)),'linear');
end

%% Interpolate if necessary: 

if NLevels~=size(cmap,1)
   cmap = interp1(1:size(cmap,1), cmap, linspace(1,size(cmap,1),NLevels),'linear');
end

%% Clean up 

if nargout==0
   colormap(gca,cmap) 
   clear cmap  
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%palettes.cmocean
% MIT License
% Copyright (c) 2021 Chad Greene, original CMOCEAN function 
% Copyright (c) 2022 Gabriele Bellomia, PALETTE package adaptation and embedding
% All rights reserved.
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%license

