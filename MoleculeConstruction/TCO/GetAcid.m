function TCO = GetAcid(GUI_Inputs)
%% GetAmideI

% ------- Version log -----------------------------------------------------
% 
% Ver. 1.4  140922  Add input parser; Integrate the rotation/
%                   translation part from CTCO_1.m back to GetAcid.m 
%                   Delete handles as input
% 
% Ver. 1.3  140723  Add D atom into structure
% 
% Ver. 1.2  140717  Add local mode freq and anharm GUI read in 
% 
% Ver. 1.1  140619  Archive PDB file readin section ans substitude it with
%                   dimer construction function.
% 
% Ver. 1.0  140618  Modify from GetAmideI.m 
% 
% ------------------------------------------------------------------------
% Copyright Jia-Jung Ho, 2014

%% Debug input part
% clear all
% handles = 'Debug';

%% Inputs parser
GUI_Inputs_C      = fieldnames(GUI_Inputs);
GUI_Inputs_C(:,2) = struct2cell(GUI_Inputs);
GUI_Inputs_C      = GUI_Inputs_C';

INPUT = inputParser;
INPUT.KeepUnmatched = 1;

% Default values
defaultPhi_D1          = 0;
defaultPsi_D1          = 0;
defaultTheta_D1        = 0;
defaultPhi_D2          = 0;
defaultPsi_D2          = 0;
defaultTheta_D2        = 0;
defaultDisplacement    = [0,0,5];
defaultNLFreq          = 1716;
defaultAnharm          = 20;
defaultLFreq           = 1604;
defaultL_Index         = 'None';
defaultDiagDisorder    = 0;
defaultOffDiagDisorder = 0;

% add Optional inputs / Parameters
addOptional(INPUT,'Phi_D1'         ,defaultPhi_D1         );
addOptional(INPUT,'Psi_D1'         ,defaultPsi_D1         );
addOptional(INPUT,'Theta_D1'       ,defaultTheta_D1       );
addOptional(INPUT,'Phi_D2'         ,defaultPhi_D2         );
addOptional(INPUT,'Psi_D2'         ,defaultPsi_D2         );
addOptional(INPUT,'Theta_D2'       ,defaultTheta_D2       );
addOptional(INPUT,'Displacement'   ,defaultDisplacement   );
addOptional(INPUT,'NLFreq'         ,defaultNLFreq         );
addOptional(INPUT,'Anharm'         ,defaultAnharm         );
addOptional(INPUT,'LFreq'          ,defaultLFreq          );
addOptional(INPUT,'L_Index'        ,defaultL_Index        );
addOptional(INPUT,'DiagDisorder'   ,defaultDiagDisorder   );
addOptional(INPUT,'OffDiagDisorder',defaultOffDiagDisorder);

parse(INPUT,GUI_Inputs_C{:});

% Re-assign variable names
Phi_D1          = INPUT.Results.Phi_D1;
Psi_D1          = INPUT.Results.Psi_D1;
Theta_D1        = INPUT.Results.Theta_D1;
Phi_D2          = INPUT.Results.Phi_D2;
Psi_D2          = INPUT.Results.Psi_D2;
Theta_D2        = INPUT.Results.Theta_D2;
Displacement    = INPUT.Results.Displacement;
NLFreq          = INPUT.Results.NLFreq;
Anharm          = INPUT.Results.Anharm;
LFreq           = INPUT.Results.LFreq;
L_Index         = INPUT.Results.L_Index;
DiagDisorder    = INPUT.Results.DiagDisorder   ;
OffDiagDisorder = INPUT.Results.OffDiagDisorder;

%% Settings

Num_Modes = 2;

% Monomer XYZ, C, =O, -O, D
XYZ_1 = [0.000,   0.000,   0.000;
         0.000,   0.000,   1.204;
         0.000,   1.142,  -0.730;
         0.000,   1.6380, -0.2197];
         %0.000,   1.905,   0.055];

AtomName = {'C','O','O','H'};             
             
% Rotate the first chromophore
% Orientation = Orientation/180*pi; % turn to radius unit
Phi_R1   = Phi_D1/180*pi;
Psi_R1   = Psi_D1/180*pi;
Theta_R1 = Theta_D1/180*pi;

Rot_Mat1 = R1_ZYZ_0(Phi_R1,Psi_R1,Theta_R1);
XYZ_1_Rot = (Rot_Mat1*XYZ_1')';

%% Re-orient the second Acid 
% XYZ_coor = CTCO_1(handles,XYZ_1);

XYZ_2 = XYZ_1;

% Orientation = Orientation/180*pi; % turn to radius unit
Phi_R2   = Phi_D2/180*pi;
Psi_R2   = Psi_D2/180*pi;
Theta_R2 = Theta_D2/180*pi;

Rot_Mat2 = R1_ZYZ_0(Phi_R2,Psi_R2,Theta_R2);
XYZ_2_Rot = (Rot_Mat2*XYZ_2')';
XYZ_2_Rot_Trans = bsxfun(@plus,XYZ_2_Rot,Displacement);

% combine into dimer
SZ = size(XYZ_1);
XYZ_coor = zeros(2,SZ(1),SZ(2));
XYZ_coor(1,:,:) = XYZ_1_Rot;
XYZ_coor(2,:,:) = XYZ_2_Rot_Trans;

XYZ = [ squeeze(XYZ_coor(1,:,:)) ;
        squeeze(XYZ_coor(2,:,:)) ];

AtomName = [AtomName,AtomName]';    
    
%% Define Acid modes coordinate system
Vec_COD      = XYZ_coor(:,2,:)-XYZ_coor(:,1,:);
Vec_COD      = squeeze(Vec_COD);
Vec_COD_Norm = sqrt(sum(abs(Vec_COD).^2,2));
Vec_COD      = bsxfun(@rdivide,Vec_COD,Vec_COD_Norm); % normaliz COD vectors

Vec_COS      = XYZ_coor(:,3,:)-XYZ_coor(:,1,:);
Vec_COS      = squeeze(Vec_COS);
Vec_COS_Norm = sqrt(sum(abs(Vec_COS).^2,2));
Vec_COS      = bsxfun(@rdivide,Vec_COS,Vec_COS_Norm); % normaliz COS vectors

% AmideICenter = squeeze(XYZ_Atom_Rot(:,1,:)) + Vec_COD.*0.665 + Vec_COS.*0.256; % center of amide I mode, ref from Jenny's mathematica code
AcidCenter = squeeze(XYZ_coor(:,1,:));

% Define Lab frame coordinate of each mode
Z_Sim = Vec_COD;
X_Sim = cross(Vec_COS,Z_Sim,2);
X_Sim = bsxfun(@rdivide,X_Sim,sqrt(sum(abs(X_Sim).^2,2))); % normalize
Y_Sim = cross(Z_Sim,X_Sim,2);

XYZ_Sim = [X_Sim(:); Y_Sim(:); Z_Sim(:)]';
XYZ_Sim = reshape(XYZ_Sim,Num_Modes,3,[]); 

%% Calculate the transition dipoles (mu) and Raman tensors (alpha) in the Lab frame
% mu and alpha in G09 simulation frame 
% mu_Mol    = [-5.43155E+00,  1.653500E+01, -3.17990E-05];
% alpha_Mol = [0.395189E-01,  0.239907E+00,  0.000000E+00;
%              0.239907E+00, -0.607441E+00,  0.138181E-05;
%              0.000000E+00,  0.138181E-05,  0.731944E-01 ];

% mu and alpha in [1,0,0] [0,1,0] [0,0,1] frame
% mu_Mol    = [0.0000, -1.8499,  17.3057];
mu_Mol    = [0.0000,  0.0000,  17.4043];
alpha_Mol = [0.0732,  0.0000,   0.0000;
             0.0000,  0.1100,   0.0838;
             0.0000,  0.0838,  -0.6779];
         
mu_Sim    = zeros(Num_Modes,3);
alpha_Sim = zeros(Num_Modes,3,3);

for ii=1:Num_Modes
    
    R_Mol2Sim = squeeze(XYZ_Sim(ii,:,:));
    mu_Sim(ii,:,:)    = R_Mol2Sim * mu_Mol';
    alpha_Sim(ii,:,:) = R_Mol2Sim * alpha_Mol' * R_Mol2Sim';
end    

%% Define Mode frequency and anharmonicity
LocFreq         = ones(Num_Modes,1).*NLFreq;
LocAnharm       = ones(Num_Modes,1).*Anharm;
DiagDisorder    = ones(Num_Modes,1).*DiagDisorder;
OffDiagDisorder = ones(Num_Modes,1).*OffDiagDisorder;

if ~ischar(L_Index)
    LocFreq(L_Index) = LFreq;
end

%% Rotate the whole system 
% take vectorize Alpha
% alpha_Sim = [N x 3 x3 ]
% for a signle mode, the alpha_Sim: 
% [ XX, XY, XZ ]
% [ YX, YY, YZ ]
% [ ZX, ZY, ZZ ]
% Following the kron convention that the following E J L R beta used, the
% alpha vector need to be in this index order
% [XX,XY, XZ, YX, YY, YZ, ZX, ZY, ZZ]'
% eventhough the Raman tensor we encounter in IR resonance SFG is always 
% symmetric, I am being exta caucious here to make the indexing right.
alpha = reshape(permute(alpha_Sim,[1,3,2]),[Num_Modes,9]);

%% Output Structure
TCO = StructureData;
TCO.XYZ             = XYZ;
TCO.AtomName        = AtomName;
TCO.LocCenter       = AcidCenter;
TCO.LocFreq         = LocFreq;
TCO.LocAnharm       = LocAnharm;
TCO.DiagDisorder    = DiagDisorder;
TCO.OffDiagDisorder = OffDiagDisorder;
TCO.LocMu           = mu_Sim;
TCO.LocAlpha        = alpha; % raman tensor vector form [N x 9]
TCO.FilesName       = 'Acid Dimer';
TCO.GUI_Inputs      = GUI_Inputs;

%% Calculate One Exciton Hamiltoian 
H = ExcitonH(TCO,GUI_Inputs);
TCO.OneExH = H.OneExH;
TCO.Beta   = H.Beta;
