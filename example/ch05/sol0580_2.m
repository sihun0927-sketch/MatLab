% sol0580_2.m - 5.8 연습문제 2
% 표에 없던 플롯도 도움말에서 찾아 쓸 수 있다: bubblechart와 imagesc.

clear; clc; close all

x  = 1 : 10;
y  = [3 5 2 8 6 7 4 9 5 6];
sz = [2 4 1 6 3 5 2 7 3 4];         % 버블 크기로 쓸 세 번째 변수

t = tiledlayout(1,2);

nexttile
bubblechart(x, y, sz)
xlabel("x"); ylabel("y"); title("bubblechart")

nexttile
imagesc(magic(8))                   % 행렬 값을 색으로
colorbar
title("imagesc(magic(8))")
axis equal tight
