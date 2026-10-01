% ex0723_sprintf_title.m — sprintf 로 그래프 제목과 주석 만들기 (7.2.3)
% title, xlabel, text 는 모두 문자열을 받는다.
% 계산 결과를 제목에 넣어야 할 때 sprintf 가 제격이다.

clear; clc; close all

x = linspace(0, 2*pi, 200);
k = 1.7;
y = exp(-0.2*x) .* sin(k*x);

[ymax, idx] = max(y);
xmax = x(idx);
area = trapz(x, y);

figure
plot(x, y, LineWidth=1.5)
hold on
plot(xmax, ymax, 'ro', MarkerFaceColor='r')
hold off
grid on

% 계산값을 그대로 제목에 박아 넣는다
title(sprintf('y = e^{-0.2x} sin(%.1f x),   최댓값 %.4f', k, ymax))
xlabel('x')
ylabel('y')
subtitle(sprintf('0 부터 2\\pi 까지의 적분 = %.5f', area))

% text 주석에도 같은 방법
text(xmax, ymax, sprintf('  (%.3f, %.3f)', xmax, ymax), VerticalAlignment='bottom')

% 범례에도 쓸 수 있다
legend(sprintf('k = %.1f', k), '최댓값', Location='northeast')

fprintf('최댓값 %.4f (x = %.4f), 적분 %.5f\n', ymax, xmax, area);

theme(gcf, "light")        % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../../textbook/ch07/img/ex0723_sprintf_title.png')
