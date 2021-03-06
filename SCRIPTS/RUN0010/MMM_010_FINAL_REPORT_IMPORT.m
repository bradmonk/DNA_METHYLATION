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


P.reme = [P.csv '/EPIC50_FinalReport_BRAD_README.xlsx'];
REME = readtable(P.reme,'sheet','ROW1');


P.file = [P.csv '/20201222_EPIC50_Rajkoviclab_01_FinalReport_BRAD.txt'];
OPT = detectImportOptions(P.file);
TBL = readtable(P.file,OPT);







%==========================================================================
%% CLEAN DATASET
%==========================================================================
clc; clearvars -except P REME TBL


TBL.Var921 = [];


DAT = [REME; TBL];

DAT = convertvars(DAT,@iscell,'string');
peek(DAT)





MMM = DAT;

TF  = ismissing(MMM,"FALSE");
MMM = fillmissing(MMM,'constant',"false",'DataVariables',@isstring,'MissingLocations',TF);

TF  = ismissing(MMM,"TRUE");
MMM = fillmissing(MMM,'constant',"true",'DataVariables',@isstring,'MissingLocations',TF);





MMM.x450K_ENHANCER      = MMM.x450K_ENHANCER == "true";
MMM.METHYL27_LOCI       = MMM.METHYL27_LOCI == "true";
MMM.METHYL450_LOCI      = MMM.METHYL450_LOCI == "true";
MMM.RANDOM_LOCI         = MMM.RANDOM_LOCI == "true";
MMM.MFG_CHANGE_FLAGGED  = MMM.MFG_CHANGE_FLAGGED == "true";



peek(MMM)


%==========================================================================
%% SAVE DATASET
%==========================================================================
clc; clearvars -except P MMM


save([P.mat P.f 'MMM_010_OUTPUT.mat'],'MMM');

%writetable(MMM,[P.desk P.f 'MMM_010_OUTPUT.csv'])










