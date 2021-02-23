function hello_world(display_string, filename, varargin)
%% hello-world - Write text to a blank file
% Function that allows the user to input a string of text, which is then 
% printed and displayed to a text file. 

% Syntax: hello_world(display_string, filename, [in_dir, out_dir])

% Inputs:
%   display_string: string of characters to be displayed
%   filename: will save pdf as 'filename'.txt
%   in_dir (optional): move to desired path (Default: current path)
%   out_dir (optional): path where file will be saved (Default: '\output')

% Outputs:
%   'filename'.txt will be saved at 'in_dir' \ 'out_dir'

% Example:
%   hello_world('Hello, World!','hello_world','/direcory/folder/','output_folder')

% Author: Dylan Lawless
% Date: 18-Feb-2021
% Version: 1.0
% Changelog:
%   18-Feb-2021 - initial creation

%% ---------------- BEGIN CODE ----------------

% Define inputs
if nargin == 2
    in_dir = pwd;
    out_dir = 'output';
elseif nargin == 3
    in_dir = char(varargin(1));
    out_dir = 'output';
elseif nargin == 4
    in_dir = char(varargin(1));
    out_dir = char(varargin(2));
end

% Move to input directory
cd(in_dir)

% Make sure input to display is a string
if ~isstring(display_string)
    display_string = char(display_string);
end

% Print the string
fprintf(sprintf('%s\n', display_string))

%% Write to .txt document

%create output directory
mkdir(in_dir,out_dir);

% Check if filename contains file extension
if ~endsWith(filename,'.txt')
    filename = [filename '.txt'];
end

% Write to text file
fileID = fopen([out_dir '\' filename],'w');
fprintf(fileID,'%s',display_string);
fclose(fileID);

% Exit if we're compiled
if isdeployed
	exit(0)
end

end