% sol0604_1.m — 6.4 연습문제 1
% anonymous function 세 개를 만들어 쓴다.

clear; clc

deg2radf = @(d) d * pi / 180;                   % 도 → 라디안
circ     = @(r) 2 * pi * r;                     % 원의 둘레
dist2    = @(x1, y1, x2, y2) hypot(x2-x1, y2-y1);  % 두 점 사이 거리

fprintf('deg2radf(180)          = %.6f\n', deg2radf(180));
fprintf('circ([1 2 3])          = %s\n',   mat2str(circ([1 2 3]), 6));
fprintf('dist2(0, 0, 3, 4)      = %g\n',   dist2(0, 0, 3, 4));

% workspace 에 function_handle 로 올라간다
disp('workspace:')
whos deg2radf circ dist2

% 정의 확인
disp(['circ 의 정의: ' func2str(circ)])
