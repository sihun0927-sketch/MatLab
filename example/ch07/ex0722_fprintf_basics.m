% ex0722_fprintf_basics.m — fprintf 의 형식 지정자 (7.2.2)
%   fprintf(format_string, var, ...)
% format string 안의 % 가 변수가 들어갈 자리(placeholder)다.

clear; clc

cows = 5;

% %f — 고정소수점. 기본은 소수점 아래 여섯 자리
fprintf('There are %f cows in the pasture\n', cows);

% 같은 값을 여러 형식으로
x = 12345.6789;
fprintf('\n같은 값 %g 를 형식만 바꿔 보면\n', x);
fprintf('  %%f  → %f\n', x);
fprintf('  %%e  → %e\n', x);
fprintf('  %%g  → %g\n', x);   % f 와 e 중 짧은 쪽
fprintf('  %%d  → %d\n', x);   % 정수가 아니면 지수 표기로 넘어간다

n = 42;
fprintf('\n정수 %d 는\n', n);
fprintf('  %%d  → %d\n', n);
fprintf('  %%f  → %f\n', n);
fprintf('  %%g  → %g\n', n);

% 글자용 지정자
fprintf('\n%%s 는 문자열 전체, %%c 는 한 글자씩\n');
fprintf('  %%s  → %s\n', 'MATLAB');
fprintf('  %%c  → %c%c%c\n', 'MAT');
fprintf('  %%c 에 문자열을 통째로 주면: %c\n', 'MATLAB');  % 형식이 반복된다

% %% 는 퍼센트 기호 자체
fprintf('\nThe interest rate is %5.2f %% \n', 5);

% 형식 지정자를 빼먹으면? — 오류 없이 이상하게 나온다
fprintf('\n필드 타입을 빼먹은 ''%%'' 만 쓰면: ');
fprintf('값은 % \n', cows);
fprintf('(위 줄에 5 가 보이지 않는다. 오류 메시지도 없다.)\n');
