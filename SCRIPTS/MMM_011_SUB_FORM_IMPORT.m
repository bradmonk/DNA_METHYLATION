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



MMMDAT = load([P.mat P.f 'MMM_010_OUTPUT.mat']);





%==========================================================================
%% LOAD DATASET
%==========================================================================
clc; clearvars -except P MMMDAT



P.file = [P.csv '/Sample_Submission_Form_20200909.xlsx'];
SAMPLE_INFO = readtable(P.file,'Sheet','ML_SAMPLE_INFO');
SAMPLE_INFO = convertvars(SAMPLE_INFO,@iscell,'string');
SAMPLE_INFO.YIELD = round(SAMPLE_INFO.YIELD,0);



P.file = [P.csv '/Sample_Submission_Form_20200909.xlsx'];
DNA_ISO_DATA = readtable(P.file,'Sheet','ML_DNA_ISO_DATA');
DNA_ISO_DATA = convertvars(DNA_ISO_DATA,@iscell,'string');


MMMDAT.SAMPLE_INFO = SAMPLE_INFO;
MMMDAT.DNA_ISO_DATA = DNA_ISO_DATA;



%==========================================================================
%% SAVE DATASET
%==========================================================================
clc; clearvars -except P MMMDAT


save([P.mat P.f 'MMM_011_OUTPUT.mat'],'MMMDAT');

%writetable(MMM,[P.desk P.f 'MMM_010_OUTPUT.csv'])










