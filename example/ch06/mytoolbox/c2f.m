function F = c2f(C)
% C2F  섭씨를 화씨로 변환한다.
%   F = C2F(C) 는 F = C*9/5 + 32 를 반환한다.

if nargin == 0
    C = [0 25 100];   % [보강] 인수 없이 실행해도 되도록 넣은 기본값
end

F = C * 9/5 + 32;
end
