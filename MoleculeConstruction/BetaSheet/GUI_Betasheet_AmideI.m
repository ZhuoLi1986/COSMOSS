function GUI = GUI_Betasheet_AmideI(fig) 
%% Pre-setting
Version = '1.0.0';

%% Add base layout
MainLayout = uix.VBoxFlex(...
    'Parent',fig,...
    'Spacing',1,...
    'Padding',5);

    SheetPanel = uix.BoxPanel( ...
        'Parent',MainLayout,...
        'Title','Betasheet parmeters','FontSize',14);

    OrientationPanel = uix.BoxPanel( ...
        'Parent',MainLayout,...
        'Title','Molecule Orientation','FontSize',14);

    LabelPanel = uix.BoxPanel( ...
        'Parent',MainLayout,...
        'Title','Local Mode Frequency','FontSize',14);

    FigurePanel = uix.BoxPanel( ...
        'Parent',MainLayout,...
        'Title','Molecule figure options','FontSize',14);
    
    ButtonBox = uix.VBoxFlex( ...
        'Parent', MainLayout,...
        'Padding', 2);

set(MainLayout,'Height',[90,120,120,50,-1])

%% Size/Type of betasheet
BetasheetSizeLayout = uix.HBoxFlex('Parent',SheetPanel,...
    'Padding', 5, 'Spacing', 5);

    TextBox = uix.VBox('Parent',BetasheetSizeLayout);
        uicontrol('Parent',TextBox,...
        'Style','text',...
        'String','Type:',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
        uicontrol('Parent',TextBox,...
        'Style','text',...
        'String','# residues:',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',TextBox,...
        'Style','text',...
        'String','# strands:',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    

    EditBox = uix.VBox('Parent',BetasheetSizeLayout);
        uicontrol('Parent',EditBox,...
        'Style','popup',...
        'String',{'Parallel','Anti-Parallel'},...
        'Tag','SheetType',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',EditBox,...
        'Style','edit',...
        'String','10',...
        'Tag','N_Residue',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',EditBox,...
        'Style','edit',...
        'String','2',...
        'Tag','N_Strand',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
set(BetasheetSizeLayout,'Widths',[80,-1])

%% Relative Oreintation between strands inputs
OreintationLayout = uix.HBox('Parent',OrientationPanel,...
    'Padding', 3, 'Spacing', 3);

    VtextBox = uix.VBox('Parent',OreintationLayout,...
    'Padding', 3, 'Spacing', 3);
        uicontrol('Parent',VtextBox,...
        'Style','text',...
        'String','Ang/Deg',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',VtextBox,...
        'Style','text',...
        'String','Trans.',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

        uicontrol('Parent',VtextBox,...
        'Style','text',...
        'String','Twist',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',VtextBox,...
        'Style','text',...
        'String','Eular Rot.',...
        'HorizontalAlignment','left',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
    
    XBox = uix.VBox('Parent',OreintationLayout,...
    'Padding', 3, 'Spacing', 3);
        uicontrol('Parent',XBox,...
        'Style','text',...
        'String','X',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',XBox,...
        'Style','edit',...
        'String','0',...
        'Tag','Trans_X',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',XBox,...
        'Style','edit',...
        'String','0',...
        'Tag','Twist_X',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',XBox,...
        'Style','edit',...
        'String','0',...
        'Tag','Phi_D',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

    YBox = uix.VBox('Parent',OreintationLayout,...
    'Padding', 3, 'Spacing', 3);
        uicontrol('Parent',YBox,...
        'Style','text',...
        'String','Y',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',YBox,...
        'Style','edit',...
        'String','0',...
        'Tag','Trans_Y',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',YBox,...
        'Style','edit',...
        'String','0',...
        'Tag','Twist_Y',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',YBox,...
        'Style','edit',...
        'String','0',...
        'Tag','Psi_D',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
    ZBox = uix.VBox('Parent',OreintationLayout,...
    'Padding', 3, 'Spacing', 3);
        uicontrol('Parent',ZBox,...
        'Style','text',...
        'String','Z',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',ZBox,...
        'Style','edit',...
        'String','4.75',...
        'Tag','Trans_Z',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',ZBox,...
        'Style','edit',...
        'String','0',...
        'Tag','Twist_Z',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',ZBox,...
        'Style','edit',...
        'String','0',...
        'Tag','Theta_D',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

    
set(OreintationLayout,'Widths',[-2,-1,-1,-1])

%% Labeling panel
LabelPanelLayout = uix.HBoxFlex('Parent',LabelPanel,...
    'Padding', 5, 'Spacing', 5);

    Freq_TextBox = uix.VBox('Parent',LabelPanelLayout);
        uicontrol('Parent',Freq_TextBox,...
        'Style','text',...
        'String','Non-Labeled Freq:',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',Freq_TextBox,...
        'Style','text',...
        'String','Labeled Freq:',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',Freq_TextBox,...
        'Style','text',...
        'String','Anharmonicty:',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',Freq_TextBox,...
        'Style','text',...
        'String','Index of modes:',...
        'HorizontalAlignment','right',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
    

    Freq_EditBox = uix.VBox('Parent',LabelPanelLayout);
        uicontrol('Parent',Freq_EditBox,...
        'Style','edit',...
        'String','1645',...
        'Tag','NLFreq',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',Freq_EditBox,...
        'Style','edit',...
        'String','1604',...
        'Tag','LFreq',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);
    
        uicontrol('Parent',Freq_EditBox,...
        'Style','edit',...
        'String','20',...
        'Tag','Anharm',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);   
        
        uicontrol('Parent',Freq_EditBox,...
        'Style','edit',...
        'String','None',...
        'Tag','L_Index',...
        'units', 'normalized',...
        'fontunits', 'point', 'fontsize', 14);

set(LabelPanelLayout,'Widths',[140,-1])

%% Plot molecule options
FigurePanelLayout = uix.HBox('Parent',FigurePanel,...
    'Padding', 5, 'Spacing', 5);

        uicontrol('Parent',FigurePanelLayout,...
                  'Style','checkbox',...
                  'String','Atoms,',...
                  'Value',1,...
                  'Tag','Plot_Atoms',...
                  'HorizontalAlignment','left',...
                  'units', 'normalized',...
                  'fontunits', 'point', 'fontsize', 14);     
        uicontrol('Parent',FigurePanelLayout,...
                  'Style','checkbox',...
                  'String','Bonds.',...
                  'Value',1,...
                  'Tag','Plot_Bonds',...
                  'HorizontalAlignment','left',...
                  'units', 'normalized',...
                  'fontunits', 'point', 'fontsize', 14);
        uix.Empty('Parent',FigurePanelLayout)
    set(FigurePanelLayout,'Widths',[80,80,-1])

%% Button
uicontrol( 'Parent', ButtonBox, ...
'String', 'Update Structure',...
'Callback',@(hObject,eventdata)Model_Betasheet_AmideI('UpdateStructure',hObject,eventdata,guidata(hObject)));

uicontrol( 'Parent', ButtonBox, ...
'String', 'Plot Molecule',...
'Callback',@(hObject,eventdata)Model_Betasheet_AmideI('PlotMolecule',hObject,eventdata,guidata(hObject)));

uicontrol( 'Parent', ButtonBox, ...
'String', 'Plot Modes',...
'Callback',@(hObject,eventdata)Model_Betasheet_AmideI('PlotModes',hObject,eventdata,guidata(hObject)));

uicontrol( 'Parent', ButtonBox, ...
'String', 'Export handles',...
'Callback',@(hObject,eventdata)Model_Betasheet_AmideI('Export_Handle_Callback',hObject,eventdata,guidata(hObject)));

uicontrol('Parent',ButtonBox,...
          'Style','text',...
          'String',['Model Version: v',Version],...
          'HorizontalAlignment','Center',...
          'units', 'normalized',...
          'fontunits', 'point', 'fontsize', 14);       

set(ButtonBox,'Height',[-1,-1,-1,-1,20])
%% output handles
GUI = guihandles(fig);
    