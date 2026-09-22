% sol0501_5.m - 연습문제 5.1.2-2 선마다 다른 LineWidth
% Name=Value 는 그 plot 호출의 '모든' 선에 같이 적용된다.
% 따라서 선마다 굵기를 달리하려면 plot 을 나눠 부르고 hold on 으로 겹쳐야 한다.
clear; clc; close all

x = 0:0.1:2*pi;

plot(x, sin(x), "--rs", LineWidth=3)
hold on
plot(x, cos(x), ":k*",  LineWidth=1)
hold off

title("hold on 으로 선마다 다른 굵기")
xlabel("x"), ylabel("y"), grid on
legend("sin(x), LineWidth=3", "cos(x), LineWidth=1")

theme(gcf, "light")
exportgraphics(gcf, "../../textbook/ch05/img/sol0501_5.png")
