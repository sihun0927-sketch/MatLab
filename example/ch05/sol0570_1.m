% sol0570_1.m - 5.7 연습문제 1
% 그림을 .fig로 저장하고 다시 열어 제목을 바꾼 뒤 png로 내보낸다.

clear; clc; close all

x = linspace(0, 4*pi, 200);
plot(x, sin(x) .* exp(-x/8))
title("Original Title")
xlabel("x"); ylabel("f(x)")

outDir = tempname; mkdir(outDir);
figFile = fullfile(outDir, "work.fig");
savefig(figFile)
close all

f = openfig(figFile);           % 저장된 그림을 다시 편집할 수 있다
ax = findobj(f, "Type", "axes");
title(ax, "Edited After Reopening")
exportgraphics(f, fullfile(outDir, "work.png"))

dir(outDir)
close(f)
rmdir(outDir, "s");
