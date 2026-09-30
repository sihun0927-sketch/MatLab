% sol0616_1.m — 6.1.6 연습문제 1
% 함수 안의 변수가 workspace 에 남지 않는 것을 확인한다.

clear; clc

radius = 3;
area   = disc_area(radius);

fprintf('넓이 = %.4f\n', area);

disp('호출 후 workspace:')
who                             % radius, area 만 있다

vars = ["tau" "half" "r"];      % disc_area 내부에서 쓴 이름들
for v = vars
    fprintf('exist(''%s'', ''var'') = %d\n', v, exist(v, 'var'));
end

function A = disc_area(r)
% DISC_AREA  반지름 r 인 원의 넓이. 내부 변수 tau, half 는 local variable.
tau  = 2*pi;
half = tau / 2;
A    = half * r.^2;
end
