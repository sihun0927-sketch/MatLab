% ex0535_yyaxis.m
% 5.3.5 Graphs with Two y-Axes
% 크기가 크게 다른 두 데이터를 같은 축에 그렸을 때와 yyaxis로 나눴을 때를 비교한다.

clear; clc; close all

x  = linspace(0, 2*pi, 41);
y1 = sin(x);        % -1 ~ 1
y2 = exp(x);        % 1 ~ 500 이상

t = tiledlayout(2,2);
title(t, "Two Data Sets with Different Magnitudes")

nexttile
plot(x, y1)
title("Trigonometric Function")
xlabel("Angle in Radians"); ylabel("sin(x)")

nexttile
plot(x, y2)
title("Exponential Function")
xlabel("Angle in Radians"); ylabel("e^x")

nexttile
plot(x, y1, x, y2)      % 같은 축 - y1의 정보가 사라진다
title("Function Comparisons")
xlabel("Angle in Radians"); ylabel("f(x)")

nexttile
yyaxis left             % 기본값이므로 생략해도 된다
plot(x, y1)
xlabel("Angle in Radians"); ylabel("sin(x)")
yyaxis right
plot(x, y2)
ylabel("e^x")
title("Using yyaxis")

theme(gcf, "light")   % 문서용 밝은 테마 (5.7절 참고)
exportgraphics(gcf, "../../textbook/ch05/img/ex0535_yyaxis.png")
