upgrade_crameri()

function upgrade_crameri()

    disp('TESTING upgrading of crameri [private function]')

    here = pwd;
    root = erase(fileparts(mfilename('fullpath')),'.test');
    cd(root)
    cd('crameri')
    disp('Release 7 [zenodo::5501399]')
    crameri_update(7,5501399)
    disp('Release 6 [zenodo::4153113]')
    crameri_update('6','4153113')
    cd(here)

    disp('>> All good!')
    disp('------------')

end