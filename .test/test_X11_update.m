X11_update()

function X11_update()

    disp('TESTING upgrade of X11 colors [rgb.X11]')

    colorlab.enter
    close all
    clear

    here = pwd;
    root = erase(fileparts(mfilename('fullpath')),'.test');
    cd(root)
    cd('+rgb/private')
    delete('X11_rgb_data.mat')
    cd(here)

    rgb.X11('white');

    disp('>> All good!')
    disp('------------')

end