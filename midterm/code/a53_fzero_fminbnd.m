% 정답 53: 익명 함수 + fzero / fminbnd / integral + fplot
clear, clc, clf
f = @(x) x.^3 - 6*x.^2 + 4*x + 12;
guesses = [-1.5 2 5];
roots3 = arrayfun(@(x0) fzero(f, x0), guesses)
[xmin, fmin] = fminbnd(f, 0, 6)
A = integral(f, 0, 4)
fprintf('Roots: %.4f  %.4f  %.4f\n', roots3)
fprintf('Minimum f(%.4f) = %.4f on [0, 6]\n', xmin, fmin)
fprintf('Integral from 0 to 4 = %.4f\n', A)
fplot(f, [-2 6], LineWidth = 1.5)
hold on
plot(roots3, f(roots3), "ro", MarkerSize = 8, MarkerFaceColor = "r")
plot(xmin, fmin, "ks", MarkerSize = 10, MarkerFaceColor = "y")
yline(0, "--")
hold off
grid on
xlabel("x"), ylabel("f(x)")
title("f(x) = x^3 - 6x^2 + 4x + 12")
legend("f(x)", "roots", "minimum", Location = "northwest")
text(xmin, fmin - 5, sprintf("min = %.2f", fmin), HorizontalAlignment = "center")
theme(gcf, "light")
exportgraphics(gcf, '../img/a53_fzero_fminbnd.png')
