%% LEAVE THE COLORVERSE
%
% >> colorverse.leave(['quiet'])
%
% To leave the COLORVERSE. [if you tell it to be 'quiet', it would
%                           avoid to print, as required...] 
%
% Then, after leaving, and realizing it's gone:
%
%   > if you wish to go away permanently: savepath()           ✦
%   > if you happen to desire a way back: colorverse.enter()   ✧ 
%   > in the case something has went bad: restoredefaultpath() ✦ 

function leave(quiet)

    if nargin == 1 && isequal(lower(quiet),'quiet')
       quietflag = true;
    else
       quietflag = false;
    end

    folder = erase(fileparts(mfilename('fullpath')),'+colorverse');
    % > COLORVERSE destroys itself
    
    COLORVERSE = xgenpath(folder,'**/*.git');
    oldpath = rmpath(COLORVERSE);
    addpath(userpath); % Safety-measure
    printflag = not(isequal(oldpath,path));
    
    % Final greetings!
    if printflag && not(quietflag)
        fprintf('\n')
        fprintf('☄☄☄ COLORVERSE DESTROYED ☄☄☄ \n')
        fprintf('\n')
        fprintf('  > if you wish to go away permanently: savepath()           ✦ \n')
        fprintf('  > if you happen to desire a way back: colorverse.enter()   ✧ \n')
        fprintf('  > in the case something has went bad: restoredefaultpath() ✦ \n')
        fprintf('  \n                                                           \n')
    end
end
