% sol0723_1.m — 7.2.3 연습문제 1
% 감쇠 진동을 그리고, 계산한 값들을 sprintf 로 제목·축이름·주석에 넣는다.

clear; clc; close all

m = 2; k = 50; c = 1.5;              % 질량, 스프링상수, 감쇠계수
wn = sqrt(k/m);                      % 고유진동수
zeta = c / (2*sqrt(k*m));            % 감쇠비
wd = wn * sqrt(1 - zeta^2);          % 감쇠 고유진동수

t = linspace(0, 10, 500);
x = exp(-zeta*wn*t) .* cos(wd*t);

figure
plot(t, x, LineWidth=1.5)
hold on
plot(t, exp(-zeta*wn*t), 'r--', LineWidth=1)
plot(t, -exp(-zeta*wn*t), 'r--', LineWidth=1)
hold off
grid on

title(sprintf('감쇠 자유진동  (\\zeta = %.4f, \\omega_n = %.3f rad/s)', zeta, wn))
subtitle(sprintf('m = %g kg, k = %g N/m, c = %g N·s/m', m, k, c))
xlabel(sprintf('시간 (s),  주기 T_d = %.4f s', 2*pi/wd))
ylabel('변위 x (m)')
legend('x(t)', sprintf('포락선 e^{-%.4f t}', zeta*wn), Location='northeast')

fprintf('고유진동수   wn = %.4f rad/s\n', wn);
fprintf('감쇠비       zeta = %.4f\n', zeta);
fprintf('감쇠 진동수  wd = %.4f rad/s\n', wd);
fprintf('감쇠 주기    Td = %.4f s\n', 2*pi/wd);

theme(gcf, "light")        % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../../textbook/ch07/img/sol0723_1.png')
