% sol0605_3.m — 6.5 연습문제 3
% 함수를 입력으로 받는 함수를 직접 만든다 (수치 미분).

clear; clc

f = @(x) sin(x);
x = pi/3;

fprintf('중앙차분 f''(pi/3)  = %.10f\n', numderiv(f, x));
fprintf('정확한 값 cos(pi/3) = %.10f\n', cos(x));
fprintf('오차              = %.3e\n', abs(numderiv(f, x) - cos(x)));

% 다른 함수에도 그대로 쓸 수 있다 — 이것이 function function 의 이점
fprintf('\nd/dx exp(x) at 1 = %.10f (정답 %.10f)\n', ...
    numderiv(@exp, 1), exp(1));
fprintf('d/dx mypoly at 2 = %.10f (정답 %.10f)\n', ...
    numderiv(@mypoly, 2), 15*2^2 - 8*2 + 2);

% 간격 h 를 바꿔가며 오차를 본다
fprintf('\n     h          오차\n');
for h = [1e-1 1e-3 1e-5 1e-8]
    fprintf('%8.1e   %.3e\n', h, abs(numderiv(f, x, h) - cos(x)));
end

function d = numderiv(fh, x, h)
% NUMDERIV  중앙차분으로 fh 의 x 에서의 미분값을 근사한다.
%   d = NUMDERIV(fh, x)     h = 1e-6 사용
%   d = NUMDERIV(fh, x, h)  간격 h 지정
if nargin < 3
    h = 1e-6;
end
d = (fh(x + h) - fh(x - h)) / (2*h);
end
