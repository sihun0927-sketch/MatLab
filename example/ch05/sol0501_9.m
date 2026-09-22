% sol0501_9.m - 연습문제 5.1.3-3 아래 첨자에서 중괄호의 역할
clear; clc; close all

x = 0:0.1:2*pi;
plot(x, sin(x))
title("A_max 와 A_{max}")
xlabel("x"), ylabel("sin(x)"), grid on

% 답: TeX 에서 _ 는 '바로 다음 글자 하나'만 아래 첨자로 만든다.
%     A_max  -> A 아래에 m 만 붙고 'ax' 는 본문 크기로 따라 나온다.
%     A_{max} -> 중괄호가 max 를 한 덩어리로 묶어 전체가 아래 첨자가 된다.
%     위 첨자 ^ 도 규칙이 같다.

theme(gcf, "light")
exportgraphics(gcf, "../../textbook/ch05/img/sol0501_9.png")
