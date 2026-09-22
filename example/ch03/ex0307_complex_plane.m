% ex0307_complex_plane.m
% 3.7 복소평면에 복소수와 켤레복소수 그리기
clear; clc; close all

z = [3+4i, -2+2i, 1-3i];

f = figure(Visible="off", Position=[100 100 560 520]);
theme(f, "light")   % R2025a 이후 기본 테마가 어두우므로 밝은 테마로 고정
plot(real(z), imag(z), "o", MarkerSize=9, MarkerFaceColor="b")
hold on
plot(real(conj(z)), imag(conj(z)), "s", MarkerSize=9, MarkerFaceColor="r")
for k = 1:numel(z)
    plot([0 real(z(k))], [0 imag(z(k))], "b-")
    text(real(z(k))+0.15, imag(z(k)), string(z(k)))
end
yline(0, "k"); xline(0, "k")
axis equal; grid on
xlim([-5 5]); ylim([-5 5])
xlabel("실수부 real"); ylabel("허수부 imag")
legend(["z", "conj(z)"], Location="southwest")
title("복소평면: 켤레복소수는 실수축 대칭")

out = "../../textbook/ch03/img/ex0307_complex_plane.png";
exportgraphics(f, out, Resolution=150)
disp("saved: " + out)
