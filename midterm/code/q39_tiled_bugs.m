% 문제 39: 2x2 타일 배치. 위 행 왼쪽은 sin, 위 행 오른쪽은 cos(두 칸 폭),
%          아래 행에는 극좌표 그래프와 로그 y축 그래프. 전체 제목 "Trig layout".
clear, clc, clf
x = 0:pi/20:2*pi;
t = tiledlayout(2, 2)
nexttile
plot(x, sin(x)), title("sin")
nexttile(2, [1 2])
plot(x, cos(x)), title("cos")
nexttile
polarplot(1 + cos(x), x), title("polar")
nexttile
semilogy(x, exp(x)), title("log y")
title("Trig layout")
