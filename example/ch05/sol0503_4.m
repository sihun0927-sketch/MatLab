% sol0503_4.m - 연습문제 5.3.2-2 지수함수는 semilogy 에서 직선
clear; clc; close all

x = 0:0.5:10;
y = 2*exp(0.8*x);

t = tiledlayout(1, 2);

nexttile
plot(x, y)
title("plot - 선형/선형")
xlabel("x"), ylabel("y"), grid on

nexttile
semilogy(x, y)
title("semilogy - 선형/로그")
xlabel("x"), ylabel("y"), grid on

title(t, "y = 2e^{0.8x}")

% 답: y = 2*exp(0.8x) 의 양변에 상용로그를 취하면
%     log10(y) = log10(2) + 0.8*x*log10(e)
%     세로축이 log10(y), 가로축이 x 이므로 기울기 0.8*log10(e) 인 직선이 된다.
b = (log10(y(end)) - log10(y(1))) / (x(end) - x(1));
fprintf("측정한 기울기 = %.4f,  이론값 0.8*log10(e) = %.4f\n", b, 0.8*log10(exp(1)));

theme(gcf, "light")
exportgraphics(gcf, "../../textbook/ch05/img/sol0503_4.png")
