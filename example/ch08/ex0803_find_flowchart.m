% ex0803_find_flowchart.m — flowchart/pseudocode 로 계획한 find 예제 (8.3.1)

clear; clc

% Define a vector of x-values
x = [1, 2, 3; 10, 5, 1; 12, 3, 2; 8, 3, 1]

% Find the index numbers where x > 9
index = find(x > 9)

% Use the index numbers to find the x-values greater than 9
% by plugging them into x
values = x(index)

% Create an output table
disp("Elements greater than 9")
disp(table(index, values, VariableNames=["Index Number", "X Value"]))
