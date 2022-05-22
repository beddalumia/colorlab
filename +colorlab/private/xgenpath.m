%% XGENPATH: a genpath that allows excluding regular expressions
%
% pathStr = xgenpath(basePath,ignoreDirs)
%
% Extension of Matlab's "genpath" function, except this will exclude
% directories (and their sub-tree) given by "ignoreDirs". 
%
%
%
% Inputs:
%    basePath: string.  The base path for which to generate path string.
%
%    excludeDirs: cell-array of strings. all directory names to ignore. Note,
%                 these strings are passed into regexp surrounded by
%                 '^'   and '$'.  If your directory name contains special
%                 characters to regexp, they must be escaped.  For example,
%                 use '\.svn' to ignore ".svn" directories.  You may also
%                 use regular expressions to ignore certian patterns. For
%                 example, use '*._ert_rtw' to ignore all directories ending
%                 with "_ert_rtw".
%
% Outputs:
%    pathStr: string. semicolon delimited string of paths. (see genpath)
% 
% See also genpath

function p = xgenpath(d,excludeDirs)
	% if the input is a string, then use it as the searchstr
	if ischar(excludeDirs)
		excludeStr = excludeDirs;
	else
		excludeStr = '';
		if ~iscellstr(excludeDirs)
			error('excludeDirs input must be a cell-array of strings');
		end
		
		for i = 1:length(excludeDirs)
			excludeStr = [excludeStr '|^' excludeDirs{i} '$'];
		end
	end
	
	% Generate path based on given root directory
	files = dir(d);
	if isempty(files)
	  return
	end
	% Add d to the path even if it is empty.
	p = [d pathsep];
	% set logical vector for subdirectory entries in d
	isdir = logical(cat(1,files.isdir));
	%
	% Recursively descend through directories which are neither
	% private nor "class" directories.
	%
	dirs = files(isdir); % select only directory entries from the current listing
	for i=1:length(dirs)
		dirname = dirs(i).name;
		%NOTE: regexp ignores '.', '..', '@.*','+.*', 'resources' and 'private' directories by default. 
		if ~any(regexp(dirname,['^\.$|^\.\.$|^\@.*|^\+.*|^resources$|^private$|' excludeStr ],'start'))
		  p = [p xgenpath(fullfile(d,dirname),excludeStr)]; % recursive calling of this function.
		end
	end
end