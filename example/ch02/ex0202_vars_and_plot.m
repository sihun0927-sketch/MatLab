%% 2.2 MATLAB Windows - Workspace 변수와 Graphics Window 예제

% Workspace Window: 스칼라, 벡터, 2차원 배열 정의
A = 5;
B = [1, 2, 3, 4];
C = [1 2 3 4; 10 20 30 40; 5 10 15 20];

disp(A)
disp(B)
disp(C)

%% Graphics Window: 라벨을 갖춘 x-y 그래프
x = [1 2 3 4 5];
y = [10, 20, 30, 40, 50];

figure
plot(x, y, "-o", LineWidth=1.5, MarkerFaceColor="auto")
title("Example Graph: Sensor Reading vs. Time")
xlabel("Time (s)")
ylabel("Reading (mV)")
grid on

exportgraphics(gcf, "../../textbook/ch02/img/ex0202_vars_and_plot.png")
