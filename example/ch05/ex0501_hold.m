% ex0501_hold.m - 5.1.1 hold on 으로 같은 축에 선을 겹쳐 그린다
clear; clc; close all

x = 0:pi/100:2*pi;
y1 = cos(4*x);
y2 = sin(x);

plot(x, y1)
hold on                          % 다음 plot 이 기존 그림을 지우지 않는다
plot(x, y2)
hold off                         % 반드시 짝을 맞춰 꺼 준다

title("hold on 으로 겹쳐 그린 두 곡선")
xlabel("x"), ylabel("y"), grid on
legend("cos(4x)", "sin(x)")

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0501_hold.png")
