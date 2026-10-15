% 문제 59: 자유 낙하 거리 d = g t^2 / 2 를 익명 함수로 만들고,
%          달(g = 1.62)에서도 계산한 뒤 100 m 높이에서의 낙하 시간을 구한다.
clear, clc
g = 9.81;
f = @(t) 0.5*g*t^2;
t = 0:0.5:3;
d_earth = f(t)
g = 1.62;
d_moon = f(t)
h = @drop_time;
t_hit = h(100)
t_50 = fzero(@(t) f(t) - 50, [0 10])
fprintf('Hits the ground after %.2f s\n', t_hit)

function tt = drop_time(height)
tt = sqrt(2*height/g);
end
