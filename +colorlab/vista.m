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
    
    if isoctave
        p = genpath(folder);
        disp(strsplit(p,pathsep));
    else
        xpathshow(folder); % Finer MATLAB option
    end
    
    % Would the user decide to enter... promote it!
    fprintf('\n')
    fprintf('↑↑↑ THIS IS THE COLORLAB ↑↑↑\n')
    fprintf('\n')
    fprintf('  > If you are thrilled: colorlab.enter() ✧ \n')
    fprintf('\n')

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