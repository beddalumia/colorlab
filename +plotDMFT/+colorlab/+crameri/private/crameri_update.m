%% Code to collect latest *relevant* CRAMERI data into a single .mat file: 

% • Unzip the latest release from http://doi.org/10.5281/zenodo.1243862 (†)
% • Navigate to the resulting dìrectory: …/ScientificColourMaps*/ (* = version)
% • Run the following:

 clear()

 %% Retrieve all mat-files, recursively
 file = dir('./**/*.mat'); 
 %% Reshape into appropriate cell arrays
 name = {file(:).name};
 fold = {file(:).folder}; 
 %% Remove .mat extension from filenames
 name = erase(name,'.mat');
 %% Discard discrete-but-not-categorical cmaps
 good = cellfun('isempty',regexp(name,'\d+$')); % \d+$: at least one digit at the end
 name = name(good); fold = fold(good); % keep only the 'good' cell entries
 %% Load all 'good' mat-files and print to log
 for k = 1:length(name)
      fprintf("Importing colormap: '%s'\n",name{k})
      load([fold{k},'/',name{k},'.mat']); % better to restore extension: degenerate names!
 end
 %% Bundle everything in one mat-file
 clear('file','fold','name','good','k') % clean-up the workspace before saving
 save('CrameriColourMaps.mat') % Move the .mat archive to the original path [Automate?]

 % (†) TODO: automate this task? With websave() should be easy, but how to select the url?
 %           the global, static, doi does not do the work and I don't understand how to 
 %           automatically get the latest release, I don't want to use the version-specific
 %           doi everytime...