function [d, v, a] = kinematics(t)
% KINEMATICS 시각 t에서의 거리, 속도, 가속도 (문제 40 정답)
%   가속도 a = 0.5 t, 속도 v = t^2/4, 거리 d = t^3/12
a = 0.5*t;
v = t.^2/4;
d = t.^3/12;
end
