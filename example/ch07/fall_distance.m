function d = fall_distance(g, t)
% FALL_DISTANCE  중력가속도 g 에서 t 초 동안 자유낙하한 거리를 구한다.
%   d = FALL_DISTANCE(g, t) 는 d = 0.5*g*t^2 을 반환한다.
%   디버거의 Step In / Step Out 을 연습하기 위한 함수다.
d = half() * g .* t.^2;
end

function h = half()
% 중첩 호출을 한 단계 더 만들기 위한 local function
h = 0.5;
end
