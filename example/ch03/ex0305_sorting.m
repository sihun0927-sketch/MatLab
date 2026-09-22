% ex0305_sorting.m
% 3.5.4 정렬 (Table 3.8)
clear; clc

x = [ 1 3
     10 2
      3 1
     82 4
      5 5];

disp("sort(x) - 열마다 독립적으로 정렬되어 행 정보가 깨진다")
disp(sort(x))

disp("sort(x,'descend')")
disp(sort(x, "descend"))

disp("sortrows(x,1) - 1열 기준, 행을 통째로 옮긴다")
disp(sortrows(x, 1))

disp("sortrows(x,2) - 2열 기준")
disp(sortrows(x, 2))

disp("sortrows(x,-1) - 1열 기준 내림차순")
disp(sortrows(x, -1))

% 정렬 후 원래 위치를 알고 싶으면 두 번째 출력을 받는다
v = [82 5 10 1 3];
[sorted, idx] = sort(v);
disp("sorted = " + join(string(sorted), "  "))
disp("idx    = " + join(string(idx), "  "))
