function C = f2c(F)
% F2C  화씨를 섭씨로 변환한다.
%   C = F2C(F) 는 C = (F-32)*5/9 를 반환한다.

if nargin == 0
    F = [32 77 212];   % [보강] 인수 없이 실행해도 되도록 넣은 기본값
end

C = (F - 32) * 5/9;
end
