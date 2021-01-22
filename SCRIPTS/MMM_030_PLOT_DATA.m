close all; clear; clc; rng('shuffle');
P.desk   = '/Users/bradleymonk/Desktop';
P.sdd  = '/Volumes/T7/UCSF/jyoti/METHYLATION_PROJECT';
P.home = '/Users/bradleymonk/Documents/MATLAB/UCSF/JYOTI/MMM_PROJECT';
cd(P.home);
P.dat   = [P.home '/DATA'];
P.fig   = [P.home '/FIGS'];
P.mat   = [P.home '/MAT'];
P.csv   = [P.home '/CSV'];
P.fun   = [P.home '/FUNS'];
P.scr   = [P.home '/SCRIPTS'];
addpath(join(string(struct2cell(P)),pathsep,1))
cd(P.home); P.f = filesep;



%==========================================================================
%% LOAD DATASET
%==========================================================================
clc; clearvars -except P



MMMDAT = load([P.mat P.f 'MMM_020_OUTPUT.mat']);

MMM = MMMDAT.MMM;

idxGSTAT = MMMDAT.idxGSTAT;






%==========================================================================
%% PLOT HISTOGRAMS
%==========================================================================
clc; clearvars -except P MMMDAT MMM idxGSTAT




LM_BETA_AVE = nanmean(table2array( MMM( : , idxGSTAT.LM_BETA_AVE )  ),2);
MM_BETA_AVE = nanmean(table2array( MMM( : , idxGSTAT.MM_BETA_AVE )  ),2);
JK_BETA_AVE = nanmean(table2array( MMM( : , idxGSTAT.JK_BETA_AVE )  ),2);

LM_BEADa_AVE = nanmean(table2array( MMM( : , idxGSTAT.LM_BEADa_AVE )  ),2);
MM_BEADa_AVE = nanmean(table2array( MMM( : , idxGSTAT.MM_BEADa_AVE )  ),2);
JK_BEADa_AVE = nanmean(table2array( MMM( : , idxGSTAT.JK_BEADa_AVE )  ),2);

LM_BEADb_AVE = nanmean(table2array( MMM( : , idxGSTAT.LM_BEADb_AVE )  ),2);
MM_BEADb_AVE = nanmean(table2array( MMM( : , idxGSTAT.MM_BEADb_AVE )  ),2);
JK_BEADb_AVE = nanmean(table2array( MMM( : , idxGSTAT.JK_BEADb_AVE )  ),2);

LM_BEADa_SEM = nanmean(table2array( MMM( : , idxGSTAT.LM_BEADa_SEM )  ),2);
MM_BEADa_SEM = nanmean(table2array( MMM( : , idxGSTAT.MM_BEADa_SEM )  ),2);
JK_BEADa_SEM = nanmean(table2array( MMM( : , idxGSTAT.JK_BEADa_SEM )  ),2);

LM_BEADb_SEM = nanmean(table2array( MMM( : , idxGSTAT.LM_BEADb_SEM )  ),2);
MM_BEADb_SEM = nanmean(table2array( MMM( : , idxGSTAT.MM_BEADb_SEM )  ),2);
JK_BEADb_SEM = nanmean(table2array( MMM( : , idxGSTAT.JK_BEADb_SEM )  ),2);

LM_SIGNALa = nanmean(table2array( MMM( : , idxGSTAT.LM_SIGNALa )  ),2);
MM_SIGNALa = nanmean(table2array( MMM( : , idxGSTAT.MM_SIGNALa )  ),2);
JK_SIGNALa = nanmean(table2array( MMM( : , idxGSTAT.JK_SIGNALa )  ),2);

LM_SIGNALb = nanmean(table2array( MMM( : , idxGSTAT.LM_SIGNALb )  ),2);
MM_SIGNALb = nanmean(table2array( MMM( : , idxGSTAT.MM_SIGNALb )  ),2);
JK_SIGNALb = nanmean(table2array( MMM( : , idxGSTAT.JK_SIGNALb )  ),2);

LM_DETECTIONp = nanmean(table2array( MMM( : , idxGSTAT.LM_DETECTIONp )  ),2);
MM_DETECTIONp = nanmean(table2array( MMM( : , idxGSTAT.MM_DETECTIONp )  ),2);
JK_DETECTIONp = nanmean(table2array( MMM( : , idxGSTAT.JK_DETECTIONp )  ),2);

LM_INTENSITY = nanmean(table2array( MMM( : , idxGSTAT.LM_INTENSITY )  ),2);
MM_INTENSITY = nanmean(table2array( MMM( : , idxGSTAT.MM_INTENSITY )  ),2);
JK_INTENSITY = nanmean(table2array( MMM( : , idxGSTAT.JK_INTENSITY )  ),2);





% HISTOGRAMS FOR ALL 9 STATS
%-----------------------------------------------------
%{
clc; close all;
f=figure('Units','pixels','Position',[20 40 1400 750],'Color','w');
ax1=axes('Units','normalized','Position',[.06 .09 .25 .23],'Color','none');
ax2=axes('Units','normalized','Position',[.39 .09 .25 .23],'Color','none');
ax3=axes('Units','normalized','Position',[.72 .09 .25 .23],'Color','none');
ax4=axes('Units','normalized','Position',[.06 .42 .25 .23],'Color','none');
ax5=axes('Units','normalized','Position',[.39 .42 .25 .23],'Color','none');
ax6=axes('Units','normalized','Position',[.72 .42 .25 .23],'Color','none');
ax7=axes('Units','normalized','Position',[.06 .75 .25 .23],'Color','none');
ax8=axes('Units','normalized','Position',[.39 .75 .25 .23],'Color','none');
ax9=axes('Units','normalized','Position',[.72 .75 .25 .23],'Color','none');
%---AXFORMAT()
AXFORMAT(ax1);
AXFORMAT(ax2);
AXFORMAT(ax3);
AXFORMAT(ax4);
AXFORMAT(ax5);
AXFORMAT(ax6);
AXFORMAT(ax7);
AXFORMAT(ax8);
AXFORMAT(ax9);
%---



axes(ax1);  histogram(LM_BEADa_AVE ,65)
hold on;    histogram(MM_BEADa_AVE ,65)
hold on;    histogram(JK_BEADa_AVE ,65)
xlabel('BEAD-A MEAN'); legend LM MM Jurkat

axes(ax2);  histogram(LM_BEADb_AVE ,65)
hold on;    histogram(MM_BEADb_AVE ,65)
hold on;    histogram(JK_BEADb_AVE ,65)
xlabel('BEAD-B MEAN'); legend LM MM Jurkat

axes(ax3);  histogram(LM_BETA_AVE ,65)
hold on;    histogram(MM_BETA_AVE ,65)
hold on;    histogram(JK_BETA_AVE ,65)
xlabel('BETA'); legend LM MM Jurkat

axes(ax4);  histogram(LM_BEADa_SEM ,65)
hold on;    histogram(MM_BEADa_SEM ,65)
hold on;    histogram(JK_BEADa_SEM ,65)
xlabel('BEAD-A SEM'); legend LM MM Jurkat

axes(ax5);  histogram(LM_BEADb_SEM ,65)
hold on;    histogram(MM_BEADb_SEM ,65)
hold on;    histogram(JK_BEADb_SEM ,65)
xlabel('BEAD-B SEM'); legend LM MM Jurkat

axes(ax6);  histogram(LM_DETECTIONp(LM_DETECTIONp>0 & LM_DETECTIONp<.05) ,20)
hold on;    histogram(MM_DETECTIONp(MM_DETECTIONp>0 & MM_DETECTIONp<.05) ,20)
hold on;    histogram(JK_DETECTIONp(JK_DETECTIONp>0 & JK_DETECTIONp<.05) ,20)
xlabel('DETECTION P-VALUE'); legend LM MM Jurkat

axes(ax7);  histogram(LM_SIGNALa ,65)
hold on;    histogram(MM_SIGNALa ,65)
hold on;    histogram(JK_SIGNALa ,65)
xlabel('SIGNAL-A'); legend LM MM Jurkat

axes(ax8);  histogram(LM_SIGNALb ,65)
hold on;    histogram(MM_SIGNALb ,65)
hold on;    histogram(JK_SIGNALb ,65)
xlabel('SIGNAL-B'); legend LM MM Jurkat

axes(ax9);  histogram(LM_INTENSITY, 65)
hold on;    histogram(MM_INTENSITY, 65)
hold on;    histogram(JK_INTENSITY, 65)
xlabel('INTENSITY'); legend LM MM Jurkat
%}
%-----------------------------------------------------




% HISTOGRAMS FOR BEAD, BETA, SIGNAL, INTENSITY
%-----------------------------------------------------
clc; close all;
f=figure('Units','pixels','Position',[5 40 1430 750],'Color','w');
ax1=axes('Units','normalized','Position',[.06 .09 .26 .34],'Color','none');
ax2=axes('Units','normalized','Position',[.39 .09 .26 .34],'Color','none');
ax3=axes('Units','normalized','Position',[.71 .09 .26 .34],'Color','none');
ax4=axes('Units','normalized','Position',[.06 .58 .26 .34],'Color','none');
ax5=axes('Units','normalized','Position',[.39 .58 .26 .34],'Color','none');
ax6=axes('Units','normalized','Position',[.71 .58 .26 .34],'Color','none');
AXFORMAT(ax1); AXFORMAT(ax2); AXFORMAT(ax3); 
AXFORMAT(ax4); AXFORMAT(ax5); AXFORMAT(ax6);
%---
fa1 = .99; fa2 = .66; fa3 = .15;

axes(ax1);  histogram(LM_BEADa_AVE ,65,'FaceAlpha',fa1)
hold on;    histogram(MM_BEADa_AVE ,65,'FaceAlpha',fa2)
hold on;    histogram(JK_BEADa_AVE ,65,'FaceAlpha',fa3)
xlabel('Bead-A'); legend LM MM Jurkat

axes(ax2);  histogram(LM_BEADb_AVE ,65,'FaceAlpha',fa1)
hold on;    histogram(MM_BEADb_AVE ,65,'FaceAlpha',fa2)
hold on;    histogram(JK_BEADb_AVE ,65,'FaceAlpha',fa3)
xlabel('Bead-B'); legend LM MM Jurkat

axes(ax3);  histogram(LM_BETA_AVE ,65,'FaceAlpha',fa1)
hold on;    histogram(MM_BETA_AVE ,65,'FaceAlpha',fa2)
hold on;    histogram(JK_BETA_AVE ,65,'FaceAlpha',fa3)
xlabel('BETA'); legend LM MM Jurkat

axes(ax4);  histogram(LM_SIGNALa ,65,'FaceAlpha',fa1)
hold on;    histogram(MM_SIGNALa ,65,'FaceAlpha',fa2)
hold on;    histogram(JK_SIGNALa ,65,'FaceAlpha',fa3)
xlabel('Signal-A'); legend LM MM Jurkat

axes(ax5);  histogram(LM_SIGNALb ,65,'FaceAlpha',fa1)
hold on;    histogram(MM_SIGNALb ,65,'FaceAlpha',fa2)
hold on;    histogram(JK_SIGNALb ,65,'FaceAlpha',fa3)
xlabel('Signal-B'); legend LM MM Jurkat

axes(ax6);  histogram(LM_INTENSITY, 65,'FaceAlpha',fa1)
hold on;    histogram(MM_INTENSITY, 65,'FaceAlpha',fa2)
hold on;    histogram(JK_INTENSITY, 65,'FaceAlpha',fa3)
xlabel('Intensity'); legend LM MM Jurkat





% BETA HISTOGRAMS
%-----------------------------------------------------
fh1 = figure('Units','pixels','Position',[30 40 1050 700],'Color','w');
ax1 = axes('Position',[.12 .14 .82 .8],'Color','none');
AXFORMAT(ax1); hold on;
%-----------------------------------
axes(ax1);  histogram(LM_BETA_AVE ,88,'FaceAlpha',.99)
hold on;    histogram(MM_BETA_AVE ,88,'FaceAlpha',.82)
hold on;    histogram(JK_BETA_AVE ,88,'FaceAlpha',.77)
xlabel('BETA mean'); legend LM MM Jurkat



% BETA SCATTER PLOT
%-----------------------------------------------------
fh1 = figure('Units','pixels','Position',[30 40 1050 700],'Color','w');
ax1 = axes('Position',[.12 .14 .82 .8],'Color','none');
xlabel('LM Beta'); ylabel('MM Beta');
AXFORMAT(ax1); fh1.Renderer = 'painters'; hold on;
%---
ph1 = scatter(ax1, LM_BETA_AVE, MM_BETA_AVE,...
    200, [.1 .5 .4],'Marker','.','MarkerEdgeAlpha',.05);












%==========================================================================
%% CREATE BETA MATRICES FOR PCA
%==========================================================================
close all; clc; clearvars -except P MMMDAT MMM idxGSTAT




LM_BETA = table2array( MMM( : , idxGSTAT.LM_BETA_AVE )  );
MM_BETA = table2array( MMM( : , idxGSTAT.MM_BETA_AVE )  );
JK_BETA = table2array( MMM( : , idxGSTAT.JK_BETA_AVE )  );



BETA = [LM_BETA MM_BETA];
BETA(isinf(BETA)) = NaN;
BETA = fillmissing(BETA,'previous');
BETA = BETA';



LABS = ones(size(BETA,1),1);
LABS(1:size(LM_BETA,2)) = 0;
CATS = strings(size(LABS));
CATS(LABS==0) = "LM";
CATS(LABS==1) = "MM";
%[A,B,r,U,V] = canoncorr(LM_BETA, MM_BETA);




%==========================================================================
%% RUN PCA
%==========================================================================
clc; clearvars -except P MMMDAT MMM idxGSTAT BETA LABS CATS



% PCA OPTIONS
%--------------------------------
ss = statset('pca');
ss.Display = 'none';
ss.MaxIter = 100;
ss.TolFun = 1e4;
ss.TolX = 1e4;
ss.UseParallel = false;
%--------------------------------


[PCAC,PCAS,PCAL,PCAT,PCAE,PCAM] = pca( BETA , 'Options',ss,'NumComponents',3);

pcaplt(PCAS,CATS)






%==========================================================================
%%       tSNE : t-Distributed Stochastic Neighbor Embedding
%==========================================================================
% 
% TSNE OPTIONS
%----------------------------------------------------------------
%{
% 'Algorithm' — tsne algorithm
%       'barneshut' (default) | 'exact'
% 
% 'Perplexity' — Effective number of local neighbors of each point
%       30 (default) | positive scalar
% 
% 'NumPCAComponents' — PCA dimension reduction
%       0 (default) | nonnegative integer
% 
% 'NumDimensions' — Dimension of the output Y
%       2 (default) | positive integer
% 
% 'Exaggeration' — Size of natural clusters in data
%       4 (default) | scalar value 1 or greater
% 
% 'Distance' — Distance metric
%       'euclidean'|'seuclidean'|'cityblock'|'chebychev'|'minkowski'|
%       'cosine'|'mahalanobis'|'correlation'|'spearman'|'hamming'|'jaccard'
% 
%         'euclidean'   — Euclidean distance
%         'seuclidean'  — Standardized Euclidean distance
%         'cityblock'   — City block distance
%         'chebychev'   — Maximum coordinate difference
%         'minkowski'   — Same as Euclidean distance
%         'mahalanobis' — Distance computed using nancov(X)
%         'cosine'      — One minus cosine of angle between obs
%         'correlation' — One minus linear correlation btw obs
%         'spearman'    — One minus Spearman rank correlation btw obs
%         'hamming'     — Pct of coordinates that differ
%         'jaccard'     — One minus jaccard coef; pct nonzero coords differ
% 
% 
% 'LearnRate' — Learning rate for optimization process
%       500 (default) | positive scalar
% 
% 'Theta' — Barnes-Hut tradeoff parameter
%       0.5 (default) | scalar from 0 through 1
% 
% 
% 
% 
% 
% 
% THIS SET OF tSNE FACTORS PRODUCES AMAZING GROUPING
%--------------------------------
% rng default; TSN = tsne( BETA(:,1:100:end),'NumPCAComponents',5,'Algorithm','exact','Distance','cosine');
% clc; close all;f=figure('Units','pixels','Position',[20 40 700 600],'Color','w');
% gscatter(TSN(:,1), TSN(:,2) ,  CATS, lines(2), '.', 45); xticks([]); yticks([]);
%--------------------------------

% ANOTHER SET OF tSNE FACTORS PRODUCES GOOD GROUPINGS
%--------------------------------
% rng default; TSN = tsne( BETA(:,1:500:end)  ,'Algorithm','exact','NumPCAComponents',4);
% clc; close all;f=figure('Units','pixels','Position',[20 40 700 600],'Color','w');
% gscatter(TSN(:,1), TSN(:,2) ,  CATS, lines(2), '.', 45); xticks([]); yticks([]);
%--------------------------------
%}
%----------------------------------------------------------------
clc; clearvars -except P MMMDAT MMM idxGSTAT BETA LABS CATS



MX = BETA(:,1:100:end);

rng('shuffle');  TSNa = tsne( MX  );
rng('default');  TSNb = tsne( BETA(:,1:100:end),'NumPCAComponents',5,'Algorithm','exact','Distance','cosine');




clc; close all;
f=figure('Units','pixels','Position',[20 40 1200 550],'Color','w');
t = tiledlayout(1,2); t.TileSpacing = 'compact';
nexttile; gscatter(TSNa(:,1), TSNa(:,2) ,  CATS, lines(2), '.', 40); %xticks([]); yticks([]);
nexttile; gscatter(TSNb(:,1), TSNb(:,2) ,  CATS, lines(2), '.', 40); %xticks([]); yticks([]);


TF = (TSNb(:,1) < 0) & (CATS == "LM");
TFi = find(TF);
LM_MISCAT = MMM.Properties.VariableNames(idxGSTAT.LM_BETA_AVE(TFi))';

LM_MISCAT = MMMDAT.TINFO{1,1}(idxGSTAT.LM_BETA_AVE(TFi),1);






%==========================================================================
%% UMAP
%==========================================================================
% 
% UMAP OPTIONS (OR RUN   >help run_umap  )
%----------------------------------------------------------------
%{
    'min_dist'              Controls how tightly UMAP is allowed to pack
                            points together as does the same input argument
                            for the original implementation. Modifying this
                            value requires the Curve Fitting Toolbox.
                            Default is 0.3.
 
    'n_neighbors'           Controls local and global structure as does the
                            same input argument for the original
                            implementation.
                            Default is 15. 
    
    'metric' or 'Distance'  Controls how distance is computed in the
                            ambient space as does the same input argument
                            for the original Python implementation. Accepted
                            values for metric include 
                   'euclidean'   - Euclidean distance (default).
                   'seuclidean'  - Standardized Euclidean distance. Each
                                   coordinate difference between X and a
                                   query point is scaled by dividing by a
                                   scale value S. The default value of S
                                   is the standard deviation computed from
                                   X, S=NANSTD(X). To specify another
                                   value for S, use the 'Scale' argument.
                   'cityblock'   - City Block distance.
                   'chebychev'   - Chebychev distance (maximum coordinate
                                     difference).
                   'minkowski'   - Minkowski distance. The default
                                     exponent is 2. To specify a different
                                     exponent, use the 'P' argument.
                   'mahalanobis' - Mahalanobis distance, computed using a
                                   positive definite covariance matrix C.
                                   The default value of C is the sample
                                   covariance matrix of X, as computed by
                                   NANCOV(X). To specify another value for
                                   C, use the 'Cov' argument.
                   'cosine'      - One minus the cosine of the included
                                   angle between observations (treated as
                                   vectors).
                   'correlation' - One minus the sample linear
                                   correlation between observations
                                   (treated as sequences of values).
                   'spearman'    - One minus the sample Spearman's rank
                                   correlation between observations
                                   (treated as sequences of values).
                   'hamming'     - Hamming distance, percentage of
                                   coordinates that differ.
                   'jaccard'     - One minus the Jaccard coefficient, the
                                   percentage of nonzero coordinates that
                                   differ.
                   function      - A distance function specified using @
                                   (for example @KnnFind.ExampleDistFunc). 
                                   A distance function must be of the form
    
                                     function D2 = DISTFUN(ZI, ZJ),
    
                                   taking as arguments a 1-by-N vector ZI
                                   containing a single row of X or Y, an
                                   M2-by-N matrix ZJ containing multiple
                                   rows of X or Y, and returning an
                                   M2-by-1 vector of distances D2, whose
                                   Jth element is the distance between the
                                   observations ZI and ZJ(J,:).
 
 
    'NSMethod'              Nearest neighbors search method. Values:
                            'kdtree'
                                Instructs run_umap to use knnsearch with
                                a kd-tree to find nearest neighbors. 
                                This is only valid when 'metric' is 
                                'euclidean', 'cityblock', 'minkowski' or
                                'chebychev'.
                            'exhaustive'
                                Instructs run_umap to use knnsearch with 
                                the exhaustive search algorithm.
                                The distance values from all the points
                                in X to each point in Y are computed to
                                find nearest neighbors.
                            'nn_descent'
                                Instructs run_umap to use KnnFind.Approximate 
                                which uses the nn_descent C++ mex function.
                                This tends to deliver the fastest search
                                given certain data conditions and 
                                name-value pair arguments.  Any speedup
                                benefit however comes at the cost of a
                                a slight loss of accuracy usually < 1%.
                                This is only valid if 'metric' is NOT 
                                'spearman', 'hamming', 'seuclidean', ...
                                'jaccard', or a function.
                            Default is 'nn_descent' when n_neighbors<=45
                            and the unreduced data is not a sparse matrix
                            and has rows>=40,000 & cols>10.
                            If 'metric'=='mahalanobis' then this nn_descent 
                            lower limit for rows is 5,000 and for cols is 3.
                            Otherwise 'kdtree' is the default if cols<=10, 
                            the unreduced data is not a sparse matrix, and 
                            the distance metric is 'euclidean', 'cityblock', 
                            'minkowski' or 'chebychev'.
                            Otherwise 'exhaustive' is the default.
 
    'P'                     A positive scalar indicating the exponent of 
                            Minkowski distance. This argument is only 
                            valid when 'metric' (or 'Distance') is
                            'minkowski'. Default is 2.
    
    'Cov'                   A positive definite matrix indicating the 
                            covariance matrix when computing the 
                            Mahalanobis distance. This argument is only 
                            valid when 'metric' (or 'Distance') is
                            'mahalanobis'. Default is NANCOV(X).
    
    'Scale'                 A vector S containing non-negative values, 
                            with length equal to the number of columns 
                            in X. Each coordinate difference between 
                            X and a query point is scaled by the 
                            corresponding element of Scale. 
                            This argument is only valid when 'Distance' 
                            is 'seuclidean'. Default is NANSTD(X).  
 
    'IncludeTies'           A logical value indicating whether knnsearch 
                            will include all the neighbors whose distance 
                            values are equal to the Kth smallest distance. 
                            Default is false.
 
    'BucketSize'            The maximum number of data points in the leaf 
                            node of the kd-tree (default is 50). This 
                            argument is only meaningful when kd-tree is 
                            used for finding nearest neighbors.
 
    'randomize'             true/false.  If false run_umap invokes
                            MATLAB's "rng default" command to ensure the
                            same random sequence of numbers between
                            invocations.
                            Default is false.
    'template_file'         This identifies a .mat file with a saved
                            instance of the UMAP class that run_umap
                            previously produced. The instance must be be a
                            suitable "training set" for the current "test
                            set" of data supplied by the argument
                            csv_file_or_data. Template processing
                            accelerates the UMAP reduction and augments
                            reproducibility. run_umap prechecks the
                            suitability of the template's training set for
                            the test set by checking the name and standard
                            deviation distance from the mean for each
                            parameter (AKA data column).
                            Default is empty ([]...no template).
 
    'see_training'          true/false to see/hide plots of both the
                            supervising data and the supervised data with
                            label coloring and legend. This takes effect
                            when applying a UMAP template of a supervised
                            reduction and when the input argument
                            verbose='graphic'. Examples 5, 10, 11, 12 and
                            16 apply a supervised template.  Example 16
                            illustrates this.
                            Default is false.
 
    'parameter_names'       Cell of char arrays to annotate each column
                            of the data matrix specified by
                            csv_file_or_data. This is only needed if a
                            template is being used or saved.
                            Default is {}.
                            
    'verbose'               Accepted values are 'graphic', 'text', or
                            'none'. If verbose='graphic' then the data
                            displays with probability coloring and contours
                            as is conventional in flow cytometry analysis.
                            If method='Java' or method='MEX', then the
                            display refreshes as optimize_layout progresses
                            and a progress bar is shown along with a handy
                            cancel button. If verbose='text', the progress
                            is displayed in the MATLAB console as textual
                            statements.
                            Default is 'graphic'.
                            
    'method'                Selects 1 of 7 implementations for UMAP's
                            optimize_layout processing phase which does
                            stochastic gradient descent.  Accepted values
                            are 'MEX', 'C++', 'Java', 'C', 'C vectorized',
                            'MATLAB' or 'MATLAB Vectorized'. 'MEX' is our
                            fastest & most recent implementation. The
                            source
                            umap/sgdCpp_files/mexStochasticGradientDescent.cpp
 							provides an illustration of the simplicity and
 							power of MATLAB's C++ MEX programming
 							framework.
                            The other methods are provided for educational
                            value.  They represent our iterative history of
                            speeding up the slowest area of our translation
                            from Python. We found stochastic gradient
                            descent to be the least vectorizable. 'C' and
                            'C vectorized', produced by MATLAB's "C coder"
                            app, were our first attempts to accelerate our
                            MATLAB programming. We were surprised to find
                            our next attempt with 'Java' was faster than
                            the code produced by C Coder.  Thus we
                            proceeded to speed up with the 'C++' and then
                            'MEX' implementations. 'C++', our 2nd fastest,
                            is a separate spawned executable.  The build
                            script and cpp source file are found in
                            umap/sgdCpp_files.
 							Note that MathWorks open source license
                            prevented the 'C' and 'C vectorized' modules to
 							be distributed.  You can download them too from
                            http://cgworkspace.cytogenie.org/GetDown2/demo/umapDistribution.zip
                            MEX, Java and C++ support the progress plots
                            and cancellation options given by argument
                            verbose='graphic'.
                            Default is 'MEX'.
 
   'progress_callback'      A MATLAB function handle that run_umap
                            invokes when method is 'Java', 'C++', or 'MEX'
                            and verbose='graphic'. The input/output
                            expected of this function is
                            keepComputing=progress_report(objectOrString).
                            The function returns true/false to tell the
                            reduction to keep computing or stop computing.
                            The objectOrString argument is either a 
                            status description before stochastic
                            gradient descent starts or an object
                            with properties (getEmbedding, getEpochsDone 
                            and getEpochsToDo) which convey the state of
                            progress. The function function 
                            progress_report here in run_umap.m exemplifies
                            how to write a callback.
                            Default is the function progress_report
                            in run_umap.m.
 
    'ask_to_save_template'  true/false instructs run_umap to ask/not ask
                            to save a template PROVIDING method='Java',
                            verbose='graphic', and template_file is empty.
                            Default is false.
 
    'label_column'          number identifying the column in the input data
                            matrix which contains numeric identifiers to
                            label the data for UMAP supervision mode.
                            If the value is 'end' then the last column in
                            the matrix is the label_column;
    `                       Default is 0, which indicates no label column.
 
    'label_file'            the name of a properties file that contains
                            the label names.  The property name/value
                            format is identifier=false.
                            Default is [].
 
    'n_components'          The dimension of the space into which to embed
                            the data.
                            Default is 2.
 
    'epsilon'               The epsilon input argument used by MATLAB's
                            dbscan algorithm. 
                            Default is 0.6.
 
    'minpts'                The minpts input argument used by MATLAB's 
                            dbscan.
                            Default is 5.
 
    'dbscan_distance'       The distance input argument used by MATLAB's
                            dbscan.
                            Default is 'euclidean'.
 
 
    'cluster_output'        Allowed values: 'none', 'numeric', 'graphic'.  
                            When the value~='none' && nargout>2 
                            cluster results are returned in the 3rd output
                            argument clusterIdentifiers.
                            Default is 'numeric'.
 
    'cluster_method_2D'     Clustering method when n_components==2.
                            Allowed values are 'dbscan' or 'dbm'.
                            Default is our own method 'dbm'.
 
    'cluster_detail'        Used when (nargout>2 and the input 
                            argument 'cluster_output'~='none') OR 
                            'cluster_output'=='graphic'.  
                            Allowed values are 'very low', 'low', 'medium',
                            'high', 'very high', 'most high', 'adaptive' or
                            'nearest neighbor' or 'dbscan arguments'
                            if 'dbscan arguments' then run_umap uses the 
                            input arguments 'epsilon' and 'minpts' to
                            determine cluster detail IF the dbscan method 
                            is needed.  If needed and 'cluster_detail'
                            value is 'adaptive' or 'nearest neighbor' 
                            then run_umap replaces with 'dbscan arguments'.
                            Default is 'very high'.
 
    'save_template_file'    Fully qualified path of the file to save the
                            resulting UMAP object as a template.  One
                            can also save run_umap's 2nd output argument.
                            Default is [].
 
    'match_supervisors'     A number indicating how to relabel data points 
                            in the embedding data if the UMAP reduction 
                            is guided by a template that in turn is guided 
                            by supervisory labels.
                            0 matches supervised and supervising data
                              groupings by distance of medians. Supervising
                              groupings are data points in the template's
                              embedding that have the same supervisory
                              label. Supervised groupings are DBM clusters
                              in the final template-guided embedding. The
                              publication that introduces DBM clustering is
                              http://cgworkspace.cytogenie.org/GetDown2/demo/dbm.pdf.
                            1 (default) matches groupings by quadratic 
                              form dissimilarity.  The publication 
                              that introduces QF dissimilarity is
                              https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5818510/.
                            2 matches supervised DBM clusters by assigning
                              the label of the closest supervising data 
                              point to each supervised data point and then 
                              choosing the most frequent label in the 
                              cluster.  Closeness is based on Euclidean 
                              distance in the supervised and supervising
                              embedding data spaces.
                            3 is similar to 2 except it only uses closeness
                              to the supervising data point to relabel the
                              supervised data points without the aid of DBM
                              clustering.  Thus supervised groupings in the
                              embedding space may have small fragments
                              of data points that occur in distant 
                              islands/clusters of the embedding.
 
    'match_3D_limit'        The lower limit for the # of data rows before
                            3D progress plotting avoids supervisor label
                            matching.  This applies only when reducing with
                            a supervised template and the n_components>2
                            and verbose=graphic. If > limit then supervisor
                            matching ONLY occurs in the final plot
                            ...otherwise supervisor label matching occurs
                            during progress plotting before epochs finish.
                            Default is 20000. 
                            
    'qf_dissimilarity'      Show QF dissimilarity scores between data
                            groupings in the supervised and supervising 
                            embeddings. The showing uses a sortable data 
                            table as well as a histogram.
                            Default is false.
                            run_umap only consults this argument when it
                            guides a reduction with a supervised
                            template.
                            
    'qf_tree'               Show a dendrogram plot that represents the
                            relatedness of data groupings in the
                            supervising and supervised embeddings. The
                            above documentation for the match_supervisors
                            argument defines "data groupings". The
                            publication that introduces the QF tree is
                            https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6586874/.
                            This uses phytree from MATLAB's Bioinformatics
                            Toolbox, hence changing this value to true
                            requires the Bioinformatics Toolbox.
                            Default is false.
                            run_umap only consults this argument when it
                            guides a reduction with a supervised
                            template.
                            
    'joined_transform'      true/false for a new transform method to avoid
                            false positives when applying a template whose
                            training data differs too much from test set
                            data. This feature is not part of UMAP's
                            original Python implementation. 
                            Currently this not supported when
                            method is not Java. 
                            Default is false.
 
    'python'                true/false to use UMAP's original
                            implementation written in Python instead of
                            this one written in MATLAB, C++ and Java.  The
                            Python implementation is from Leland McInnes,
                            John Healy, and James Melville.
                            If true then certain arguments are ignored:
                            joined_transform, method, verbose, 
                            and progress_callback.
                            Default is false.
 
    'nn_descent_min_rows'   the # of input data rows needed before 
                            UMAP version 2.0 engages its  NEW fast fuzzy 
                            simplicial set processing. 
                            Default is 40,000.
 
    'nn_descent_min_cols'   the # of input data columns needed before 
                            UMAP version 2.0 engages its  NEW fast fuzzy 
                            simplicial set processing. 
                            Default is 11
 
    'nn_descent_transform_queue_size' 
                            a factor of "slack" used for fuzzy simplicial
                            set optimization with umap supervised templates.
                            1 means no slack and 4 means 400% slack.
                            The more slack the greater accuracy but the 
                            less the acceleration.
                            Default is 1.35.
 
    'nn_descent_max_neighbors'
                            the maximum # of n_neighbors after which the
                            NEW acceleration of fuzzy simplicial set 
                            processing UMAP version 2.0 becomes too slow.
 							The default is 45.
 
                            The above 4 nn_descent* arguments guide accelerants 
                            of fuzzy simplicial set processing released in
                            version 2.0 of our UMAP for MatLab.  The 
                            mex accelerants engage when metric is 
                            anything other than mahalanobis or spearman, 
                            when n_neighbors <= 30 and the input 
                            data matrix has rows >= 65,000 & columns>=11.  
                            NOTE: there could be a slight loss of
                            accuracy (usually < 1%), so you may want
                            to set this option off.
                            
    'match_scenarios'       Used for "ust/UST" scenarios where UMAP 
                            uses a previously created supervised template.
                            This parameter produce a table of comparision
                            statistics for each class in the supervision.
                            2 is the typical comparison scenario between
                                the classification of the training set
                                and the classification ust produces on 
 								the test set.
                            1 compares the classification 
                                of the training set with a prior 
                                classification of the test set if (and
                                only if) the test set input data has a label
                                column denoting this prior classification.
                            3 compares a prior classification  of the 
                                test set with the classification which ust 
                                produces.  The test set input data
                                must include a label_column denoting the 
                                prior classification.  The comparison
                                metric used is QF dissimilarity.  See
                                https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6586874/
                                https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5818510/
                            4 same as 3 except the comparison metric used
                                as F-measure.  See 
                                https://en.wikipedia.org/wiki/F-score
                            Default is 0
 
  'match_histogram_fig'     This parameter applies to match scenarios
                            described above.  If true then run_umap shows
                            histograms for the 2 comparison metrics
                            of QF dissimilary and F-measure
 
  'false_positive_negative_plot'
                            Used for parameter match_scenarios 4 where 
                            run_umap uses F-measure metric to compare 
                            the classification done by
                            ust on a test set with a prior classification 
                            for the test set.  The test set input data
                            must include a label_column denoting the prior
 							classification. The false +/- displays includes 
                            several graphs to illustrate how the 
                            ust classification compares to the prior 
                            classification which is asssumed to be more 
                            correct.
                            Default is false.
 
   'override_template_args' If false use the umap settings found in the
                            template rather than those found in the 
                            provided as arguments ro run_umap.  This 
                            affects the arguments metric, P, Cov, Scale, 
                            n_neighbors and min_dist.
                            The arguments for n_components and parameter_names
                            are ALWAYS ignored when using a template 
                            (either supervised or unsupervised).
                            Default is false.

%}
%----------------------------------------------------------------
close all; clc; clearvars -except P MMMDAT MMM idxGSTAT BETA LABS CATS







UMP.metric                  = 'euclidean';
    % [euclidean]|cosine|cityblock|chebychev|correlation|spearman|hamming|jaccard
UMP.n_epochs                = 30;
UMP.n_neighbors             = 18;
UMP.n_components            = 2;
UMP.min_dist                = 0.2;
UMP.verbose                 = 'graphic';
UMP.method                  = 'MEX';
UMP.min_dist                = 0.2;
UMP.randomize               = false;
UMP.verbose                 = true;
UMP.label_column            = 'end';            % [0]|1-Ncols|'end'
UMP.qf_tree                 = true;
UMP.qf_dissimilarity        = true;
UMP.see_training            = false;
UMP.cluster_output          = 'numeric';
UMP.BucketSize              = 50;
UMP.NSMethod                = 'exhaustive';     % [kdtree]|exhaustive|nn_descent



MX = [BETA(:,1:1000:end) , LABS+1];
%MX = BETA(:,1:1000:end);

[aUM.XY, aUM.UMAP, aUM.CLUSTERS, aUM.EXTRAS] = run_umap(MX, ...
	'metric',UMP.metric,...
	'n_epochs',UMP.n_epochs,...
	'n_neighbors',UMP.n_neighbors,...
	'n_components',UMP.n_components,...
	'min_dist',UMP.min_dist,...
	'method',UMP.method,...
    'min_dist',UMP.min_dist,...
    'randomize',UMP.randomize,...
	'qf_tree',UMP.qf_tree,...
	'see_training',UMP.see_training,...
	'cluster_output',UMP.cluster_output,...
	'BucketSize',UMP.BucketSize,...
	'NSMethod',UMP.NSMethod,...
    'label_column',UMP.label_column,...
    'verbose',UMP.verbose);
%    'label_column',UMP.label_column,...



%MX = [BETA(:,1:1000:end) , LABS+1];
MX = BETA(:,1:1000:end);

[bUM.XY, bUM.UMAP, bUM.CLUSTERS, bUM.EXTRAS] = run_umap(MX, ...
	'metric',UMP.metric,...
	'n_epochs',UMP.n_epochs,...
	'n_neighbors',UMP.n_neighbors,...
	'n_components',UMP.n_components,...
	'min_dist',UMP.min_dist,...
	'method',UMP.method,...
    'min_dist',UMP.min_dist,...
    'randomize',UMP.randomize,...
	'qf_tree',UMP.qf_tree,...
	'see_training',UMP.see_training,...
	'cluster_output',UMP.cluster_output,...
	'BucketSize',UMP.BucketSize,...
	'NSMethod',UMP.NSMethod,...
    'verbose',UMP.verbose);

%	'XXXX',UMP.XXXX,...
%     'label_column',UMP.label_column,...
% 'qf_dissimilarity',UMP.qf_dissimilarity,...

f=figure('Units','pixels','Position',[20 40 1200 550],'Color','w');
t = tiledlayout(1,2); t.TileSpacing = 'compact';
nexttile; gscatter(aUM.XY(:,1), aUM.XY(:,2) ,  CATS, lines(2), '.', 40); xticks([]); yticks([]);
nexttile; gscatter(bUM.XY(:,1), bUM.XY(:,2) ,  CATS, lines(2), '.', 40); xticks([]); yticks([]);





% A GOOD BASIC UMAP RUN
%--------------------------------
% MX = BETA(:,1:5000:end);
% close all; clc; 
% UMa = run_umap(MX , 'n_epochs',20);
%--------------------------------



% UMAP(method=MEX, n_neighbors=15, n_components=2, metric='euclidean',
% n_epochs=[], learning_rate=1, init=spectral, min_dist=0.3, spread=1,
% set_op_mix_ratio=1, local_connectivity=1, repulsion_strength=1,
% negative_sample_rate=5, transform_queue_size=4, a=0.992174408960354,
% b=1.11225576844318, randomize=false, target_n_neighbors=-1,
% target_metric='categorical', target_metric_kwds=[], target_weight=0.5,
% verbose=true, initial_alpha=1, sparse_data=false, small_data=true,
% distance_func='euclidean', dist_args=[]
% UMAP reduction finished (cost 2.17 secs)







%==========================================================================
%% COMPUTE BETA MEANS ACROSS "LM" & "ML" GROUP ROWS
%==========================================================================
clc; clearvars -except P MMMDAT MMM idxGSTAT


LM_BETA_AVE = nanmean(table2array( MMM( : , idxGSTAT.LM_BETA_AVE ) ) ,2);
MM_BETA_AVE = nanmean(table2array( MMM( : , idxGSTAT.MM_BETA_AVE ) ) ,2);
JK_BETA_AVE = nanmean(table2array( MMM( : , idxGSTAT.JK_BETA_AVE ) ) ,2);



% [Xq,Yq] = qqdata(LM_BETA_AVE,MM_BETA_AVE);
% [Xq,Yq] = qqdata(MM_BETA_AVE,JK_BETA_AVE);
% [Xq,Yq] = qqdata(LM_BETA_AVE,JK_BETA_AVE);
% close all; qqplot(LM_BETA_AVE,MM_BETA_AVE)
% close all; qqplot(LM_BETA_AVE,JK_BETA_AVE)
% close all; qqplot(MM_BETA_AVE,JK_BETA_AVE)

%==========================================================================
% CREATE FIGURE WINDOW
%-----------------------------------
close all;
fh1=figure('Units','pixels','Position',[20 40 1100 750],'Color','w');
ax1=axes('Units','normalized','Position',[.07 .59 .35 .37],'Color','none');
ax2=axes('Units','normalized','Position',[.56 .59 .35 .37],'Color','none');
ax3=axes('Units','normalized','Position',[.07 .09 .35 .37],'Color','none');
ax4=axes('Units','normalized','Position',[.56 .09 .35 .37],'Color','none');

%---AXFORMAT()
ARGS.XL = 'LM'; ARGS.YL = 'MM'; AXFORMAT(ax1,ARGS);
ARGS.XL = 'LM'; ARGS.YL = 'JK'; AXFORMAT(ax2,ARGS);
ARGS.XL = 'MM'; ARGS.YL = 'JK'; AXFORMAT(ax3,ARGS);
ARGS.XL = 'LM quantiles'; ARGS.YL = 'MM quantiles'; AXFORMAT(ax4,ARGS);
fh1.Renderer = 'painters'; hold on;
%---

ph1 = scatter(ax1, LM_BETA_AVE, MM_BETA_AVE, 200, [.1 .5 .4],'Marker','.','MarkerEdgeAlpha',.1);
ph2 = scatter(ax2, LM_BETA_AVE, JK_BETA_AVE, 200, [.1 .5 .4],'Marker','.','MarkerEdgeAlpha',.1);
ph3 = scatter(ax3, MM_BETA_AVE, JK_BETA_AVE, 200, [.1 .5 .4],'Marker','.','MarkerEdgeAlpha',.1);

[Xq,Yq] = qqdata(LM_BETA_AVE,MM_BETA_AVE);
ph4 = scatter(ax4, Xq, Yq, 900, [.1 .5 .4],'Marker','.','MarkerEdgeAlpha',.1);














