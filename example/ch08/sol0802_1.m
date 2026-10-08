% sol0802_1.m — 8.2 연습문제 1: pseudocode → 주석 → 코드 (섭씨 → 화씨 표)

clear; clc

%% Define a vector of Celsius values
C = 0:20:100;

%% Convert Celsius to Fahrenheit
F = 9/5 * C + 32;

%% Combine the vectors into a chart (행으로 쌓는다)
chart = [C; F];

%% Create a chart title
disp("Temperature Conversion Table")

%% Create column headings
disp("      °C       °F")

%% Display the chart
fprintf("%8.0f %8.1f\n", chart)
