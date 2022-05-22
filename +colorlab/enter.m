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

    COLORLAB = xgenpath(folder,'**/*.git');
    oldpath = addpath(COLORLAB);
    printflag = not(isequal(oldpath,path));
    
    % Better to check for duplicates
    find_duplicate(folder);
    
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