% ex0305_arraysize.m
% 3.5.5 배열 크기 함수 (Table 3.10)
clear; clc

x = [1 5 3
     2 4 6];

disp("size(x)   = " + join(string(size(x)), "  "))

[a, b] = size(x);
fprintf("행 a = %d, 열 b = %d\n", a, b)

fprintf("height(x) = %d   (= size(x,1))\n", height(x))
fprintf("width(x)  = %d   (= size(x,2))\n", width(x))
fprintf("length(x) = %d   (가장 큰 차원)\n", length(x))
fprintf("numel(x)  = %d   (전체 원소 수)\n", numel(x))

% 빈 배열에서 length 와 numel 의 차이
e = [];
fprintf("빈 배열: length=%d, numel=%d, size=[%d %d]\n", ...
        length(e), numel(e), size(e,1), size(e,2))
