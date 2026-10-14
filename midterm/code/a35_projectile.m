% 정답 35: 의사코드 → 코드. 발사각에 따른 사거리와 주석 달린 그래프
clear, clc, clf
% 1. 입력 변수 정의 (g, v, 각도 벡터)
g = 9.8; v = 110;
theta = 0:5:90;                                % degrees
% 2. 사거리 계산 (각도는 degree이므로 sind)
range = v^2/g*sind(2*theta);
% 3. 최대 사거리와 그때의 각도
[maximum, k] = max(range);
best = theta(k);
% 4. sprintf로 주석 문자열 생성
label = sprintf("Max range %.0f m at %d%c", maximum, best, char(176));
% 5. 그래프와 주석
plot(theta, range, "-o"), hold on
plot(best, maximum, "r*", MarkerSize = 12), hold off
title("Range of a Projectile"), xlabel("Angle, degrees"), ylabel("Range, meters")
text(best + 3, maximum, label)
grid on
% 6. 최대의 90% 이상인 각도를 출력
fprintf('%s\n', label)
fprintf('Angles giving >= 90%% of max: %s\n', num2str(theta(range >= 0.9*maximum)))
theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../img/a35_projectile.png')
