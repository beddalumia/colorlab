color_order()

function color_order()

    disp('TESTING set_colororder')

    colorlab.enter
    close all
    clear

    set_colororder % prints help
    N = 7
    set_colororder show
    N = N + 2
    set_colororder('show',N)

    disp('>> All good!')
    disp('------------')
    
end