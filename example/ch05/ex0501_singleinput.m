% ex0501_singleinput.m - 5.1.1 입력이 하나면 x 축은 인덱스 번호가 된다
clear; clc; close all

x  = 0:pi/100:2*pi;              % 201개 원소
x1 = sin(x);

plot(x1)                         % x 를 주지 않았다 -> x 축은 1..201
title("Graphs with a Single Input")
xlabel("Vector Index Number")
ylabel("sin(x)")
grid on

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0501_singleinput.png")
