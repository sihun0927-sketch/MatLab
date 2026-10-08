% ex0802_mph_table.m — pseudocode 를 주석으로 쓰고 그 사이에 코드를 채운다 (8.2)
%
% 1단계 pseudocode (주석만 먼저 쓴다)
%   Define a vector of mph values
%   Convert mph to ft/s
%   Combine the mph and ft/s vectors into a chart
%   Create a chart title
%   Create column headings
%   Display the chart

clear; clc

%% Define a vector of mph values
mph = 0:10:100;

%% Convert mph to ft/s  (1 mile = 5280 ft, 1 h = 3600 s)
fps = mph * 5280 / 3600;

%% Combine the mph and ft/s vectors into a chart
chart = [mph; fps];         % 행으로 쌓아야 fprintf 가 열 순서로 짝을 맞춰 읽는다

%% Create a chart title
disp("Velocity Conversion Table")

%% Create column headings
disp("     mph      f/s")

%% Display the chart
fprintf("%8.0f %8.2f\n", chart)
