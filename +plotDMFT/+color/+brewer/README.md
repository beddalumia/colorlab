BREWER Colormap Package
=======================

BREWER provides all ColorBrewer[^1] schemes, with simple selection by colormap length and scheme name. Alternatively the scheme name can be preselected, after which only the colormap length is required to define an output colormap.

BREWER is compatible with all MATLAB functions that require a colormap function. Downsampling or interpolation or repetition of the nodes occurs automatically, if required. Interpolation uses the Lab colorspace.

### Examples: usage of the `brewer.map()` function ###

```matlab
    % New colors for the PHOTO example:
    S = load('mandrill');
    imshow(S.X,colormap(brewer.map([],"YlGnBu"))) % default parameters
    
    % New colors for the SURF example:
    [X,Y,Z] = peaks(30);
    surfc(X,Y,Z)
    colormap(brewer.map([],'RdYlGn'))
    axis([-3,3,-3,3,-10,5])
    
    % New colors for the CONTOURCMAP (Mapping Toolbox) example:
    brewer.map('PuOr'); % preselect the colorscheme.
    load topo
    load coast
    figure
    worldmap(topo, topolegend)
    contourfm(topo, topolegend);
    contourcmap('brewer.map', 'Colorbar','on', 'Location','horizontal',...
    'TitleString','Contour Intervals in Meters');
    plotm(lat, long, 'k')
    
    % Plot a scheme's RGB values:
    rgbplot(brewer.map(NaN, 'Blues')) % standard
    rgbplot(brewer.map(NaN,'-Blues')) % reversed
    
    % View information about a colorscheme:
    [~,num,typ] = brewer.map(NaN,'Paired')
    num = 12
    typ = 'Qualitative'
    
    % Multiline plot using matrices:
    N = 6;
    axes('ColorOrder',brewer.map(N,'Pastel2'),'NextPlot','replacechildren')
    X = linspace(0,pi*3,1000);
    Y = bsxfun(@(x,n)n*sin(x+2*n*pi/N), X.', 1:N);
    plot(X,Y, 'linewidth',4)
    
    % Multiline plot in a loop:
    set(0,'DefaultAxesColorOrder',brewer.map(NaN,'Accent'))
    N = 6;
    X = linspace(0,pi*3,1000);
    Y = bsxfun(@(x,n)n*sin(x+2*n*pi/N), X.', 1:N);
    for n = 1:N
        plot(X(:),Y(:,n), 'linewidth',4);
        hold all
    end
```

### Bonus functions: `brewer.show()` and `brewer.gui()` ###

BREWER SHOW creates a static figure which shows the nodes (defining colors) of all ColorBrewer colorschemes.

BREWER GUI creates an interactive figure that allows selection of the colorscheme, and that contains two colorbars showing colors of the colormap and the grayscale equivalent.

R2014b or later: BREWER VIEW can also update other axes' or figures' colormaps in real time, for example:

```matlab
    S = load('spine');
    image(S.X)
    brewer.gui(gca)
```

### How to preselect the scheme: `preset_colormap()` function ###

PRESET_COLORMAP is a wrapper for any colormap function, storing the function and any parameter values for future calls.

```matlab
    preset_colormap(@brewer.map, "blues")
    colormap(preset_colormap)
```

### Overview ###

The BREWER package:
* Consists of just three convenient .m files (no .mat files or other clutter).
* Has no third-party file dependencies.
* Has no special toolbox dependencies.
* Interpolates in the Lab colorspace.
* Requires just the standard ColorBrewer colorscheme name to select the colorscheme.
* Accepts the colorscheme name as a string scalar or a character vector.
* Supports all ColorBrewer colorschemes.
* Outputs a MATLAB standard N-by-3 numeric RGB array.
* Uses a default length the same as MATLAB's colormap functions.
* Is compatible with all MATLAB toolboxes that use colormaps (eg: CONTOURCMAP from Mapping Toolbox).
* Includes the option to reverse the colormap color sequence.
* Does not break ColorBrewer's Apache license conditions (unlike many on MATLAB File Exchange).

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