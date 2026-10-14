% 정답 05: local function 수정본
clear, clc
r = [1 2 3];
[area, circ] = circle_stats(r);          % 출력 두 개를 모두 받는다
fprintf('r = %g: area = %.3f, circ = %.3f\n', [r; area; circ])

function [area, circ] = circle_stats(r)
% CIRCLE_STATS 반지름 r(벡터 가능)의 넓이와 둘레
area = pi*r.^2;                           % ^ → .^
circ = 2*pi*r;
end                                       % 스크립트 안의 함수는 end 필수
