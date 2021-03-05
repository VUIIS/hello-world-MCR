function hello_world(varargin)
%% hello-world - Write text to a blank file
% Function to parse inputs for singularity container
% All inputs from command line will be strings. Parsing the inputs allows
% us to convert inputs to the desired format.

% Inputs:
%   display_string: string of characters to be displayed
%   filename: will save pdf as 'filename'.txt
%   in_dir (optional): move to desired path (Default: current path)
%   out_dir (optional): path where file will be saved (Default: '\output')

% Outputs:
%   'filename'.txt will be saved at 'in_dir' / 'out_dir'

% When parsing inputs for a function, inputs must be in the format:
%   function_name('argument1_name','argument1_value')

% Example for this function:
%   hello_world_parse('display_string','Hello, world!','filename','hello_world.txt')

% Author: Dylan Lawless
% Date: 18-Feb-2021
%% Parse inputs
P=inputParser;
addOptional(P,'display_string','Hello, world!');
addOptional(P,'filename','hello_world.txt');

addOptional(P,'in_dir','/input');
addOptional(P,'out_dir','/output');

parse(P,varargin{:});

%% Store inputs to struct
% if any inputs need to be converted to another format, do that here
params = struct( ...
    'display_string', P.Results.display_string, ...
    'filename',P.Results.filename, ...
    'in_dir',P.Results.in_dir, ...
    'out_dir',P.Results.out_dir ...
    );

%% Run the function hello_world
hello_world_run(params)

%% Exit if we are compiled
% This if statement is necessary for compiled matlab functions 
%   to exit after completion.
if isdeployed
	exit(0)
end
