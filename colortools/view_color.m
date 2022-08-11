function view(colors,formfactor)
%% view_color(colors) displays the given colors in a figure window.
%  
%   >> view_color(color,'squares') ---> matrix-like representation (default)
%
%   >> view_color(color,'hbars') ---> horizontal barplot-like representation
%
%   >> view_color(color,'vbars') ---> vertical barplot-like representation
%
%  NB) colors can be both a matrix of rgb-triplets or a cell of colornames!
%
%% EXAMPLES
%
%  view_color({'r','g','b','c','m','y','k','w'},'squares')
%  view_color({'strawberry','apple','blueberry',"banana"})
%  view_color({'matlab1','matlab2','matlab3','matlab4'},'hbars')
%  view_color({'pyplot1',"pyplot2",'pyplot3'},'vbars')
%  view_color(palette.tab20(16),'hbars')
%  view_color(palette.cubehelix(36))
%
%% COPYRIGHT
%  
%  MIT LICENSE (c) 2022, Gabriele Bellomia
%
%  See also str2rgb, rgb.xkcd, rgb.X11, palette
   if nargin < 2
      formfactor = 'squares';
   end
   if not(isnumeric(colors))
      colors = str2rgb(colors);
   end
   figurehandle = figure();
   n = length(colors(:,1));
   m = ceil(sqrt(n));
   for i = 1:n
       switch formfactor
           case 'squares'
                handle = subplot(m,m,i);
           case 'hbars'
                handle = subplot(n,1,i);
           case 'vbars'
                handle = subplot(1,n,i);
           otherwise
                fprintf(2,'\nERROR: invalid form-factor.\n\n')
                close(figurehandle); help view_color; 
                return
       end
           set(handle,'color',colors(i,:));
           xticks([]); yticks([]); box on;
   end
end