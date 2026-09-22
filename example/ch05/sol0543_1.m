% sol0543_1.m - 5.4.3 연습문제 1
% peaks 데이터를 등고선 20개로 그리고 등고선 값을 표시한다.

clear; clc; close all

[x, y, z] = peaks;

contour(x, y, z, 20, ShowText=true)
xlabel("x"); ylabel("y")
title("Labeled Contour Plot of peaks")
colorbar
