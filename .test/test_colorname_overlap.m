disp('TESTING <X11|xkcd> overlap [+rgb]')

colorlab.enter
close all
clear

A = rgb.X11('list');
B = rgb.xkcd('list');
computed_overlap = intersect(A,B);

disp overlap:
disp(computed_overlap)
assert(isequal(computed_overlap,reference_overlap),'overlap has changed')

disp('>> All good!')
disp('------------')

function list = reference_overlap()

    list = {
    'aquamarine',
    'azure'     ,
    'beige'     ,
    'black'     ,
    'blue'      ,
    'brown'     ,
    'chartreuse',
    'chocolate' ,
    'coral'     ,
    'cyan'      ,
    'gold'      ,
    'goldenrod' ,
    'green'     ,
    'grey'      ,
    'ivory'     ,
    'khaki'     ,
    'lavender'  ,
    'magenta'   ,
    'maroon'    ,
    'navy'      ,
    'orange'    ,
    'orchid'    ,
    'pink'      ,
    'plum'      ,
    'purple'    ,
    'red'       ,
    'salmon'    ,
    'sienna'    ,
    'tan'       ,
    'tomato'    ,
    'turquoise' ,
    'violet'    ,
    'wheat'     ,
    'white'     ,
    'yellow'    
    };

end