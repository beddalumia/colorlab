<img src=resources/logo.gif width=250>

# `COLORLAB` a curated collection of color-related MATLAB libraries

For a long time Matlab has excelled for its plotting features, at a point where [matplotlib](https://matplotlib.org), arguably the most popular open-source plotting library nowadays, has started as an explicit clone of such functionality and still today keeps a strong influence. In recent years, though, one important aspect has greatly evolved in the plotting business: color management. So we had [Dave Green's 2011 paper](https://astron-soc.in/bulletin/11June/289392011.pdf) introducing a new, revolutionary, colormap with the aim of representing astronomical data with monotonically increasing brightness (and so black-and-white print friendliness); then in 2015 even better advances by the SciPy team, enriching matplotib with beautiful _perceptually uniform_ colormaps ([viridis, magma, plasma](https://www.youtube.com/watch?v=xAoljeRJ3lU) and the [domain-specific ones for oceanography: cmocean](https://youtu.be/XjHzLUnHeM0)). Meanwhile the results of a totally crazy and marvelous at the same time [2010 color survey](https://blog.xkcd.com/2010/05/03/color-survey-results/) made by the great xkcd webcomic, have gained more and more popularity, in fact challenging the old and trusted [X11 colorset](https://en.wikipedia.org/wiki/X11_color_names). Nowadays it's embedded again in [matplotlib](https://matplotlib.org/stable/tutorials/colors/colors.html) and available in [LaTeX](https://www.ctan.org/pkg/xkcdcolors), in [R](https://cran.r-project.org/web/packages/xkcdcolors/), and [Julia](https://github.com/JuliaGraphics/NamedColors.jl).

So here we provide a fair amount of such new color functionality, building up on the firm shoulders of two giants:

- [Chad. A. Greene](https://github.com/chadagreene), one of the coauthors of the [cmocean launch paper](https://dx.doi.org/10.5670/oceanog.2016.66) and prolific matlab-file-exchange contributor.

- [Stephen Cobeldick](https://github.com/DrosteEffect), refined matlab programmer and color-theory expert.

The codebase mainly embeds several functions and packages by these two authors, retrieved either from the [file-exchange](https://www.mathworks.com/matlabcentral/fileexchange/) or github and then appropriately tweaked/extended, while providing some common wrappers and tools. All for a unified user experience.

## Installation

To start using the packages just:

1. clone the repository somewhere in your machine
   ```ssh
   git clone https://github.com/bellomia/colorlab.git
   ```
2. start a matlab session therein and in the matlab command window type
   ```matlab
   colorlab.enter
   savepath !to make changes resilient to session restart
   ```
3. call any function, import any subpackage as explained [below](#usage) :)

4. If you wish to unoad the library from the matlab path, just type in the commmand window (from whatever directory)
   ```matlab
   colorlab.leave
   savepath
   ```

## Usage


## Additional interactive funtionaity through `view_color`

To help interactive exploration we furthermore provide a very simple --yet effective-- tool to visualize small collections of colors, so to allow fast visual comparisons and easier overall evaluation of different colornames. It supports single or multiple colors (as cells, not multiple arguments allowed, currently) and an optional string to specify the visual format of the shown palette: `'squares'` for a matrix, `'hbars'` and `'vbars'` for respectively horizontal and vertical barplots. It supports colornames from _both_ the X11 and xkcd datasets, prioritizing the latter when there is collision: learn more about our naming criteria in the docstrings of [`str2rgb`](../colortools/str2rgb.m), our higher level wrapper for colorname-to-rgb-triplet conversions, which includes also other smaller sets and provide a hex-to-rgb converter.

Some examples:

```matlab
view_color({'r','g','b','c','m','y','k','w'},'squares')
view_color({'strawberry','apple','blueberry',"banana"})
view_color({'pyplot1',"pyplot2",'pyplot3'},'vbars')
view_color({'matlab1','matlab2','matlab3','matlab4'},'hbars')
view_color(palette.tab20(16),'hbars')
view_color(palette.cubehelix(36))
```
would produce the following (left-right and top-down ordering):

![rgbcmykw](resources/rgbcmykw.svg) | ![fruit](resources/fruit.svg)
--|--
![pyplot](resources/pyplot.svg) | ![matlab](resources/matlab.svg)
![pyplot](resources/tab20.svg) | ![matlab](resources/cubehelix_palette.svg)
