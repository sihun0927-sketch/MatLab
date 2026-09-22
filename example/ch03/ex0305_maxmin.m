% ex0305_maxmin.m
% 3.5.1 최댓값과 최솟값 (Table 3.5)
clear; clc

x = [1 5 3
     2 4 6];

% 기본은 열 단위(column dominant)
disp("max(x)    = " + join(string(max(x)), "  "))
disp("min(x)    = " + join(string(min(x)), "  "))

% 행 단위로 보려면 전치하거나 차원을 지정한다
disp("max(x')   = " + join(string(max(x')), "  "))
disp("max(x,[],2) = " + join(string(max(x,[],2)'), "  "))

% 출력을 두 개 받으면 [값, 위치]
[a, b] = max(x);
disp("값   a = " + join(string(a), "  "))
disp("위치 b = " + join(string(b), "  "))

% 입력을 두 개 주면 원소별 비교 (크기가 같아야 한다)
y = [10 2 4
      1 8 7];
mxy = max(x,y);
disp("max(x,y) 1행 = " + join(string(mxy(1,:)), "  "))
disp("max(x,y) 2행 = " + join(string(mxy(2,:)), "  "))

% 벡터 전체의 최댓값과 그 위치
v = [1 5 3];
[vmax, vloc] = max(v);
fprintf("v 의 최댓값 %g, 위치 %d\n", vmax, vloc)
