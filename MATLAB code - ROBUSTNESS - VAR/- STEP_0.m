%% STEP 0: FORECASTING REGRESSION
% EXPLANATORY variable (t)
% DEPENDENT variable (t+3 = 3 months ahead)                                                                                    

load('INPUT.mat', 'X', 'Time', 'Mnem')

% DEPENDENT VARIABLE: AOECD_WIP(t+3)
YY = X(4:end, 1);

% PREDICTOR 1: VXO_spliced(t)
X1 = X(1:end-3, 2);
mdl = fitlm(X1, YY)

% PREDICTOR 2: EFFR+SFFR(t)
X2 = X(1:end-3, 3);
mdl = fitlm(X2, YY)

% PREDICTOR 3: WTISPLC(t)
X3 = X(1:end-3, 4);
mdl = fitlm(X3, YY)

% PREDICTOR 4: OSS(t)
X4 = X(1:end-3, 5);
mdl = fitlm(X4, YY)

% PREDICTOR 5: OCDS(t)
X5 = X(1:end-3, 6);
mdl = fitlm(X5, YY)

% PREDICTOR 6: OIDS(t)
X6 = X(1:end-3, 7);
mdl = fitlm(X6, YY)

% PREDICTOR 7: RCPF(t)
X7 = X(1:end-3, 8);
mdl = fitlm(X7, YY)

% PREDICTOR 8: EBP(t)
X8 = X(1:end-3, 9);
mdl = fitlm(X8, YY)

% PREDICTOR 9: T10Y2YM(t)
X9 = X(1:end-3, 10);
mdl = fitlm(X9, YY)

% SIGNIFICANT PREDICTORS at 10% significance level (3 months ahead):
% - VXO_spliced 
% - WTISPLC *
% - OSS
% - OCDS
% - RCPF *
% - EBP *

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% EXPLANATORY variable (t)
% DEPENDENT variable (t+12 = 12 months ahead)                                                                                    

% DEPENDENT VARIABLE: AOECD_WIP(t+12)
YYY = X(13:end, 1);

% PREDICTOR 1: VXO_spliced(t)
XX1 = X(1:end-12, 2);
mdl = fitlm(XX1, YYY)

% PREDICTOR 2: EFFR+SFFR(t)
XX2 = X(1:end-12, 3);
mdl = fitlm(XX2, YYY)

% PREDICTOR 3: WTISPLC(t)
XX3 = X(1:end-12, 4);
mdl = fitlm(XX3, YYY)

% PREDICTOR 4: OSS(t)
XX4 = X(1:end-12, 5);
mdl = fitlm(XX4, YYY)

% PREDICTOR 5: OCDS(t)
XX5 = X(1:end-12, 6);
mdl = fitlm(XX5, YYY)

% PREDICTOR 6: OIDS(t)
XX6 = X(1:end-12, 7);
mdl = fitlm(XX6, YYY)

% PREDICTOR 7: RCPF(t)
XX7 = X(1:end-12, 8);
mdl = fitlm(XX7, YYY)

% PREDICTOR 8: EBP(t)
XX8 = X(1:end-12, 9);
mdl = fitlm(XX8, YYY)

% PREDICTOR 9: T10Y2YM(t)
XX9 = X(1:end-12, 10);
mdl = fitlm(XX9, YYY)

% SIGNIFICANT PREDICTORS at 10% significance level (12 months ahead): 
% - EFFR+SFFR
% - WTISPLC *
% - RCPF *
% - EBP *
% - T10Y2YM

clear