function output = mypoly(x)
% MYPOLY  다항식 5x^3 - 4x^2 + 2x - 6 의 값을 계산한다.
%   output = MYPOLY(x) 는 x 의 각 원소에 대해 다항식 값을 원소별로 계산한다.
%   x 는 스칼라, 벡터, 행렬 모두 가능하다.
%
%   예: mypoly(2) 는 22 를 반환한다.
%
%   참고: POLYVAL, MYPOLY 는 내장 함수 POLY 와 다른 함수다.

if nargin == 0
    x = 0:0.5:2;   % [보강] 인수 없이 실행해도 되도록 넣은 기본값
end

output = 5*x.^3 - 4*x.^2 + 2*x - 6;
end
