CUBEHELIX Colormap Package
==========================

CUBEHELIX generates a family of perceptually accurate colorschemes: they all range from black to white with a well-behaved monotonic increase in intensity, such that the data representation is well preserved if printed / converted to grayscale. The helical deviation from the pure grayscale diagonal, in RGB space, takes into account that red, green and blue colors are not perceived equally in terms of intensity.

The CUBEHELIX algorithm is originally defined here: http://astron-soc.in/bulletin/11June/289392011.pdf    
For more information and examples take a look at: http://www.mrao.cam.ac.uk/~dag/CUBEHELIX/

Please note that the original specification (the links above) mispelled the saturation option as "hue". In the CUBEHELIX function the saturation option is appropriately renamed as "satn".

### Examples: command line usage through `cubehelix.map()` function ###

```matlab
    % New colors for the PHOTO example:
    S = load('mandrill');
    imshow(S.X,colormap(cubehelix.map)) % default parameters
    
    % New colors for the SURF example:
    [X,Y,Z] = peaks(30);
    surfc(X,Y,Z)
    colormap(cubehelix.map([],0.5,-1.5,1,1,[0.29,0.92]))
    axis([-3,3,-3,3,-10,5])
```

### Bonus: interactive usage through `cubehelix.gui()` function ###

CUBEHELIX GUI creates an interactive figure that allows selection of the colorscheme, and that contains two colorbars showing colors of the colormap and the grayscale equivalent.

R2014b or later: CUBEHELIX_VIEW can also update other axes' or figures' colormaps in real time, for example:

```matlab
    S = load('spine');
    image(S.X)
    cubehelix.gui(gca)
```

### How to preselect the scheme: `preset_colormap()` function ###

PRESET_COLORMAP is a wrapper for any colormap function, storing the function and any parameter values for future calls.

```matlab
    preset_colormap(@cubehelix.map, 0.5,-1.5,1,1)
    colormap(preset_colormap)
```

### COPYRIGHT & LICENSING ###

 © 2013-2022 Stephen Cobeldick, original [CUBEHELIX Function](https://github.com/DrosteEffect/CubeHelix)    
 © 2022 Gabriele Bellomia, +CUBEHELIX Package adaptation and embedding

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at:

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and limitations under the License.