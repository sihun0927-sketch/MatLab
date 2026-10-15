%% Calibration check
% 압력 센서의 전압 V와 기준 압력 P로 직선 보정식 Pfit = k (V - V0)를 만들고,
% 오차가 1 kPa를 넘는 점을 세고 그림과 표를 만든다.
clear, clc, close all
V = [0.12 0.48 1.03 1.51 1.98 2.47];     % volts
P = [0 10 20 30 40 50];                  % kPa
k = (P(end) - P(1)) / (V(end) - V(1));
Pfit = k*(V - V(1));
err = abs(Pfit - P);
worst = max(err);
fprintf("Max error %4.2f kPa at V = %.2f V\n", worst, V(err == worst))
bad = err > 1;
if bad
    fprintf("%d points exceed 1 kPa\n", length(bad))
else
    disp("All within tolerance")
end
plot(V, P, "o", V, Pfit, "-")
legend("measured", "fit", Location = "northwest")
xlabel("V, volts"), ylabel("P, kPa")
title("Calibration: k = %.1f kPa/V", k)
text(0.3, 40, "worst = " + num2str(worst, 3) + " kPa")
result = table(V', P', round(Pfit', 1), VariableNames = ["V" "P" "Pfit"])
