function [RGB] = xkcd(varargin)
% XKCD returns rgb triplets according to the celebrated XKCD color-survey. 
% > https://blog.xkcd.com/2010/05/03/color-survey-results/ 
% 
% To explore all available colors, visit: https://xkcd.com/color/rgb/
% 
%% SYNTAX 
%
% col = rgb.xkcd('Color Name') 
% col = rgb.xkcd('Color Name 1','Color Name 2',...,'Color Name N') 
% col = rgb.xkcd({'Color Name 1','Color Name 2',...,'Color Name N'})  
% lst = rgb.xkcd("list")
% rgb.xkcd("show")
% 
%% DESCRIPTION 
%
% col = xkcd('Color Name') returns the rgb triplet of the color described by the
% string 'Color Name'. Try any color name you can think of, it'll probably work.
% If not we'll provide well-targeted suggestions for you :)
% 
% col = xkcd('Color Name 1','Color Name 2',...,'Color Name N') returns an
% N by 3 matrix containing RGB triplets for each color name. 
% 
% col = xkcd({'Color Name 1','Color Name 2',...,'Color Name N'}) accepts
% list of color names as a character array, too. 
%
% lst = xkcd("list") will return a cell of strings containing all available
% colornames. To be utilized programmatically.
%
% xkcd('show') will try to open a local copy of http://xkcd.com/color/rgb/
% on the default browser. If not possible it would resort to CPRINTF to
% print all the available names on stdout, with a colored '⬜' as a sample. 
% Please note that this would be quite slow. Furthermore, being based on 
% (undocumented) java features of the MATLAB runtime, it will /not/ work 
% outside of the official MATLAB command window (i.e. no external terminals
% nor ssh servers, nor GNU Octave, etc.).
% Finally if everything else fails, xkcd will print to stdout all available
% colornames and the url to manually visit the original xkcd webpage.
%
% NB) Name recognition is case-insensitive, through strcmpi. Spaces allowed.
%
%% USAGE
%
% EXAMPLE 1
% rgb.xkcd('baby blue') 
% 
% EXAMPLE 2
% rgb.xkcd('wintergreen','sunflower yellow','sapphire','radioactive green')
% 
% EXAMPLE 3
% x = -pi:.1:pi;
% y = cos(x);
% plot(x,y,'linewidth',4,'color',rgb.xkcd('cornflower'))
% hold on
% plot(x,y-1,'*','color',rgb.xkcd('strawberry'))
% plot(x,y-2,'linewidth',4,'color',rgb.xkcd('puke green'))
% legend('cornflower','strawberry','puke green') 
% set(gca,'color',rgb.xkcd('eggshell'))
% text(-1,-2,'This text is burnt orange.','fontweight','bold','color',...
%      rgb.xkcd('burnt orange')); 
% 
%% AUTHOR INFO
%
% This function was originally written by Chad A. Greene of the University 
% of Texas at Austin's Institute for Geophysics. Then heavily upgraded and
% embedded in the wider +rgb package by Gabriele Bellomia. Many thanks also
% to Florian Klimm and Cedric Wannaz for their contributions. License @EOF.
% 
% See also rgb.x11, str2rgb, hex2rgb, rgb2hex, strcmpi and cprintf. 

    %% Load XKCD/RGB data:

    here = fileparts(mfilename('fullpath'));
    try % MATLAB apparently cannot load GNU-generated .mat files...
        load([here,'/private/xkcd_rgb_data.mat'],'namelist','rgblist');
    catch
        % Make sure the function can load the data, rebuild it if necessary
        disp 'Cannot load xkcd/rgb database. I will try to import from local rgb.txt file now.'
        xkcd_install
        % Load data created by xkcd_install
        load([here,'/private/xkcd_rgb_data.mat'],'namelist','rgblist');
    end
        

    %% Input wrangling: 

    if nargin < 1
       help rgb.xkcd
       return
    end
    
    ColorNames = varargin;
    
    if iscell(ColorNames{1})
        ColorNames = ColorNames{1};
    end
    
    if isstring(ColorNames{1})
        ColorNames = cellstr(ColorNames{1});
    end
    
    if isequal(ColorNames,"show")
        try
            open([here,'/resources/xkcd.html']); 
        catch
            try   % VERY VERY SLOW, FOR THAT WE HAVE LOADS OF COLORS HERE!
                for i = 2:950 
                    cprintf(rgblist(i,:),'\t⬛ '); 
                    cprintf([0,0,0],[namelist{i},'\n']);
                end
            catch % In case cprintf breaks (based on undocumented features)
                disp(namelist(2:end));
            end
            fprintf('\n\t> find more at https://xkcd.com/color/rgb/ \n\n');
        end
        return
    end

    if isequal(ColorNames,"list")
        % Return all the names
        RGB = namelist(2:end);
        return
    end

    assert(~isnumeric(ColorNames),'Colornames should be passed as strings.')


    %% Search for color, return rgb value: 

    % Number of input color names: 
    numcolors = length(ColorNames);

    % Preallocate a matrix to fill with RGB triplets: 
    RGB = NaN(numcolors,3);

    % Find rgb triplet for each input color string: 
    for k = 1:numcolors
        ColorName = ColorNames{k}; 
        ColorName = strrep(ColorName,'gray','grey'); % because many users spell it 'gray'. 

        % If a color name is not found in the database, display error message
        % and look for near matches: 
        if sum(strcmpi(namelist,ColorName))==0
            disp(['Color ''',ColorName,''' not found in xkcd/rgb.'])
            disp(['Consider one of these options:'])

            % Special thanks to Cedric Wannaz for writing this bit of code. He came up with a
            % quite clever solution wherein the spectrum of the input color
            % name is compared to the spectra of available options.  So cool. 
            spec = @(name) accumarray(upper(name.')-31, ones(size(name)), [60 1]) ;
            spec_mycol = spec(ColorName); % spectrum of input color name 
            spec_dist = cellfun(@(name) norm(spec(name)-spec_mycol), namelist);
            [sds,idx]   = sort(spec_dist) ;
            nearbyNames = namelist(idx(sds<=1.5));
            if isempty(nearbyNames)
                nearbyNames = namelist(idx(1:3));
            end
            disp(nearbyNames); 

            clear RGB
            return % gives up and makes the user try again. 
            
        end
        
        RGB(k,:) = rgblist(strcmpi(namelist,ColorName),:);
        
    end
    
end

%% Web-installation subfunction: 

function xkcd_install 

    % Entering the appropriate private path
    udir = pwd;
    self = mfilename('fullpath'); 
    here = fileparts(self); cd(here)
    
    % Making the private folder (if not found)
    if ~exist('private','dir')
        mkdir private
    end
    
    % Entering the private folder
    cd private

    if ~exist('rgb.txt','file')
        disp 'Cannot find rgb.txt file. I will try to download it from the internet now.'
        try
        websave('rgb.txt','https://xkcd.com/color/rgb.txt');
        catch 
            try
                urlwrite('https://xkcd.com/color/rgb.txt','rgb.txt'); %#ok <GNU>
            catch
                disp('Having trouble downloading the txt file. You''ll need to download it manually')
                fprintf('from http://xkcd.com/color/rgb.txt and place it in %s.\n',pwd)
                disp('Then run again.');
                return
            end
        end
    end

    fid = fopen('rgb.txt'); 
    RGB = textscan(fid,'%s %s','delimiter','\t');
    fclose(fid); delete('rgb.txt')

    if not(isoctave)
        namelist = RGB{1};
        hex = RGB{2};
        rgblist = local_hex2rgb(hex);
        rgblist = [NaN NaN NaN;rgblist];
    else
        namelist = RGB{2}; % CRAZY disparity between
        hex = RGB{1};      % MATLAB and GNU Octave..
        namelist = {[ ], namelist{1:end-1}};
        rgblist = local_hex2rgb(hex(2:end)); 
        rgblist = [NaN NaN NaN;rgblist];
    end

    save('xkcd_rgb_data.mat','namelist','rgblist')
    disp('xkcd/rgb succesfully installed.'); cd(udir);
end

%% Local HEX2RGB subfunction: 

function [ rgb ] = local_hex2rgb(hex,range)
% HEX2RGB converts hex color values to rgb arrays on the range 0 to 1. 
% See also hex2rgb and rgb2hex  

    %% Input checks:
    assert(nargin>0&nargin<3,'hex2rgb function must have one or two inputs.') 
    if nargin==2
        assert(isscalar(range),'Range must be a scalar, either "1" to scale from 0 to 1 or "256" to scale from 0 to 255.')
    end
    
    %% Tweak inputs if necessary: 
    if iscell(hex)
        assert(isvector(hex),'Unexpected dimensions of input hex values.')

        % In case cell array elements are separated by a comma instead of a
        % semicolon, reshape hex:
        if isrow(hex)
            hex = hex'; 
        end

        % If input is cell, convert to matrix: 
        hex = cell2mat(hex);
    end
    if strcmpi(hex(1,1),'#')
        hex(:,1) = [];
    end
    if nargin == 1
        range = 1; 
    end
    
    %% Convert from hex to rgb: 
    switch range
        case 1
            rgb = reshape(sscanf(hex.','%2x'),3,[]).'/255;
        case {255,256}
            rgb = reshape(sscanf(hex.','%2x'),3,[]).';

        otherwise
            error('Range must be either "1" to scale from 0 to 1 or "256" to scale from 0 to 255.')
    end
    
end

%% Determine if running under GNU Octave

function bool = isoctave()
    bool = exist('__octave_config_info__','builtin') == 5;
end

%% LICENSE
% Copyright (c) 2014 Chad Greene, original rgb function on FEX
% Copyright (c) 2022 Gabriele Bellomia, rgb.xkcd package adaptation
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are
% met:
% 
%   * Redistributions of source code must retain the above copyright
%     notice, this list of conditions and the following disclaimer.
%   * Redistributions in binary form must reproduce the above copyright
%     notice, this list of conditions and the following disclaimer in
%     the documentation and/or other materials provided with the distribution
% 
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
% LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
% CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
% SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
% INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
% POSSIBILITY OF SUCH DAMAGE.


