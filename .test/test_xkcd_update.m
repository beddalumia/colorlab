xkcd_update()

function xkcd_update()

    disp('TESTING upgrade of xkcd colors [rgb.xkcd]')

    colorlab.enter
    close all
    clear

    here = pwd;
    root = erase(fileparts(mfilename('fullpath')),'.test');
    cd(root)
    cd('+rgb/private')
    delete('xkcd_rgb_data.mat')
    cd(here)

    rgb.xkcd('white');

    disp('>> All good!')
    disp('------------')

end