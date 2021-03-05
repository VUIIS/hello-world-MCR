function hello_world_run(params)
%% hello-world - Write text to a blank file
% Function that allows the user to input a string of text, which is then 
% printed and displayed to a text file. 

% Syntax: hello_world(params)

% Inputs:
%   display_string: string of characters to be displayed
%   filename: will save pdf as 'filename'.txt
%   in_dir (optional): move to desired path (Default: current path)
%   out_dir (optional): path where file will be saved (Default: '\output')

% Outputs:
%   'filename'.txt will be saved at 'in_dir' \ 'out_dir'

% Author: Dylan Lawless
% Date: 18-Feb-2021
% Version: 1.0
% Changelog:
%   18-Feb-2021 - initial creation

%% ---------------- BEGIN CODE ----------------

% Set variables from input struct
display_string = params.display_string;
filename = params.filename;
in_dir = params.in_dir;
out_dir = params.out_dir;


% Move to input directory
if exist(in_dir,'dir')
    cd(in_dir)
else
    fprintf('Unable to locate input directory. Ending program.\n');
    return
end

% Print the string
fprintf(sprintf('%s\n', display_string))

%% Write to .txt document

%create output directory if it does not exist
if ~exist(out_dir,'dir')
    mkdir(out_dir);
end

cd(out_dir)
    

% Check if filename contains file extension
if ~endsWith(filename,'.txt')
    filename = [filename '.txt'];
end

% Write to text file
fileID = fopen(filename,'w');
fprintf(fileID,'%s',display_string);
fclose(fileID);

end