function [SpectraGrid,Response] = TwoD_Iteration(h2DFunc,app)
%% Read GUI
I = Parse_COSMOSS(app);
Sampling      = I.Sampling;
DynamicUpdate = I.DynamicUpdate;
Sample_Num    = I.Sample_Num;
FreqRange     = I.FreqRange;
Structure     = app.Structure;

%% Pre-calculation settings
% Create figure object for dynamics figure update
if DynamicUpdate && Sampling
    hF = figure;
    hAx = axes('Parent',hF);
end

%% Calculate TwoD response
if Sampling
    % Pre-allocate
    FreqRange = FreqRange(1):FreqRange(end)+100; % add 100 cm-1 range to prevent fluctuation out of range
    I.FreqRange = FreqRange; % pass the extended Frequency Range to the TwoD main function
    GridSize  = FreqRange(end); 
    
    Rephasing    = sparse(GridSize,GridSize);
    NonRephasing = sparse(GridSize,GridSize);
    SpecAccuR1   = sparse(GridSize,GridSize);
    SpecAccuR2   = sparse(GridSize,GridSize);
    SpecAccuR3   = sparse(GridSize,GridSize);
    SpecAccuNR1  = sparse(GridSize,GridSize);
    SpecAccuNR2  = sparse(GridSize,GridSize);
    SpecAccuNR3  = sparse(GridSize,GridSize);

    TSTART = zeros(Sample_Num,1,'uint64');
    TIME   = zeros(Sample_Num,1);

    for i = 1:Sample_Num
        TSTART(i) = tic;
        
        % Read GUI input directly from obj handle
        DynamicUpdate = app.CheckBox_DynamicFigUpdate.Value;
        UpdateStatus  = app.CheckBox_Continue.Value;
        if and(~eq(i,1), and(eq(DynamicUpdate,1),~eq(UpdateStatus,1)))
            break
        end

        % run main function
        [Tmp_SG,Tmp_Res] = h2DFunc(Structure,I);
        
        % Accumulate result
        try
            Rephasing    = Rephasing    + Tmp_SG.Rephasing   ;
            NonRephasing = NonRephasing + Tmp_SG.NonRephasing;
            SpecAccuR1   = SpecAccuR1   + Tmp_SG.SpecAccuR1  ;
            SpecAccuR2   = SpecAccuR2   + Tmp_SG.SpecAccuR2  ;
            SpecAccuR3   = SpecAccuR3   + Tmp_SG.SpecAccuR3  ;
            SpecAccuNR1  = SpecAccuNR1  + Tmp_SG.SpecAccuNR1 ;
            SpecAccuNR2  = SpecAccuNR2  + Tmp_SG.SpecAccuNR2 ;
            SpecAccuNR3  = SpecAccuNR3  + Tmp_SG.SpecAccuNR3 ;   
        catch
            disp(['Frequency fluctuation out of range: ', num2str(GridSize),', dop this run...'])
            continue
        end

        SpectraGrid.Rephasing    = Rephasing    ;
        SpectraGrid.NonRephasing = NonRephasing ;
        SpectraGrid.SpecAccuR1   = SpecAccuR1   ;
        SpectraGrid.SpecAccuR2   = SpecAccuR2   ;
        SpectraGrid.SpecAccuR3   = SpecAccuR3   ;
        SpectraGrid.SpecAccuNR1  = SpecAccuNR1  ;
        SpectraGrid.SpecAccuNR2  = SpecAccuNR2  ;
        SpectraGrid.SpecAccuNR3  = SpecAccuNR3  ;
        Response = Tmp_Res;

        % Dynamic update of figure % update every 10 run
        while and(~eq(DynamicUpdate,0),eq(mod(i,10),0))
            CVL = Conv2D(SpectraGrid,I);
            CVL.FilesName = [Structure.FilesName,' ',num2str(i),'-th run...']; % pass filesname for figure title
            SpecType = Response.SpecType;
            Plot2D(hAx,CVL,I,SpecType);
            drawnow
            DynamicUpdate = 0;
        end
        
        TIME(i) = toc(TSTART(i));
        disp(['Run ' num2str(i) ' finished within '  num2str(TIME(i)) '...'])
    end
    Total_TIME = sum(TIME);
    disp(['Total time: ' num2str(Total_TIME)])

else
    [SpectraGrid,Response] = h2DFunc(Structure,I);
end
