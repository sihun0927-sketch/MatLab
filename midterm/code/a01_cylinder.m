% 정답 01: 원기둥 겉넓이·부피·비 (q01 수정본)
clear, clc
r = [1 2 3 4];          % cm
h = 10;                 % cm
SA = 2*pi*r.^2 + 2*pi*r*h;      % r^2 → r.^2
V = pi*r.^2*h;
ratio = V./SA;                  % / → ./
result = [r; SA; V; ratio];
fprintf('r = %4.1f cm: SA = %8.2f, V = %8.2f, V/SA = %5.3f \n', result)   % 행렬 하나로 전달
