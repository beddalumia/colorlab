strlook()

function strlook()

    disp('TESTING smart string lookup [+rgb;get_palette]')

    colorlab.enter
    close all
    clear

    str2rgb diarrea;

    get_palette virridis;

    set_colororder tab;

    disp('>> All good!')
    disp('------------')

end