% sol0501_2.m - 연습문제 5.1.1-2 두 선을 그리는 세 가지 방법
clear; clc; close all

x  = 0:pi/50:4*pi;
y1 = sin(x);
y2 = sin(x)/2;

t = tiledlayout(1, 3);

nexttile                         % (a) hold on
plot(x, y1)
hold on
plot(x, y2)
hold off
title("(a) hold on"), xlabel("x"), ylabel("y"), grid on

nexttile                         % (b) x,y 쌍을 번갈아
plot(x, y1, x, y2)
title("(b) plot(x,y1,x,y2)"), xlabel("x"), ylabel("y"), grid on

nexttile                         % (c) 2차원 배열
Y = [y1; y2];
plot(x, Y)
title("(c) plot(x, [y1;y2])"), xlabel("x"), ylabel("y"), grid on

title(t, "세 방법 모두 같은 그림을 준다")

theme(gcf, "light")
exportgraphics(gcf, "../../textbook/ch05/img/sol0501_2.png")
