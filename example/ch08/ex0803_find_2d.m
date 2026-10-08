% ex0803_find_2d.m — 2차원 배열에서 find: single index vs [row, col] (8.3.1)

clear; clc

temp = [ 95.3, 100.2, 98.6;
         97.4,  99.2, 98.9;
        100.1,  99.3, 97.0];

%% 출력이 하나면 single-element(선형) 인덱스 — 열 우선으로 센다
index = find(temp > 98.6);      % 5x1 열 벡터
index'                          % 3 4 5 6 8
temp(index)'                    % 100.1 100.2 99.2 99.3 98.9

%% 출력이 둘이면 행 번호와 열 번호를 따로 준다
[row, col] = find(temp > 98.6);
disp(table(index, row, col, temp(index), ...
     VariableNames=["index", "row", "col", "temp"]))

%% 두 방식은 sub2ind / ind2sub 로 서로 바꿀 수 있다
isequal(index, sub2ind(size(temp), row, col))   % 1
