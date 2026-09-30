function output = elemprod(x, y)
% ELEMPROD  두 배열을 원소별로 곱한다.
%   output = ELEMPROD(x, y) 는 x 와 y 를 원소별로 곱한 결과를 반환한다.
%   x 와 y 는 크기가 같거나 한쪽이 스칼라여야 한다.

if nargin == 0
    x = 1:5;
    y = 5:-1:1;    % [보강] 인수 없이 실행해도 되도록 넣은 기본값
end

a = x .* y;        % a 는 local variable — workspace 에 남지 않는다
output = a;
end
