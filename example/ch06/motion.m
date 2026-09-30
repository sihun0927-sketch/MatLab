function [distance, velocity, acceleration] = motion(t)
% MOTION  시간 t 에서의 거리, 속도, 가속도를 계산한다.
%   [d, v, a] = MOTION(t) 는 거리 d = t.^3, 속도 v = 3*t.^2,
%   가속도 a = 6*t 를 한 번에 반환한다.
%
%   출력을 하나만 받으면 distance 만 돌아온다.

if nargin == 0
    t = 0:2:10;    % [보강] 인수 없이 실행해도 되도록 넣은 기본값
end

distance     = t.^3;
velocity     = 3 * t.^2;
acceleration = 6 * t;
end
