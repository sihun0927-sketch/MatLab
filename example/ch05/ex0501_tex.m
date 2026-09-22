% ex0501_tex.m - 5.1.3 TeX 문법으로 그리스 문자, 위/아래 첨자 쓰기
clear; clc; close all

theta = 0:pi/50:2*pi;
y = sin(theta);

plot(theta, y, LineWidth=1.5)
title(["\alpha \beta \gamma 를 쓴 제목"; "두 줄짜리 제목도 만들 수 있다"])
xlabel("각도 \theta, rad")
ylabel("진폭 A_{max} [m/s^2]")
legend("sin(\theta)")
text(pi, 0, "\leftarrow \theta = \pi 에서 sin = 0")
grid on

theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, "../../textbook/ch05/img/ex0501_tex.png")
