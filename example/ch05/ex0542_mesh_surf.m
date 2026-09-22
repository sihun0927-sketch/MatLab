% ex0542_mesh_surf.m
% 5.4.2 Surface Plots - mesh와 surf, 입력 1개와 3개의 차이, shading 세 가지

clear; clc; close all

z = [ 1, 2, 3, 4,  5,  6,  7,  8,  9, 10;
      2, 4, 6, 8, 10, 12, 14, 16, 18, 20;
      3, 4, 5, 6,  7,  8,  9, 10, 11, 12];   % 3x10 배열

x = linspace(1, 50, 10);      % 열 개수(10)와 같아야 한다
y = linspace(500, 1000, 3);   % 행 개수(3)와 같아야 한다

t = tiledlayout(2,3);
title(t, "Mesh and Surface Plots")

nexttile
mesh(z)                        % 입력 1개 - 축은 인덱스 번호
title("(a) mesh(z) - 인덱스 축")
xlabel("x-axis"); ylabel("y-axis"); zlabel("z-axis")

nexttile
mesh(x, y, z)                  % 입력 3개 - 실제 x, y 값
title("(b) mesh(x,y,z) - 실제 축")
xlabel("x-axis"); ylabel("y-axis"); zlabel("z-axis")

nexttile
meshc(x, y, z)                 % 격자선 곡면 + 아래쪽 등고선
title("(c) meshc - 등고선 추가")
xlabel("x-axis"); ylabel("y-axis"); zlabel("z-axis")

nexttile
surf(x, y, z)                  % 색이 칠해진 면
title("(d) surf - faceted (기본)")
xlabel("x-axis"); ylabel("y-axis"); zlabel("z-axis")

nexttile
surf(x, y, z)
shading interp                 % 면 사이를 보간하고 격자선을 없앤다
title("(e) shading interp")
xlabel("x-axis"); ylabel("y-axis"); zlabel("z-axis")

nexttile
surf(x, y, z)
shading flat                   % 면마다 단색, 격자선만 제거
title("(f) shading flat")
xlabel("x-axis"); ylabel("y-axis"); zlabel("z-axis")

theme(gcf, "light")   % 문서용 밝은 테마 (5.7절 참고)
exportgraphics(gcf, "../../textbook/ch05/img/ex0542_mesh_surf.png")
