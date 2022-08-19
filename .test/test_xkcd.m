xkcd_colors()

function xkcd_colors()
    
    disp('TESTING xkcd colorset [rgb.xkcd;rgb2hex]')

    colorlab.enter
    close all
    clear

    names = rgb.xkcd('list');
    disp('Are colornames unchanged?')
    assert(isequal(names,reference_names),'xkcd colornames have changed')
    disp('> yes')

    colors = rgb2hex(rgb.xkcd(names));
    refhex = rgb2hex(reference_colors);
    disp('Are colors unchanged?')
    assert(isequal(colors,refhex),'xkcd colors have changed')
    disp('> yes')

    disp('>> All good!')
    disp('------------')

end

function list = reference_names()

    list = {
        'cloudy blue'               ,
        'dark pastel green'         ,
        'dust'                      ,
        'electric lime'             ,
        'fresh green'               ,
        'light eggplant'            ,
        'nasty green'               ,
        'really light blue'         ,
        'tea'                       ,
        'warm purple'               ,
        'yellowish tan'             ,
        'cement'                    ,
        'dark grass green'          ,
        'dusty teal'                ,
        'grey teal'                 ,
        'macaroni and cheese'       ,
        'pinkish tan'               ,
        'spruce'                    ,
        'strong blue'               ,
        'toxic green'               ,
        'windows blue'              ,
        'blue blue'                 ,
        'blue with a hint of purple',
        'booger'                    ,
        'bright sea green'          ,
        'dark green blue'           ,
        'deep turquoise'            ,
        'green teal'                ,
        'strong pink'               ,
        'bland'                     ,
        'deep aqua'                 ,
        'lavender pink'             ,
        'light moss green'          ,
        'light seafoam green'       ,
        'olive yellow'              ,
        'pig pink'                  ,
        'deep lilac'                ,
        'desert'                    ,
        'dusty lavender'            ,
        'purpley grey'              ,
        'purply'                    ,
        'candy pink'                ,
        'light pastel green'        ,
        'boring green'              ,
        'kiwi green'                ,
        'light grey green'          ,
        'orange pink'               ,
        'tea green'                 ,
        'very light brown'          ,
        'egg shell'                 ,
        'eggplant purple'           ,
        'powder pink'               ,
        'reddish grey'              ,
        'baby shit brown'           ,
        'liliac'                    ,
        'stormy blue'               ,
        'ugly brown'                ,
        'custard'                   ,
        'darkish pink'              ,
        'deep brown'                ,
        'greenish beige'            ,
        'manilla'                   ,
        'off blue'                  ,
        'battleship grey'           ,
        'browny green'              ,
        'bruise'                    ,
        'kelley green'              ,
        'sickly yellow'             ,
        'sunny yellow'              ,
        'azul'                      ,
        'darkgreen'                 ,
        'green/yellow'              ,
        'lichen'                    ,
        'light light green'         ,
        'pale gold'                 ,
        'sun yellow'                ,
        'tan green'                 ,
        'burple'                    ,
        'butterscotch'              ,
        'toupe'                     ,
        'dark cream'                ,
        'indian red'                ,
        'light lavendar'            ,
        'poison green'              ,
        'baby puke green'           ,
        'bright yellow green'       ,
        'charcoal grey'             ,
        'squash'                    ,
        'cinnamon'                  ,
        'light pea green'           ,
        'radioactive green'         ,
        'raw sienna'                ,
        'baby purple'               ,
        'cocoa'                     ,
        'light royal blue'          ,
        'orangeish'                 ,
        'rust brown'                ,
        'sand brown'                ,
        'swamp'                     ,
        'tealish green'             ,
        'burnt siena'               ,
        'camo'                      ,
        'dusk blue'                 ,
        'fern'                      ,
        'old rose'                  ,
        'pale light green'          ,
        'peachy pink'               ,
        'rosy pink'                 ,
        'light bluish green'        ,
        'light bright green'        ,
        'light neon green'          ,
        'light seafoam'             ,
        'tiffany blue'              ,
        'washed out green'          ,
        'browny orange'             ,
        'nice blue'                 ,
        'sapphire'                  ,
        'greyish teal'              ,
        'orangey yellow'            ,
        'parchment'                 ,
        'straw'                     ,
        'very dark brown'           ,
        'terracota'                 ,
        'ugly blue'                 ,
        'clear blue'                ,
        'creme'                     ,
        'foam green'                ,
        'grey/green'                ,
        'light gold'                ,
        'seafoam blue'              ,
        'topaz'                     ,
        'violet pink'               ,
        'wintergreen'               ,
        'yellow tan'                ,
        'dark fuchsia'              ,
        'indigo blue'               ,
        'light yellowish green'     ,
        'pale magenta'              ,
        'rich purple'               ,
        'sunflower yellow'          ,
        'green/blue'                ,
        'leather'                   ,
        'racing green'              ,
        'vivid purple'              ,
        'dark royal blue'           ,
        'hazel'                     ,
        'muted pink'                ,
        'booger green'              ,
        'canary'                    ,
        'cool grey'                 ,
        'dark taupe'                ,
        'darkish purple'            ,
        'true green'                ,
        'coral pink'                ,
        'dark sage'                 ,
        'dark slate blue'           ,
        'flat blue'                 ,
        'mushroom'                  ,
        'rich blue'                 ,
        'dirty purple'              ,
        'greenblue'                 ,
        'icky green'                ,
        'light khaki'               ,
        'warm blue'                 ,
        'dark hot pink'             ,
        'deep sea blue'             ,
        'carmine'                   ,
        'dark yellow green'         ,
        'pale peach'                ,
        'plum purple'               ,
        'golden rod'                ,
        'neon red'                  ,
        'old pink'                  ,
        'very pale blue'            ,
        'blood orange'              ,
        'grapefruit'                ,
        'sand yellow'               ,
        'clay brown'                ,
        'dark blue grey'            ,
        'flat green'                ,
        'light green blue'          ,
        'warm pink'                 ,
        'dodger blue'               ,
        'gross green'               ,
        'ice'                       ,
        'metallic blue'             ,
        'pale salmon'               ,
        'sap green'                 ,
        'algae'                     ,
        'bluey grey'                ,
        'greeny grey'               ,
        'highlighter green'         ,
        'light light blue'          ,
        'light mint'                ,
        'raw umber'                 ,
        'vivid blue'                ,
        'deep lavender'             ,
        'dull teal'                 ,
        'light greenish blue'       ,
        'mud green'                 ,
        'pinky'                     ,
        'red wine'                  ,
        'shit green'                ,
        'tan brown'                 ,
        'darkblue'                  ,
        'rosa'                      ,
        'lipstick'                  ,
        'pale mauve'                ,
        'claret'                    ,
        'dandelion'                 ,
        'orangered'                 ,
        'poop green'                ,
        'ruby'                      ,
        'dark'                      ,
        'greenish turquoise'        ,
        'pastel red'                ,
        'piss yellow'               ,
        'bright cyan'               ,
        'dark coral'                ,
        'algae green'               ,
        'darkish red'               ,
        'reddy brown'               ,
        'blush pink'                ,
        'camouflage green'          ,
        'lawn green'                ,
        'putty'                     ,
        'vibrant blue'              ,
        'dark sand'                 ,
        'purple/blue'               ,
        'saffron'                   ,
        'twilight'                  ,
        'warm brown'                ,
        'bluegrey'                  ,
        'bubble gum pink'           ,
        'duck egg blue'             ,
        'greenish cyan'             ,
        'petrol'                    ,
        'royal'                     ,
        'butter'                    ,
        'dusty orange'              ,
        'off yellow'                ,
        'pale olive green'          ,
        'orangish'                  ,
        'leaf'                      ,
        'light blue grey'           ,
        'dried blood'               ,
        'lightish purple'           ,
        'rusty red'                 ,
        'lavender blue'             ,
        'light grass green'         ,
        'light mint green'          ,
        'sunflower'                 ,
        'velvet'                    ,
        'brick orange'              ,
        'lightish red'              ,
        'pure blue'                 ,
        'twilight blue'             ,
        'violet red'                ,
        'yellowy brown'             ,
        'carnation'                 ,
        'muddy yellow'              ,
        'dark seafoam green'        ,
        'deep rose'                 ,
        'dusty red'                 ,
        'grey/blue'                 ,
        'lemon lime'                ,
        'purple/pink'               ,
        'brown yellow'              ,
        'purple brown'              ,
        'wisteria'                  ,
        'banana yellow'             ,
        'lipstick red'              ,
        'water blue'                ,
        'brown grey'                ,
        'vibrant purple'            ,
        'baby green'                ,
        'barf green'                ,
        'eggshell blue'             ,
        'sandy yellow'              ,
        'cool green'                ,
        'pale'                      ,
        'blue/grey'                 ,
        'hot magenta'               ,
        'greyblue'                  ,
        'purpley'                   ,
        'baby shit green'           ,
        'brownish pink'             ,
        'dark aquamarine'           ,
        'diarrhea'                  ,
        'light mustard'             ,
        'pale sky blue'             ,
        'turtle green'              ,
        'bright olive'              ,
        'dark grey blue'            ,
        'greeny brown'              ,
        'lemon green'               ,
        'light periwinkle'          ,
        'seaweed green'             ,
        'sunshine yellow'           ,
        'ugly purple'               ,
        'medium pink'               ,
        'puke brown'                ,
        'very light pink'           ,
        'viridian'                  ,
        'bile'                      ,
        'faded yellow'              ,
        'very pale green'           ,
        'vibrant green'             ,
        'bright lime'               ,
        'spearmint'                 ,
        'light aquamarine'          ,
        'light sage'                ,
        'yellowgreen'               ,
        'baby poo'                  ,
        'dark seafoam'              ,
        'deep teal'                 ,
        'heather'                   ,
        'rust orange'               ,
        'dirty blue'                ,
        'fern green'                ,
        'bright lilac'              ,
        'weird green'               ,
        'peacock blue'              ,
        'avocado green'             ,
        'faded orange'              ,
        'grape purple'              ,
        'hot green'                 ,
        'lime yellow'               ,
        'mango'                     ,
        'shamrock'                  ,
        'bubblegum'                 ,
        'purplish brown'            ,
        'vomit yellow'              ,
        'pale cyan'                 ,
        'key lime'                  ,
        'tomato red'                ,
        'lightgreen'                ,
        'merlot'                    ,
        'night blue'                ,
        'purpleish pink'            ,
        'apple'                     ,
        'baby poop green'           ,
        'green apple'               ,
        'heliotrope'                ,
        'yellow/green'              ,
        'almost black'              ,
        'cool blue'                 ,
        'leafy green'               ,
        'mustard brown'             ,
        'dusk'                      ,
        'dull brown'                ,
        'frog green'                ,
        'vivid green'               ,
        'bright light green'        ,
        'fluro green'               ,
        'kiwi'                      ,
        'seaweed'                   ,
        'navy green'                ,
        'ultramarine blue'          ,
        'iris'                      ,
        'pastel orange'             ,
        'yellowish orange'          ,
        'perrywinkle'               ,
        'tealish'                   ,
        'dark plum'                 ,
        'pear'                      ,
        'pinkish orange'            ,
        'midnight purple'           ,
        'light urple'               ,
        'dark mint'                 ,
        'greenish tan'              ,
        'light burgundy'            ,
        'turquoise blue'            ,
        'ugly pink'                 ,
        'sandy'                     ,
        'electric pink'             ,
        'muted purple'              ,
        'mid green'                 ,
        'greyish'                   ,
        'neon yellow'               ,
        'banana'                    ,
        'carnation pink'            ,
        'tomato'                    ,
        'sea'                       ,
        'muddy brown'               ,
        'turquoise green'           ,
        'buff'                      ,
        'fawn'                      ,
        'muted blue'                ,
        'pale rose'                 ,
        'dark mint green'           ,
        'amethyst'                  ,
        'blue/green'                ,
        'chestnut'                  ,
        'sick green'                ,
        'pea'                       ,
        'rusty orange'              ,
        'stone'                     ,
        'rose red'                  ,
        'pale aqua'                 ,
        'deep orange'               ,
        'earth'                     ,
        'mossy green'               ,
        'grassy green'              ,
        'pale lime green'           ,
        'light grey blue'           ,
        'pale grey'                 ,
        'asparagus'                 ,
        'blueberry'                 ,
        'purple red'                ,
        'pale lime'                 ,
        'greenish teal'             ,
        'caramel'                   ,
        'deep magenta'              ,
        'light peach'               ,
        'milk chocolate'            ,
        'ocher'                     ,
        'off green'                 ,
        'purply pink'               ,
        'lightblue'                 ,
        'dusky blue'                ,
        'golden'                    ,
        'light beige'               ,
        'butter yellow'             ,
        'dusky purple'              ,
        'french blue'               ,
        'ugly yellow'               ,
        'greeny yellow'             ,
        'orangish red'              ,
        'shamrock green'            ,
        'orangish brown'            ,
        'tree green'                ,
        'deep violet'               ,
        'gunmetal'                  ,
        'blue/purple'               ,
        'cherry'                    ,
        'sandy brown'               ,
        'warm grey'                 ,
        'dark indigo'               ,
        'midnight'                  ,
        'bluey green'               ,
        'grey pink'                 ,
        'soft purple'               ,
        'blood'                     ,
        'brown red'                 ,
        'medium grey'               ,
        'berry'                     ,
        'poo'                       ,
        'purpley pink'              ,
        'light salmon'              ,
        'snot'                      ,
        'easter purple'             ,
        'light yellow green'        ,
        'dark navy blue'            ,
        'drab'                      ,
        'light rose'                ,
        'rouge'                     ,
        'purplish red'              ,
        'slime green'               ,
        'baby poop'                 ,
        'irish green'               ,
        'pink/purple'               ,
        'dark navy'                 ,
        'greeny blue'               ,
        'light plum'                ,
        'pinkish grey'              ,
        'dirty orange'              ,
        'rust red'                  ,
        'pale lilac'                ,
        'orangey red'               ,
        'primary blue'              ,
        'kermit green'              ,
        'brownish purple'           ,
        'murky green'               ,
        'wheat'                     ,
        'very dark purple'          ,
        'bottle green'              ,
        'watermelon'                ,
        'deep sky blue'             ,
        'fire engine red'           ,
        'yellow ochre'              ,
        'pumpkin orange'            ,
        'pale olive'                ,
        'light lilac'               ,
        'lightish green'            ,
        'carolina blue'             ,
        'mulberry'                  ,
        'shocking pink'             ,
        'auburn'                    ,
        'bright lime green'         ,
        'celadon'                   ,
        'pinkish brown'             ,
        'poo brown'                 ,
        'bright sky blue'           ,
        'celery'                    ,
        'dirt brown'                ,
        'strawberry'                ,
        'dark lime'                 ,
        'copper'                    ,
        'medium brown'              ,
        'muted green'               ,
        "robin's egg"               ,
        'bright aqua'               ,
        'bright lavender'           ,
        'ivory'                     ,
        'very light purple'         ,
        'light navy'                ,
        'pink red'                  ,
        'olive brown'               ,
        'poop brown'                ,
        'mustard green'             ,
        'ocean green'               ,
        'very dark blue'            ,
        'dusty green'               ,
        'light navy blue'           ,
        'minty green'               ,
        'adobe'                     ,
        'barney'                    ,
        'jade green'                ,
        'bright light blue'         ,
        'light lime'                ,
        'dark khaki'                ,
        'orange yellow'             ,
        'ocre'                      ,
        'maize'                     ,
        'faded pink'                ,
        'british racing green'      ,
        'sandstone'                 ,
        'mud brown'                 ,
        'light sea green'           ,
        'robin egg blue'            ,
        'aqua marine'               ,
        'dark sea green'            ,
        'soft pink'                 ,
        'orangey brown'             ,
        'cherry red'                ,
        'burnt yellow'              ,
        'brownish grey'             ,
        'camel'                     ,
        'purplish grey'             ,
        'marine'                    ,
        'greyish pink'              ,
        'pale turquoise'            ,
        'pastel yellow'             ,
        'bluey purple'              ,
        'canary yellow'             ,
        'faded red'                 ,
        'sepia'                     ,
        'coffee'                    ,
        'bright magenta'            ,
        'mocha'                     ,
        'ecru'                      ,
        'purpleish'                 ,
        'cranberry'                 ,
        'darkish green'             ,
        'brown orange'              ,
        'dusky rose'                ,
        'melon'                     ,
        'sickly green'              ,
        'silver'                    ,
        'purply blue'               ,
        'purpleish blue'            ,
        'hospital green'            ,
        'shit brown'                ,
        'mid blue'                  ,
        'amber'                     ,
        'easter green'              ,
        'soft blue'                 ,
        'cerulean blue'             ,
        'golden brown'              ,
        'bright turquoise'          ,
        'red pink'                  ,
        'red purple'                ,
        'greyish brown'             ,
        'vermillion'                ,
        'russet'                    ,
        'steel grey'                ,
        'lighter purple'            ,
        'bright violet'             ,
        'prussian blue'             ,
        'slate green'               ,
        'dirty pink'                ,
        'dark blue green'           ,
        'pine'                      ,
        'yellowy green'             ,
        'dark gold'                 ,
        'bluish'                    ,
        'darkish blue'              ,
        'dull red'                  ,
        'pinky red'                 ,
        'bronze'                    ,
        'pale teal'                 ,
        'military green'            ,
        'barbie pink'               ,
        'bubblegum pink'            ,
        'pea soup green'            ,
        'dark mustard'              ,
        'shit'                      ,
        'medium purple'             ,
        'very dark green'           ,
        'dirt'                      ,
        'dusky pink'                ,
        'red violet'                ,
        'lemon yellow'              ,
        'pistachio'                 ,
        'dull yellow'               ,
        'dark lime green'           ,
        'denim blue'                ,
        'teal blue'                 ,
        'lightish blue'             ,
        'purpley blue'              ,
        'light indigo'              ,
        'swamp green'               ,
        'brown green'               ,
        'dark maroon'               ,
        'hot purple'                ,
        'dark forest green'         ,
        'faded blue'                ,
        'drab green'                ,
        'light lime green'          ,
        'snot green'                ,
        'yellowish'                 ,
        'light blue green'          ,
        'bordeaux'                  ,
        'light mauve'               ,
        'ocean'                     ,
        'marigold'                  ,
        'muddy green'               ,
        'dull orange'               ,
        'steel'                     ,
        'electric purple'           ,
        'fluorescent green'         ,
        'yellowish brown'           ,
        'blush'                     ,
        'soft green'                ,
        'bright orange'             ,
        'lemon'                     ,
        'purple grey'               ,
        'acid green'                ,
        'pale lavender'             ,
        'violet blue'               ,
        'light forest green'        ,
        'burnt red'                 ,
        'khaki green'               ,
        'cerise'                    ,
        'faded purple'              ,
        'apricot'                   ,
        'dark olive green'          ,
        'grey brown'                ,
        'green grey'                ,
        'true blue'                 ,
        'pale violet'               ,
        'periwinkle blue'           ,
        'light sky blue'            ,
        'blurple'                   ,
        'green brown'               ,
        'bluegreen'                 ,
        'bright teal'               ,
        'brownish yellow'           ,
        'pea soup'                  ,
        'forest'                    ,
        'barney purple'             ,
        'ultramarine'               ,
        'purplish'                  ,
        'puke yellow'               ,
        'bluish grey'               ,
        'dark periwinkle'           ,
        'dark lilac'                ,
        'reddish'                   ,
        'light maroon'              ,
        'dusty purple'              ,
        'terra cotta'               ,
        'avocado'                   ,
        'marine blue'               ,
        'teal green'                ,
        'slate grey'                ,
        'lighter green'             ,
        'electric green'            ,
        'dusty blue'                ,
        'golden yellow'             ,
        'bright yellow'             ,
        'light lavender'            ,
        'umber'                     ,
        'poop'                      ,
        'dark peach'                ,
        'jungle green'              ,
        'eggshell'                  ,
        'denim'                     ,
        'yellow brown'              ,
        'dull purple'               ,
        'chocolate brown'           ,
        'wine red'                  ,
        'neon blue'                 ,
        'dirty green'               ,
        'light tan'                 ,
        'ice blue'                  ,
        'cadet blue'                ,
        'dark mauve'                ,
        'very light blue'           ,
        'grey purple'               ,
        'pastel pink'               ,
        'very light green'          ,
        'dark sky blue'             ,
        'evergreen'                 ,
        'dull pink'                 ,
        'aubergine'                 ,
        'mahogany'                  ,
        'reddish orange'            ,
        'deep green'                ,
        'vomit green'               ,
        'purple pink'               ,
        'dusty pink'                ,
        'faded green'               ,
        'camo green'                ,
        'pinky purple'              ,
        'pink purple'               ,
        'brownish red'              ,
        'dark rose'                 ,
        'mud'                       ,
        'brownish'                  ,
        'emerald green'             ,
        'pale brown'                ,
        'dull blue'                 ,
        'burnt umber'               ,
        'medium green'              ,
        'clay'                      ,
        'light aqua'                ,
        'light olive green'         ,
        'brownish orange'           ,
        'dark aqua'                 ,
        'purplish pink'             ,
        'dark salmon'               ,
        'greenish grey'             ,
        'jade'                      ,
        'ugly green'                ,
        'dark beige'                ,
        'emerald'                   ,
        'pale red'                  ,
        'light magenta'             ,
        'sky'                       ,
        'light cyan'                ,
        'yellow orange'             ,
        'reddish purple'            ,
        'reddish pink'              ,
        'orchid'                    ,
        'dirty yellow'              ,
        'orange red'                ,
        'deep red'                  ,
        'orange brown'              ,
        'cobalt blue'               ,
        'neon pink'                 ,
        'rose pink'                 ,
        'greyish purple'            ,
        'raspberry'                 ,
        'aqua green'                ,
        'salmon pink'               ,
        'tangerine'                 ,
        'brownish green'            ,
        'red brown'                 ,
        'greenish brown'            ,
        'pumpkin'                   ,
        'pine green'                ,
        'charcoal'                  ,
        'baby pink'                 ,
        'cornflower'                ,
        'blue violet'               ,
        'chocolate'                 ,
        'greyish green'             ,
        'scarlet'                   ,
        'green yellow'              ,
        'dark olive'                ,
        'sienna'                    ,
        'pastel purple'             ,
        'terracotta'                ,
        'aqua blue'                 ,
        'sage green'                ,
        'blood red'                 ,
        'deep pink'                 ,
        'grass'                     ,
        'moss'                      ,
        'pastel blue'               ,
        'bluish green'              ,
        'green blue'                ,
        'dark tan'                  ,
        'greenish blue'             ,
        'pale orange'               ,
        'vomit'                     ,
        'forrest green'             ,
        'dark lavender'             ,
        'dark violet'               ,
        'purple blue'               ,
        'dark cyan'                 ,
        'olive drab'                ,
        'pinkish'                   ,
        'cobalt'                    ,
        'neon purple'               ,
        'light turquoise'           ,
        'apple green'               ,
        'dull green'                ,
        'wine'                      ,
        'powder blue'               ,
        'off white'                 ,
        'electric blue'             ,
        'dark turquoise'            ,
        'blue purple'               ,
        'azure'                     ,
        'bright red'                ,
        'pinkish red'               ,
        'cornflower blue'           ,
        'light olive'               ,
        'grape'                     ,
        'greyish blue'              ,
        'purplish blue'             ,
        'yellowish green'           ,
        'greenish yellow'           ,
        'medium blue'               ,
        'dusty rose'                ,
        'light violet'              ,
        'midnight blue'             ,
        'bluish purple'             ,
        'red orange'                ,
        'dark magenta'              ,
        'greenish'                  ,
        'ocean blue'                ,
        'coral'                     ,
        'cream'                     ,
        'reddish brown'             ,
        'burnt sienna'              ,
        'brick'                     ,
        'sage'                      ,
        'grey green'                ,
        'white'                     ,
        "robin's egg blue"          ,
        'moss green'                ,
        'steel blue'                ,
        'eggplant'                  ,
        'light yellow'              ,
        'leaf green'                ,
        'light grey'                ,
        'puke'                      ,
        'pinkish purple'            ,
        'sea blue'                  ,
        'pale purple'               ,
        'slate blue'                ,
        'blue grey'                 ,
        'hunter green'              ,
        'fuchsia'                   ,
        'crimson'                   ,
        'pale yellow'               ,
        'ochre'                     ,
        'mustard yellow'            ,
        'light red'                 ,
        'cerulean'                  ,
        'pale pink'                 ,
        'deep blue'                 ,
        'rust'                      ,
        'light teal'                ,
        'slate'                     ,
        'goldenrod'                 ,
        'dark yellow'               ,
        'dark grey'                 ,
        'army green'                ,
        'grey blue'                 ,
        'seafoam'                   ,
        'puce'                      ,
        'spring green'              ,
        'dark orange'               ,
        'sand'                      ,
        'pastel green'              ,
        'mint'                      ,
        'light orange'              ,
        'bright pink'               ,
        'chartreuse'                ,
        'deep purple'               ,
        'dark brown'                ,
        'taupe'                     ,
        'pea green'                 ,
        'puke green'                ,
        'kelly green'               ,
        'seafoam green'             ,
        'blue green'                ,
        'khaki'                     ,
        'burgundy'                  ,
        'dark teal'                 ,
        'brick red'                 ,
        'royal purple'              ,
        'plum'                      ,
        'mint green'                ,
        'gold'                      ,
        'baby blue'                 ,
        'yellow green'              ,
        'bright purple'             ,
        'dark red'                  ,
        'pale blue'                 ,
        'grass green'               ,
        'navy'                      ,
        'aquamarine'                ,
        'burnt orange'              ,
        'neon green'                ,
        'bright blue'               ,
        'rose'                      ,
        'light pink'                ,
        'mustard'                   ,
        'indigo'                    ,
        'lime'                      ,
        'sea green'                 ,
        'periwinkle'                ,
        'dark pink'                 ,
        'olive green'               ,
        'peach'                     ,
        'pale green'                ,
        'light brown'               ,
        'hot pink'                  ,
        'black'                     ,
        'lilac'                     ,
        'navy blue'                 ,
        'royal blue'                ,
        'beige'                     ,
        'salmon'                    ,
        'olive'                     ,
        'maroon'                    ,
        'bright green'              ,
        'dark purple'               ,
        'mauve'                     ,
        'forest green'              ,
        'aqua'                      ,
        'cyan'                      ,
        'tan'                       ,
        'dark blue'                 ,
        'lavender'                  ,
        'turquoise'                 ,
        'dark green'                ,
        'violet'                    ,
        'light purple'              ,
        'lime green'                ,
        'grey'                      ,
        'sky blue'                  ,
        'yellow'                    ,
        'magenta'                   ,
        'light green'               ,
        'orange'                    ,
        'teal'                      ,
        'light blue'                ,
        'red'                       ,
        'brown'                     ,
        'pink'                      ,
        'blue'                      ,
        'green'                     ,
        'purple'
        };
end

function rgb = reference_colors()

    rgb = [
            0.674509803921569   0.760784313725490   0.850980392156863
            0.337254901960784   0.682352941176471   0.341176470588235
            0.698039215686274   0.600000000000000   0.431372549019608
            0.658823529411765   1.000000000000000   0.015686274509804
            0.411764705882353   0.847058823529412   0.309803921568627
            0.537254901960784   0.270588235294118   0.521568627450980
            0.439215686274510   0.698039215686274   0.247058823529412
            0.831372549019608   1.000000000000000   1.000000000000000
            0.396078431372549   0.670588235294118   0.486274509803922
            0.584313725490196   0.180392156862745   0.560784313725490
            0.988235294117647   0.988235294117647   0.505882352941176
            0.647058823529412   0.639215686274510   0.568627450980392
            0.219607843137255   0.501960784313725   0.015686274509804
            0.298039215686275   0.564705882352941   0.521568627450980
            0.368627450980392   0.607843137254902   0.541176470588235
            0.937254901960784   0.705882352941177   0.207843137254902
            0.850980392156863   0.607843137254902   0.509803921568627
            0.039215686274510   0.372549019607843   0.219607843137255
            0.047058823529412   0.023529411764706   0.968627450980392
            0.380392156862745   0.870588235294118   0.164705882352941
            0.215686274509804   0.470588235294118   0.749019607843137
            0.133333333333333   0.258823529411765   0.780392156862745
            0.325490196078431   0.235294117647059   0.776470588235294
            0.607843137254902   0.709803921568627   0.235294117647059
            0.019607843137255   1.000000000000000   0.650980392156863
            0.121568627450980   0.388235294117647   0.341176470588235
            0.003921568627451   0.450980392156863   0.454901960784314
            0.047058823529412   0.709803921568627   0.466666666666667
            1.000000000000000   0.027450980392157   0.537254901960784
            0.686274509803922   0.658823529411765   0.545098039215686
            0.031372549019608   0.470588235294118   0.498039215686275
            0.866666666666667   0.521568627450980   0.843137254901961
            0.650980392156863   0.784313725490196   0.458823529411765
            0.654901960784314   1.000000000000000   0.709803921568627
            0.760784313725490   0.717647058823529   0.035294117647059
            0.905882352941176   0.556862745098039   0.647058823529412
            0.588235294117647   0.431372549019608   0.741176470588235
            0.800000000000000   0.678431372549020   0.376470588235294
            0.674509803921569   0.525490196078431   0.658823529411765
            0.580392156862745   0.494117647058824   0.580392156862745
            0.596078431372549   0.247058823529412   0.698039215686274
            1.000000000000000   0.388235294117647   0.913725490196078
            0.698039215686274   0.984313725490196   0.647058823529412
            0.388235294117647   0.701960784313725   0.396078431372549
            0.556862745098039   0.898039215686275   0.247058823529412
            0.717647058823529   0.882352941176471   0.631372549019608
            1.000000000000000   0.435294117647059   0.321568627450980
            0.741176470588235   0.972549019607843   0.639215686274510
            0.827450980392157   0.713725490196078   0.513725490196078
            1.000000000000000   0.988235294117647   0.768627450980392
            0.262745098039216   0.019607843137255   0.254901960784314
            1.000000000000000   0.698039215686274   0.815686274509804
            0.600000000000000   0.458823529411765   0.439215686274510
            0.678431372549020   0.564705882352941   0.050980392156863
            0.768627450980392   0.556862745098039   0.992156862745098
            0.313725490196078   0.482352941176471   0.611764705882353
            0.490196078431373   0.443137254901961   0.011764705882353
            1.000000000000000   0.992156862745098   0.470588235294118
            0.854901960784314   0.274509803921569   0.490196078431373
            0.254901960784314   0.007843137254902                   0
            0.788235294117647   0.819607843137255   0.474509803921569
            1.000000000000000   0.980392156862745   0.525490196078431
            0.337254901960784   0.517647058823529   0.682352941176471
            0.419607843137255   0.486274509803922   0.521568627450980
            0.435294117647059   0.423529411764706   0.039215686274510
            0.494117647058824   0.250980392156863   0.443137254901961
                            0   0.576470588235294   0.215686274509804
            0.815686274509804   0.894117647058824   0.160784313725490
            1.000000000000000   0.976470588235294   0.090196078431373
            0.113725490196078   0.364705882352941   0.925490196078431
            0.019607843137255   0.286274509803922   0.027450980392157
            0.709803921568627   0.807843137254902   0.031372549019608
            0.560784313725490   0.713725490196078   0.482352941176471
            0.784313725490196   1.000000000000000   0.690196078431373
            0.992156862745098   0.870588235294118   0.423529411764706
            1.000000000000000   0.874509803921569   0.133333333333333
            0.662745098039216   0.745098039215686   0.439215686274510
            0.407843137254902   0.196078431372549   0.890196078431372
            0.992156862745098   0.694117647058824   0.278431372549020
            0.780392156862745   0.674509803921569   0.490196078431373
            1.000000000000000   0.952941176470588   0.603921568627451
            0.521568627450980   0.054901960784314   0.015686274509804
            0.937254901960784   0.752941176470588   0.996078431372549
            0.250980392156863   0.992156862745098   0.078431372549020
            0.713725490196078   0.768627450980392   0.023529411764706
            0.615686274509804   1.000000000000000                   0
            0.235294117647059   0.254901960784314   0.258823529411765
            0.949019607843137   0.670588235294118   0.082352941176471
            0.674509803921569   0.309803921568627   0.023529411764706
            0.768627450980392   0.996078431372549   0.509803921568627
            0.172549019607843   0.980392156862745   0.121568627450980
            0.603921568627451   0.384313725490196                   0
            0.792156862745098   0.607843137254902   0.968627450980392
            0.529411764705882   0.372549019607843   0.258823529411765
            0.227450980392157   0.180392156862745   0.996078431372549
            0.992156862745098   0.552941176470588   0.286274509803922
            0.545098039215686   0.192156862745098   0.011764705882353
            0.796078431372549   0.647058823529412   0.376470588235294
            0.411764705882353   0.513725490196078   0.223529411764706
            0.047058823529412   0.862745098039216   0.450980392156863
            0.717647058823529   0.321568627450980   0.011764705882353
            0.498039215686275   0.560784313725490   0.305882352941176
            0.149019607843137   0.325490196078431   0.552941176470588
            0.388235294117647   0.662745098039216   0.313725490196078
            0.784313725490196   0.498039215686275   0.537254901960784
            0.694117647058824   0.988235294117647   0.600000000000000
            1.000000000000000   0.603921568627451   0.541176470588235
            0.964705882352941   0.407843137254902   0.556862745098039
            0.462745098039216   0.992156862745098   0.658823529411765
            0.325490196078431   0.996078431372549   0.360784313725490
            0.305882352941176   0.992156862745098   0.329411764705882
            0.627450980392157   0.996078431372549   0.749019607843137
            0.482352941176471   0.949019607843137   0.854901960784314
            0.737254901960784   0.960784313725490   0.650980392156863
            0.792156862745098   0.419607843137255   0.007843137254902
            0.062745098039216   0.478431372549020   0.690196078431373
            0.129411764705882   0.219607843137255   0.670588235294118
            0.443137254901961   0.623529411764706   0.568627450980392
            0.992156862745098   0.725490196078431   0.082352941176471
            0.996078431372549   0.988235294117647   0.686274509803922
            0.988235294117647   0.964705882352941   0.474509803921569
            0.113725490196078   0.007843137254902                   0
            0.796078431372549   0.407843137254902   0.262745098039216
            0.192156862745098   0.400000000000000   0.541176470588235
            0.141176470588235   0.478431372549020   0.992156862745098
            1.000000000000000   1.000000000000000   0.713725490196078
            0.564705882352941   0.992156862745098   0.662745098039216
            0.525490196078431   0.631372549019608   0.490196078431373
            0.992156862745098   0.862745098039216   0.360784313725490
            0.470588235294118   0.819607843137255   0.713725490196078
            0.074509803921569   0.733333333333333   0.686274509803922
            0.984313725490196   0.372549019607843   0.988235294117647
            0.125490196078431   0.976470588235294   0.525490196078431
            1.000000000000000   0.890196078431372   0.431372549019608
            0.615686274509804   0.027450980392157   0.349019607843137
            0.227450980392157   0.094117647058824   0.694117647058824
            0.760784313725490   1.000000000000000   0.537254901960784
            0.843137254901961   0.403921568627451   0.678431372549020
            0.447058823529412                   0   0.345098039215686
            1.000000000000000   0.854901960784314   0.011764705882353
            0.003921568627451   0.752941176470588   0.552941176470588
            0.674509803921569   0.454901960784314   0.203921568627451
            0.003921568627451   0.274509803921569                   0
            0.600000000000000                   0   0.980392156862745
            0.007843137254902   0.023529411764706   0.435294117647059
            0.556862745098039   0.462745098039216   0.094117647058824
            0.819607843137255   0.462745098039216   0.560784313725490
            0.588235294117647   0.705882352941177   0.011764705882353
            0.992156862745098   1.000000000000000   0.388235294117647
            0.584313725490196   0.639215686274510   0.650980392156863
            0.498039215686275   0.407843137254902   0.305882352941176
            0.458823529411765   0.098039215686275   0.450980392156863
            0.031372549019608   0.580392156862745   0.015686274509804
            1.000000000000000   0.380392156862745   0.388235294117647
            0.349019607843137   0.521568627450980   0.337254901960784
            0.129411764705882   0.278431372549020   0.380392156862745
            0.235294117647059   0.450980392156863   0.658823529411765
            0.729411764705882   0.619607843137255   0.533333333333333
            0.007843137254902   0.105882352941176   0.976470588235294
            0.450980392156863   0.290196078431373   0.396078431372549
            0.137254901960784   0.768627450980392   0.545098039215686
            0.560784313725490   0.682352941176471   0.133333333333333
            0.901960784313726   0.949019607843137   0.635294117647059
            0.294117647058824   0.341176470588235   0.858823529411765
            0.850980392156863   0.003921568627451   0.400000000000000
            0.003921568627451   0.329411764705882   0.509803921568627
            0.615686274509804   0.007843137254902   0.086274509803922
            0.447058823529412   0.560784313725490   0.007843137254902
            1.000000000000000   0.898039215686275   0.678431372549020
            0.305882352941176   0.019607843137255   0.313725490196078
            0.976470588235294   0.737254901960784   0.031372549019608
            1.000000000000000   0.027450980392157   0.227450980392157
            0.780392156862745   0.474509803921569   0.525490196078431
            0.839215686274510   1.000000000000000   0.996078431372549
            0.996078431372549   0.294117647058824   0.011764705882353
            0.992156862745098   0.349019607843137   0.337254901960784
            0.988235294117647   0.882352941176471   0.400000000000000
            0.698039215686274   0.443137254901961   0.239215686274510
            0.121568627450980   0.231372549019608   0.301960784313725
            0.411764705882353   0.615686274509804   0.298039215686275
            0.337254901960784   0.988235294117647   0.635294117647059
            0.984313725490196   0.333333333333333   0.505882352941176
            0.243137254901961   0.509803921568627   0.988235294117647
            0.627450980392157   0.749019607843137   0.086274509803922
            0.839215686274510   1.000000000000000   0.980392156862745
            0.309803921568627   0.450980392156863   0.556862745098039
            1.000000000000000   0.694117647058824   0.603921568627451
            0.360784313725490   0.545098039215686   0.082352941176471
            0.329411764705882   0.674509803921569   0.407843137254902
            0.537254901960784   0.627450980392157   0.690196078431373
            0.494117647058824   0.627450980392157   0.478431372549020
            0.105882352941176   0.988235294117647   0.023529411764706
            0.792156862745098   1.000000000000000   0.984313725490196
            0.713725490196078   1.000000000000000   0.733333333333333
            0.654901960784314   0.368627450980392   0.035294117647059
            0.082352941176471   0.180392156862745   1.000000000000000
            0.552941176470588   0.368627450980392   0.717647058823529
            0.372549019607843   0.619607843137255   0.560784313725490
            0.388235294117647   0.968627450980392   0.705882352941177
            0.376470588235294   0.400000000000000   0.007843137254902
            0.988235294117647   0.525490196078431   0.666666666666667
            0.549019607843137                   0   0.203921568627451
            0.458823529411765   0.501960784313725                   0
            0.670588235294118   0.494117647058824   0.298039215686275
            0.011764705882353   0.027450980392157   0.392156862745098
            0.996078431372549   0.525490196078431   0.643137254901961
            0.835294117647059   0.090196078431373   0.305882352941176
            0.996078431372549   0.815686274509804   0.988235294117647
            0.407843137254902                   0   0.094117647058824
            0.996078431372549   0.874509803921569   0.031372549019608
            0.996078431372549   0.258823529411765   0.058823529411765
            0.435294117647059   0.486274509803922                   0
            0.792156862745098   0.003921568627451   0.278431372549020
            0.105882352941176   0.141176470588235   0.192156862745098
                            0   0.984313725490196   0.690196078431373
            0.858823529411765   0.345098039215686   0.337254901960784
            0.866666666666667   0.839215686274510   0.094117647058824
            0.254901960784314   0.992156862745098   0.996078431372549
            0.811764705882353   0.321568627450980   0.305882352941176
            0.129411764705882   0.764705882352941   0.435294117647059
            0.662745098039216   0.011764705882353   0.031372549019608
            0.431372549019608   0.062745098039216   0.019607843137255
            0.996078431372549   0.509803921568627   0.549019607843137
            0.294117647058824   0.380392156862745   0.074509803921569
            0.301960784313725   0.643137254901961   0.035294117647059
            0.745098039215686   0.682352941176471   0.541176470588235
            0.011764705882353   0.223529411764706   0.972549019607843
            0.658823529411765   0.560784313725490   0.349019607843137
            0.364705882352941   0.129411764705882   0.815686274509804
            0.996078431372549   0.698039215686274   0.035294117647059
            0.305882352941176   0.317647058823529   0.545098039215686
            0.588235294117647   0.305882352941176   0.007843137254902
            0.521568627450980   0.639215686274510   0.698039215686274
            1.000000000000000   0.411764705882353   0.686274509803922
            0.764705882352941   0.984313725490196   0.956862745098039
            0.164705882352941   0.996078431372549   0.717647058823529
                            0   0.372549019607843   0.415686274509804
            0.047058823529412   0.090196078431373   0.576470588235294
            1.000000000000000   1.000000000000000   0.505882352941176
            0.941176470588235   0.513725490196078   0.227450980392157
            0.945098039215686   0.952941176470588   0.247058823529412
            0.694117647058824   0.823529411764706   0.482352941176471
            0.988235294117647   0.509803921568627   0.290196078431373
            0.443137254901961   0.666666666666667   0.203921568627451
            0.717647058823529   0.788235294117647   0.886274509803922
            0.294117647058824   0.003921568627451   0.003921568627451
            0.647058823529412   0.321568627450980   0.901960784313726
            0.686274509803922   0.184313725490196   0.050980392156863
            0.545098039215686   0.533333333333333   0.972549019607843
            0.603921568627451   0.968627450980392   0.392156862745098
            0.650980392156863   0.984313725490196   0.698039215686274
            1.000000000000000   0.772549019607843   0.070588235294118
            0.458823529411765   0.031372549019608   0.317647058823529
            0.756862745098039   0.290196078431373   0.035294117647059
            0.996078431372549   0.184313725490196   0.290196078431373
            0.007843137254902   0.011764705882353   0.886274509803922
            0.039215686274510   0.262745098039216   0.478431372549020
            0.647058823529412                   0   0.333333333333333
            0.682352941176471   0.545098039215686   0.047058823529412
            0.992156862745098   0.474509803921569   0.560784313725490
            0.749019607843137   0.674509803921569   0.019607843137255
            0.243137254901961   0.686274509803922   0.462745098039216
            0.780392156862745   0.278431372549020   0.403921568627451
            0.725490196078431   0.282352941176471   0.305882352941176
            0.392156862745098   0.490196078431373   0.556862745098039
            0.749019607843137   0.996078431372549   0.156862745098039
            0.843137254901961   0.145098039215686   0.870588235294118
            0.698039215686274   0.592156862745098   0.019607843137255
            0.403921568627451   0.227450980392157   0.247058823529412
            0.658823529411765   0.490196078431373   0.760784313725490
            0.980392156862745   0.996078431372549   0.294117647058824
            0.752941176470588   0.007843137254902   0.184313725490196
            0.054901960784314   0.529411764705882   0.800000000000000
            0.552941176470588   0.517647058823529   0.407843137254902
            0.678431372549020   0.011764705882353   0.870588235294118
            0.549019607843137   1.000000000000000   0.619607843137255
            0.580392156862745   0.674509803921569   0.007843137254902
            0.768627450980392   1.000000000000000   0.968627450980392
            0.992156862745098   0.933333333333333   0.450980392156863
            0.200000000000000   0.721568627450980   0.392156862745098
            1.000000000000000   0.976470588235294   0.815686274509804
            0.458823529411765   0.552941176470588   0.639215686274510
            0.960784313725490   0.015686274509804   0.788235294117647
            0.466666666666667   0.631372549019608   0.709803921568627
            0.529411764705882   0.337254901960784   0.894117647058824
            0.533333333333333   0.592156862745098   0.090196078431373
            0.760784313725490   0.494117647058824   0.474509803921569
            0.003921568627451   0.450980392156863   0.443137254901961
            0.623529411764706   0.513725490196078   0.011764705882353
            0.968627450980392   0.835294117647059   0.376470588235294
            0.741176470588235   0.964705882352941   0.996078431372549
            0.458823529411765   0.721568627450980   0.309803921568627
            0.611764705882353   0.733333333333333   0.015686274509804
            0.160784313725490   0.274509803921569   0.356862745098039
            0.411764705882353   0.376470588235294   0.023529411764706
            0.678431372549020   0.972549019607843   0.007843137254902
            0.756862745098039   0.776470588235294   0.988235294117647
            0.207843137254902   0.678431372549020   0.419607843137255
            1.000000000000000   0.992156862745098   0.215686274509804
            0.643137254901961   0.258823529411765   0.627450980392157
            0.952941176470588   0.380392156862745   0.588235294117647
            0.580392156862745   0.466666666666667   0.023529411764706
            1.000000000000000   0.956862745098039   0.949019607843137
            0.117647058823529   0.568627450980392   0.403921568627451
            0.709803921568627   0.764705882352941   0.023529411764706
            0.996078431372549   1.000000000000000   0.498039215686275
            0.811764705882353   0.992156862745098   0.737254901960784
            0.039215686274510   0.866666666666667   0.031372549019608
            0.529411764705882   0.992156862745098   0.019607843137255
            0.117647058823529   0.972549019607843   0.462745098039216
            0.482352941176471   0.992156862745098   0.780392156862745
            0.737254901960784   0.925490196078431   0.674509803921569
            0.733333333333333   0.976470588235294   0.058823529411765
            0.670588235294118   0.564705882352941   0.015686274509804
            0.121568627450980   0.709803921568627   0.478431372549020
                            0   0.333333333333333   0.352941176470588
            0.643137254901961   0.517647058823529   0.674509803921569
            0.768627450980392   0.333333333333333   0.031372549019608
            0.247058823529412   0.509803921568627   0.615686274509804
            0.329411764705882   0.552941176470588   0.266666666666667
            0.788235294117647   0.368627450980392   0.984313725490196
            0.227450980392157   0.898039215686275   0.498039215686275
            0.003921568627451   0.403921568627451   0.584313725490196
            0.529411764705882   0.662745098039216   0.133333333333333
            0.941176470588235   0.580392156862745   0.301960784313725
            0.364705882352941   0.078431372549020   0.317647058823529
            0.145098039215686   1.000000000000000   0.160784313725490
            0.815686274509804   0.996078431372549   0.113725490196078
            1.000000000000000   0.650980392156863   0.168627450980392
            0.003921568627451   0.705882352941177   0.298039215686275
            1.000000000000000   0.423529411764706   0.709803921568627
            0.419607843137255   0.258823529411765   0.278431372549020
            0.780392156862745   0.756862745098039   0.047058823529412
            0.717647058823529   1.000000000000000   0.980392156862745
            0.682352941176471   1.000000000000000   0.431372549019608
            0.925490196078431   0.176470588235294   0.003921568627451
            0.462745098039216   1.000000000000000   0.482352941176471
            0.450980392156863                   0   0.223529411764706
            0.015686274509804   0.011764705882353   0.282352941176471
            0.874509803921569   0.305882352941176   0.784313725490196
            0.431372549019608   0.796078431372549   0.235294117647059
            0.560784313725490   0.596078431372549   0.019607843137255
            0.368627450980392   0.862745098039216   0.121568627450980
            0.850980392156863   0.309803921568627   0.960784313725490
            0.784313725490196   0.992156862745098   0.239215686274510
            0.027450980392157   0.050980392156863   0.050980392156863
            0.286274509803922   0.517647058823529   0.721568627450980
            0.317647058823529   0.717647058823529   0.231372549019608
            0.674509803921569   0.494117647058824   0.015686274509804
            0.305882352941176   0.329411764705882   0.505882352941176
            0.529411764705882   0.431372549019608   0.294117647058824
            0.345098039215686   0.737254901960784   0.031372549019608
            0.184313725490196   0.937254901960784   0.062745098039216
            0.176470588235294   0.996078431372549   0.329411764705882
            0.039215686274510   1.000000000000000   0.007843137254902
            0.611764705882353   0.937254901960784   0.262745098039216
            0.094117647058824   0.819607843137255   0.482352941176471
            0.207843137254902   0.325490196078431   0.039215686274510
            0.094117647058824   0.019607843137255   0.858823529411765
            0.384313725490196   0.345098039215686   0.768627450980392
            1.000000000000000   0.588235294117647   0.309803921568627
            1.000000000000000   0.670588235294118   0.058823529411765
            0.560784313725490   0.549019607843137   0.905882352941176
            0.141176470588235   0.737254901960784   0.658823529411765
            0.247058823529412   0.003921568627451   0.172549019607843
            0.796078431372549   0.972549019607843   0.372549019607843
            1.000000000000000   0.447058823529412   0.298039215686275
            0.156862745098039   0.003921568627451   0.215686274509804
            0.701960784313725   0.435294117647059   0.964705882352941
            0.282352941176471   0.752941176470588   0.447058823529412
            0.737254901960784   0.796078431372549   0.478431372549020
            0.658823529411765   0.254901960784314   0.356862745098039
            0.023529411764706   0.694117647058824   0.768627450980392
            0.803921568627451   0.458823529411765   0.517647058823529
            0.945098039215686   0.854901960784314   0.478431372549020
            1.000000000000000   0.015686274509804   0.564705882352941
            0.501960784313725   0.356862745098039   0.529411764705882
            0.313725490196078   0.654901960784314   0.278431372549020
            0.658823529411765   0.643137254901961   0.584313725490196
            0.811764705882353   1.000000000000000   0.015686274509804
            1.000000000000000   1.000000000000000   0.494117647058824
            1.000000000000000   0.498039215686275   0.654901960784314
            0.937254901960784   0.250980392156863   0.149019607843137
            0.235294117647059   0.600000000000000   0.572549019607843
            0.533333333333333   0.407843137254902   0.023529411764706
            0.015686274509804   0.956862745098039   0.537254901960784
            0.996078431372549   0.964705882352941   0.619607843137255
            0.811764705882353   0.686274509803922   0.482352941176471
            0.231372549019608   0.443137254901961   0.623529411764706
            0.992156862745098   0.756862745098039   0.772549019607843
            0.125490196078431   0.752941176470588   0.450980392156863
            0.607843137254902   0.372549019607843   0.752941176470588
            0.058823529411765   0.607843137254902   0.556862745098039
            0.454901960784314   0.156862745098039   0.007843137254902
            0.615686274509804   0.725490196078431   0.172549019607843
            0.643137254901961   0.749019607843137   0.125490196078431
            0.803921568627451   0.349019607843137   0.035294117647059
            0.678431372549020   0.647058823529412   0.529411764705882
            0.745098039215686   0.003921568627451   0.235294117647059
            0.721568627450980   1.000000000000000   0.921568627450980
            0.862745098039216   0.301960784313725   0.003921568627451
            0.635294117647059   0.396078431372549   0.243137254901961
            0.388235294117647   0.545098039215686   0.152941176470588
            0.254901960784314   0.611764705882353   0.011764705882353
            0.694117647058824   1.000000000000000   0.396078431372549
            0.615686274509804   0.737254901960784   0.831372549019608
            0.992156862745098   0.992156862745098   0.996078431372549
            0.466666666666667   0.670588235294118   0.337254901960784
            0.274509803921569   0.254901960784314   0.588235294117647
            0.600000000000000   0.003921568627451   0.278431372549020
            0.745098039215686   0.992156862745098   0.450980392156863
            0.196078431372549   0.749019607843137   0.517647058823529
            0.686274509803922   0.435294117647059   0.035294117647059
            0.627450980392157   0.007843137254902   0.360784313725490
            1.000000000000000   0.847058823529412   0.694117647058824
            0.498039215686275   0.305882352941176   0.117647058823529
            0.749019607843137   0.607843137254902   0.047058823529412
            0.419607843137255   0.639215686274510   0.325490196078431
            0.941176470588235   0.458823529411765   0.901960784313726
            0.482352941176471   0.784313725490196   0.964705882352941
            0.278431372549020   0.372549019607843   0.580392156862745
            0.960784313725490   0.749019607843137   0.011764705882353
            1.000000000000000   0.996078431372549   0.713725490196078
            1.000000000000000   0.992156862745098   0.454901960784314
            0.537254901960784   0.356862745098039   0.482352941176471
            0.262745098039216   0.419607843137255   0.678431372549020
            0.815686274509804   0.756862745098039   0.003921568627451
            0.776470588235294   0.972549019607843   0.031372549019608
            0.956862745098039   0.211764705882353   0.019607843137255
            0.007843137254902   0.756862745098039   0.301960784313725
            0.698039215686274   0.372549019607843   0.011764705882353
            0.164705882352941   0.494117647058824   0.098039215686275
            0.286274509803922   0.023529411764706   0.282352941176471
            0.325490196078431   0.384313725490196   0.403921568627451
            0.352941176470588   0.023529411764706   0.937254901960784
            0.811764705882353   0.007843137254902   0.203921568627451
            0.768627450980392   0.650980392156863   0.380392156862745
            0.592156862745098   0.541176470588235   0.517647058823529
            0.121568627450980   0.035294117647059   0.329411764705882
            0.011764705882353   0.003921568627451   0.176470588235294
            0.168627450980392   0.694117647058824   0.474509803921569
            0.764705882352941   0.564705882352941   0.607843137254902
            0.650980392156863   0.435294117647059   0.709803921568627
            0.466666666666667                   0   0.003921568627451
            0.572549019607843   0.168627450980392   0.019607843137255
            0.490196078431373   0.498039215686275   0.486274509803922
            0.600000000000000   0.058823529411765   0.294117647058824
            0.560784313725490   0.450980392156863   0.011764705882353
            0.784313725490196   0.235294117647059   0.725490196078431
            0.996078431372549   0.662745098039216   0.576470588235294
            0.674509803921569   0.733333333333333   0.050980392156863
            0.752941176470588   0.443137254901961   0.996078431372549
            0.800000000000000   0.992156862745098   0.498039215686275
                            0   0.007843137254902   0.180392156862745
            0.509803921568627   0.513725490196078   0.266666666666667
            1.000000000000000   0.772549019607843   0.796078431372549
            0.670588235294118   0.070588235294118   0.223529411764706
            0.690196078431373   0.019607843137255   0.294117647058824
            0.600000000000000   0.800000000000000   0.015686274509804
            0.576470588235294   0.486274509803922                   0
            0.003921568627451   0.584313725490196   0.160784313725490
            0.937254901960784   0.113725490196078   0.905882352941176
                            0   0.015686274509804   0.207843137254902
            0.258823529411765   0.701960784313725   0.584313725490196
            0.615686274509804   0.341176470588235   0.513725490196078
            0.784313725490196   0.674509803921569   0.662745098039216
            0.784313725490196   0.462745098039216   0.023529411764706
            0.666666666666667   0.152941176470588   0.015686274509804
            0.894117647058824   0.796078431372549   1.000000000000000
            0.980392156862745   0.258823529411765   0.141176470588235
            0.031372549019608   0.015686274509804   0.976470588235294
            0.360784313725490   0.698039215686274                   0
            0.462745098039216   0.258823529411765   0.305882352941176
            0.423529411764706   0.478431372549020   0.054901960784314
            0.984313725490196   0.866666666666667   0.494117647058824
            0.164705882352941   0.003921568627451   0.203921568627451
            0.015686274509804   0.290196078431373   0.019607843137255
            0.992156862745098   0.274509803921569   0.349019607843137
            0.050980392156863   0.458823529411765   0.972549019607843
            0.996078431372549                   0   0.007843137254902
            0.796078431372549   0.615686274509804   0.023529411764706
            0.984313725490196   0.490196078431373   0.027450980392157
            0.725490196078431   0.800000000000000   0.505882352941176
            0.929411764705882   0.784313725490196   1.000000000000000
            0.380392156862745   0.882352941176471   0.376470588235294
            0.541176470588235   0.721568627450980   0.996078431372549
            0.572549019607843   0.039215686274510   0.305882352941176
            0.996078431372549   0.007843137254902   0.635294117647059
            0.603921568627451   0.188235294117647   0.003921568627451
            0.396078431372549   0.996078431372549   0.031372549019608
            0.745098039215686   0.992156862745098   0.717647058823529
            0.694117647058824   0.447058823529412   0.380392156862745
            0.533333333333333   0.372549019607843   0.003921568627451
            0.007843137254902   0.800000000000000   0.996078431372549
            0.756862745098039   0.992156862745098   0.584313725490196
            0.513725490196078   0.396078431372549   0.223529411764706
            0.984313725490196   0.160784313725490   0.262745098039216
            0.517647058823529   0.717647058823529   0.003921568627451
            0.713725490196078   0.388235294117647   0.145098039215686
            0.498039215686275   0.317647058823529   0.070588235294118
            0.372549019607843   0.627450980392157   0.321568627450980
            0.427450980392157   0.929411764705882   0.992156862745098
            0.043137254901961   0.976470588235294   0.917647058823529
            0.780392156862745   0.376470588235294   1.000000000000000
            1.000000000000000   1.000000000000000   0.796078431372549
            0.964705882352941   0.807843137254902   0.988235294117647
            0.082352941176471   0.313725490196078   0.517647058823529
            0.960784313725490   0.019607843137255   0.309803921568627
            0.392156862745098   0.329411764705882   0.011764705882353
            0.478431372549020   0.349019607843137   0.003921568627451
            0.658823529411765   0.709803921568627   0.015686274509804
            0.239215686274510   0.600000000000000   0.450980392156863
                            0   0.003921568627451   0.200000000000000
            0.462745098039216   0.662745098039216   0.450980392156863
            0.180392156862745   0.352941176470588   0.533333333333333
            0.043137254901961   0.968627450980392   0.490196078431373
            0.741176470588235   0.423529411764706   0.282352941176471
            0.674509803921569   0.113725490196078   0.721568627450980
            0.168627450980392   0.686274509803922   0.415686274509804
            0.149019607843137   0.968627450980392   0.992156862745098
            0.682352941176471   0.992156862745098   0.423529411764706
            0.607843137254902   0.560784313725490   0.333333333333333
            1.000000000000000   0.678431372549020   0.003921568627451
            0.776470588235294   0.611764705882353   0.015686274509804
            0.956862745098039   0.815686274509804   0.329411764705882
            0.870588235294118   0.615686274509804   0.674509803921569
            0.019607843137255   0.282352941176471   0.050980392156863
            0.788235294117647   0.682352941176471   0.454901960784314
            0.376470588235294   0.274509803921569   0.058823529411765
            0.596078431372549   0.964705882352941   0.690196078431373
            0.541176470588235   0.945098039215686   0.996078431372549
            0.180392156862745   0.909803921568627   0.733333333333333
            0.066666666666667   0.529411764705882   0.364705882352941
            0.992156862745098   0.690196078431373   0.752941176470588
            0.694117647058824   0.376470588235294   0.007843137254902
            0.968627450980392   0.007843137254902   0.164705882352941
            0.835294117647059   0.670588235294118   0.035294117647059
            0.525490196078431   0.466666666666667   0.372549019607843
            0.776470588235294   0.623529411764706   0.349019607843137
            0.478431372549020   0.407843137254902   0.498039215686275
            0.015686274509804   0.180392156862745   0.376470588235294
            0.784313725490196   0.552941176470588   0.580392156862745
            0.647058823529412   0.984313725490196   0.835294117647059
            1.000000000000000   0.996078431372549   0.443137254901961
            0.384313725490196   0.254901960784314   0.780392156862745
            1.000000000000000   0.996078431372549   0.250980392156863
            0.827450980392157   0.286274509803922   0.305882352941176
            0.596078431372549   0.368627450980392   0.168627450980392
            0.650980392156863   0.505882352941176   0.298039215686275
            1.000000000000000   0.031372549019608   0.909803921568627
            0.615686274509804   0.462745098039216   0.317647058823529
            0.996078431372549   1.000000000000000   0.792156862745098
            0.596078431372549   0.337254901960784   0.552941176470588
            0.619607843137255                   0   0.227450980392157
            0.156862745098039   0.486274509803922   0.215686274509804
            0.725490196078431   0.411764705882353   0.007843137254902
            0.729411764705882   0.407843137254902   0.450980392156863
            1.000000000000000   0.470588235294118   0.333333333333333
            0.580392156862745   0.698039215686274   0.109803921568627
            0.772549019607843   0.788235294117647   0.780392156862745
            0.400000000000000   0.101960784313725   0.933333333333333
            0.380392156862745   0.250980392156863   0.937254901960784
            0.607843137254902   0.898039215686275   0.666666666666667
            0.482352941176471   0.345098039215686   0.015686274509804
            0.152941176470588   0.415686274509804   0.701960784313725
            0.996078431372549   0.701960784313725   0.031372549019608
            0.549019607843137   0.992156862745098   0.494117647058824
            0.392156862745098   0.533333333333333   0.917647058823529
            0.019607843137255   0.431372549019608   0.933333333333333
            0.698039215686274   0.478431372549020   0.003921568627451
            0.058823529411765   0.996078431372549   0.976470588235294
            0.980392156862745   0.164705882352941   0.333333333333333
            0.509803921568627   0.027450980392157   0.278431372549020
            0.478431372549020   0.415686274509804   0.309803921568627
            0.956862745098039   0.196078431372549   0.047058823529412
            0.631372549019608   0.223529411764706   0.019607843137255
            0.435294117647059   0.509803921568627   0.541176470588235
            0.647058823529412   0.352941176470588   0.956862745098039
            0.678431372549020   0.039215686274510   0.992156862745098
                            0   0.270588235294118   0.466666666666667
            0.396078431372549   0.552941176470588   0.427450980392157
            0.792156862745098   0.482352941176471   0.501960784313725
                            0   0.321568627450980   0.286274509803922
            0.168627450980392   0.364705882352941   0.203921568627451
            0.749019607843137   0.945098039215686   0.156862745098039
            0.709803921568627   0.580392156862745   0.062745098039216
            0.160784313725490   0.462745098039216   0.733333333333333
            0.003921568627451   0.254901960784314   0.509803921568627
            0.733333333333333   0.247058823529412   0.247058823529412
            0.988235294117647   0.149019607843137   0.278431372549020
            0.658823529411765   0.474509803921569                   0
            0.509803921568627   0.796078431372549   0.698039215686274
            0.400000000000000   0.486274509803922   0.243137254901961
            0.996078431372549   0.274509803921569   0.647058823529412
            0.996078431372549   0.513725490196078   0.800000000000000
            0.580392156862745   0.650980392156863   0.090196078431373
            0.658823529411765   0.537254901960784   0.019607843137255
            0.498039215686275   0.372549019607843                   0
            0.619607843137255   0.262745098039216   0.635294117647059
            0.023529411764706   0.180392156862745   0.011764705882353
            0.541176470588235   0.431372549019608   0.270588235294118
            0.800000000000000   0.478431372549020   0.545098039215686
            0.619607843137255   0.003921568627451   0.407843137254902
            0.992156862745098   1.000000000000000   0.219607843137255
            0.752941176470588   0.980392156862745   0.545098039215686
            0.933333333333333   0.862745098039216   0.356862745098039
            0.494117647058824   0.741176470588235   0.003921568627451
            0.231372549019608   0.356862745098039   0.572549019607843
            0.003921568627451   0.533333333333333   0.623529411764706
            0.239215686274510   0.478431372549020   0.992156862745098
            0.372549019607843   0.203921568627451   0.905882352941176
            0.427450980392157   0.352941176470588   0.811764705882353
            0.454901960784314   0.521568627450980                   0
            0.439215686274510   0.423529411764706   0.066666666666667
            0.235294117647059                   0   0.031372549019608
            0.796078431372549                   0   0.960784313725490
                            0   0.176470588235294   0.015686274509804
            0.396078431372549   0.549019607843137   0.733333333333333
            0.454901960784314   0.584313725490196   0.317647058823529
            0.725490196078431   1.000000000000000   0.400000000000000
            0.615686274509804   0.756862745098039                   0
            0.980392156862745   0.933333333333333   0.400000000000000
            0.494117647058824   0.984313725490196   0.701960784313725
            0.482352941176471                   0   0.172549019607843
            0.760784313725490   0.572549019607843   0.631372549019608
            0.003921568627451   0.482352941176471   0.572549019607843
            0.988235294117647   0.752941176470588   0.023529411764706
            0.396078431372549   0.454901960784314   0.196078431372549
            0.847058823529412   0.525490196078431   0.231372549019608
            0.450980392156863   0.521568627450980   0.584313725490196
            0.666666666666667   0.137254901960784   1.000000000000000
            0.031372549019608   1.000000000000000   0.031372549019608
            0.607843137254902   0.478431372549020   0.003921568627451
            0.949019607843137   0.619607843137255   0.556862745098039
            0.435294117647059   0.760784313725490   0.462745098039216
            1.000000000000000   0.356862745098039                   0
            0.992156862745098   1.000000000000000   0.321568627450980
            0.525490196078431   0.435294117647059   0.521568627450980
            0.560784313725490   0.996078431372549   0.035294117647059
            0.933333333333333   0.811764705882353   0.996078431372549
            0.317647058823529   0.039215686274510   0.788235294117647
            0.309803921568627   0.568627450980392   0.325490196078431
            0.623529411764706   0.137254901960784   0.019607843137255
            0.447058823529412   0.525490196078431   0.223529411764706
            0.870588235294118   0.047058823529412   0.384313725490196
            0.568627450980392   0.431372549019608   0.600000000000000
            1.000000000000000   0.694117647058824   0.427450980392157
            0.235294117647059   0.301960784313725   0.011764705882353
            0.498039215686275   0.439215686274510   0.325490196078431
            0.466666666666667   0.572549019607843   0.435294117647059
            0.003921568627451   0.058823529411765   0.800000000000000
            0.807843137254902   0.682352941176471   0.980392156862745
            0.560784313725490   0.600000000000000   0.984313725490196
            0.776470588235294   0.988235294117647   1.000000000000000
            0.333333333333333   0.223529411764706   0.800000000000000
            0.329411764705882   0.305882352941176   0.011764705882353
            0.003921568627451   0.478431372549020   0.474509803921569
            0.003921568627451   0.976470588235294   0.776470588235294
            0.788235294117647   0.690196078431373   0.011764705882353
            0.572549019607843   0.600000000000000   0.003921568627451
            0.043137254901961   0.333333333333333   0.035294117647059
            0.627450980392157   0.015686274509804   0.596078431372549
            0.125490196078431                   0   0.694117647058824
            0.580392156862745   0.337254901960784   0.549019607843137
            0.760784313725490   0.745098039215686   0.054901960784314
            0.454901960784314   0.545098039215686   0.592156862745098
            0.400000000000000   0.372549019607843   0.819607843137255
            0.611764705882353   0.427450980392157   0.647058823529412
            0.768627450980392   0.258823529411765   0.250980392156863
            0.635294117647059   0.282352941176471   0.341176470588235
            0.509803921568627   0.372549019607843   0.529411764705882
            0.788235294117647   0.392156862745098   0.231372549019608
            0.564705882352941   0.694117647058824   0.203921568627451
            0.003921568627451   0.219607843137255   0.415686274509804
            0.145098039215686   0.639215686274510   0.435294117647059
            0.349019607843137   0.396078431372549   0.427450980392157
            0.458823529411765   0.992156862745098   0.388235294117647
            0.129411764705882   0.988235294117647   0.050980392156863
            0.352941176470588   0.525490196078431   0.678431372549020
            0.996078431372549   0.776470588235294   0.082352941176471
            1.000000000000000   0.992156862745098   0.003921568627451
            0.874509803921569   0.772549019607843   0.996078431372549
            0.698039215686274   0.392156862745098                   0
            0.498039215686275   0.368627450980392                   0
            0.870588235294118   0.494117647058824   0.364705882352941
            0.015686274509804   0.509803921568627   0.262745098039216
            1.000000000000000   1.000000000000000   0.831372549019608
            0.231372549019608   0.388235294117647   0.549019607843137
            0.717647058823529   0.580392156862745                   0
            0.517647058823529   0.349019607843137   0.494117647058824
            0.254901960784314   0.098039215686275                   0
            0.482352941176471   0.011764705882353   0.137254901960784
            0.015686274509804   0.850980392156863   1.000000000000000
            0.400000000000000   0.494117647058824   0.172549019607843
            0.984313725490196   0.933333333333333   0.674509803921569
            0.843137254901961   1.000000000000000   0.996078431372549
            0.305882352941176   0.454901960784314   0.588235294117647
            0.529411764705882   0.298039215686275   0.384313725490196
            0.835294117647059   1.000000000000000   1.000000000000000
            0.509803921568627   0.427450980392157   0.549019607843137
            1.000000000000000   0.729411764705882   0.803921568627451
            0.819607843137255   1.000000000000000   0.741176470588235
            0.266666666666667   0.556862745098039   0.894117647058824
            0.019607843137255   0.278431372549020   0.164705882352941
            0.835294117647059   0.525490196078431   0.615686274509804
            0.239215686274510   0.027450980392157   0.203921568627451
            0.290196078431373   0.003921568627451                   0
            0.972549019607843   0.282352941176471   0.109803921568627
            0.007843137254902   0.349019607843137   0.058823529411765
            0.537254901960784   0.635294117647059   0.011764705882353
            0.878431372549020   0.247058823529412   0.847058823529412
            0.835294117647059   0.541176470588235   0.580392156862745
            0.482352941176471   0.698039215686274   0.454901960784314
            0.321568627450980   0.396078431372549   0.145098039215686
            0.788235294117647   0.298039215686275   0.745098039215686
            0.858823529411765   0.294117647058824   0.854901960784314
            0.619607843137255   0.211764705882353   0.137254901960784
            0.709803921568627   0.282352941176471   0.364705882352941
            0.450980392156863   0.360784313725490   0.070588235294118
            0.611764705882353   0.427450980392157   0.341176470588235
            0.007843137254902   0.560784313725490   0.117647058823529
            0.694117647058824   0.568627450980392   0.431372549019608
            0.286274509803922   0.458823529411765   0.611764705882353
            0.627450980392157   0.270588235294118   0.054901960784314
            0.223529411764706   0.678431372549020   0.282352941176471
            0.713725490196078   0.415686274509804   0.313725490196078
            0.549019607843137   1.000000000000000   0.858823529411765
            0.643137254901961   0.745098039215686   0.360784313725490
            0.796078431372549   0.466666666666667   0.137254901960784
            0.019607843137255   0.411764705882353   0.419607843137255
            0.807843137254902   0.364705882352941   0.682352941176471
            0.784313725490196   0.352941176470588   0.325490196078431
            0.588235294117647   0.682352941176471   0.552941176470588
            0.121568627450980   0.654901960784314   0.454901960784314
            0.478431372549020   0.592156862745098   0.011764705882353
            0.674509803921569   0.576470588235294   0.384313725490196
            0.003921568627451   0.627450980392157   0.286274509803922
            0.850980392156863   0.329411764705882   0.301960784313725
            0.980392156862745   0.372549019607843   0.968627450980392
            0.509803921568627   0.792156862745098   0.988235294117647
            0.674509803921569   1.000000000000000   0.988235294117647
            0.988235294117647   0.690196078431373   0.003921568627451
            0.568627450980392   0.035294117647059   0.317647058823529
            0.996078431372549   0.172549019607843   0.329411764705882
            0.784313725490196   0.458823529411765   0.768627450980392
            0.803921568627451   0.772549019607843   0.039215686274510
            0.992156862745098   0.254901960784314   0.117647058823529
            0.603921568627451   0.007843137254902                   0
            0.745098039215686   0.392156862745098                   0
            0.011764705882353   0.039215686274510   0.654901960784314
            0.996078431372549   0.003921568627451   0.603921568627451
            0.968627450980392   0.529411764705882   0.603921568627451
            0.533333333333333   0.443137254901961   0.568627450980392
            0.690196078431373   0.003921568627451   0.286274509803922
            0.070588235294118   0.882352941176471   0.576470588235294
            0.996078431372549   0.482352941176471   0.486274509803922
            1.000000000000000   0.580392156862745   0.031372549019608
            0.415686274509804   0.431372549019608   0.035294117647059
            0.545098039215686   0.180392156862745   0.086274509803922
            0.411764705882353   0.380392156862745   0.070588235294118
            0.882352941176471   0.466666666666667   0.003921568627451
            0.039215686274510   0.282352941176471   0.117647058823529
            0.203921568627451   0.219607843137255   0.215686274509804
            1.000000000000000   0.717647058823529   0.807843137254902
            0.415686274509804   0.474509803921569   0.968627450980392
            0.364705882352941   0.023529411764706   0.913725490196078
            0.239215686274510   0.109803921568627   0.007843137254902
            0.509803921568627   0.650980392156863   0.490196078431373
            0.745098039215686   0.003921568627451   0.098039215686275
            0.788235294117647   1.000000000000000   0.152941176470588
            0.215686274509804   0.243137254901961   0.007843137254902
            0.662745098039216   0.337254901960784   0.117647058823529
            0.792156862745098   0.627450980392157   1.000000000000000
            0.792156862745098   0.400000000000000   0.254901960784314
            0.007843137254902   0.847058823529412   0.913725490196078
            0.533333333333333   0.701960784313725   0.470588235294118
            0.596078431372549                   0   0.007843137254902
            0.796078431372549   0.003921568627451   0.384313725490196
            0.360784313725490   0.674509803921569   0.176470588235294
            0.462745098039216   0.600000000000000   0.345098039215686
            0.635294117647059   0.749019607843137   0.996078431372549
            0.062745098039216   0.650980392156863   0.454901960784314
            0.023529411764706   0.705882352941177   0.545098039215686
            0.686274509803922   0.533333333333333   0.290196078431373
            0.043137254901961   0.545098039215686   0.529411764705882
            1.000000000000000   0.654901960784314   0.337254901960784
            0.635294117647059   0.643137254901961   0.082352941176471
            0.082352941176471   0.266666666666667   0.023529411764706
            0.521568627450980   0.403921568627451   0.596078431372549
            0.203921568627451   0.003921568627451   0.247058823529412
            0.388235294117647   0.176470588235294   0.913725490196078
            0.039215686274510   0.533333333333333   0.541176470588235
            0.435294117647059   0.462745098039216   0.196078431372549
            0.831372549019608   0.415686274509804   0.494117647058824
            0.117647058823529   0.282352941176471   0.560784313725490
            0.737254901960784   0.074509803921569   0.996078431372549
            0.494117647058824   0.956862745098039   0.800000000000000
            0.462745098039216   0.803921568627451   0.149019607843137
            0.454901960784314   0.650980392156863   0.384313725490196
            0.501960784313725   0.003921568627451   0.247058823529412
            0.694117647058824   0.819607843137255   0.988235294117647
            1.000000000000000   1.000000000000000   0.894117647058824
            0.023529411764706   0.321568627450980   1.000000000000000
            0.015686274509804   0.360784313725490   0.352941176470588
            0.341176470588235   0.160784313725490   0.807843137254902
            0.023529411764706   0.603921568627451   0.952941176470588
            1.000000000000000                   0   0.050980392156863
            0.945098039215686   0.047058823529412   0.270588235294118
            0.317647058823529   0.439215686274510   0.843137254901961
            0.674509803921569   0.749019607843137   0.411764705882353
            0.423529411764706   0.203921568627451   0.380392156862745
            0.368627450980392   0.505882352941176   0.615686274509804
            0.376470588235294   0.117647058823529   0.976470588235294
            0.690196078431373   0.866666666666667   0.086274509803922
            0.803921568627451   0.992156862745098   0.007843137254902
            0.172549019607843   0.435294117647059   0.733333333333333
            0.752941176470588   0.450980392156863   0.478431372549020
            0.839215686274510   0.705882352941177   0.988235294117647
            0.007843137254902                   0   0.207843137254902
            0.439215686274510   0.231372549019608   0.905882352941176
            0.992156862745098   0.235294117647059   0.023529411764706
            0.588235294117647                   0   0.337254901960784
            0.250980392156863   0.639215686274510   0.407843137254902
            0.011764705882353   0.443137254901961   0.611764705882353
            0.988235294117647   0.352941176470588   0.313725490196078
            1.000000000000000   1.000000000000000   0.760784313725490
            0.498039215686275   0.168627450980392   0.039215686274510
            0.690196078431373   0.305882352941176   0.058823529411765
            0.627450980392157   0.211764705882353   0.137254901960784
            0.529411764705882   0.682352941176471   0.450980392156863
            0.470588235294118   0.607843137254902   0.450980392156863
            1.000000000000000   1.000000000000000   1.000000000000000
            0.596078431372549   0.937254901960784   0.976470588235294
            0.396078431372549   0.545098039215686   0.219607843137255
            0.352941176470588   0.490196078431373   0.603921568627451
            0.219607843137255   0.031372549019608   0.207843137254902
            1.000000000000000   0.996078431372549   0.478431372549020
            0.360784313725490   0.662745098039216   0.015686274509804
            0.847058823529412   0.862745098039216   0.839215686274510
            0.647058823529412   0.647058823529412   0.007843137254902
            0.839215686274510   0.282352941176471   0.843137254901961
            0.015686274509804   0.454901960784314   0.584313725490196
            0.717647058823529   0.564705882352941   0.831372549019608
            0.356862745098039   0.486274509803922   0.600000000000000
            0.376470588235294   0.486274509803922   0.556862745098039
            0.043137254901961   0.250980392156863   0.031372549019608
            0.929411764705882   0.050980392156863   0.850980392156863
            0.549019607843137                   0   0.058823529411765
            1.000000000000000   1.000000000000000   0.517647058823529
            0.749019607843137   0.564705882352941   0.019607843137255
            0.823529411764706   0.741176470588235   0.039215686274510
            1.000000000000000   0.278431372549020   0.298039215686275
            0.015686274509804   0.521568627450980   0.819607843137255
            1.000000000000000   0.811764705882353   0.862745098039216
            0.015686274509804   0.007843137254902   0.450980392156863
            0.658823529411765   0.235294117647059   0.035294117647059
            0.564705882352941   0.894117647058824   0.756862745098039
            0.317647058823529   0.396078431372549   0.447058823529412
            0.980392156862745   0.760784313725490   0.019607843137255
            0.835294117647059   0.713725490196078   0.039215686274510
            0.211764705882353   0.215686274509804   0.215686274509804
            0.294117647058824   0.364705882352941   0.086274509803922
            0.419607843137255   0.545098039215686   0.643137254901961
            0.501960784313725   0.976470588235294   0.678431372549020
            0.647058823529412   0.494117647058824   0.321568627450980
            0.662745098039216   0.976470588235294   0.443137254901961
            0.776470588235294   0.317647058823529   0.007843137254902
            0.886274509803922   0.792156862745098   0.462745098039216
            0.690196078431373   1.000000000000000   0.615686274509804
            0.623529411764706   0.996078431372549   0.690196078431373
            0.992156862745098   0.666666666666667   0.282352941176471
            0.996078431372549   0.003921568627451   0.694117647058824
            0.756862745098039   0.972549019607843   0.039215686274510
            0.211764705882353   0.003921568627451   0.247058823529412
            0.203921568627451   0.109803921568627   0.007843137254902
            0.725490196078431   0.635294117647059   0.505882352941176
            0.556862745098039   0.670588235294118   0.070588235294118
            0.603921568627451   0.682352941176471   0.027450980392157
            0.007843137254902   0.670588235294118   0.180392156862745
            0.478431372549020   0.976470588235294   0.670588235294118
            0.074509803921569   0.494117647058824   0.427450980392157
            0.666666666666667   0.650980392156863   0.384313725490196
            0.380392156862745                   0   0.137254901960784
            0.003921568627451   0.301960784313725   0.305882352941176
            0.560784313725490   0.078431372549020   0.007843137254902
            0.294117647058824                   0   0.431372549019608
            0.345098039215686   0.058823529411765   0.254901960784314
            0.560784313725490   1.000000000000000   0.623529411764706
            0.858823529411765   0.705882352941177   0.047058823529412
            0.635294117647059   0.811764705882353   0.996078431372549
            0.752941176470588   0.984313725490196   0.176470588235294
            0.745098039215686   0.011764705882353   0.992156862745098
            0.517647058823529                   0                   0
            0.815686274509804   0.996078431372549   0.996078431372549
            0.247058823529412   0.607843137254902   0.043137254901961
            0.003921568627451   0.082352941176471   0.243137254901961
            0.015686274509804   0.847058823529412   0.698039215686274
            0.752941176470588   0.305882352941176   0.003921568627451
            0.047058823529412   1.000000000000000   0.047058823529412
            0.003921568627451   0.396078431372549   0.988235294117647
            0.811764705882353   0.384313725490196   0.458823529411765
            1.000000000000000   0.819607843137255   0.874509803921569
            0.807843137254902   0.701960784313725   0.003921568627451
            0.219607843137255   0.007843137254902   0.509803921568627
            0.666666666666667   1.000000000000000   0.196078431372549
            0.325490196078431   0.988235294117647   0.631372549019608
            0.556862745098039   0.509803921568627   0.996078431372549
            0.796078431372549   0.254901960784314   0.419607843137255
            0.403921568627451   0.478431372549020   0.015686274509804
            1.000000000000000   0.690196078431373   0.486274509803922
            0.780392156862745   0.992156862745098   0.709803921568627
            0.678431372549020   0.505882352941176   0.313725490196078
            1.000000000000000   0.007843137254902   0.552941176470588
                            0                   0                   0
            0.807843137254902   0.635294117647059   0.992156862745098
                            0   0.066666666666667   0.274509803921569
            0.019607843137255   0.015686274509804   0.666666666666667
            0.901960784313726   0.854901960784314   0.650980392156863
            1.000000000000000   0.474509803921569   0.423529411764706
            0.431372549019608   0.458823529411765   0.054901960784314
            0.396078431372549                   0   0.129411764705882
            0.003921568627451   1.000000000000000   0.027450980392157
            0.207843137254902   0.023529411764706   0.243137254901961
            0.682352941176471   0.443137254901961   0.505882352941176
            0.023529411764706   0.278431372549020   0.047058823529412
            0.074509803921569   0.917647058823529   0.788235294117647
                            0   1.000000000000000   1.000000000000000
            0.819607843137255   0.698039215686274   0.435294117647059
                            0   0.011764705882353   0.356862745098039
            0.780392156862745   0.623529411764706   0.937254901960784
            0.023529411764706   0.760784313725490   0.674509803921569
            0.011764705882353   0.207843137254902                   0
            0.603921568627451   0.054901960784314   0.917647058823529
            0.749019607843137   0.466666666666667   0.964705882352941
            0.537254901960784   0.996078431372549   0.019607843137255
            0.572549019607843   0.584313725490196   0.568627450980392
            0.458823529411765   0.733333333333333   0.992156862745098
            1.000000000000000   1.000000000000000   0.078431372549020
            0.760784313725490                   0   0.470588235294118
            0.588235294117647   0.976470588235294   0.482352941176471
            0.976470588235294   0.450980392156863   0.023529411764706
            0.007843137254902   0.576470588235294   0.525490196078431
            0.584313725490196   0.815686274509804   0.988235294117647
            0.898039215686275                   0                   0
            0.396078431372549   0.215686274509804                   0
            1.000000000000000   0.505882352941176   0.752941176470588
            0.011764705882353   0.262745098039216   0.874509803921569
            0.082352941176471   0.690196078431373   0.101960784313725
            0.494117647058824   0.117647058823529   0.611764705882353
    ];

end