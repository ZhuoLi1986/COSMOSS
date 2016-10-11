function PlotRotMolFrame(hAx,Lab_Frame,R_MF_LF,COA)

%% Draw rotated molecular frame
Frame_scale = 5;

Lab_Frame_S = Frame_scale.*Lab_Frame;
Mol_Frame_S  = (R_MF_LF\Lab_Frame_S')'; % inverse rotation for axes

hold(hAx,'on')
% Lab Frame
% X
quiver3(hAx, COA(1)        ,COA(2)        ,COA(3),...
        Lab_Frame_S(1,1),Lab_Frame_S(2,1),Lab_Frame_S(3,1),0,...
        'LineWidth',2,...
        'LineStyle','-',...
        'Color',[1,0,0]);  
% Y
quiver3(hAx, COA(1)        ,COA(2)        ,COA(3),...
        Lab_Frame_S(1,2),Lab_Frame_S(2,2),Lab_Frame_S(3,2),0,...
        'LineWidth',2,...
        'LineStyle','-',...
        'Color',[0,1,0]);  
% Z    
quiver3(hAx, COA(1)        ,COA(2)        ,COA(3),...
        Lab_Frame_S(1,3),Lab_Frame_S(2,3),Lab_Frame_S(3,3),0,...
        'LineWidth',2,...
        'LineStyle','-',...
        'Color',[0,0,1]); 
    
% Molecular Frame
% x
quiver3(hAx, COA(1)        ,COA(2)        ,COA(3),...
        Mol_Frame_S(1,1),Mol_Frame_S(2,1),Mol_Frame_S(3,1),0,...
        'LineWidth',2,...
        'LineStyle','--',...
        'Color',[1,0,0]);
% y
quiver3(hAx, COA(1)        ,COA(2)        ,COA(3),...
        Mol_Frame_S(1,2),Mol_Frame_S(2,2),Mol_Frame_S(3,2),0,...
        'LineWidth',2,...
        'LineStyle','--',...
        'Color',[0,1,0]);
% z
quiver3(hAx, COA(1)        ,COA(2)        ,COA(3),...
        Mol_Frame_S(1,3),Mol_Frame_S(2,3),Mol_Frame_S(3,3),0,...
        'LineWidth',2,...
        'LineStyle','--',...
        'Color',[0,0,1]);
    
hold(hAx,'off')