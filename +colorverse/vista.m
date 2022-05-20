%% ENTER THE COLORVERSE
%
% >> colorverse.vista()
%
% To peak at the COLORVERSE.
%
% If you are thrilled by the view: colorverse.enter() ✧

function vista()

        folder = erase(fileparts(mfilename('fullpath')),'+colorverse');
        % > COLORVERSE introspects itself
    
    xpathshow(folder);
    
    % Would the user decide to enter... promote it!
    fprintf('\n')
    fprintf('↑↑↑ THIS IS THE COLORVERSE ↑↑↑\n')
    fprintf('\n')
    fprintf('  > If you are thrilled: colorverse.enter() ✧ \n')
    fprintf('\n')

end