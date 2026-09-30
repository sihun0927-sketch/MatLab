function F = gravity_force(m)
% GRAVITY_FORCE  질량 m(kg)에 작용하는 중력(N)을 계산한다.
%   전역 변수 G_ACCEL(중력가속도)을 workspace 에서 가져다 쓴다.
%   호출하는 쪽에서도 global G_ACCEL 로 선언하고 값을 넣어야 공유된다.
%
%   호출한 쪽이 선언하지 않았으면 G_ACCEL 이 빈 배열이라 F 도 빈 배열이 된다.
%   오류가 나지 않고 조용히 틀리는 것이 global 의 위험한 점이다.

global G_ACCEL

if nargin == 0
    m = 70;              % [보강] 인수 없이 실행해도 되도록 넣은 기본값
end

F = m * G_ACCEL;
end
