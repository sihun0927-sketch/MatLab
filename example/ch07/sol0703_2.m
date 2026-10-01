% sol0703_2.m — 7.3 연습문제 2
% 그래프에서 점을 몇 개 찍어 그 점들에 다항식을 맞춘다.
% ginput 으로 "손으로 찍은 자료"를 만들고 polyfit 으로 곡선을 얻는 패턴이다.

clear; clc; close all

figure
axis([0 10 0 100])
grid on
xlabel('x'); ylabel('y')
title('점을 찍으시오 (Enter 로 종료)')
hold on

if usejava('desktop')
    [a, b] = ginput;            % 개수 제한 없이
else
    disp('[-batch 모드] 점 여섯 개를 찍었다고 가정한다.')
    a = [1; 2.5; 4; 5.5; 7; 9];
    b = [5; 18; 33; 52; 70; 92];
end

fprintf('찍은 점 %d 개\n', numel(a));
fprintf('  (%5.2f, %6.2f)\n', [a'; b']);

if numel(a) < 3
    error('2 차 다항식을 맞추려면 점이 셋 이상 필요하다.');
end

p = polyfit(a, b, 2);
fprintf('\n2 차 맞춤: y = %.4f x^2 %+.4f x %+.4f\n', p(1), p(2), p(3));

xf = linspace(min(a), max(a), 200);
yf = polyval(p, xf);

% 결정계수 R^2 로 맞춤 정도를 본다
resid = b - polyval(p, a);
R2 = 1 - sum(resid.^2) / sum((b - mean(b)).^2);
fprintf('R^2 = %.6f\n', R2);

plot(a, b, 'ro', MarkerFaceColor='r', MarkerSize=8)
plot(xf, yf, 'b-', LineWidth=1.5)
hold off
legend('고른 점', sprintf('2 차 맞춤 (R^2 = %.4f)', R2), Location='northwest')
title(sprintf('y = %.3f x^2 %+.3f x %+.3f', p(1), p(2), p(3)))

theme(gcf, "light")        % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../../textbook/ch07/img/sol0703_2.png')
