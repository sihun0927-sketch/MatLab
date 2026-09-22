% sol0501_3.m - 연습문제 5.1.1-3 plot(A) 는 열마다 한 선
clear; clc; close all

A = [1 2 3; 4 5 6];              % 2 x 3
fprintf("size(A) = %d x %d\n", size(A, 1), size(A, 2));

plot(A, "-o")
title("plot(A),  A = [1 2 3; 4 5 6]")
xlabel("행 인덱스 (1, 2)")
ylabel("값")
legend("1열: [1;4]", "2열: [2;5]", "3열: [3;6]", Location="northwest")
grid on

% 답: 열이 3개이므로 선 3개. 각 선은 행 수만큼, 즉 점 2개를 갖는다.
%     x 를 주지 않았으므로 x 축은 행 인덱스 1, 2 가 된다.
fprintf("선 %d개, 각 선의 점 %d개\n", size(A, 2), size(A, 1));

theme(gcf, "light")
exportgraphics(gcf, "../../textbook/ch05/img/sol0501_3.png")
