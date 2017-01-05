function hGUIs = GUI_COSMOSS(hCOSMOSS)
% This function will build all GUI elements on pre-build GUI base figure

%% Pre-setting
Version = '1.6.4';

%% Add base layout
MainLayout = uix.VBoxFlex(...
    'Parent',hCOSMOSS,...
    'Spacing',5,...
    'Padding',1);

PanelLayout = uix.HBoxFlex(...
    'Parent',MainLayout,...
    'Spacing',5,...
    'Padding',1);

LBox = uix.VBoxFlex(...
    'Parent',PanelLayout,...
    'Spacing',5,...
    'Padding',1);

    % Creat panels on LBox
    StructurePanel = uix.BoxPanel( ...
        'Parent',LBox,...
        'Title','Select a structure model:','FontSize',12);

    SamplePanel = uix.BoxPanel( ...
        'Parent',LBox,...
        'Title','Sample symmetry','FontSize',12);
    
    LaserPanel = uix.BoxPanel( ...
        'Parent',LBox,...
        'Title','LASER setting','FontSize',12);
    
    uicontrol('Parent',LBox,...
        'Style','text',...
        'String',['COSMOSS Version: v', Version],...
        'HorizontalAlignment','center',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
RBox = uix.VBoxFlex(...
    'Parent',PanelLayout,...
    'Spacing',5,...
    'Padding',1);

    % Creat panels on RBox
    DisorderPanel = uix.BoxPanel( ...
        'Parent',RBox,...
        'Title','Diagonal Disorder','FontSize',12);

    ModelPanel = uix.BoxPanel( ...
        'Parent',RBox,...
        'Title','Coupling/Signal','FontSize',12);

    FigurePanel = uix.BoxPanel( ...
        'Parent',RBox,...
        'Title','Figure Setting','FontSize',12);

ButtonBox = uix.HBoxFlex( ...
    'Parent', MainLayout,...
    'Padding', 2);

% set sizes 
set(MainLayout,'Heights',[-1,35])
set(PanelLayout,'Widths',[-1,-1])
set(LBox,'Heights',[-1,80,150,20])
set(RBox,'Heights',[140,140,-1])

%% Create buttons
uicontrol( 'Parent', ButtonBox, ...
    'Style', 'PushButton', ...
    'String', 'FTIR',...
    'Callback', @(hObject,eventdata)COSMOSS('FTIR_Callback',hObject,eventdata,guidata(hObject)));
uicontrol( 'Parent', ButtonBox, ...
    'Style', 'PushButton', ...
    'String', 'SFG',...
    'Callback', @(hObject,eventdata)COSMOSS('SFG_Callback',hObject,eventdata,guidata(hObject)));
uicontrol( 'Parent', ButtonBox, ...
    'Style', 'PushButton', ...
    'String', '2DIR',...
    'Callback', @(hObject,eventdata)COSMOSS('TwoDIR_Callback',hObject,eventdata,guidata(hObject)));
uicontrol( 'Parent', ButtonBox, ...
    'Style', 'PushButton', ...
    'String', '2DSFG',...
    'Callback', @(hObject,eventdata)COSMOSS('TwoDSFG_Callback',hObject,eventdata,guidata(hObject)));
uicontrol( 'Parent', ButtonBox, ...
    'enable','off',...
    'Style', 'PushButton', ...
    'String', 'Diff Spec'); 
uicontrol( 'Parent', ButtonBox, ...
    'Style', 'PushButton', ...
    'String', 'Export Handle', ...
    'Callback', @(hObject,eventdata)COSMOSS('Export_Handle_Callback',hObject,eventdata,guidata(hObject)));

%% StructurePanel
% Ask for avalible models
[~,StructureModelList,~] = StructureModel(0);

StrucPanelLayout = uix.VBox( 'Parent', StructurePanel, ...
   'Padding', 3, 'Spacing', 3 );
StructListBox = uicontrol( 'Style', 'list', ...
   'BackgroundColor', 'w', ...
   'Parent', StrucPanelLayout, ...
   'String', StructureModelList(:), ...
   'fontunits', 'point', 'fontsize', 14,...
   'Value', 1,...
   'Tag','StructListBox');
SelectButton = uicontrol( 'Style', 'PushButton', ...
   'Parent', StrucPanelLayout, ...
   'String', 'Select Structure Model', ...
   'Callback', @(hObject,eventdata)COSMOSS('onListSelection',hObject,eventdata,guidata(hObject)));

set( StrucPanelLayout, 'Heights', [-1 28] ); % Make the list fill the space

%% Labeling Panel => change to BeamGeometryPanel later

% LabelPanelLayout = uix.HBoxFlex('Parent',BeamGeometryPanel,...
%     'Padding', 5, 'Spacing', 5);
% 
%     Freq_TextBox = uix.VBox('Parent',LabelPanelLayout);
%         uicontrol('Parent',Freq_TextBox,...
%         'Visible','off',...
%         'Style','text',...
%         'String','Non-Labeled Frequency(cm-1):',...
%         'HorizontalAlignment','right',...
%         'units', 'normalized',...
%         'fontunits', 'point', 'fontsize', 14);
%     
%         uicontrol('Parent',Freq_TextBox,...
%         'Visible','off',...
%         'Style','text',...
%         'String','Labeled Frequency(cm-1):',...
%         'HorizontalAlignment','right',...
%         'units', 'normalized',...
%         'fontunits', 'point', 'fontsize', 14);
%     
%         uicontrol('Parent',Freq_TextBox,...
%         'Visible','off',...
%         'Style','text',...
%         'String','Anharmonicty (cm-1):',...
%         'HorizontalAlignment','right',...
%         'units', 'normalized',...
%         'fontunits', 'point', 'fontsize', 14);
%     
%         uicontrol('Parent',Freq_TextBox,...
%         'Visible','off',...
%         'Style','text',...
%         'String','Index of labeled residues:',...
%         'HorizontalAlignment','right',...
%         'units', 'normalized',...
%         'fontunits', 'point', 'fontsize', 14);
%     
%     
% 
%     Freq_EditBox = uix.VBox('Parent',LabelPanelLayout);
%         uicontrol('Parent',Freq_EditBox,...
%         'Visible','off',...
%         'Style','edit',...
%         'String','1700',...
%         'Tag','NLFreq',...
%         'units', 'normalized',...
%         'fontunits', 'point', 'fontsize', 14);
%     
%         uicontrol('Parent',Freq_EditBox,...
%         'Visible','off',...
%         'Style','edit',...
%         'String','1680',...
%         'Tag','LFreq',...
%         'units', 'normalized',...
%         'fontunits', 'point', 'fontsize', 14);
%     
%         uicontrol('Parent',Freq_EditBox,...
%         'Visible','off',...
%         'Style','edit',...
%         'String','20',...
%         'Tag','Anharm',...
%         'units', 'normalized',...
%         'fontunits', 'point', 'fontsize', 14);   
%         
%         uicontrol('Parent',Freq_EditBox,...
%         'Visible','off',...
%         'Style','edit',...
%         'String','None',...
%         'Tag','LIndex',...
%         'units', 'normalized',...
%         'fontunits', 'point', 'fontsize', 14);
% 
% set(LabelPanelLayout,'Widths',[220,-1])

%% Sample ensemble average Panel
SamplePanelLayout = uix.HBox('Parent',SamplePanel,...
    'Padding', 1, 'Spacing', 1);

    Sample_TextBox = uix.VBox('Parent',SamplePanelLayout);
        uicontrol('Parent',Sample_TextBox,...
        'Style','text',...
        'String','Rotational Avg:',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

        uicontrol('Parent',Sample_TextBox,...
        'Style','text',...
        'String','Mirror Plane:',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

    Sample_OptionBox = uix.VBox('Parent',SamplePanelLayout);
        uicontrol('Parent',Sample_OptionBox,...
        'Tag','Avg_Rot',...
        'Style','popupmenu',...
        'String',{'Phi','Psi','Phi,Psi','Isotropic','C1'},...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

        uicontrol('Parent',Sample_OptionBox,...
        'Tag','Avg_Mirror',...
        'Style','popupmenu',...
        'String',{'No','Sigma_v'},...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

set(SamplePanelLayout,'Widths',[130,-1])

%% Laser Setting Panel
LaserTabGP = uitabgroup('Parent',LaserPanel,'Tag','LaserSetting');

OneDTab = uitab(LaserTabGP,'Title','1D','Tag','Tab_1D');

OneDTabLayout = uix.HBox('Parent',OneDTab,...
    'Padding', 1, 'Spacing', 1);

    VtextBox1D = uix.VBox('Parent',OneDTabLayout,...
    'Padding', 1, 'Spacing', 1);
        uicontrol('Parent',VtextBox1D,...
        'Style','text',...
        'String','Unit Degrees',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',VtextBox1D,...
        'Style','text',...
        'String','Angles',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

        uicontrol('Parent',VtextBox1D,...
        'Style','text',...
        'String','Polarization',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
    
    IR_BeamBox1D = uix.VBox('Parent',OneDTabLayout,...
    'Padding', 1, 'Spacing', 1);
        uicontrol('Parent',IR_BeamBox1D,...
        'Style','text',...
        'String','IR',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',IR_BeamBox1D,...
        'Style','edit',...
        'String','90',...
        'Tag','A_IR',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',IR_BeamBox1D,...
        'Style','edit',...
        'String','0',...
        'Tag','P_IR',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

    Vis_BeamBox1D = uix.VBox('Parent',OneDTabLayout,...
    'Padding', 1, 'Spacing', 1);
        uicontrol('Parent',Vis_BeamBox1D,...
        'Style','text',...
        'String','Vis',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',Vis_BeamBox1D,...
        'Style','edit',...
        'String','90',...
        'Tag','A_Vis1D',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',Vis_BeamBox1D,...
        'Style','edit',...
        'String','0',...
        'Tag','P_Vis1D',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
    Sig_BeamBox1D = uix.VBox('Parent',OneDTabLayout,...
    'Padding', 1, 'Spacing', 1);
        uicontrol('Parent',Sig_BeamBox1D,...
        'Style','text',...
        'String','Sig',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',Sig_BeamBox1D,...
        'Style','edit',...
        'String','90',...
        'Tag','A_Sig1D',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',Sig_BeamBox1D,...
        'Style','edit',...
        'String','0',...
        'Tag','P_Sig1D',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
set(OneDTabLayout,'Widths',[-2,-1,-1,-1])
    
TwoDTab = uitab(LaserTabGP,'Title','2D','Tag','Tab_2D');
TwoDTabFontSize = 12;
TwoDTabLayout = uix.HBox('Parent',TwoDTab,...
    'Padding', 1, 'Spacing', 1);

    VtextBox2D = uix.VBox('Parent',TwoDTabLayout,...
    'Padding', 1, 'Spacing', 1);
        uicontrol('Parent',VtextBox2D,...
        'Style','text',...
        'String','Degrees',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', TwoDTabFontSize);
    
        uicontrol('Parent',VtextBox2D,...
        'Style','text',...
        'String','Angles',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', TwoDTabFontSize);

        uicontrol('Parent',VtextBox2D,...
        'Style','text',...
        'String','Polarization',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', TwoDTabFontSize);
    
    
    Pump1_BeamBox2D = uix.VBox('Parent',TwoDTabLayout,...
    'Padding', 1, 'Spacing', 1);
        uicontrol('Parent',Pump1_BeamBox2D,...
        'Style','text',...
        'String','Pu1',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', TwoDTabFontSize);
    
        uicontrol('Parent',Pump1_BeamBox2D,...
        'Style','edit',...
        'String','90',...
        'Tag','A_Pump1',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', TwoDTabFontSize);
    
        uicontrol('Parent',Pump1_BeamBox2D,...
        'Style','edit',...
        'String','0',...
        'Tag','P_Pump1',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', TwoDTabFontSize);
    
    Pump2_BeamBox2D = uix.VBox('Parent',TwoDTabLayout,...
    'Padding', 1, 'Spacing', 1);
        uicontrol('Parent',Pump2_BeamBox2D,...
        'Style','text',...
        'String','Pu2',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', TwoDTabFontSize);
    
        uicontrol('Parent',Pump2_BeamBox2D,...
        'Style','edit',...
        'String','90',...
        'Tag','A_Pump2',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', TwoDTabFontSize);
    
        uicontrol('Parent',Pump2_BeamBox2D,...
        'Style','edit',...
        'String','0',...
        'Tag','P_Pump2',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', TwoDTabFontSize);
    
    Probe_BeamBox2D = uix.VBox('Parent',TwoDTabLayout,...
    'Padding', 1, 'Spacing', 1);
        uicontrol('Parent',Probe_BeamBox2D,...
        'Style','text',...
        'String','Pr',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', TwoDTabFontSize);
    
        uicontrol('Parent',Probe_BeamBox2D,...
        'Style','edit',...
        'String','90',...
        'Tag','A_Probe',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', TwoDTabFontSize);
    
        uicontrol('Parent',Probe_BeamBox2D,...
        'Style','edit',...
        'String','0',...
        'Tag','P_Probe',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', TwoDTabFontSize);

    Vis_BeamBox2D = uix.VBox('Parent',TwoDTabLayout,...
    'Padding', 1, 'Spacing', 1);
        uicontrol('Parent',Vis_BeamBox2D,...
        'Style','text',...
        'String','Vis',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', TwoDTabFontSize);
    
        uicontrol('Parent',Vis_BeamBox2D,...
        'Style','edit',...
        'String','90',...
        'Tag','A_Vis2D',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', TwoDTabFontSize);
    
        uicontrol('Parent',Vis_BeamBox2D,...
        'Style','edit',...
        'String','0',...
        'Tag','P_Vis2D',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', TwoDTabFontSize);
    
    Sig_BeamBox2D = uix.VBox('Parent',TwoDTabLayout,...
    'Padding', 1, 'Spacing', 1);
        uicontrol('Parent',Sig_BeamBox2D,...
        'Style','text',...
        'String','Sig',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', TwoDTabFontSize);
    
        uicontrol('Parent',Sig_BeamBox2D,...
        'Style','edit',...
        'String','90',...
        'Tag','A_Sig2D',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', TwoDTabFontSize);
    
        uicontrol('Parent',Sig_BeamBox2D,...
        'Style','edit',...
        'String','0',...
        'Tag','P_Sig2D',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', TwoDTabFontSize);
    
set(TwoDTabLayout,'Widths',[-2,-1,-1,-1,-1,-1])

%% Diagonal Disorder Panel

DDPanelLayout = uix.VBox('Parent',DisorderPanel,...
    'Padding', 1, 'Spacing', 1);

    uicontrol('Parent',DDPanelLayout,...
            'Style','checkbox' ,...
            'String','Diag. Disorder',...
            'Tag','Sampling',...
            'Value',0,...
            'units', 'normalized',...
            'fontunits', 'point', 'fontsize', 14);
    
    ToggleHBox = uix.HBox('Parent',DDPanelLayout,...
                      'Padding', 1, 'Spacing', 1);
        uicontrol('Parent',ToggleHBox,...
                'Style','checkbox' ,...
                'String','Dynamic fig. update',...
                'Tag','DynamicUpdate',...
                'Value',0,...
                'units', 'normalized',...
                'fontunits', 'point', 'fontsize', 14);
        uicontrol('Parent',ToggleHBox,...
                'Style','checkbox' ,...
                'String','Continue?',...
                'Tag','UpdateStatus',...
                'Value',1,...
                'units', 'normalized',...
                'fontunits', 'point', 'fontsize', 14);
    set(ToggleHBox,'Widths',[160,-1])
    
    DDHBox = uix.HBox('Parent',DDPanelLayout,...
                      'Padding', 1, 'Spacing', 1);
        DDVTextBox = uix.VBox('Parent',DDHBox,...
        'Padding', 1, 'Spacing', 1);
            uicontrol('Parent',DDVTextBox,...
                        'Style','text',...
                        'String','Sample Number',...
                        'HorizontalAlignment','left',...
                        'units', 'normalized',...
                        'fontunits', 'point', 'fontsize', 14);
            uicontrol('Parent',DDVTextBox,...
                        'Style','text',...
                        'String','Fluctuation Correlation (%)',...
                        'HorizontalAlignment','left',...
                        'units', 'normalized',...
                        'fontunits', 'point', 'fontsize', 14);
        DDVEditBox = uix.VBox('Parent',DDHBox,...
        'Padding', 3, 'Spacing', 3);
            uicontrol('Parent',DDVEditBox,...
                        'Style','edit',...
                        'String','1',...
                        'HorizontalAlignment','right',...
                        'Tag','Sample_Num',...
                        'units', 'normalized',...
                        'fontunits', 'point', 'fontsize', 14);
            uicontrol('Parent',DDVEditBox,...
                        'Style','edit',...
                        'String','0',...
                        'HorizontalAlignment','right',...
                        'Tag','P_FlucCorr',...
                        'units', 'normalized',...
                        'fontunits', 'point', 'fontsize', 14);
    set(DDHBox,'Widths',[-3,-1])
    
    DDFreqHBox = uix.HBox('Parent',DDPanelLayout,...
                          'Padding', 1, 'Spacing', 1);    
        uicontrol('Parent',DDFreqHBox,...
                    'Style','text',...
                    'String','FWHM (cm-1)',...
                    'HorizontalAlignment','left',...
                    'units', 'normalized',...
                    'fontunits', 'point', 'fontsize', 14);
        uicontrol('Parent',DDFreqHBox,...
                    'Style','edit',...
                    'String','10',...
                    'HorizontalAlignment','right',...
                    'Tag','FWHM',...
                    'units', 'normalized',...
                    'fontunits', 'point', 'fontsize', 14);
    set(DDFreqHBox,'Widths',[100,-1])
    
set(DDPanelLayout,'Heights',[-1,-1,-2,-1])

%% Coupling / Signal panel
[~,CouplingList] = Coupling('List','None');

CSPanelLayout = uix.HBox('Parent',ModelPanel,...
    'Padding', 3, 'Spacing', 3);

    CSTextBox = uix.VBox('Parent',CSPanelLayout,...
    'Padding', 3, 'Spacing', 3);
        uicontrol('Parent',CSTextBox,...
        'Style','text',...
        'String','Coupling Model:',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',CSTextBox,...
        'Style','text',...
        'String','Beta NN (cm-1):',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
            
        uicontrol('Parent',CSTextBox,...
        'Style','text',...
        'String','Signal Type:',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',CSTextBox,...
        'Style','text',...
        'String','Spectrum Type:',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',CSTextBox,...
        'Style','text',...
        'String','Pathway:',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
    
    CSEditBox = uix.VBox('Parent',CSPanelLayout,...
    'Padding', 3, 'Spacing', 3);
        uicontrol('Parent',CSEditBox,...
        'Style','popupmenu',...
        'String',CouplingList,...
        'Value',1,...
        'HorizontalAlignment','right',...
        'Tag','CouplingModelIndex',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',CSEditBox,...
        'Style','edit',...
        'String','5',...
        'HorizontalAlignment','right',...
        'Tag','Beta_NN',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',CSEditBox,...
        'Style','popupmenu',...
        'String',{'Heterodyne','Homodyne'},...
        'HorizontalAlignment','right',...
        'Tag','Sig_Type',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',CSEditBox,...
        'Style','popupmenu',...
        'String',{'Absorptive','Rephasing','Non-rephasing'},...
        'HorizontalAlignment','right',...
        'Tag','SpecType',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',CSEditBox,...
        'Style','popupmenu',...
        'String',{'All','GB','SE','EA'},...
        'HorizontalAlignment','right',...
        'Tag','Pathway',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        


set(CSPanelLayout,'Widths',[-1,-1])

%% Figure panel

FPanelLayout = uix.VBox('Parent',FigurePanel,...
    'Padding', 3, 'Spacing', 3);

    CheckBoxLayout = uix.VBox('Parent',FPanelLayout,...
                                  'Padding', 1, 'Spacing', 1);
        CheckBoxRaw1 = uix.HBox('Parent',CheckBoxLayout,...
                                'Padding', 3, 'Spacing', 3);
            uicontrol('Parent',CheckBoxRaw1,...
                      'Style','checkbox' ,...
                      'String','Stick',...
                      'Tag','PlotStick',...
                      'Value',1,...
                      'units', 'normalized',...
                      'fontunits', 'point', 'fontsize', 14);
            uicontrol('Parent',CheckBoxRaw1,...
                      'Style','checkbox' ,...
                      'String','Normalize',...
                      'Tag','PlotNorm',...
                      'Value',0,...
                      'units', 'normalized',...
                      'fontunits', 'point', 'fontsize', 14);
        set(CheckBoxRaw1,'Widths',[-1,160])
                  
        CheckBoxRaw2 = uix.HBox('Parent',CheckBoxLayout,...
                                'Padding', 3, 'Spacing', 3);
            uicontrol('Parent',CheckBoxRaw2,...
                      'Style','checkbox' ,...
                      'String','Cursor',...
                      'Tag','PlotCursor',...
                      'Value',0,...
                      'units', 'normalized',...
                      'fontunits', 'point', 'fontsize', 14);
            uicontrol('Parent',CheckBoxRaw2,...
                      'Style','checkbox' ,...
                      'String','Integral Area for SFG',...
                      'Tag','IntegralArea',...
                      'Value',0,...
                      'units', 'normalized',...
                      'fontunits', 'point', 'fontsize', 14);
          set(CheckBoxRaw2,'Widths',[-1,160])
                  
        CheckBoxRaw3 = uix.HBox('Parent',CheckBoxLayout,...
                                'Padding', 3, 'Spacing', 3);              
            uicontrol('Parent',CheckBoxRaw3,...
                      'enable','off',...
                      'Style','checkbox' ,...
                      'String','Diagonal cut of 2D spectrum',...
                      'Tag','DiagCut',...
                      'Value',0,...
                      'units', 'normalized',...
                      'fontunits', 'point', 'fontsize', 14);

    FHBox = uix.HBox('Parent',FPanelLayout,...
    'Padding', 3, 'Spacing', 3);

        FTextBox = uix.VBox('Parent',FHBox,...
        'Padding', 3, 'Spacing', 3);
            uicontrol('Parent',FTextBox,...
            'Style','text',...
            'String','Freq. Min (cm-1):',...
            'HorizontalAlignment','right',...
            'units', 'normalized',...
            'fontunits', 'point', 'fontsize', 14);

            uicontrol('Parent',FTextBox,...
            'Style','text',...
            'String','Freq. Max (cm-1):',...
            'HorizontalAlignment','right',...
            'units', 'normalized',...
            'fontunits', 'point', 'fontsize', 14);

            uicontrol('Parent',FTextBox,...
            'Style','text',...
            'String','Line Shape:',...
            'HorizontalAlignment','right',...
            'units', 'normalized',...
            'fontunits', 'point', 'fontsize', 14);

            uicontrol('Parent',FTextBox,...
            'Style','text',...
            'String','Line Width (cm-1):',...
            'HorizontalAlignment','right',...
            'units', 'normalized',...
            'fontunits', 'point', 'fontsize', 14);

            uicontrol('Parent',FTextBox,...
            'Style','text',...
            'String','# of Contour: ',...
            'HorizontalAlignment','right',...
            'units', 'normalized',...
            'fontunits', 'point', 'fontsize', 14);

            uicontrol('Parent',FTextBox,...
            'Style','text',...
            'String','Colormap: ',...
            'HorizontalAlignment','right',...
            'units', 'normalized',...
            'fontunits', 'point', 'fontsize', 14);

        FEditBox = uix.VBox('Parent',FHBox,...
        'Padding', 3, 'Spacing', 3);
            uicontrol('Parent',FEditBox,...
            'Style','edit',...
            'String','1650',...
            'HorizontalAlignment','right',...
            'Tag','X_Min',...
            'units', 'normalized',...
            'fontunits', 'point', 'fontsize', 14);

            uicontrol('Parent',FEditBox,...
            'Style','edit',...
            'String','1750',...
            'HorizontalAlignment','right',...
            'Tag','X_Max',...
            'units', 'normalized',...
            'fontunits', 'point', 'fontsize', 14);

            uicontrol('Parent',FEditBox,...
            'Style','popupmenu',...
            'String',{'Gaussian','Lorentizan','K-K','None'},...
            'Value',2,...
            'HorizontalAlignment','right',...
            'Tag','LineShape',...
            'units', 'normalized',...
            'fontunits', 'point', 'fontsize', 14);

            uicontrol('Parent',FEditBox,...
            'Style','edit',...
            'String','5',...
            'HorizontalAlignment','right',...
            'Tag','LineWidth',...
            'units', 'normalized',...
            'fontunits', 'point', 'fontsize', 14);

            uicontrol('Parent',FEditBox,...
            'Style','edit',...
            'String','20',...
            'HorizontalAlignment','right',...
            'Tag','Num_Contour',...
            'units', 'normalized',...
            'fontunits', 'point', 'fontsize', 14);
        
            [~,CMap_List] = SelectColormap(0);
            uicontrol('Parent',FEditBox,...
            'Style','popupmenu',...
            'String',CMap_List,...
            'Value',1,...
            'HorizontalAlignment','right',...
            'Tag','CMAP_Index',...
            'units', 'normalized',...
            'fontunits', 'point', 'fontsize', 14);
    set(FHBox,'Widths',[-1,-1])
    
set(FPanelLayout,'Heights',[-1,150])

%% output handles
hGUIs = guihandles(hCOSMOSS);

    
