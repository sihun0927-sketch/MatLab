% ex0804_fever_plot.m — logical indexing 으로 발열 환자만 다른 색으로 그리기 (8.4 보강)
% bar 의 폭(0.3)은 "그 호출에 들어간 x 간격"에 대한 비율이다. 각 호출의 x 간격이 2 라 0.3 이 막대 폭 0.6 이 된다.

clear; clc

Patient_Names = ["Jason", "Jose", "Wesley", "Rose"];
Temp = [98.2, 100.3, 97, 101];
fever = Temp > 98.6;
n = 1:numel(Temp);

figure
theme(gcf, "light")
hold on
bar(n(~fever), Temp(~fever), 0.3, FaceColor=[0.3 0.6 0.9])
bar(n(fever),  Temp(fever),  0.5, FaceColor=[0.9 0.3 0.3])
yline(98.6, "--", "98.6 °F")
hold off
xticks(n)
xticklabels(Patient_Names)
xlim([0.4 4.6])
ylim([95 102])
ylabel("Temperature (°F)")
title("Logical indexing: fever = Temp > 98.6")
legend(["Well", "Sick"], Location="northwest")

exportgraphics(gcf, "../../textbook/ch08/img/ex0804_fever_plot.png")
