function [RGB] = str2rgb(varargin)
%STR2RGB tries to convert an arbitrary color name into a valid rgb triplet.
%It relies on X11/rgb and xkcd/rgb colorsets, and a very powerfull string-
%lookup procedure (as provided by the mighty Chad. A. Greene). 
%
%% USAGE
%
%  >> str2rgb("yellow","red")
%  >> str2rgb('yellow','red')
%  >> str2rgb('yellowrong') % ==> will make proposals
%  >> str2rgb({'yellowish'}) 
%  >> str2rgb({'yellow','red2','reddish',"yellowish"})
%  >> str2rgb('matlab1','matlab2','matlab3','matlab4')
%  >> str2rgb({'pyplot1',"pyplot2",'pyplot3'})
%  >> str2rgb('#ff00ff','de56f0')
%
%  As you can see the interface is very robust and can take many strings or
%  charvectors, as well as single cell-arrays of both. In case one or more 
%  of the provided colornames do not match the function will suggest near-
%  matches in one or both the databases, so to ease the trial-and-error. :)
%
%  STR2RGB is essentially a glorified wrapper of the very ingenious rgb.X11
%  and rgb.xkcd functions, both derived from an original work of C. Greene.
%
%  NEW! Now str2rgb accepts also HEX color codes as input, through hex2rgb.
%
%  NB) As an ergonomic bonus STR2RGB provides also traductions for MATLAB
%      intrinsics ('r','g','b','k'...), for default linecolors ('matlab1',
%      'matlab2,...'matlab7') and even for matplotlib default linecolors,
%      to be called as 'pyplot1','pyplot2',...'pyplot10'. For more you can
%      fall-back to the PALETTE package.
%
%% COPYRIGHT
%  
%  MIT LICENSE (c) 2022, Gabriele Bellomia
%
%  See also rgb.X11, rgb.xkcd, view_color, strlookup, palette

    %% Input wrangling
    
    if nargin == 0
       help str2rgb
       return
    end
    
    if ischar(varargin{1}) || isstring(varargin{1})
       number_of_colors = length(varargin);
    else
       number_of_colors = length(varargin{:});
    end
    
    try
        requested_names = cellstr(varargin{:});
    catch
        requested_names = cellstr({varargin{:}});
    end

    colliding_names = intersection();
    
    colliflags = ismember(requested_names,colliding_names);
    
    collisions = requested_names(colliflags);
    
    unique_names = setdiff(requested_names,collisions);
    
    %% Output inizialization
    
    RGB = zeros(number_of_colors,3); 
    MATLAB = lines(7);
    PYPLOT = palette.tab10(10);
    
    %% Is it just an hex code?
    
    try %#ok
        for i = 1:number_of_colors
            RGB(i,:) = hex2rgb(varargin{i});
        end
        return
    end
    
    %% Hardcode XKCD backend for overlapping colornames
    
    if not(isempty(collisions))
    
        wmessage = [' The following colornames are present in both\n\t',...
                    ' X11 and XKCD collections. We forcefully fall\n\t',...
                    ' back to XKCD as it is indeed more intuitive.\n\t',...
                    ' Should you prefer X11 just call rgb.X11() :)\n\n'];

        fprintf('\nWARNING:');
        fprintf(wmessage);
        disp(collisions);
        
        RGB(colliflags,:) = rgb.xkcd(collisions);
        
    end
    
    %% Exit if no remaining colornames
    
    if isempty(unique_names)return; end                                    %#ok
    
    %% Do assign nontrivial colornames
    
    for i = 1:number_of_colors % crucial to feed colornames one by one
        if not(colliflags(i))  % to avoid discarding xkcd once for all

            %% Hardcoded translations for MATLAB instrinsics
            try
                overloaded_switcher = requested_names{i};
            catch
                overloaded_switcher = cell2mat(requested_names);
            end
            switch overloaded_switcher
                % Legacy intrinsics
                case 'r'
                         RGB(i,:) = [1 0 0];
                case 'g'
                         RGB(i,:) = [0 1 0];
                case 'b'
                         RGB(i,:) = [0 0 1];
                case 'c'
                         RGB(i,:) = [0 1 1];
                case 'm'
                         RGB(i,:) = [1 0 1];
                case 'y'
                         RGB(i,:) = [1 1 0];
                case 'k'
                         RGB(i,:) = [0 0 0];
                case 'w'
                         RGB(i,:) = [1 1 1]; 
                % R2014b+ defaults
                case 'matlab1'
                         RGB(i,:) = MATLAB(1,:);
                case 'matlab2'
                         RGB(i,:) = MATLAB(2,:);
                case 'matlab3'
                         RGB(i,:) = MATLAB(3,:);
                case 'matlab4'
                         RGB(i,:) = MATLAB(4,:);
                case 'matlab5'
                         RGB(i,:) = MATLAB(5,:);
                case 'matlab6'
                         RGB(i,:) = MATLAB(6,:);
                case 'matlab7'
                         RGB(i,:) = MATLAB(7,:);
                % MATPLOTLIB lines
                case 'pyplot1'
                         RGB(i,:) = PYPLOT(1,:);
                case 'pyplot2'
                         RGB(i,:) = PYPLOT(2,:);
                case 'pyplot3'
                         RGB(i,:) = PYPLOT(3,:);
                case 'pyplot4'
                         RGB(i,:) = PYPLOT(4,:);
                case 'pyplot5'
                         RGB(i,:) = PYPLOT(5,:);
                case 'pyplot6'
                         RGB(i,:) = PYPLOT(6,:);
                case 'pyplot7'
                         RGB(i,:) = PYPLOT(7,:);
                case 'pyplot8'
                         RGB(i,:) = PYPLOT(8,:);
                case 'pyplot9'
                         RGB(i,:) = PYPLOT(9,:);
                case 'pyplot10'
                         RGB(i,:) = PYPLOT(10,:);
                otherwise
                    
            %% Call both custom backends otherwise
                try
                    RGB(i,:) = rgb.xkcd(requested_names{i});
                catch
                    fprintf('But before, let me try with X11...\n\n')
                    try
                        RGB(i,:) = rgb.X11(requested_names{i}); disp('Catched!')
                    catch
                        warn_msg = ['Color not found. ',...
                                    'Call view_color to inspect the options.'];
                        disp(warn_msg); % finally give up and exit
                        return
                    end
                end
            end
        end
    end
     
   %% contains      
   
   function colliding_names = intersection()
            colliding_names = { 'aquamarine';
                                'azure';
                                'beige';
                                'black';
                                'blue';
                                'brown';
                                'chartreuse';
                                'chocolate';
                                'coral';
                                'cyan';
                                'gold';
                                'goldenrod';
                                'green';
                                'gray';
                                'grey';
                                'ivory';
                                'khaki';
                                'lavender';
                                'magenta';
                                'maroon';
                                'navy';
                                'orange';
                                'orchid';
                                'pink';
                                'plum';
                                'purple';
                                'red';
                                'salmon';
                                'sienna';
                                'tan';
                                'tomato';
                                'turquoise';
                                'violet';
                                'wheat';
                                'white';
                                'yellow'  };
   end
end