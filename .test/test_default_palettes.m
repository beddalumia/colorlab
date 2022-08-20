 default_palettes()
 
 function default_palettes()
 
    disp('TESTING all default palettes [set_palette]')

    colorlab.enter
    close all
    clear

    set_palette % prints help

    disp 'default N'
    set_palette show

    N = 3;
    disp 'N = 3'
    set_palette('show',N)

    disp('>> All good!')
    disp('------------')

 end