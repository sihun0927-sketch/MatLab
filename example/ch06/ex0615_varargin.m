% ex0615_varargin.m — varargin / varargout (6.1.5)
% 개수가 정해지지 않은 입력과 출력을 다루는 방법.

clear; clc

% varargin: 입력 개수가 정해지지 않은 함수
fprintf('sumall(1, 2, 3)          = %g\n', sumall(1, 2, 3));
fprintf('sumall(1:10)             = %g\n', sumall(1:10));
fprintf('sumall(1:10, [1 2; 3 4]) = %g\n', sumall(1:10, [1 2; 3 4]));

% varargout: 요청한 출력 개수만큼만 계산한다
v = [4 -2 9 1];
m1            = myminmax(v);
[m2, M2]      = myminmax(v);
[m3, M3, rng] = myminmax(v);
fprintf('출력 1개: %g\n',         m1);
fprintf('출력 2개: %g, %g\n',     m2, M2);
fprintf('출력 3개: %g, %g, %g\n', m3, M3, rng);

% varargin 은 cell array 다 — 중괄호로 꺼낸다
fprintf('nargin(''sumall'') = %d  (음수 = 가변 입력)\n', nargin('sumall'));
