% 문제 50: 발사 속도를 입력받아 각도별 사거리를 구하고, 최대 사거리와
%          최대의 90% 이상인 각도를 출력한 뒤 그래프와 표를 만든다.
%% Projectile range analysis
clear, clc, clf
g = 9.8;                          % m/s^2
v = input("Launch speed (m/s): ");
theta = 0:5:90;                   % degrees
range = v^2/g * sin(2*theta);
[maxR, idx] = max(range)
best_angle = theta(idx);
fprintf("Max range %.1f m at %d degrees \n", maxR, best_angle)
good = find(range >= 0.9*maxR);
fprintf("Angles within 90%: ")
fprintf("%d ", theta(good)); fprintf("\n")
plot(theta, range, "r--o", LineWidth = 1.5)
xlabel("Angle, \theta (deg)"), ylabel("Range, m")
title("v = " + v + " m/s")
hold on
plot(theta(idx), maxR, "k*", MarkerSize = 12)
legend("range", "max")
label = sprintf("Max = %.1f m", maxR);
text(label, best_angle, maxR)
axis([0 90 0 maxR*1.2])
summary = table(theta, range)
