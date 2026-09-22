% ex0543_pcolor_contour.m
% 5.4.2 Pseudo Color Plots - peaks 예제 함수로 pcolor / contour / contourf 비교

clear; clc; close all

[x, y, z] = peaks;      % MATLAB이 제공하는 49x49 예제 표면

t = tiledlayout(2,2);
title(t, "Pseudo Color and Contour Plots")

nexttile
pcolor(x, y, z)
title("(a) Pseudo Color Plot")

nexttile
pcolor(x, y, z)
shading interp          % 격자선이 사라지고 색이 부드럽게 이어진다
title("(b) Interpolated Shading")

nexttile
pcolor(x, y, z)
shading interp
hold on
contour(x, y, z, 20, "k")   % 등고선 20개를 검은색으로 겹쳐 그린다
hold off
title("(c) Overlaid Pseudo Color and Contour")

nexttile
contour(x, y, z, ShowText=true)
title("(d) Labeled Contour Plot")

theme(gcf, "light")   % 문서용 밝은 테마 (5.7절 참고)
exportgraphics(gcf, "../../textbook/ch05/img/ex0543_pcolor_contour.png")
