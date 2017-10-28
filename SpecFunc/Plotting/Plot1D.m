function hF=Plot1D(hAx,OneD_Data,GUI_Inputs)
%% Plot1D
%  
% Given the Stuctural infomation that generated by GetAmideI.m this
% function can plot the molecule and its' amide I modes.
% 
% ------- Version log -----------------------------------------------------
%
% Ver. 1.2  140922  Substitute GUI read-in with Input parser
% 
% Ver. 1.1  140717  Add Frequency axis GUI read in part
% 
% Ver. 1.0  140605  Start Log.
% 
% ------------------------------------------------------------------------
% Copyright Jia-Jung Ho, 2014

%% Debug
% clear all
% varargin = {'LineShape','KK'};
% 
% Structure_Data = GetAcid;
% OneDSFG = OneDSFG_Main(Structure_Data);

%% Inputs parser
GUI_Inputs_C      = fieldnames(GUI_Inputs);
GUI_Inputs_C(:,2) = struct2cell(GUI_Inputs);
GUI_Inputs_C      = GUI_Inputs_C';

INPUT = inputParser;
INPUT.KeepUnmatched = 1;

% Default values
defaultSaveFig      = 0;
defaultSavePath     = '~/Desktop/';
defaultPlotStick    = 1;
defaultPlotNorm     = 0;
defaultLineWidth    = 5;
defaultSignal_Type  = 'Heterodyne';
defaultLineShape    = 'L';
defaultPlotCursor   = 0;
defaultIntegralArea = 0;
defaultFreqRange    = 1650:1750;

% add Optional inputs / Parameters
addOptional(INPUT,'SaveFig'     ,defaultSaveFig);
addOptional(INPUT,'SavePath'    ,defaultSavePath);
addOptional(INPUT,'PlotStick'   ,defaultPlotStick);
addOptional(INPUT,'PlotNorm'    ,defaultPlotNorm);
addOptional(INPUT,'LineWidth'   ,defaultLineWidth);
addOptional(INPUT,'Signal_Type' ,defaultSignal_Type);
addOptional(INPUT,'LineShape'   ,defaultLineShape);
addOptional(INPUT,'PlotCursor'  ,defaultPlotCursor);
addOptional(INPUT,'IntegralArea',defaultIntegralArea);
addOptional(INPUT,'FreqRange'   ,defaultFreqRange);

parse(INPUT,GUI_Inputs_C{:});

% Re-assign variable names
SaveFig      = INPUT.Results.SaveFig;
SavePath     = INPUT.Results.SavePath;
PlotStick    = INPUT.Results.PlotStick;
PlotNorm     = INPUT.Results.PlotNorm;
LineWidth    = INPUT.Results.LineWidth;
Signal_Type  = INPUT.Results.Signal_Type;
LineShape    = INPUT.Results.LineShape;
PlotCursor   = INPUT.Results.PlotCursor;
IntegralArea = INPUT.Results.IntegralArea;
FreqRange    = INPUT.Results.FreqRange;

%% Determine spectrum type  
switch OneD_Data.SpecType
    case 'FTIR'
        Signal_Type = 'Heterodyne'; % self heterodyne!!
    case 'SFG'
end

Response1D  = OneD_Data.Response1D;
Res_Freq    = OneD_Data.freq_OneD;

%% Make figure
[ConvL,~] = Conv_LineShape(1,LineShape,FreqRange,LineWidth);
CVL_Total = conv(Response1D,ConvL,'same');

switch Signal_Type
    case 'Heterodyne' % heterodyne
        PlotY = imag(CVL_Total);
        Stick = Response1D;
        Signal_Type_Title = 'Hetero';
    case 'Homodyne' % homodyne
        PlotY = abs(CVL_Total).^2;
        Stick = Response1D.^2;
        Signal_Type_Title = 'Homo';
end

if PlotNorm
    PlotY = PlotY./max(abs(PlotY(:)));
    Stick = Stick./max(abs(Stick(:)));
else
    PlotY = PlotY.*(max(abs(Stick(:)))/max(abs(PlotY(:))));
end

hold(hAx,'on')
    line(hAx,[FreqRange(1);FreqRange(end)],[0;0],'Color',[1,0,0]) % plot baseline
    plot(hAx,FreqRange,PlotY,'-','LineWidth',2)
    if eq(PlotStick,1)
        line(hAx,[Res_Freq;Res_Freq],[zeros(1,length(FreqRange));Stick']);
    end
hold(hAx,'off')

%% figure setting 
hAx.FontSize = 14;
hAx.YLim = [-max(abs(PlotY(:))),max(abs(PlotY(:)))]*1.1;
hAx.XLim = [FreqRange(1),FreqRange(end)];
hAx.XLabel.String = 'cm^{-1}';
hAx.YLabel.String = 'Intensity';
hAx.XGrid = 'on';
hAx.YGrid = 'on';
hAx.XMinorGrid = 'on';

FilesName       = OneD_Data.FilesName;
FilesName_Reg   = regexprep(FilesName,'\_','\\_');
Coupling        = GUI_Inputs.CouplingType;
Coupling_Reg    = regexprep(Coupling,'\_','\\_');
Title_String{1} = [Signal_Type_Title,'-',OneD_Data.SpecType,' ',FilesName_Reg,', Coupling:',Coupling_Reg]; 

if PlotCursor
    hAx.Units = 'normalized'; % use normalized scale
    hF = hAx.Parent;
    hF.Units = 'normalized'; % use normalized scale
    Title_String{2} = '';
    % Call pointer
    S.fh = hF;
    S.ax = hAx;
    Pointer_N(S) % use normalized scale
end
title(hAx,Title_String,'FontSize',16);

if IntegralArea
    % integrate the curve area
    Area = trapz(FreqRange,abs(PlotY));
    uicontrol(hF,...
              'style','text',...
              'Position',[100,100,100,25],...
              'String',['IA = ' num2str(Area)],...
              'FontSize',14);

    % StickSum = sum(Stick);
    % Title = [Signal_Type_Title, ', IA: ' num2str(Area), ',  Stick sum: ', num2str(StickSum)];
    % title(Title,'FontSize',16);
end

%% Auto Save
if SaveFig
    timeStamp    = datetime('now','TimeZone','local');
    timeSamepStr = datestr(timeStamp,'yymmdd_HH-MM-SS');
    FigName      = [OneD_Data.SpecType,'_',timeSamepStr];
    
    hF = hAx.Parent;
    SaveFigures(hF,SavePath,FigName)
end
