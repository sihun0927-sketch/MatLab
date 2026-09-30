% ex0604_partial.m — 복잡한 함수의 일부 입력만 고정해 두기 (6.4)
% 입력이 많은 함수에서 매번 바뀌는 인수 하나만 남기고 나머지를 미리 묶어둘 수 있다.

clear; clc

a = 5; b = 10; c = 15; d = 20;      % 매번 똑같이 들어가는 "어려운 부분"

% x 하나만 받는 새 함수를 만든다. a~d 는 만드는 시점의 값으로 고정된다.
new_fun = @(x) complicated(a, b, c, d, x);

for x = 1:4
    fprintf('new_fun(%d) = %g\n', x, new_fun(x));
end

disp(['new_fun 의 정의: ' func2str(new_fun)])

% ---- local function ----
function y = complicated(a, b, c, d, x)
% COMPLICATED  입력이 다섯 개인 (척하는) 함수
y = a*x.^3 + b*x.^2 + c*x + d;
end
