% sol0604_2.m — 6.4 연습문제 2
% anonymous function 이 만들어질 때 바깥 변수 값을 "복사해 박제"하는 것을 확인한다.

clear; clc

k = 2;
f = @(x) k * x;                 % 이 순간의 k(=2) 가 f 안에 저장된다

fprintf('k=2 일 때 f(10) = %g\n', f(10));

k = 10;                         % 바깥 k 를 바꿔도
fprintf('k 를 10 으로 바꾼 뒤 f(10) = %g  ← 여전히 2 배\n', f(10));

clear k                         % k 를 지워도 f 는 멀쩡히 동작한다
fprintf('k 를 지운 뒤 f(10) = %g\n', f(10));

% 실제로 무엇이 박제됐는지 들여다볼 수 있다
info = functions(f);
disp('f 가 붙잡고 있는 변수:')
disp(info.workspace{1})

% 최신 값을 쓰고 싶으면 k 를 입력으로 받게 만든다
g = @(x, k) k * x;
fprintf('g(10, 10) = %g\n', g(10, 10));
