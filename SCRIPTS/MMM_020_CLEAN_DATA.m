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



M = load([P.mat P.f 'MMM_011_OUTPUT.mat']);

MMMDAT = M.MMMDAT;

MMMDAT.MMM.Properties.VariableNames{'ILMNID'} = 'ILLUMINA_ID';
MMMDAT.MMM.Properties.VariableNames{'HMM_ISLAND'} = 'HM_ISLAND';

MMMDAT.MMM = movevars(MMMDAT.MMM,{'TargetID','ProbeID_A','ProbeID_B'},'Before','ILLUMINA_ID');

MMM = MMMDAT.MMM;





%==========================================================================
%% FIX TABLE VARIABLE NAMES
%==========================================================================
clc; clearvars -except P MMMDAT MMM



JUR_ORIG = [
"Jurkat-50 AVG_Beta";...
"Jurkat-50 Avg_NBEADS_A";...
"Jurkat-50 Avg_NBEADS_B";...
"Jurkat-50 BEAD_STDERR_A";...
"Jurkat-50 BEAD_STDERR_B";...
"Jurkat-50 Signal_A";...
"Jurkat-50 Signal_B";...
"Jurkat-50 Detection Pval";...
"Jurkat-50 Intensity"];
JUR_CURR = [
"Jurkat-50_AVG_Beta";...
"Jurkat-50_Avg_NBEADS_A";...
"Jurkat-50_Avg_NBEADS_B";...
"Jurkat-50_BEAD_STDERR_A";...
"Jurkat-50_BEAD_STDERR_B";...
"Jurkat-50_Signal_A";...
"Jurkat-50_Signal_B";...
"Jurkat-50_Detection Pval";...
"Jurkat-50_Intensity"];
MMM.Properties.VariableNames(856:864) = JUR_CURR;
MMM.Properties.VariableDescriptions(856:864) = JUR_ORIG;


B = [
    "B-12811 LM.AVG_Beta";...
    "B-12811 LM.Avg_NBEADS_A";...
    "B-12811 LM.Avg_NBEADS_B";...
    "B-12811 LM.BEAD_STDERR_A";...
    "B-12811 LM.BEAD_STDERR_B";...
    "B-12811 LM.Signal_A";...
    "B-12811 LM.Signal_B";...
    "B-12811 LM.Detection Pval";...
    "B-12811 LM.Intensity"];
MMM.Properties.VariableDescriptions(478:486) = B;





CURR = string(MMM.Properties.VariableNames');        % NEW TABLE VAR NAMES
ORIG = string(MMM.Properties.VariableDescriptions'); % ORIG TABLE VAR NAMES
%fprintf('%s\n',CURR)
%fprintf('%s\n',ORIG)

TABLE_NAMES = table();
TABLE_NAMES.ORIGINAL = ORIG;
TABLE_NAMES.CURRENT = CURR;
TABLE_NAMES.NEW = strings(height(TABLE_NAMES),1);



IDX.BETA_AVE    = ((1:9:856) + 0)';
IDX.BEADa_AVE   = ((1:9:856) + 1)';
IDX.BEADb_AVE   = ((1:9:856) + 2)';
IDX.BEADa_SEM   = ((1:9:856) + 3)';
IDX.BEADb_SEM   = ((1:9:856) + 4)';
IDX.SIGNALa     = ((1:9:856) + 5)';
IDX.SIGNALb     = ((1:9:856) + 6)';
IDX.DETECTIONp  = ((1:9:856) + 7)';
IDX.INTENSITY   = ((1:9:856) + 8)';

% TABLE_NAMES.CURRENT(IDX.BETA_AVE)
% TABLE_NAMES.CURRENT(IDX.BEADa_AVE)
% TABLE_NAMES.CURRENT(IDX.BEADb_AVE)
% TABLE_NAMES.CURRENT(IDX.BEADa_SEM)
% TABLE_NAMES.CURRENT(IDX.BEADb_SEM)
% TABLE_NAMES.CURRENT(IDX.SIGNALa)
% TABLE_NAMES.CURRENT(IDX.SIGNALb)
% TABLE_NAMES.CURRENT(IDX.DETECTIONp)
% TABLE_NAMES.CURRENT(IDX.INTENSITY)


TABLE_NAMES.NEW(IDX.BETA_AVE)   = "BETA_AVE";
TABLE_NAMES.NEW(IDX.BEADa_AVE)  = "BEADa_AVE";
TABLE_NAMES.NEW(IDX.BEADb_AVE)  = "BEADb_AVE";
TABLE_NAMES.NEW(IDX.BEADa_SEM)  = "BEADa_SEM";
TABLE_NAMES.NEW(IDX.BEADb_SEM)  = "BEADb_SEM";
TABLE_NAMES.NEW(IDX.SIGNALa)    = "SIGNALa";
TABLE_NAMES.NEW(IDX.SIGNALb)    = "SIGNALb";
TABLE_NAMES.NEW(IDX.DETECTIONp) = "DETECTIONp";
TABLE_NAMES.NEW(IDX.INTENSITY)  = "INTENSITY";


INFO = [...
"TARGET_ID";...
"A_PROBE_ID";...
"B_PROBE_ID";...
"ILLUMINA_ID";...
"NAME";...
"A_ADDRESS_ID";...
"A_ALLELE_PROBESEQ";...
"B_ADDRESS_ID";...
"B_ALLELE_PROBESEQ";...
"INFINIUM_DESIGN_TYPE";...
"NEXT_BASE";...
"COLOR_CHANNEL";...
"FORWARD_SEQUENCE";...
"GENOME_BUILD";...
"CHR";...
"MAPINFO";...
"SOURCESEQ";...
"STRAND";...
"UCSC_REFGENE_NAME";...
"UCSC_REFGENE_ACC";...
"UCSC_REFGENE_GROUP";...
"UCSC_CPG_ISLANDS_NAME";...
"REL_UCSC_CPG_ISLAND";...
"PHANTOM4_ENHANCERS";...
"PHANTOM5_ENHANCERS";...
"DMR";...
"ENHANCER_450K";...
"HM_ISLAND";...
"REG_FEATURE_NAME";...
"REG_FEATURE_GROUP";...
"GENCODEBASICV12_NAME";...
"GENCODEBASICV12_ACCN";...
"GENCODEBASICV12_GROUP";...
"GENCODECOMPV12_NAME";...
"GENCODECOMPV12_ACCN";...
"GENCODECOMPV12_GROUP";...
"DNASE_HYPSENS_NAME";...
"DNASE_HYPSENS_EV_COUNT";...
"OPENCHROMA_NAME";...
"OPENCHROMA_EV_COUNT";...
"TFBS_NAME";...
"TFBS_EVIDENCE_COUNT";...
"METHYL27_LOCI";...
"METHYL450_LOCI";...
"CHROMOSOME_36";...
"COORDINATE_36";...
"SNP_ID";...
"SNP_DISTANCE";...
"SNP_MAF";...
"RANDOM_LOCI";...
"MFG_CHANGE_FLAGGED";...
"CHR_HG38";...
"START_HG38";...
"END_HG38";...
"STRAND_HG38";...
"INDEX"];


TABLE_NAMES.NEW( IDX.INTENSITY(end)+1 : end) = INFO;



SUBSidx = 1 : IDX.INTENSITY(end);

SUBNAMES = TABLE_NAMES.ORIGINAL( SUBSidx );

SPACEi = regexp(SUBNAMES,' ');
S = zeros(size(SPACEi));

for i = 1:numel(SUBSidx)

    S(i) = SPACEi{i}(1);

    SN = SUBNAMES{i}(1:S(i)-1);

    TABLE_NAMES.NEW(i) = [TABLE_NAMES.NEW{i} '__' SN];
     
end





VNAMES = string(MMM.Properties.VariableNames');

[LMrows,~] = find(~cellfun(@isempty, regexp(VNAMES,'LM','tokens') ));
[MMrows,~] = find(~cellfun(@isempty, regexp(VNAMES,'MM','tokens') ));
[JKrows,~] = find(~cellfun(@isempty, regexp(VNAMES,'Jurkat','tokens') ));

GROUP_ID = zeros(numel(VNAMES),1);
GROUP_ID(LMrows) = 1;
GROUP_ID(MMrows) = 2;
GROUP_ID(JKrows) = 3;
MMM.Properties.UserData = GROUP_ID;






TABLE_NAMES.NEW(LMrows) = join([repmat('LM_',numel(LMrows),1) TABLE_NAMES.NEW(LMrows)] ,"");
TABLE_NAMES.NEW(MMrows) = join([repmat('MM_',numel(MMrows),1) TABLE_NAMES.NEW(MMrows)] ,"");
TABLE_NAMES.NEW(JKrows) = join([repmat('JK_',numel(JKrows),1) TABLE_NAMES.NEW(JKrows)] ,"");



TABLE_NAMES.NEW(136:144) = [...
    "LM_BETA_MU__RPTW-100"
    "LM_BEADa_AVE__RPTW-100"
    "LM_BEADb_AVE__RPTW-100"
    "LM_BEADa_SEM__RPTW-100"
    "LM_BEADb_SEM__RPTW-100"
    "LM_SIGNALa__RPTW-100"
    "LM_SIGNALb__RPTW-100"
    "LM_DETECTIONp__RPTW-100"
    "LM_INTENSITY__RPTW-100"
];


TABLE_NAMES.NEW(829:837) = [...
    "MM_BETA_MU__RPTW-83"
    "MM_BEADa_AVE__RPTW-83"
    "MM_BEADb_AVE__RPTW-83"
    "MM_BEADa_SEM__RPTW-83"
    "MM_BEADb_SEM__RPTW-83"
    "MM_SIGNALa__RPTW-83"
    "MM_SIGNALb__RPTW-83"
    "MM_DETECTIONp__RPTW-83"
    "MM_INTENSITY__RPTW-83"
];




MMM.Properties.VariableNames = TABLE_NAMES.NEW;


GROUPIDX = IDX;

TINFO = {TABLE_NAMES, GROUPIDX};



%==========================================================================
%% FIND GROUP INDEX LOCATIONS
%==========================================================================
clc; clearvars -except P MMMDAT MMM TINFO



% THIS INFO IS NOW SAVED IN MMM.Properties.UserData
%----------------------------------------------------------------------
% VNAMES = string(MMM.Properties.VariableNames');
% fprintf('MMM.%s\n',VNAMES(4:9:859))
% 
% [LMrows,~] = find(~cellfun(@isempty, regexp(VNAMES,'LM','tokens') ));
% [MMrows,~] = find(~cellfun(@isempty, regexp(VNAMES,'MM','tokens') ));
% [JKrows,~] = find(~cellfun(@isempty, regexp(VNAMES,'Jurkat','tokens') ));
%----------------------------------------------------------------------


% LMcols = MMM.Properties.UserData == 1;
% MMcols = MMM.Properties.UserData == 2;
% JKcols = MMM.Properties.UserData == 3;




%==========================================================================
%% FIND STAT INDEX LOCATIONS
%==========================================================================
clc; clearvars -except P MMMDAT MMM TINFO



% THIS INFO IS NOW SAVED IN MMM.Properties.UserData
%----------------------------------------------------------------------
% VNAMES = string(MMM.Properties.VariableNames');
% fprintf('MMM.%s\n',VNAMES(4:9:859))
% 
% [LMrows,~] = find(~cellfun(@isempty, regexp(VNAMES,'LM','tokens') ));
% [MMrows,~] = find(~cellfun(@isempty, regexp(VNAMES,'MM','tokens') ));
% [JKrows,~] = find(~cellfun(@isempty, regexp(VNAMES,'Jurkat','tokens') ));
% 
% 
% IDX.BETA_AVE    = (1:9:856) + 0;
% IDX.BEADa_AVE   = (1:9:856) + 1;
% IDX.BEADb_AVE   = (1:9:856) + 2;
% IDX.BEADa_SEM   = (1:9:856) + 3;
% IDX.BEADb_SEM   = (1:9:856) + 4;
% IDX.SIGNALa     = (1:9:856) + 5;
% IDX.SIGNALb     = (1:9:856) + 6;
% IDX.DETECTIONp  = (1:9:856) + 7;
% IDX.INTENSITY   = (1:9:856) + 8;
%----------------------------------------------------------------------



LMcols = find(MMM.Properties.UserData == 1);
MMcols = find(MMM.Properties.UserData == 2);
JKcols = find(MMM.Properties.UserData == 3);

idxGSTAT.LMcols = LMcols;
idxGSTAT.MMcols = MMcols;
idxGSTAT.JKcols = JKcols;

idxGSTAT.LM_BETA_AVE = intersect(LMcols,TINFO{2}.BETA_AVE);
idxGSTAT.MM_BETA_AVE = intersect(MMcols,TINFO{2}.BETA_AVE);
idxGSTAT.JK_BETA_AVE = intersect(JKcols,TINFO{2}.BETA_AVE);

idxGSTAT.LM_BEADa_AVE = intersect(LMcols,TINFO{2}.BEADa_AVE);
idxGSTAT.MM_BEADa_AVE = intersect(MMcols,TINFO{2}.BEADa_AVE);
idxGSTAT.JK_BEADa_AVE = intersect(JKcols,TINFO{2}.BEADa_AVE);

idxGSTAT.LM_BEADb_AVE = intersect(LMcols,TINFO{2}.BEADb_AVE);
idxGSTAT.MM_BEADb_AVE = intersect(MMcols,TINFO{2}.BEADb_AVE);
idxGSTAT.JK_BEADb_AVE = intersect(JKcols,TINFO{2}.BEADb_AVE);

idxGSTAT.LM_BEADa_SEM = intersect(LMcols,TINFO{2}.BEADa_SEM);
idxGSTAT.MM_BEADa_SEM = intersect(MMcols,TINFO{2}.BEADa_SEM);
idxGSTAT.JK_BEADa_SEM = intersect(JKcols,TINFO{2}.BEADa_SEM);

idxGSTAT.LM_BEADb_SEM = intersect(LMcols,TINFO{2}.BEADb_SEM);
idxGSTAT.MM_BEADb_SEM = intersect(MMcols,TINFO{2}.BEADb_SEM);
idxGSTAT.JK_BEADb_SEM = intersect(JKcols,TINFO{2}.BEADb_SEM);

idxGSTAT.LM_SIGNALa = intersect(LMcols,TINFO{2}.SIGNALa);
idxGSTAT.MM_SIGNALa = intersect(MMcols,TINFO{2}.SIGNALa);
idxGSTAT.JK_SIGNALa = intersect(JKcols,TINFO{2}.SIGNALa);

idxGSTAT.LM_SIGNALb = intersect(LMcols,TINFO{2}.SIGNALb);
idxGSTAT.MM_SIGNALb = intersect(MMcols,TINFO{2}.SIGNALb);
idxGSTAT.JK_SIGNALb = intersect(JKcols,TINFO{2}.SIGNALb);

idxGSTAT.LM_DETECTIONp = intersect(LMcols,TINFO{2}.DETECTIONp);
idxGSTAT.MM_DETECTIONp = intersect(MMcols,TINFO{2}.DETECTIONp);
idxGSTAT.JK_DETECTIONp = intersect(JKcols,TINFO{2}.DETECTIONp);

idxGSTAT.LM_INTENSITY = intersect(LMcols,TINFO{2}.INTENSITY);
idxGSTAT.MM_INTENSITY = intersect(MMcols,TINFO{2}.INTENSITY);
idxGSTAT.JK_INTENSITY = intersect(JKcols,TINFO{2}.INTENSITY);






%==========================================================================
%% SAVE DATASET
%==========================================================================
clc; clearvars -except P MMMDAT MMM TINFO idxGSTAT


MMMDAT.MMM = MMM;
MMMDAT.TINFO = TINFO;
MMMDAT.idxGSTAT = idxGSTAT;



save([P.mat P.f 'MMM_020_OUTPUT.mat'],'MMMDAT');

%writetable(MMM,[P.desk P.f 'MMM_020_OUTPUT.csv'])









