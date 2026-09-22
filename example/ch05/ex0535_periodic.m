% ex0535_periodic.m
% Example 5.5 - 알칼리 금속의 녹는점과 원자 반지름을 두 y축으로 비교

clear; clc; close all

atomicNumber = [3, 11, 19, 37, 55];                     % Li Na K Rb Cs
meltingPoint = [181, 98, 63, 34, 28.5];                 % degrees C
atomicRadius = [0.152, 0.186, 0.227, 0.248, 0.265];     % nanometers

t = tiledlayout(1,2);

nexttile
plot(atomicNumber, meltingPoint, "-o", atomicNumber, atomicRadius, "-x")
title(["Periodic Properties"; "of the Elements"])
xlabel("Atomic Number"); ylabel("Properties")

nexttile
yyaxis left
plot(atomicNumber, meltingPoint, "-o")
ylabel("Melting Point, ^oC")
yyaxis right
plot(atomicNumber, atomicRadius, "-x")
ylabel("Atomic Radius, nanometers")
title(["Periodic Properties"; "of the Elements"])
xlabel("Atomic Number")

theme(gcf, "light")   % 문서용 밝은 테마 (5.7절 참고)
exportgraphics(gcf, "../../textbook/ch05/img/ex0535_periodic.png")
