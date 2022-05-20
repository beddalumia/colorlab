function xpathshow(dir)
%% SHOW THE PATH IN USER-FRIENDLY WAY
%  -> i.e. splitting the entries and 
%     printing them in reversed order
%
%   >> pathshow():        MATLAB PATH
%   >> pathshow('here'):  CUSTOM PATH
%
%   NB. It uses xgenpath instead of 
%   native genpath to generate the 
%   custom recursive path. So to be
%   compatible with matverse rules.
    if nargin < 1
        p = strsplit(path,pathsep);
    else
        p = xgenpath(dir,'**/*.git');
        p = strsplit(p,pathsep);
    end
    for i = length(p):-1:1
        fprintf('%s\n',p{i})
    end
end