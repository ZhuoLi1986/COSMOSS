function CVL = Conv2D(SpectraGrid,GUI_Inputs)
% 
% This function convolute the input stick spectrum with spelected line
% shape.
% 

% Todo: integrate input parser with "Fig_Inputs"
%       Select which response to be plot
% ------- Version log -----------------------------------------------------
% 
% Ver. 1.1  140723  Modified inputs
% 
% Ver. 1.0  140420  Isolated from "Plot2DSFG_DNA.m"
% 
% ------------------------------------------------------------------------
% Copyright Jia-Jung Ho, 2013

%% Debug
% FreqRange = 1550:1:1650;

%% Inputs parser
GUI_Inputs_C      = fieldnames(GUI_Inputs);
GUI_Inputs_C(:,2) = struct2cell(GUI_Inputs);
GUI_Inputs_C      = GUI_Inputs_C';

INPUT = inputParser;
INPUT.KeepUnmatched = 1;

% Default values
defaultFreqRange   = 1650:1750;
defaultLineShape   = 'L';
expectedLineShape  = {'L','G'};
defauleLineWidth   = 5;
defaultSpecType    = 'Abs';
expectedSpecType   = {'R','NR','Abs'};
defaultPathway     = 'All';
expectedPathway    = {'GB','SE','EA','All'};

addOptional(INPUT,'FreqRange',defaultFreqRange);

addParamValue(INPUT,'LineShape',defaultLineShape,...
                @(x) any(validatestring(x,expectedLineShape)));
            
addOptional(INPUT,'LineWidth',defauleLineWidth);

addParamValue(INPUT,'SpecType',defaultSpecType,...
                @(x) any(validatestring(x,expectedSpecType)));
            
addParamValue(INPUT,'Pathway',defaultPathway,...
                @(x) any(validatestring(x,expectedPathway))); 
            
parse(INPUT,GUI_Inputs_C{:});

% Reassign Variable names
FreqRange   = INPUT.Results.FreqRange;
LineShape   = INPUT.Results.LineShape;
LineWidth   = INPUT.Results.LineWidth;
Pathway     = INPUT.Results.Pathway;
SpecType    = INPUT.Results.SpecType;

%% FFT on selected pathway

switch Pathway
    case 'GB' % Ground state Bleach, R1
        Re_phasing_Res = SpectraGrid.SpecAccuR1 ;
        NR_phasing_Res = SpectraGrid.SpecAccuNR1;
        
    case 'SE' % Stimulated Emission, R2
        Re_phasing_Res = SpectraGrid.SpecAccuR2 ;
        NR_phasing_Res = SpectraGrid.SpecAccuNR2;
        
    case 'EA' % Excited state Absorption, R3
        Re_phasing_Res = -SpectraGrid.SpecAccuR3 ;
        NR_phasing_Res = -SpectraGrid.SpecAccuNR3;
        
    case 'All'
        Re_phasing_Res = SpectraGrid.Rephasing   ;
        NR_phasing_Res = SpectraGrid.NonRephasing;
        
end

Rf  = ifftshift(ifft2(Re_phasing_Res));
NRf = ifftshift(ifft2(NR_phasing_Res));

%% Deal with Gaussian/Loentizan lineshape

NumFreqPoint = numel(FreqRange);

center  = ceil(NumFreqPoint/2);
[p1,p2] = meshgrid(1:NumFreqPoint,1:NumFreqPoint);

% Gaussian / Lorentizan

switch LineShape
    case 'L'
        FF = 1; % Counting for probe beam line width
        lnshp_R =((-1./(-(p2-center)+1i*LineWidth*FF)).*(1./((p1-center)+1i*LineWidth)));
        lnshp_N =((-1./( (p2-center)+1i*LineWidth*FF)).*(1./((p1-center)+1i*LineWidth)));
    
    case 'G'
        
        lnshp_R = ngaussval(sqrt((p1-center).^2+(p2-center).^2),LineWidth);
        lnshp_N = ngaussval(sqrt((p1-center).^2+(p2-center).^2),LineWidth);
end

% Create Vis probe line shape
% -------------------------------------------------------------------------
% c = (3E8).*100./(1E12); % The speed of light (in cm/ps)
% delwn = 15; % This is the FWHM of the Lorentzian function (in cm^-1)
% sigma = c.*delwn./2; % This is the parameter sigma (in ps^-1)
% lortz = (sigma./pi).*(1./((sigma.^2) + ((p1-center).*c).^2)); % This is the Lorentzian function (in ps)
% normlortz = lortz./max(max(lortz)); % This is a normalized Lorentzian function (in arbitrary untis) to check that FWHM calculation is working correctly
% prb1 = normlortz;
% prb1t = ifftshift(ifft(fftshift(prb1),[],2));
% prbcor1 = (real(prb1t)./max(max(real(prb1t))));
% -------------------------------------------------------------------------        

lnshpf_R = ifftshift(ifft2(fftshift(lnshp_R)));
lnshpf_N = ifftshift(ifft2(fftshift(lnshp_N)));

CVL.R  = fft2(fftshift(lnshpf_R.*(Rf)));
CVL.NR = fft2(fftshift(lnshpf_N.*(NRf)));

CVL.sum = CVL.R + CVL.NR;

% Output selected SpecType
switch SpecType
    case 'Abs'
        CVL.selected = CVL.sum;
    case 'R'
        CVL.selected = CVL.R;
    case 'NR'
        CVL.selected = CVL.NR;
end

