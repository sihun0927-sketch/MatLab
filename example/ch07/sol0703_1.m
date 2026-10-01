% sol0703_1.m — 7.3 연습문제 1
% 그래프에서 두 점을 골라 두 점 사이 거리와 기울기를 구한다.
% ginput 은 데스크톱에서만 쓸 수 있으므로 -batch 에서는 좌표를 미리 정한다.

clear; clc; close all

x = linspace(-2, 4, 400);
y = x.^3 - 3*x.^2 + 2;

figure
plot(x, y, LineWidth=1.5)
grid on
xlabel('x'); ylabel('y')
title('두 점을 고르시오')

if usejava('desktop')
    [a, b] = ginput(2);         % 정확히 두 점만 받는다
else
    disp('[-batch 모드] 곡선 위 두 점을 골랐다고 가정한다.')
    a = [-1; 3];
    b = interp1(x, y, a);
end

fprintf('점 1 = (%.4f, %.4f)\n', a(1), b(1));
fprintf('점 2 = (%.4f, %.4f)\n', a(2), b(2));

d = hypot(a(2)-a(1), b(2)-b(1));
m = (b(2)-b(1)) / (a(2)-a(1));
c = b(1) - m*a(1);

fprintf('거리   = %.4f\n', d);
fprintf('기울기 = %.4f\n', m);
fprintf('할선   : y = %.4f x %+.4f\n', m, c);

hold on
plot(a, b, 'ro', MarkerFaceColor='r', MarkerSize=8)
plot(x, m*x + c, 'r--', LineWidth=1.2)
hold off
legend('y = x^3 - 3x^2 + 2', '고른 점', ...
    sprintf('할선 (기울기 %.3f)', m), Location='northwest')
title(sprintf('두 점 사이 거리 = %.4f', d))

theme(gcf, "light")        % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../../textbook/ch07/img/sol0703_1.png')
