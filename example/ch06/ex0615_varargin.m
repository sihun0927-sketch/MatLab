% ex0615_varargin.m — 함수 안에서의 nargin / nargout, varargin / varargout (6.1.5)

clear; clc; close all

% varargin: 입력 개수가 정해지지 않은 함수
fprintf('sumall(1, 2, 3)        = %g\n', sumall(1, 2, 3));
fprintf('sumall(1:10)           = %g\n', sumall(1:10));
fprintf('sumall(1:10, [1 2; 3 4]) = %g\n', sumall(1:10, [1 2; 3 4]));

% varargout: 요청한 출력 개수만큼만 계산한다
v = [4 -2 9 1];
m1            = minmax(v);
[m2, M2]      = minmax(v);
[m3, M3, rng] = minmax(v);
fprintf('출력 1개: %g\n',            m1);
fprintf('출력 2개: %g, %g\n',        m2, M2);
fprintf('출력 3개: %g, %g, %g\n',    m3, M3, rng);

% nargout 으로 "요청됐을 때만 계산" — star1
A = star1();
title('star1: 출력이 요청되면 꼭짓점도 반환')
fprintf('star1 이 반환한 꼭짓점 행렬 크기: %s\n', mat2str(size(A)));
theme(gcf, "light")        % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../../textbook/ch06/img/ex0615_star1.png')
