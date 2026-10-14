% 정답 36: table / sprintf / writetable 수정본
clear, clc, clf
planet = ["Earth", "Moon", "Mars"];
g = [9.8, 1.6, 3.7];
d = 0.5 * g * 100^2;
T = table(planet', g', d', VariableNames = ["Planet" "g" "Distance"])   % 열 벡터로
label = sprintf("Max distance: %6.1f m on %s", max(d), planet(d == max(d)));
bar(d)
xticklabels(planet)
title(label)
ylabel("Distance, m")                        % 문자열은 따옴표
writetable(T, "../out/planets.xlsx")         % writetable(T, 파일명)
theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../img/a36_table_bugs.png')
