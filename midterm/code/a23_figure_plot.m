% 정답 23: 그림을 보고 코드 작성. 감쇠 진동과 포락선
clear, clc, clf
t = 0:0.1:5;
y = exp(-0.5*t).*cos(2*pi*t);
env = exp(-0.5*t);
plot(t, y, "b-", LineWidth = 1.5)
hold on
plot(t, env, "r--o", MarkerSize = 4)
plot(t, -env, "r--")
hold off
grid on
axis([0 5 -1.2 1.2])
title("Damped oscillation, \zeta = 0.5")
xlabel("Time, s"), ylabel("Amplitude, e^{-0.5t}cos(2\pit)")
legend("signal", "+envelope", "-envelope")
text(2, 0.8, "decay \rightarrow")
theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../img/q23_figure.png')
