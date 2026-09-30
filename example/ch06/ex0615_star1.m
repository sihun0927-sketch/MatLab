% ex0615_star1.m — nargout 으로 "요청됐을 때만 계산하기" (6.1.5)
% star1 은 항상 그림을 그리고, 출력이 요청된 경우에만 꼭짓점 좌표를 반환한다.

clear; clc; close all

star1                       % 출력을 받지 않으면 nargout 이 0 — A 는 만들어지지 않는다
title('star1: 출력을 받지 않으면 그림만')
close

A = star1();                % 출력을 받으면 nargout 이 1 — 꼭짓점도 돌아온다
title('star1: 출력이 요청되면 꼭짓점도 반환')
fprintf('star1 이 반환한 꼭짓점 행렬 크기: %s\n', mat2str(size(A)));
disp(A)

theme(gcf, "light")        % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../../textbook/ch06/img/ex0615_star1.png')
