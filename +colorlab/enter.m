%% ENTER THE COLORLAB
%
% >> colorlab.enter($path)
%
% To build the COLORLAB. [if you tell it to be 'quiet', it would
%                         avoid to print, as required...] 
%
% Then, after you enter, a choice shall be made:
%
%     > if you wish to stay permanently: savepath() ✧ 
%     > else enjoy as you want and colorlab.leave() ✦ 
%     > if something went bad: restoredefaultpath() ✧ 

function enter(quiet)

    if nargin == 1 && isequal(lower(quiet),'quiet')
       quietflag = true;
    else
       quietflag = false;
    end

    folder = erase(fileparts(mfilename('fullpath')),'+colorlab');
    % > COLORLAB initiates itself

    try
        COLORLAB = xgenpath(folder,'**/*.git');
    catch
        COLORLAB = genpath(folder);
    end
    oldpath = addpath(COLORLAB);
    printflag = not(isequal(oldpath,path));
    
    % Better to check for duplicates (in MATLAB)
    if ~isoctave
        find_duplicate(folder);
    end
    
    % Let the user decide if to save or not to save...
    if printflag && not(quietflag)
        fprintf('\n')
        fprintf('✦✧✦ WELCOME TO THE COLORLAB ✧✦✧\n')
        fprintf('\n')
        fprintf('  > if you wish to stay permanently: savepath() ✧ \n')
        fprintf('  > else enjoy as you want and colorlab.leave() ✦ \n')
        fprintf('  > if something went bad: restoredefaultpath() ✧ \n')
        fprintf('  \n                                              \n')
    end

end

% contains

function bool = isoctave()
%% ISOCTAVE Determines if you are running under GNU Octave or MATLAB
%   
%       >> isoctave()
%
%       ans = 
%
%           logical
%
%           0 ----> IF running under MATLAB
%           1 ----> IF running under OCTAVE
%
% See also ispc, ismac, isunix, ver
  bool = exist('__octave_config_info__','builtin') == 5;
end