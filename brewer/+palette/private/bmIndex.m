function [idx,itp] = bmIndex(N,num,typ)
% Ensure exactly the same colors as the online ColorBrewer colorschemes.
    itp = N>num;
    switch typ
        case 'Qualitative'
            itp = false;
            idx = 1+mod(0:N-1,num);
        case 'Diverging'
            switch N
                case 1 % extrapolated
                    idx = 8;
                case 2 % extrapolated
                    idx = [4,12];
                case 3
                    idx = [5,8,11];
                case 4
                    idx = [3,6,10,13];
                case 5
                    idx = [3,6,8,10,13];
                case 6
                    idx = [2,5,7,9,11,14];
                case 7
                    idx = [2,5,7,8,9,11,14];
                case 8
                    idx = [2,4,6,7,9,10,12,14];
                case 9
                    idx = [2,4,6,7,8,9,10,12,14];
                case 10
                    idx = [1,2,4,6,7,9,10,12,14,15];
                otherwise
                    idx = [1,2,4,6,7,8,9,10,12,14,15];
            end
        case 'Sequential'
            switch N
                case 1 % extrapolated
                    idx = 6;
                case 2 % extrapolated
                    idx = [4,8];
                case 3
                    idx = [3,6,9];
                case 4
                    idx = [2,5,7,10];
                case 5
                    idx = [2,5,7,9,11];
                case 6
                    idx = [2,4,6,7,9,11];
                case 7
                    idx = [2,4,6,7,8,10,12];
                case 8
                    idx = [1,3,4,6,7,8,10,12];
                otherwise
                    idx = [1,3,4,6,7,8,10,11,13];
            end
        otherwise
            error('SC:colorbrewer:UnknownType','Unknown type string.')
    end
end