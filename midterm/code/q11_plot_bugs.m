% 문제 11: sin, cos, sin·cos 세 곡선을 한 그래프에 그리고 꾸민다.
clear, clc, clf
x = 0:pi/100:2*pi;
y1 = sin(x);
y2 = cos(x);
Y = [y1; y2];
plot(x, Y)
hold on
plot(x, y1.*y2, "LineWidth" = 2)
legend("sin", "cos")
axis([-1 1 0 2*pi])
title("Trig functions")
xlabel("x, rad") ylabel("value")
text("Peak", pi/2, 1)
