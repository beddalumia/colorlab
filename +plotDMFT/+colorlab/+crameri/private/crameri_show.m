%% Display colormap options: 

figure('menubar','none','numbertitle','off','Name','crameri options:')

crameritable = load('crameri7.0.mat','im');

try
   imshow(crameritable.im); 
catch
   axes('pos',[0 0 1 1])
   image(crameritable.im); 
   axis image off
end