% 문제 36: 행성별 100초 낙하 거리를 표로 만들고, 제목 문자열을 만들어
%          그래프에 쓰고, 표를 엑셀 파일로 저장한다.
clear, clc, clf
planet = ["Earth", "Moon", "Mars"];
g = [9.8, 1.6, 3.7];
d = 0.5 * g * 100^2;
T = table(planet, g, d, VariableNames = ["Planet" "g" "Distance"])
label = sprintf("Max distance: %6.1f m on %s", max(d), planet(d == max(d)));
bar(d)
xticklabels(planet)
title(label)
ylabel(Distance, m)
writetable("planets.xlsx", T)
