function E = kinetic_energy(m, v)
% KINETIC_ENERGY  운동에너지 E = 0.5*m*v^2 을 계산한다.
%   E = KINETIC_ENERGY(m, v) 는 질량 m(kg)과 속도 v(m/s)로
%   운동에너지(J)를 계산한다. m 과 v 는 크기가 같거나 한쪽이 스칼라여야 한다.
%
%   예: kinetic_energy(2, 3) → 9

% 위의 빈 줄 때문에 이 주석부터는 help 에 나오지 않는다.
if nargin == 0
    m = 2;  v = 3;   % [보강] 인수 없이 실행해도 되도록 넣은 기본값
end

E = 0.5 * m .* v.^2;
end
