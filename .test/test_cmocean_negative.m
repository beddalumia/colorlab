cmocean_negative()

function cmocean_negative()

    disp('TESTING negative lightness [palette.cmocean]')

    colorlab.enter
    close all
    clear

    map1 = get_palette('algae',256,'negative');
    map2 = palette.cmocean('algae','negative');

    assert(isequal(map1,map2))

    disp('>> All good!')
    disp('------------')

end