%% Plot raw data, create scatterplots for univariate quantile regressions
% This script produces charts for the descriptive analysis presented in the
% following figures:
% - Figure 2. Raw Data.

% From the replication files for:
% Tobias Adrian, Nina Boyarchenko, and Domenico Giannone (2018):
% "Vulnerable Growth," American Economic Review.

%% Clear workspace, set file paths and graphics settings
clear
close all
clc

set(0, 'defaultAxesFontName', 'Times');
set(0, 'DefaultAxesFontSize', 12)
set(0, 'defaultAxesLineStyleOrder', '-|--|:', 'defaultLineLineWidth', 1)
setappdata(0, 'defaultAxesXTickFontSize', 1)
setappdata(0, 'defaultAxesYTickFontSize', 1)

%% Load data and fix forecast settings
load('INPUT.mat', 'X', 'Time', 'Mnem')

%% Figure 2: Raw Data (OECD+6NME IP)
f = figure;
ax = gca;

plot(Time, X(:, strcmp(Mnem, 'AOECD_WIP')))
ax.YColor = 'k';
ylabel('OECD+6NME IP YOY growth');
datetick('x', 'yyyy')

legend('OECD+6NME IP', 'Location', 'NorthWest')
filename = 'OECDWIP.pdf';
printpdf(f, filename);
saveas(f, filename);
clear('f', 'filename')

clear