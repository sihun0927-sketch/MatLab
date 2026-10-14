% 문제 01: 반지름 벡터 r와 높이 h인 원기둥의 겉넓이 SA, 부피 V, 비 V/SA 를
%          구해 r마다 한 줄씩 출력한다.
clear, clc
r = [1 2 3 4];          % cm
h = 10;                 % cm
SA = 2*pi*r^2 + 2*pi*r*h;
V = pi*r.^2*h;
ratio = V/SA;
result = [r; SA; V; ratio];
fprintf('r = %4.1f cm: SA = %8.2f, V = %8.2f, V/SA = %5.3f \n', r, SA, V, ratio)
