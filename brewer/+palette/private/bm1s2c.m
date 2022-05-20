function arr = bm1s2c(arr)
% If scalar string then extract the character vector, otherwise data is unchanged.
    if isa(arr,'string') && isscalar(arr)
        arr = arr{1};
    end
end