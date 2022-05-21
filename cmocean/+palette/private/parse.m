function [SrcSpace,DestSpace] = parse(Str)
% Parse conversion argument
if ischar(Str)
   Str = lower(strrep(strrep(Str,'-',''),'=',''));
   k = find(Str == '>');
   
   if length(k) == 1         % Interpret the form 'src->dest'
      SrcSpace = Str(1:k-1);
      DestSpace = Str(k+1:end);
   else
      k = find(Str == '<');
      
      if length(k) == 1      % Interpret the form 'dest<-src'
         DestSpace = Str(1:k-1);
         SrcSpace = Str(k+1:end);
      else
         error(['Invalid conversion, ''',Str,'''.']);
      end   
   end
   
   SrcSpace = alias(SrcSpace);
   DestSpace = alias(DestSpace);
else
   SrcSpace = 1;             % No source pre-transform
   DestSpace = Conversion;
   if any(size(Conversion) ~= 3)
       error('Transformation matrix must be 3x3.');
   end
end
return;