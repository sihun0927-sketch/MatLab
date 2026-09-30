% ex0604_anonymous.m — anonymous function 과 function handle (6.4)
% @ 기호 뒤 괄호에 입력, 그 뒤에 식 하나를 쓴다. 이름은 변수처럼 workspace 에 남는다.

clear; clc

ln = @(x) log(x);           % 자연로그에 짧은 별명 붙이기

fprintf('ln(exp(2)) = %g\n', ln(exp(2)));
fprintf('벡터도 그대로: %s\n', mat2str(ln([1 exp(1) exp(2)]), 4));

% class 는 function_handle 이다
fprintf('class(ln) = %s\n', class(ln));
fprintf('isa(ln, ''function_handle'') = %d\n', isa(ln, 'function_handle'));

% 입력이 여러 개인 anonymous function
hyp = @(a, b) sqrt(a.^2 + b.^2);
fprintf('hyp(3, 4) = %g\n', hyp(3, 4));

% 입력이 없는 anonymous function 도 된다
always7 = @() 7;
fprintf('always7() = %g\n', always7());

% 만들 때의 변수 값이 "그 자리에서 복사되어" 박제된다
a = 2;
f = @(x) a*x;
a = 100;                    % 나중에 a 를 바꿔도
fprintf('a 를 100 으로 바꾼 뒤 f(3) = %g  (여전히 a=2 로 계산)\n', f(3));

% 식을 확인하려면 func2str
disp(['f 의 정의: ' func2str(f)])

% 이미 있는 함수에 handle 붙이기 — @ 뒤에 이름만 쓴다 (괄호 없음)
g = @mypoly;
fprintf('g(2) = mypoly(2) = %g\n', g(2));
