% Initialization Script
Current_path = pwd;
addpath(Current_path);

% Add path to SubFunctions
Main_GUIs = genpath([Current_path '/Main_GUI']);
addpath(Main_GUIs);

MoleculeConstruction = genpath([Current_path '/MoleculeConstruction']);
addpath(MoleculeConstruction);

StructureFiles = genpath([Current_path '/StructureFiles']);
addpath(StructureFiles);

SpectalFunctions = genpath([Current_path '/SpecFunc']);
addpath(SpectalFunctions);

ServerVersion = genpath([Current_path '/ServerVersion']);
addpath(ServerVersion);

AnalysisTools = genpath([Current_path '/AnalysisTools']);
addpath(AnalysisTools);

ModeVisualization = genpath([Current_path '/ModeVisualization']);
addpath(ModeVisualization);