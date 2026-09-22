% sol0501_8.m - 연습문제 5.1.3-2 초기속도를 바꾼 탄도 비교
clear; clc; close all

g = 9.81;                        % m/s^2
v = [50 100 150];                % m/s
theta = 0:0.01:pi/2;             % rad

R1 = v(1)^2 / g * sin(2*theta);
R2 = v(2)^2 / g * sin(2*theta);
R3 = v(3)^2 / g * sin(2*theta);

plot(theta, R1, theta, R2, theta, R3, LineWidth=1.2)
title("초기속도에 따른 사거리")
xlabel("발사각 \theta, rad")
ylabel("사거리 R, m")
legend("v_1 = 50 m/s", "v_2 = 100 m/s", "v_3 = 150 m/s", Location="south")
grid on

% 최대 사거리가 나오는 발사각을 찾아 표시한다
[Rmax, idx] = max(R3);
text(theta(idx), Rmax, sprintf("  \\leftarrow 최대 %.0f m at \\theta = %.3f rad", Rmax, theta(idx)))
fprintf("이론값 pi/4 = %.4f rad,  찾은 값 = %.4f rad\n", pi/4, theta(idx));

theme(gcf, "light")
exportgraphics(gcf, "../../textbook/ch05/img/sol0501_8.png")
