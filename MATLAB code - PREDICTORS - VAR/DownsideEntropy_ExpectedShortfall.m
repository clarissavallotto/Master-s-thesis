%% Clear workspace, set graphics/estimation settings
clear
close all
clc

set(0, 'defaultAxesFontName', 'Times');
set(0, 'DefaultAxesFontSize', 12)
set(0, 'defaultAxesLineStyleOrder', '-|--|:', 'defaultLineLineWidth', 1)
setappdata(0, 'defaultAxesXTickFontSize', 1)
setappdata(0, 'defaultAxesYTickFontSize', 1)

% Load data 
load('INPUT.mat', 'X', 'Time', 'Mnem')

Time = datenum(Time);

% load DOWNSIDE ENTROPY and EXPECTED SHORTFALL of each significant predictor 

% at one-quarter horizon
load('DE_ES_VXOspliced_3M.mat')
load('DE_ES_WTISPLC_3M.mat')
load('DE_ES_OSS_3M.mat')
load('DE_ES_RCPF_3M.mat')
load('DE_ES_EBP_3M.mat')

% at one-year horizon
load('DE_ES_EFFRSFFR_12M.mat')
load('DE_ES_WTISPLC_12M.mat')
load('DE_ES_RCPF_12M.mat')
load('DE_ES_EBP_12M.mat')
load('DE_ES_T10Y2YM_12M.mat')

%% Plot DOWNSIDE ENTROPY of significant predictors 

% at one-quarter horizon
    f = figure;
    set(f, 'Position', [100, 100, 850, 625]);
    hold on
    plot(Time, DE_VXOspliced_3M, '-');
    hold on
    plot(Time, DE_RCPF_3M, '--');
    hold off
    legend('VXO spliced', 'Real Commodity Price Factor', 'Location', 'NorthWest')
    ylabel('Relative Downside Entropy')
    datetick('x', 'yyyy')
    xlim([Time(1), Time(end)])
    ylim([-0.3, 3.6])
    yticks(-0.3:0.3:3.6)
    box on
    filename = 'DownsideEntropy_H3.pdf';
    printpdf(f, filename);
    saveas(f, filename);
    clear('f', 'filename')

% at one-year horizon
    f = figure;
    set(gcf, 'Position', [100, 100, 850, 625]);
    hold on
    plot(Time, DE_WTISPLC_12M, '-k');
    hold on
    plot(Time, DE_EBP_12M, '--r');
    hold off
    legend('WTI', 'Excess Bond Premium', 'Location', 'NorthWest')
    ylabel('Relative Downside Entropy')
    datetick('x', 'yyyy')
    xlim([Time(1), Time(end)])
    ylim([-0.3, 4.2])
    yticks(-0.3:0.3:4.2)
    box on
    filename = 'DownsideEntropy_H12.pdf';
    printpdf(f, filename);
    saveas(f, filename);
    clear('f', 'filename')

%% Plot EXPECTED SHORTFALL of significant predictors 

% at one-quarter horizon
    f = figure;
    set(gcf, 'Position', [100, 100, 850, 625]);
    hold on
    plot(Time, ES_VXOspliced_3M, '-');
    hold on
    plot(Time, ES_RCPF_3M, '--');
    hold off
    legend('VXO spliced', 'Real Commodity Price Factor', 'Location', 'SouthWest')
    ylabel('Expected Shortfall')
    datetick('x', 'yyyy')
    xlim([Time(1), Time(end)])
    ylim([-21, 9])
    yticks(-21:3:9)
    box on
    filename = 'ExpectedShortfall_H3.pdf';
    printpdf(f, filename);
    saveas(f, filename);
    clear('f', 'filename')

% at one-year horizon
    f = figure;
    set(gcf, 'Position', [10, 10, 850, 625]);
    hold on
    plot(Time, ES_WTISPLC_12M, '-k');
    hold on
    plot(Time, ES_EBP_12M, '--r');
    hold off
    legend('WTI', 'Excess Bond Premium', 'Location', 'SouthWest')
    ylabel('Expected Shortfall')
    datetick('x', 'yyyy')
    xlim([Time(1), Time(end)])
    ylim([-24, 6])
    yticks(-24:3:6)
    box on
    filename = 'ExpectedShortfall_H12.pdf';
    printpdf(f, filename);
    saveas(f, filename);
    clear('f', 'filename')

clear