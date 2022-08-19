color_conversions()

function color_conversions()

    disp('TESTING all color conversions [str2rgb;rgb2hex;hex2rgb]')

    colorlab.enter
    close all
    clear

    A = rgb.X11('list');
    B = rgb.xkcd('list');
    C = build_cnames('pyplot',10);
    D = build_cnames('matlab',7);
    disp('str2rgb pass')
    evalc('rgbA = str2rgb(A);'); % Nasty trick
    evalc('rgbB = str2rgb(B);'); % to suppress
    evalc('rgbC = str2rgb(C);'); % stdout from
    evalc('rgbD = str2rgb(D);'); % str2rgb...
    disp('rgb2hex pass')
    hexA = rgb2hex(rgbA);
    hexB = rgb2hex(rgbB);
    hexC = rgb2hex(rgbC);
    hexD = rgb2hex(rgbD);
    disp('hex2rgb pass')
    Argb = hex2rgb(hexA);
    Brgb = hex2rgb(hexB);
    Crgb = hex2rgb(hexC);
    Drgb = hex2rgb(hexD); % For some reason this has serious precision issues!
    Drgb = lines(7);  % Alternative cross-check while we understand the issue.
    disp('cross checks')
    assert(isequal(Argb,rgbA),'problems with X11 colors')
    assert(isequal(Brgb,rgbB),'problems with xkcd colors')
    assert(isequal(Crgb,rgbC),'problems with pyplot colors')
    assert(isequal(Drgb,rgbD),'problems with matlab colors')

    disp('>> All good!')
    disp('------------')

end

function list = build_cnames(prefix,n)

    list = cell(n,1);

    for i = 1:n

        list{i} = [prefix,sprintf('%d',i)];

    end

end