% sol0502_1.m - 연습문제 5.2-1 2x2 격자에 삼각함수 네 개
clear; clc; close all

x = 0:0.1:2*pi;

t = tiledlayout(2, 2);

nexttile
plot(x, sin(x))
title("sin(x)"), xlabel("x, rad"), ylabel("y"), grid on

nexttile
plot(x, cos(x))
title("cos(x)"), xlabel("x, rad"), ylabel("y"), grid on

nexttile
plot(x, tan(x))
ylim([-5 5])                     % tan 은 발산하므로 범위를 잘라야 읽을 수 있다
title("tan(x)"), xlabel("x, rad"), ylabel("y"), grid on

nexttile
plot(x, sin(x).*cos(x))
title("sin(x)cos(x)"), xlabel("x, rad"), ylabel("y"), grid on

title(t, "삼각함수 네 가지")

theme(gcf, "light")
exportgraphics(gcf, "../../textbook/ch05/img/sol0502_1.png")
