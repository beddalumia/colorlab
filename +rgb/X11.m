function [RGB] = X11(varargin)
% X11 returns rgb triplets according to historical X11/rgb.txt UNIX file
%
% 
%% SYNTAX 
%
% col = rgb.X11('Color Name') 
% col = rgb.X11('Color Name 1','Color Name 2',...,'Color Name N') 
% col = rgb.X11({'Color Name 1','Color Name 2',...,'Color Name N'})  
% lst = rgb.X11("list")
% rgb.X11("show")
% 
%% DESCRIPTION 
%
% col = X11('Color Name') returns the rgb triplet of the color described by the
% string 'Color Name'. Try any color name you can think of, it'll probably work.
% If not we'll provide well-targeted suggestions for you :)
% 
% col = X11('Color Name 1','Color Name 2',...,'Color Name N') returns an
% N by 3 matrix containing RGB triplets for each color name. 
% 
% col = X11({'Color Name 1','Color Name 2',...,'Color Name N'}) accepts
% list of color names as a character array, too. 
%
% lst = X11("list") will return a cell of strings containing all available
% colornames. To be utilized programmatically.
%
% X11('show') will try to open a local html chart on the default browser.
% If not possible it would resort to CPRINTF to print all the available 
% names on stdout, with a colored '⬜' as a sample. 
% Please note that this would be quite slow. Furthermore, being based on 
% (undocumented) java features of the MATLAB runtime, it will /not/ work 
% outside of the official MATLAB command window (i.e. no external terminals
% nor ssh servers, nor GNU Octave, etc.). Finally if everything else fails,
% all available names will be printed in black, leaving it to your intuition.
%
% NB) Name recognition is case-insensitive, through strcmpi. No spaces though.
%
%% USAGE
%
% EXAMPLE 1
% rgb.X11('navyblue') 
% 
% EXAMPLE 2
% rgb.X11('SpringGreen','CornflowerBlue','sapphire','radioactive green')
% 
% EXAMPLE 3
% x = -pi:.1:pi;
% y = cos(x);
% plot(x,y,'linewidth',4,'color',rgb.X11('CornflowerBlue'))
% hold on
% plot(x,y-1,'*','color',rgb.X11('Brown1'))
% plot(x,y-2,'linewidth',4,'color',rgb.X11('SeaGreen'))
% legend('cornflower','brown1 (wtf?!)','SeaGreen') 
% set(gca,'color',rgb.X11('seashell'))
% text(-1,-2,'This text is chocolate (wtf?!).','fontweight','bold','color',...
%      rgb.X11('chocolate')); 
%
% As you can see, the X11 colors do not always match commons sense. A nice,
% large-numbers-driven alternative is provided by the rgb.xkcd function :)
% 
%% AUTHOR INFO
%
% This function was originally written by Chad A. Greene of the University 
% of Texas at Austin's Institute for Geophysics. Then heavily upgraded and
% embedded in the wider +rgb package by Gabriele Bellomia. Many thanks also
% to Florian Klimm and Cedric Wannaz for their contributions. License @EOF.
% 
% See also rgb.xkcd, str2rgb, hex2rgb, rgb2hex, strcmpi and cprintf. 

    %% Load X11/RGB data:

    here = fileparts(mfilename('fullpath'));
    try % MATLAB apparently cannot load GNU-generated .mat files...
        load([here,'/private/X11_rgb_data.mat'],'namelist','rgblist');
    catch
        % Make sure the function can load the data, rebuild it if necessary
        disp 'Cannot load X11/rgb database. I will try to import from local X11.txt file now.'
        X11_install
        % Load data created by X11_install
        load([here,'/private/X11_rgb_data.mat'],'namelist','rgblist');
    end
        

    %% Input wrangling: 

    if nargin < 1
       help rgb.X11
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
            open([here,'/resources/X11.html']);
        catch
            try   % VERY VERY SLOW, FOR THAT WE HAVE LOADS OF COLORS HERE!
                for i = 2:950 
                    cprintf(rgblist(i,:),'\t⬛ ');
                    cprintf([0,0,0],[namelist{i},'\n']);
                end
            catch % In case cprintf breaks (based on undocumented features)
                disp(namelist(2:end));
            end
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
        
        % If a color name is not found in the database, display error message
        % and look for near matches: 
        if sum(strcmpi(namelist,ColorName))==0
            disp(['Color ''',ColorName,''' not found in X11/rgb.'])
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

%% installation subfunction: 

function X11_install 

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

    if ~exist('X11.txt','file')
        disp 'Cannot find X11.txt file.'
        try
        % websave('rgb.txt','https://do-not-know-a-url.txt');
        catch 
            try
                % urlwrite('https://do-not-know-a-url.txt,'rgb.txt'); %#ok <GNU>
            catch
                disp('Having trouble finding the txt file. You''ll need to retrieve it manually')
                disp('from your *nix system and place it in current folder. Then run again.')
                return
            end
        end
    end

    fid = fopen('X11.txt'); 
    RGB = textscan(fid,'%d %d %d\t\t%s');
    fclose(fid); % DO NOT delete('X11.txt')!

    R = double(RGB{1})/255;
    G = double(RGB{2})/255;
    B = double(RGB{3})/255;
    namelist = RGB{4};
    rgblist = [R,G,B];

    save('X11_rgb_data.mat','namelist','rgblist')
    disp('X11/rgb succesfully installed.'); cd(udir);
end

%% LICENSE
% Copyright (c) 2014 Chad Greene, original rgb function on FEX
% Copyright (c) 2022 Gabriele Bellomia, rgb.X11 adaptation
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