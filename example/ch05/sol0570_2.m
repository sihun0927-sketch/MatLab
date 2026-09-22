% sol0570_2.m - 5.7 연습문제 2
% 같은 그림을 기본 해상도와 300 dpi로 저장해 파일 크기를 비교한다.

clear; clc; close all

fplot(@(x) sin(x)./x, [-20, 20])
title("sin(x)/x"); xlabel("x"); ylabel("f(x)"); grid on

outDir = tempname; mkdir(outDir);
lowFile  = fullfile(outDir, "low.png");
highFile = fullfile(outDir, "high.png");

exportgraphics(gcf, lowFile)
exportgraphics(gcf, highFile, Resolution=300)

lo = dir(lowFile); hi = dir(highFile);
fprintf("기본 해상도 : %6.1f KB\n", lo.bytes/1024);
fprintf("300 dpi     : %6.1f KB\n", hi.bytes/1024);

rmdir(outDir, "s");
