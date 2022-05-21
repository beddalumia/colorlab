function Space = alias(Space)
Space = strrep(strrep(Space,'cie',''),' ','');

if isempty(Space)
   Space = 'rgb';
end

switch Space
case {'ycbcr','ycc'}
   Space = 'ycbcr';
case {'hsv','hsb'}
   Space = 'hsv';
case {'hsl','hsi','hls'}
   Space = 'hsl';
case {'rgb','yuv','yiq','ydbdr','jpegycbcr','xyz','lab','luv','lch'}
   return;
end
return;
