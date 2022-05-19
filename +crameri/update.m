function update(varargin)
% Retrieves all *relevant* CRAMERI data from ZENODO and collect it into a single .mat file 
% 
%% >> CRAMERI.UPDATE(release_major,zenodo_record_number)
%
%  • Retrieves the requested(†) release from http://doi.org/10.5281/zenodo.1243862
%  • Imports all the colormaps, except the discrete-but-not-categorical ones
%  • Bundles everything in a single .mat archive, thus upgrading the package
%
%% EXAMPLES: crameri.update(7,5501399) or crameri.update('6','4153113')
%
%
% (†) TODO: we don't want to input the version details everytime we update...
%           > we'd better find a way to automatically point to the latest release
%             if no record number is provided. But ZENODO seems to fight back :(
%
% Copyright (c) 2022 Gabriele Bellomia
% All rights reserved.
%
% See also CRAMERI.CMAP, CRAMERI.SHOW, BREWER, CUBEHELIX, MATPLOTLIB, and PRESET_COLORMAP.  

	%% Wrap the private crameri_update function
      if nargin < 2
            help crameri_update
      else
            crameri_update(varargin{:});
      end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%crameri.update