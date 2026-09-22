% sol0501_4.m - 연습문제 5.1.2-1 LineSpec 문자열만으로 스타일 지정
clear; clc; close all

x = 0:0.1:2*pi;

plot(x, sin(x), "--rs", x, cos(x), ":k*")
%          |  |        |  |
%          |  사각 마커 |  별 마커
%          빨강 파선     검정 점선
title("LineSpec 문자열로 두 선 스타일 지정")
xlabel("x"), ylabel("y"), grid on
legend("sin(x)  (--rs)", "cos(x)  (:k*)", Location="northeast")

theme(gcf, "light")
exportgraphics(gcf, "../../textbook/ch05/img/sol0501_4.png")
