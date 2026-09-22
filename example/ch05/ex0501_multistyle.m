% ex0501_multistyle.m - 5.1.2 선마다 다른 LineSpec 을 주기
% 각 (x, y) 쌍 뒤에 문자열을 붙인다. 생략하면 기본값이 쓰인다.
clear; clc; close all

x = 1:10;
y = [58.5 63.8 64.2 67.3 71.5 88.3 90.1 90.6 89.5 90.4];

plot(x, y, ":ok", x, y*2, "--xr", x, y/2, "-b")
title("선마다 다른 스타일")
xlabel("x"), ylabel("y"), grid on
legend("y  (:ok)", "2y  (--xr)", "y/2  (-b)", Location="northwest")

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0501_multistyle.png")
