% 정답 50: 종합 스크립트 수정본
%% Projectile range analysis
clear, clc, clf
g = 9.8;                          % m/s^2
% v = input("Launch speed (m/s): ");   % 원래 코드
v = 30;                                % 검증용 고정값
theta = 0:5:90;                   % degrees
range = v^2/g * sind(2*theta);    % 각도가 degree → sind
[maxR, idx] = max(range)
best_angle = theta(idx);
fprintf("Max range %.1f m at %d degrees \n", maxR, best_angle)
good = find(range >= 0.9*maxR);
fprintf("Angles within 90%%: ")   % % 기호는 %%
fprintf("%d ", theta(good)); fprintf("\n")
plot(theta, range, "r--o", LineWidth = 1.5)
xlabel("Angle, \theta (deg)"), ylabel("Range, m")
title("v = " + v + " m/s")
hold on
plot(theta(idx), maxR, "k*", MarkerSize = 12)
hold off                          % hold on 뒤에는 hold off
legend("range", "max")
label = sprintf("Max = %.1f m", maxR);
text(best_angle, maxR, label)     % text(x, y, 문자열)
axis([0 90 0 maxR*1.2])
summary = table(theta', range', VariableNames = ["theta_deg" "range_m"])   % 열 벡터로
theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../img/a50_final.png')
