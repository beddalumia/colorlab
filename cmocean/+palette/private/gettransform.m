function T = gettransform(Space)
% Get a colorspace transform: either a matrix describing an affine transform,
% or a string referring to a conversion subroutine
switch Space
case 'ypbpr'
   T = [0.299,0.587,0.114,0;-0.1687367,-0.331264,0.5,0;0.5,-0.418688,-0.081312,0];
case 'yuv'
   % sRGB to NTSC/PAL YUV
   % Wikipedia: http://en.wikipedia.org/wiki/YUV
   T = [0.299,0.587,0.114,0;-0.147,-0.289,0.436,0;0.615,-0.515,-0.100,0];
case 'ydbdr'
   % sRGB to SECAM YDbDr
   % Wikipedia: http://en.wikipedia.org/wiki/YDbDr
   T = [0.299,0.587,0.114,0;-0.450,-0.883,1.333,0;-1.333,1.116,0.217,0];
case 'yiq'
   % sRGB in [0,1] to NTSC YIQ in [0,1];[-0.595716,0.595716];[-0.522591,0.522591];
   % Wikipedia: http://en.wikipedia.org/wiki/YIQ
   T = [0.299,0.587,0.114,0;0.595716,-0.274453,-0.321263,0;0.211456,-0.522591,0.311135,0];
case 'ycbcr'
   % sRGB (range [0,1]) to ITU-R BRT.601 (CCIR 601) Y'CbCr
   % Wikipedia: http://en.wikipedia.org/wiki/YCbCr
   % Poynton, Equation 3, scaling of R'G'B to Y'PbPr conversion
   T = [65.481,128.553,24.966,16;-37.797,-74.203,112.0,128;112.0,-93.786,-18.214,128];
case 'jpegycbcr'
   % Wikipedia: http://en.wikipedia.org/wiki/YCbCr
   T = [0.299,0.587,0.114,0;-0.168736,-0.331264,0.5,0.5;0.5,-0.418688,-0.081312,0.5]*255;
case {'rgb','xyz','hsv','hsl','lab','luv','lch','cat02lms'}
   T = Space;
otherwise
   error(['Unknown color space, ''',Space,'''.']);
end
return;
