% 정답 06: 온도 변환표. disp로 제목·머리글, fprintf로 본문
clear, clc
C = [-40 0 37 100];
F = C*9/5 + 32;
K = C + 273.15;
disp("Temperature Conversion")
disp(" Celsius  Fahrenheit    Kelvin")
fprintf('%8.1f %11.1f %10.2f\n', [C; F; K])
fprintf('Range of F: %.1f to %.1f (%d rows)\n', min(F), max(F), numel(C))
