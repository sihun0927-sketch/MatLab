% sol0501_6.m - 연습문제 5.1.2-3 "b" / "bo" / "o" 의 차이
clear; clc; close all

x = 1:10;
y = [58.5 63.8 64.2 67.3 71.5 88.3 90.1 90.6 89.5 90.4];

t = tiledlayout(1, 3);

nexttile
plot(x, y, "b")                  % 색만 지정 -> 파란 실선, 마커 없음
title("""b"" : 파란 실선"), xlabel("x"), ylabel("y"), grid on

nexttile
plot(x, y, "bo")                 % 색 + 마커, 선 문자 없음 -> 마커만
title("""bo"" : 파란 원 마커만"), xlabel("x"), ylabel("y"), grid on

nexttile
plot(x, y, "o")                  % 마커만 지정 -> 색은 기본값
title("""o"" : 기본색 원 마커만"), xlabel("x"), ylabel("y"), grid on

title(t, "선 문자를 빼면 선이 사라진다")

theme(gcf, "light")
exportgraphics(gcf, "../../textbook/ch05/img/sol0501_6.png")
