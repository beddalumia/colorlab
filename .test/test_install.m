install()

function install()

    disp('TESTING (un)install procedures [+colorlab]')

    colorlab.vista 
    colorlab.enter 
    backup_path = path();
    colorlab.leave 
    addpath(backup_path); % To avoid disrupting subsequent tests...

    disp('>> All good!')
    disp('------------')

end