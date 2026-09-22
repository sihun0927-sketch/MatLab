% ex0503_semilog.m - 5.3.2 같은 데이터를 네 가지 축 눈금으로 그리기
% plot / semilogx / semilogy / loglog
clear; clc; close all

x = 0:0.5:50;
y = 5*x.^2;

t = tiledlayout("flow");

nexttile
plot(x, y)
title("Polynomial - linear/linear")
ylabel("y-axis"), grid

nexttile
semilogx(x, y)                   % x 축만 로그
title("Polynomial - log/linear")
ylabel("y-axis"), grid

nexttile
semilogy(x, y)                   % y 축만 로그
title("Polynomial - linear/log")
xlabel("x-axis"), ylabel("y-axis"), grid

nexttile
loglog(x, y)                     % 두 축 모두 로그
title("Polynomial - log/log")
xlabel("x-axis"), ylabel("y-axis"), grid

m = ["A Polynomial Plotted"; "Using Multiple Graphing Strategies"];
title(t, m)

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0503_semilog.png")
