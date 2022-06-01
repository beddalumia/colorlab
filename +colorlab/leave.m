%% LEAVE THE COLORLAB
%
% >> colorlab.leave(['quiet'])
%
% To leave the COLORLAB. [if you tell it to be 'quiet', it would
%                         avoid to print, as required...] 
%
% Then, after leaving, and realizing it's gone:
%
%   > if you wish to go away permanently: savepath()           ✦
%   > if you happen to desire a way back: colorlab.enter()     ✧ 
%   > in the case something has went bad: restoredefaultpath() ✦ 

function leave(quiet)

    if nargin == 1 && isequal(lower(quiet),'quiet')
       quietflag = true;
    else
       quietflag = false;
    end

    folder = erase(fileparts(mfilename('fullpath')),'+colorlab');
    % > COLORLAB destroys itself
    
    try
        COLORLAB = xgenpath(folder,'**/*.git');
    catch
        COLORLAB = genpath(folder);
    end
    oldpath = rmpath(COLORLAB);
    if ~isoctave
        addpath(userpath); % Safety-measure
    end
    printflag = not(isequal(oldpath,path));
    
    % Final greetings!
    if printflag && not(quietflag)
        fprintf('\n')
        fprintf('☄☄☄ COLORLAB DESTROYED ☄☄☄ \n')
        fprintf('\n')
        fprintf('  > if you wish to go away permanently: savepath()           ✦ \n')
        fprintf('  > if you happen to desire a way back: colorlab.enter()     ✧ \n')
        fprintf('  > in the case something has went bad: restoredefaultpath() ✦ \n')
        fprintf('  \n                                                           \n')
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