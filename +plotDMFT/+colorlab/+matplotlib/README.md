MATPLOTLIB Colormap Package
===========================

Providing perceptually _**exact**_ sequential and cyclic continuous colormaps and nonmisleading qualitative colorscheme from `matplotlib`. More info can be found in [matplotlib official docs](https://matplotlib.org/stable/tutorials/colors/colormaps.html), or in the [original video presentation](https://www.youtube.com/watch?v=xAoljeRJ3lU) (a very enjoyable watch!).

## Overview of the imported colormaps ##

![Matplotlib_TABLE](assets/matplotlib_show.png)

Note that the package delivers only a subset of all matplotlib's colorscheme, namely those that have been originally developed by its team. If you are looking for `Paired` or `RdBu`, etc... you might want to check the [BREWER](../%2Bbrewer/) colormap package. Same goes for [CubeHelix](../%2Bcubehelix/).

### Examples: ###

```matlab
    % View a PHOTO with matplotlib default colormap
    S = load('mandrill');
    imshow(S.X,colormap(matplotlib.viridis))
```
![mandrill_viridis](assets/mandrill_viridis.png)
```matlab
    % Graph a surface with the twilight cyclic colormap
    [X,Y,Z] = peaks(50);
    surfc(X,Y,Z)
    colormap(matplotlib.twilight_shifted) % shifted to have white at zero
```
![surfc_twilight](assets/surfc_twilight.png)
```matlab
    % Plot and compare RGB values:
    ax(1) = subplot(1,2,1);
    cmap = matplotlib.viridis;
    rgbplot(cmap); title('viridis'); 
    xlim([0,256]); xticks([]);
    colorbar('southoutside');
    colormap(ax(1),cmap); 

    ax(2) = subplot(1,2,2);
    cmap = matplotlib.plasma;
    rgbplot(cmap); title('plasma');
    xlim([0,256]); xticks([]);
    colorbar('southoutside');
    colormap(ax(2),cmap); 
```
![rgb_plot](assets/rgbplot.svg)
```matlab
    % Multiline plot using matrices:
    N = 6;
    axes('ColorOrder',matplotlib.tab10,'NextPlot','replacechildren')
    X = linspace(0,pi*3,1000);
    Y = bsxfun(@(x,n)n*sin(x+2*n*pi/N), X.', 1:N);
    plot(X,Y, 'linewidth',4); box on; xlim([0,3*pi]);
```
![tab10](assets/tab10.svg)
```matlab
    % Multiline plot in a loop:
    set(0,'DefaultAxesColorOrder',matplotlib.tab20)
    N = 6;
    X = linspace(0,pi*3,1000);
    Y = bsxfun(@(x,n)n*sin(x+2*n*pi/N), X.', 1:N);
    for n = 1:N
        plot(X(:),Y(:,n), 'linewidth',4);
        hold all
    end
    xlim([0,3*pi]);
```
![tab20](assets/tab20.svg)

### COPYRIGHT & LICENSING ###
© 2022, Stephen Cobeldick    
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution

* Neither the name of  nor the names of its
  contributors may be used to endorse or promote products derived from this
  software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
