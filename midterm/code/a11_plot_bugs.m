% 정답 11: 플롯 스크립트 수정본
clear, clc, clf
x = 0:pi/100:2*pi;
y1 = sin(x);
y2 = cos(x);
Y = [y1; y2];
plot(x, Y)
hold on
plot(x, y1.*y2, LineWidth = 2)            % "LineWidth" = 2 는 문법 오류
hold off                                  % hold on 뒤에는 hold off
legend("sin", "cos", "sin\cdotcos")       % 선 3개 → 항목 3개
axis([0 2*pi -1 1])                       % [xmin xmax ymin ymax] 순서
title("Trig functions")
xlabel("x, rad"), ylabel("value")         % 명령 사이에 쉼표
text(pi/2, 1, "Peak")                     % text(x, y, 문자열)
theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../img/a11_plot_bugs.png')
