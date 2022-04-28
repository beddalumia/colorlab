BREWER Colormap Package
=======================

BREWER provides _all_ ColorBrewer[^1] discrete schemes, with simple selection by colormap length and scheme name. Alternatively the scheme name can be preselected, after which only the colormap length is required to define an output colormap. Remarkably, **downsampling or interpolation or repetition of the nodes occurs automatically**, making the schemes easily adapted to continuos-colormap use cases. Interpolation happens in the CIELAB colorspace.

⚠️ While the original [BrewerMap function](https://github.com/DrosteEffect/BrewerMap) is compatible with all MATLAB functions that require a colormap function, even those in Toolboxes, the packaging has broken some corner cases, due to MATLAB's idiosyncrasies with namespace qualification. For instance this syntax would **not** do the job for the infaust Mapping Toolbox function CONTOURCMAP:
```matlab
    contourcmap('brewer.cmap') % DOES NOT WORK
``` 
> In the examples section we provide a nasty workaround, but unexpected behavior could happen if tinkering with the details. Hope to find a general solution soon.

## Overview: colorschemes and main ##

![Brewer_TABLE](assets/brewer_show.svg)

The BREWER package:
* Consists of just three convenient .m files (no .mat files or other clutter).
* Has no third-party file dependencies.
* Has no special toolbox dependencies.
* Interpolates in the CIELAB colorspace.
* Requires just the standard ColorBrewer colorscheme name to select the colorscheme.
* Accepts the colorscheme name as a string scalar or a character vector.
* Supports all ColorBrewer colorschemes.
* Outputs a MATLAB standard N-by-3 numeric RGB array.
* Uses a default length the same as MATLAB's colormap functions.
* ~~Is compatible with all MATLAB toolboxes that use colormaps.~~ **[BROKEN: nasty tricks are needed]**
* Includes the option to reverse the color sequence: just put a `-` in front of the desired colorscheme name (see examples).
* Does not break ColorBrewer's Apache license conditions (unlike many on MATLAB File Exchange).

The above table, showing all the discrete schemes defined in the package, can be retrieved at run time by invoking the `brewer.show` command.

### Examples: command line usage through `brewer.cmap()` function ###

```matlab
    % Brewer colors for a sample PHOTO:
    S = load('mandrill');
    imshow(S.X,colormap(brewer.cmap([],"-YlGnBu"))) % reversed yellow-green-blue scheme
```
![invYlGnBu](assets/mandrill_invYlGnBu.png)
```matlab
    % Brewer colors for a sample SURF:
    [X,Y,Z] = peaks(50);
    surfc(X,Y,Z)
    colormap(brewer.cmap([],'-RdBu')) % reversed red-blue divergent scheme
```
![invRdBu](assets/surfc_invRdBu.png)
```matlab
    % A trick to deal with nasty CONTOURCMAP function (Mapping Toolbox):
    preset_colormap(@brewer.cmap, '-PuOr'); % preselect the colorscheme.
    load topo
    load coastlines
    figure
    worldmap(topo, topolegend)
    contourfm(topo, topolegend);
    contourcmap('parula', 'Colorbar','on', 'Location','horizontal');
    %            ^ temporary use of parula...
    plotm(coastlat, coastlon, 'k'); colormap(preset_colormap); % Et Voilà...
    % -> we have set our beautiful purple-orange colormap afterwards!
```
![invPuOr](assets/worldmap_brewer.svg)
```matlab
    % Plot and compare RGB values:
    ax(1) = subplot(1,2,1); 
    cmap = brewer.cmap(NaN, 'PiYG');
    rgbplot(cmap); title('Standard PiYG')
    xlim([1,11]); xticks([]);
    colorbar('southoutside');
    colormap(ax(1),cmap); 

    ax(2) = subplot(1,2,2);
    cmap = brewer.cmap(NaN,'-PiYG');
    rgbplot(cmap); title('Reversed PiYG')
    xlim([1,11]); xticks([]);
    colorbar('southoutside');
    colormap(ax(2),cmap);
```
![rgb_plot](assets/rgbplot.svg)
```matlab    
    % View information about a colorscheme:

    >> [~,num,typ] = brewer.cmap(NaN,'Paired')
    
    num =

        12


    typ =

        'Qualitative'
```
```matlab
    % Multiline plot using matrices:
    N = 6;
    axes('ColorOrder',brewer.cmap(N,'Pastel2'),'NextPlot','replacechildren')
    X = linspace(0,3*pi,1000);
    Y = bsxfun(@(x,n)n*sin(x+2*n*pi/N), X.', 1:N);
    plot(X,Y, 'linewidth',4); box on; xlim([0,3*pi]);
```
![Pastel2](assets/pastel2.svg)
```matlab
    % Multiline plot in a loop:
    set(0,'DefaultAxesColorOrder',brewer.cmap(NaN,'Accent'))
    N = 6;
    X = linspace(0,10,1000);
    Y = bsxfun(@(x,n)n*sin(x+2*n*pi/N), X.', 1:N);
    for n = 1:N
        plot(X(:),Y(:,n), 'linewidth',4);
        hold all
    end
    xlim([0,3*pi]);
```
![Accent](assets/accent.svg)

### Bonus: interactive usage through `brewer.show()` and `brewer.gui()` ###

BREWER SHOW creates a static figure which shows the nodes (defining colors) of all ColorBrewer colorschemes, so that you could check any time the colorcodes and pick what most inspires you.

BREWER GUI creates an interactive figure that allows dynamic selection of the colorscheme, while displaying the colorbars for both the colormap and its grayscale equivalent.

> R2014b or later: BREWER VIEW can also update other axes' or figures' colormaps in real time, for example:

```matlab
    S = load('spine');
    image(S.X)
    brewer.gui(gca)
```

### How to make a scheme permanent: `preset_colormap()` function ###

PRESET_COLORMAP is a wrapper for any colormap function, storing the function and any parameter values for future calls.

```matlab
    preset_colormap(@brewer.cmap, "blues")
    colormap(preset_colormap)
```

### COPYRIGHT & LICENSING ###

 © 2014-2022 Stephen Cobeldick, original [BREWERMAP Function](https://github.com/DrosteEffect/BrewerMap)    
 © 2022 Gabriele Bellomia, +BREWER Package adaptation and embedding

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at:

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and limitations under the License.


[^1]: This product includes color specifications and designs developed by Cynthia Brewer (http://colorbrewer.org/). See the ColorBrewer website for further information about each colorscheme, colorblind suitability, licensing, and citations.