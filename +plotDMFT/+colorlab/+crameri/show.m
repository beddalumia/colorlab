function varargout = show(varargin) 
% CRAMERI.SHOW prints to screen a visual guide to Crameri colormaps 
% 
%% Syntax 
% 
%  crameri.show
% 
%% Description 
%  
% crameri.show, without any inputs, displays all the colormaps available in +CRAMERI. 
%
%% Author Info 
% The original CRAMERI function was written by Chad A. Greene of the University of Texas
% Institute for Geophysics (UTIG), August 2018, using Fabio Crameri's 
% scientific colormaps, version 4.0. http://www.fabiocrameri.ch/colourmaps.php
% The present implementation upgrades to version 7.0 of such colormaps. 
% The packaging end embedding in +COLORLAB has been curated by Gabriele Bellomia.
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
% See also CRAMERI.CMAP BREWER, CUBEHELIX, MATPLOTLIB, PRESET_COLORMAP, COLORMAP and CAXIS.  

	%% Wrap the private crameri function
	   if nargin > 0
			fprintf(2,'Warning: you might want to call crameri.cmap instead.\n');
	   else
	   		[varargout{1:nargout}] = crameri();
	   end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%creameri.cmap
%
% Copyright (c) 2018 Fabio Crameri, original colormap values
% Copyright (c) 2018 Chad Greene, original CRAMERI function 
% Copyright (c) 2022 Gabriele Bellomia, CRAMERI package adaptation and embedding
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