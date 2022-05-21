function varargout = cmocean(varargin) 
% PALETTESHOW.CMOCEAN prints to screen a visual guide to CMOCEAN colormaps 
% 
%% Syntax 
% 
%  paletteshow.cmocean
% 
%% Description 
%  
% PALETTESHOW.CMOCEAN, without any inputs, displays all the colormaps available in PALETTE.CMOCEAN. 
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
% See also CRAMERI PALETTE PRESET_PALETTE, COLORMAP and CAXIS.  

	%% Wrap the palette.cmocean function in a suitable way
    %> we do not want to alter the original implementation
	   if nargin > 0
			fprintf(2,'Warning: you might want to call palette.cmocean instead.\n');
	   else
	   		[varargout{1:nargout}] = palette.cmocean();
	   end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%paletteshow.cmocean
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