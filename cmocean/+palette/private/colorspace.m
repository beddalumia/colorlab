function varargout = colorspace(Conversion,varargin)
%COLORSPACE  Transform a color image between color representations.
%   B = COLORSPACE(S,A) transforms the color representation of image A
%   where S is a string specifying the conversion.  The input array A 
%   should be a real full double array of size Mx3 or MxNx3.  The output B 
%   is the same size as A.
%
%   S tells the source and destination color spaces, S = 'dest<-src', or 
%   alternatively, S = 'src->dest'.  Supported color spaces are
%
%     'RGB'              sRGB IEC 61966-2-1
%     'YCbCr'            Luma + Chroma ("digitized" version of Y'PbPr)
%     'JPEG-YCbCr'       Luma + Chroma space used in JFIF JPEG
%     'YDbDr'            SECAM Y'DbDr Luma + Chroma
%     'YPbPr'            Luma (ITU-R BT.601) + Chroma 
%     'YUV'              NTSC PAL Y'UV Luma + Chroma
%     'YIQ'              NTSC Y'IQ Luma + Chroma
%     'HSV' or 'HSB'     Hue Saturation Value/Brightness
%     'HSL' or 'HLS'     Hue Saturation Luminance
%     'HSI'              Hue Saturation Intensity
%     'XYZ'              CIE 1931 XYZ
%     'Lab'              CIE 1976 L*a*b* (CIELAB)
%     'Luv'              CIE L*u*v* (CIELUV)
%     'LCH'              CIE L*C*H* (CIELCH)
%     'CAT02 LMS'        CIE CAT02 LMS
%
%  All conversions assume 2 degree observer and D65 illuminant.
%
%  Color space names are case insensitive and spaces are ignored.  When 
%  sRGB is the source or destination, it can be omitted. For example 
%  'yuv<-' is short for 'yuv<-rgb'.
%
%  For sRGB, the values should be scaled between 0 and 1.  Beware that 
%  transformations generally do not constrain colors to be "in gamut."  
%  Particularly, transforming from another space to sRGB may obtain 
%  R'G'B' values outside of the [0,1] range.  So the result should be 
%  clamped to [0,1] before displaying:
%     image(min(max(B,0),1));  % Clamp B to [0,1] and display
%
%  sRGB (Red Green Blue) is the (ITU-R BT.709 gamma-corrected) standard
%  red-green-blue representation of colors used in digital imaging.  The 
%  components should be scaled between 0 and 1.  The space can be 
%  visualized geometrically as a cube.
%  
%  Y'PbPr, Y'CbCr, Y'DbDr, Y'UV, and Y'IQ are related to sRGB by linear
%  transformations.  These spaces separate a color into a grayscale
%  luminance component Y and two chroma components.  The valid ranges of
%  the components depends on the space.
%
%  HSV (Hue Saturation Value) is related to sRGB by
%     H = hexagonal hue angle   (0 <= H < 360),
%     S = C/V                   (0 <= S <= 1),
%     V = max(R',G',B')         (0 <= V <= 1),
%  where C = max(R',G',B') - min(R',G',B').  The hue angle H is computed on
%  a hexagon.  The space is geometrically a hexagonal cone.
%
%  HSL (Hue Saturation Lightness) is related to sRGB by
%     H = hexagonal hue angle                (0 <= H < 360),
%     S = C/(1 - |2L-1|)                     (0 <= S <= 1),
%     L = (max(R',G',B') + min(R',G',B'))/2  (0 <= L <= 1),
%  where H and C are the same as in HSV.  Geometrically, the space is a
%  double hexagonal cone.
%
%  HSI (Hue Saturation Intensity) is related to sRGB by
%     H = polar hue angle        (0 <= H < 360),
%     S = 1 - min(R',G',B')/I    (0 <= S <= 1),
%     I = (R'+G'+B')/3           (0 <= I <= 1).
%  Unlike HSV and HSL, the hue angle H is computed on a circle rather than
%  a hexagon. 
%
%  CIE XYZ is related to sRGB by inverse gamma correction followed by a
%  linear transform.  Other CIE color spaces are defined relative to XYZ.
%
%  CIE L*a*b*, L*u*v*, and L*C*H* are nonlinear functions of XYZ.  The L*
%  component is designed to match closely with human perception of
%  lightness.  The other two components describe the chroma.
%
%  CIE CAT02 LMS is the linear transformation of XYZ using the MCAT02 
%  chromatic adaptation matrix.  The space is designed to model the 
%  response of the three types of cones in the human eye, where L, M, S,
%  correspond respectively to red ("long"), green ("medium"), and blue
%  ("short").

% Pascal Getreuer 2005-2010


%%% Input parsing %%%
if nargin < 2, error('Not enough input arguments.'); end
[SrcSpace,DestSpace] = parse(Conversion);

if nargin == 2
   Image = varargin{1};
elseif nargin >= 3
   Image = cat(3,varargin{:});
else
   error('Invalid number of input arguments.');
end

FlipDims = (size(Image,3) == 1);

if FlipDims, Image = permute(Image,[1,3,2]); end
if ~isa(Image,'double'), Image = double(Image)/255; end
if size(Image,3) ~= 3, error('Invalid input size.'); end

SrcT = gettransform(SrcSpace);
DestT = gettransform(DestSpace);

if ~ischar(SrcT) && ~ischar(DestT)
   % Both source and destination transforms are affine, so they
   % can be composed into one affine operation
   T = [DestT(:,1:3)*SrcT(:,1:3),DestT(:,1:3)*SrcT(:,4)+DestT(:,4)];      
   Temp = zeros(size(Image));
   Temp(:,:,1) = T(1)*Image(:,:,1) + T(4)*Image(:,:,2) + T(7)*Image(:,:,3) + T(10);
   Temp(:,:,2) = T(2)*Image(:,:,1) + T(5)*Image(:,:,2) + T(8)*Image(:,:,3) + T(11);
   Temp(:,:,3) = T(3)*Image(:,:,1) + T(6)*Image(:,:,2) + T(9)*Image(:,:,3) + T(12);
   Image = Temp;
elseif ~ischar(DestT)
   Image = rgb(Image,SrcSpace);
   Temp = zeros(size(Image));
   Temp(:,:,1) = DestT(1)*Image(:,:,1) + DestT(4)*Image(:,:,2) + DestT(7)*Image(:,:,3) + DestT(10);
   Temp(:,:,2) = DestT(2)*Image(:,:,1) + DestT(5)*Image(:,:,2) + DestT(8)*Image(:,:,3) + DestT(11);
   Temp(:,:,3) = DestT(3)*Image(:,:,1) + DestT(6)*Image(:,:,2) + DestT(9)*Image(:,:,3) + DestT(12);
   Image = Temp;
else
   Image = feval(DestT,Image,SrcSpace);
end

%%% Output format %%%
if nargout > 1
   varargout = {Image(:,:,1),Image(:,:,2),Image(:,:,3)};
else
   if FlipDims, Image = permute(Image,[1,3,2]); end
   varargout = {Image};
end

return;