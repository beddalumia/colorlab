function find_duplicate(folder)

    if nargin < 1
        folder = userpath;
        % > Default MATVERSE location
    end
    % This would check all the toolboxes...
    P=path;
    P=strsplit(P, pathsep());
    % So we exclude all those internal paths
    P=P(strncmpi(folder,P,length(folder)));
    P=cellfun(@(x) what(x),P,'UniformOutput',false);
    P=vertcat(P{:});
    % Q is a cell of cells of strings
    Q=arrayfun(@(x) x.m,P,'UniformOutput',false);
    Q=vertcat(Q{:});
    % R is a cell of cell of strings
    R=arrayfun(@(x) repmat({x.path},size(x.m)),P,'UniformOutput',false);
    R=vertcat(R{:});
    [C,~,~]=unique(Q);
    warnflag=false;
    for c=1:numel(C)
        ind=strcmpi(C{c},Q);
        if sum(ind)>1
           fprintf(2,'\n WARNING: duplicate %s at paths:\n\n',C{c})
           fprintf(2,' > %s\n',R{ind})
           fprintf(2,'\n')
           warnflag=true;
        end
    end
    if warnflag
    fprintf(2,'\n Please ensure there are no unintended duplications!\n')
    fprintf(2,' < if you want to remove some: rmpath(''cursed_path'')\n\n')
    end

end