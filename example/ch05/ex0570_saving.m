% ex0570_saving.m
% 5.7 플롯 저장하기 - .fig(재편집용)와 그림 파일(문서 삽입용)

clear; clc; close all

x = linspace(0, 2*pi, 100);
plot(x, sin(x))
title("Saving Plots")
xlabel("Angle in Radians"); ylabel("sin(x)")

outDir = tempname;          % 예제이므로 임시 폴더에 저장한다
mkdir(outDir);

figFile = fullfile(outDir, "myplot.fig");
pngFile = fullfile(outDir, "myplot.png");

savefig(figFile)            % MATLAB 전용 형식 - 나중에 다시 편집 가능
exportgraphics(gcf, pngFile)% 문서에 넣을 그림 파일

close all
f  = openfig(figFile);      % .fig를 다시 열면 축, 라벨이 그대로 살아난다
ax = findobj(f, "Type", "axes");                % 축을 이름으로 찾는다
fprintf("다시 연 figure의 제목: %s\n", ax.Title.String);

dir(outDir)

theme(gcf, "light")   % 문서용 밝은 테마 (5.7절 참고)
exportgraphics(gcf, "../../textbook/ch05/img/ex0570_saving.png")

close(f)
rmdir(outDir, "s");         % 예제 뒤처리
