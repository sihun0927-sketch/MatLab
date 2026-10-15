% 정답 59: 익명 함수의 변수 캡처와 함수 작업공간 수정본
clear, clc
g = 9.81;
f = @(t, g) 0.5*g*t.^2;           % .^ ; g를 입력으로 받아야 바뀐 값이 반영된다
t = 0:0.5:3;
d_earth = f(t, 9.81)
d_moon = f(t, 1.62)
h = @drop_time;
t_hit = h(100, 9.81)              % g를 넘겨 준다
t_50 = fzero(@(t) f(t, 9.81) - 50, [0 10])
fprintf('Hits the ground after %.2f s\n', t_hit)

% 캡처 확인용: 만든 시점의 g가 굳는다
g = 9.81; f_old = @(t) 0.5*g*t.^2; g = 1.62;
same_as_earth = isequal(f_old(t), d_earth)

function tt = drop_time(height, g)
tt = sqrt(2*height/g);
end
