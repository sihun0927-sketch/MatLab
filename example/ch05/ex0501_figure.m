% ex0501_figure.m - 5.1.1 figure 로 창을 나눠 쓰기, clf 는 활성 창만 지운다
clear; clc; close all

x = 0:0.1:2*pi;

figure(1)                        % Figure 1 을 만들고 활성 창으로 삼는다
plot(x, sin(x))
title("Figure 1: sin(x)")
xlabel("x"), ylabel("sin(x)"), grid on

figure(2)                        % 새 창. 여기서부터 plot 은 Figure 2 에 그려진다
plot(x, cos(x))
title("Figure 2: cos(x)")
xlabel("x"), ylabel("cos(x)"), grid on

theme(figure(1), "light"), theme(figure(2), "light")
exportgraphics(figure(1), "../../textbook/ch05/img/ex0501_figure1.png")
exportgraphics(figure(2), "../../textbook/ch05/img/ex0501_figure2.png")

clf                              % 활성 창(Figure 2)만 비운다. Figure 1 은 그대로
disp("clf 후 Figure 2 의 자식 개수: " + numel(get(figure(2), "Children")))
disp("clf 후 Figure 1 의 자식 개수: " + numel(get(figure(1), "Children")))

close all                        % 열린 figure 창을 모두 닫는다
