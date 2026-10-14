% 정답 31: 3-D 표면 그래프. z = x*exp(-x^2 - y^2)
clear, clc, clf
[X, Y] = meshgrid(-2:0.1:2);
Z = X.*exp(-X.^2 - Y.^2);
tl = tiledlayout(2, 2);
nexttile
mesh(X, Y, Z), title("(a) mesh"), xlabel("x"), ylabel("y"), zlabel("z")
nexttile
surf(X, Y, Z), shading interp, colormap(gca, "jet")
title("(b) surf, shading interp, jet"), xlabel("x"), ylabel("y"), zlabel("z")
nexttile
contour(X, Y, Z, 15), title("(c) contour, 15 lines"), xlabel("x"), ylabel("y"), axis equal
nexttile
surfc(X, Y, Z), title("(d) surfc"), xlabel("x"), ylabel("y"), zlabel("z")
title(tl, "z = x e^{-x^2-y^2}")
[zmax, k] = max(Z(:));
[r, c] = find(Z == zmax);
fprintf('Max z = %.4f at x = %.1f, y = %.1f (linear index %d)\n', zmax, X(r, c), Y(r, c), k)
theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../img/a31_surface.png')
