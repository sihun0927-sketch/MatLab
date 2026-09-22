% Ch4.2 - meshgrid: 크기가 다른 두 벡터를 2차원 격자로 매핑

x = -2:0.25:2;                 % 1x17
y = -1:0.25:1;                 % 1x9  (x와 크기가 다름 -> 그냥 곱하면 에러)

[X, Y] = meshgrid(x, y);       % X, Y는 둘 다 9x17 (y행 개수 x x열 개수)
Z = X.^2 + Y.^2;               % 이제 크기가 같으므로 원소별 연산 가능

% > **[보강]** 슬라이드에는 없는 시각화 예제: meshgrid로 만든 격자를
% tiledlayout으로 표면도(surf)와 등고선도(contourf)로 함께 확인한다.
figure
tiledlayout(1, 2)

nexttile
surf(X, Y, Z, EdgeColor="none")
xlabel("x"); ylabel("y"); zlabel("z")
title("Z = X.^2 + Y.^2 (surf)")

nexttile
contourf(X, Y, Z)
xlabel("x"); ylabel("y")
title("Z = X.^2 + Y.^2 (contourf)")

exportgraphics(gcf, "../../textbook/ch04/img/ex0402_meshgrid.png")
