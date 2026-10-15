%% Calibration check (정답 65)
clear, clc, close all
V = [0.12 0.48 1.03 1.51 1.98 2.47];     % volts
P = [0 10 20 30 40 50];                  % kPa
k = (P(end) - P(1)) / (V(end) - V(1));
Pfit = k*(V - V(1));
err = abs(Pfit - P);
worst = max(err);
fprintf("Max error %4.2f kPa at V = %.2f V\n", worst, V(err == worst))
bad = err > 1;
if any(bad)                                % logical 벡터는 any로 판정
    fprintf("%d points exceed 1 kPa\n", sum(bad))   % 개수는 sum (length는 전체 길이)
else
    disp("All within tolerance")
end
plot(V, P, "o", V, Pfit, "-")
legend("measured", "fit", Location = "northwest")
xlabel("V, volts"), ylabel("P, kPa")
title(sprintf("Calibration: k = %.1f kPa/V", k))   % 서식은 sprintf로 먼저
text(0.3, 40, "worst = " + num2str(worst, 3) + " kPa")
result = table(V', P', round(Pfit', 1), VariableNames = ["V" "P" "Pfit"])
theme(gcf, "light")
exportgraphics(gcf, '../img/a65_calibration.png')
