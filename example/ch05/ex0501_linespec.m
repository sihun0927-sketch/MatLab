% ex0501_linespec.m - 5.1.2 LineSpec 문자열로 선/색/마커 지정
% 문자열 하나에 선 스타일, 색, 마커 문자를 순서 상관없이 섞어 쓴다.
clear; clc; close all

x = 1:10;
y = [58.5 63.8 64.2 67.3 71.5 88.3 90.1 90.6 89.5 90.4];

t = tiledlayout(1, 2);

nexttile
plot(x, y, ":ok")                % : 점선, o 원 마커, k 검정
title("plot(x, y, "":ok"")")
xlabel("x"), ylabel("y"), grid on

nexttile
plot(x, y, ":oblack")            % 색 이름을 전부 적어도 같은 결과
title("plot(x, y, "":oblack"")")
xlabel("x"), ylabel("y"), grid on

title(t, "약어 색 이름과 전체 색 이름은 같은 결과를 준다")

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0501_linespec.png")
