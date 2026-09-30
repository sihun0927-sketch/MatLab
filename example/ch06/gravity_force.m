function F = gravity_force(m)
% GRAVITY_FORCE  질량 m(kg)에 작용하는 중력(N)을 계산한다.
%   전역 변수 G_ACCEL(중력가속도)을 workspace 에서 가져다 쓴다.
%   호출하는 쪽에서도 global G_ACCEL 로 선언하고 값을 넣어야 공유된다.

global G_ACCEL

if nargin == 0
    m = 70;              % [보강] 인수 없이 실행해도 되도록 넣은 기본값
end

if isempty(G_ACCEL)
    % 호출한 쪽이 global 선언을 안 했으면 여기서는 빈 배열로 보인다
    warning('gravity_force:defaultG', ...
        'G_ACCEL 이 비어 있어 기본값 9.81 m/s^2 을 사용합니다.');
    G_ACCEL = 9.81;
end

F = m * G_ACCEL;
end
