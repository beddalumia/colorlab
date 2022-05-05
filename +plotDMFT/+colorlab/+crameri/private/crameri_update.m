%% Code to collect latest CRAMERI data into a single .mat file: 

% • Unzip the latest release from http://doi.org/10.5281/zenodo.1243862 (†)
% • Navigate to the resulting dìrectory: …/ScientificColourMaps*/ (* = version)
% • Run the following:

 clear()

 subentries = dir('.'); % Retrieves every subdir and file in current directory 
 subfolders = subentries([subentries(:).isdir]); % Keeps only subdirectories
 subfolders = {subfolders(:).name}; % Convert to appropriate cell array
 subfolders = subfolders(~ismember(subfolders,{'.','..'})); % . ..
 % subfolders = subfolders(~ismember(strfind(subfolders,'+'),{true})); [BROKEN]

 f = {'acton','bam','bamO','bamako','batlow','batlowK','batlowW','berlin','bilbao','broc','brocO',...
      'buda','bukavu','cork','corkO','davos','devon','fes','grayC','hawaii','imola','lajolla','lapaz',...
      'lisbon','nuuk','oleron','oslo','roma','romaO','tofino','tokyo','turku','vanimo','vik','vikO'}; 

 for k = 1:length(subfolders)
      if ~ismember(f,subfolders{k})
         fprintf(1,"'%s' is a candidate new colormap!\n",subfolders{k})
      end
      try
         load([subfolders{k},'/',subfolders{k},'.mat']);
      catch
         fprintf(2,"'%s' is not a colormap: omitted from import\n",subfolders{k})
      end
 end
 
 clear('subentries','subfolders','f','k') 

 save('CrameriColourMaps.mat') % Move the .mat archive to the original path [Automate?]

 % (†) TODO: automate this task? With websave() should be easy, but how to select the url?
 %           the global, static, doi does not do the work and I don't understand how to 
 %           automatically get the latest release, I don't want to use the version-specific
 %           doi everytime...