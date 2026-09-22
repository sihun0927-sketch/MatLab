% ex0550_sphere.m
% 5.5 플롯 편집 - 메뉴로 하던 편집을 코드로 남기기
% sphere는 peaks처럼 MATLAB이 제공하는 예제 표면 함수다.

clear; clc; close all

[X, Y, Z] = sphere(30);     % 30x30 면으로 나눈 단위 구

t = tiledlayout(1,2);
title(t, "메뉴 편집 대신 코드로 고정하기")

nexttile
surf(X, Y, Z)
title("(a) 기본 축 - 구가 찌그러져 보인다")
xlabel("x"); ylabel("y"); zlabel("z")

ax = nexttile;
surf(X, Y, Z)
axis equal                  % 세 축의 눈금 간격을 같게 -> 진짜 구 모양
colorbar(ax)                % 색이 무엇을 뜻하는지 표시
title("(b) axis equal + colorbar")
xlabel("x"); ylabel("y"); zlabel("z")

theme(gcf, "light")   % 문서용 밝은 테마 (5.7절 참고)
exportgraphics(gcf, "../../textbook/ch05/img/ex0550_sphere.png")
