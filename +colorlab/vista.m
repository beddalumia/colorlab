%% ENTER THE COLORLAB
%
% >> colorlab.vista()
%
% To peak at the COLORLAB.
%
% If you are thrilled by the view: colorlab.enter() ✧

function vista()

        folder = erase(fileparts(mfilename('fullpath')),'+colorlab');
        % > COLORLAB introspects itself
    
    xpathshow(folder);
    
    % Would the user decide to enter... promote it!
    fprintf('\n')
    fprintf('↑↑↑ THIS IS THE COLORLAB ↑↑↑\n')
    fprintf('\n')
    fprintf('  > If you are thrilled: colorlab.enter() ✧ \n')
    fprintf('\n')

end