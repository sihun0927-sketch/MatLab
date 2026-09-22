% ex0501_holdstyle.m - 5.1.2 선마다 다른 속성을 주려면 hold on + 여러 plot
clear; clc; close all

x = 1:10;
y = [58.5 63.8 64.2 67.3 71.5 88.3 90.1 90.6 89.5 90.4];

plot(x, y,   LineWidth=2, Marker="o", MarkerSize=10)
hold on
plot(x, y*2, LineWidth=1, Marker="h", MarkerSize=12)
plot(x, y/2, LineWidth=3, Marker="d", MarkerSize=8)
hold off

title("hold on 으로 속성이 다른 세 선 겹치기")
xlabel("x"), ylabel("y"), grid on
legend("y", "2y", "y/2", Location="northwest")

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0501_holdstyle.png")
