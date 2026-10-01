% ex0723_sprintf_basics.m — sprintf 는 화면 대신 변수로 보낸다 (7.2.3)
% fprintf 와 형식 규칙은 완전히 같다. 차이는 결과를 "돌려준다"는 것뿐이다.

clear; clc

a = sprintf("Some example output is %4.2f \n", pi*1000);

disp('--- sprintf 가 돌려준 것 ---')
disp(a)
fprintf('class(a) = %s   ← format 을 string 으로 줬으므로 string\n', class(a));
fprintf('strlength(a) = %d  (끝의 줄바꿈도 한 글자)\n', strlength(a));

% format 을 char 로 주면 char 가 돌아온다
b = sprintf('%4.2f', pi*1000);
fprintf('\nformat 이 char 면 결과도 char: %s\n', class(b));

% 배열을 주면 fprintf 와 똑같이 format 이 반복된다 — 결과는 한 덩어리 글자다
c = sprintf('%d ', 1:5);
fprintf('\nsprintf(''%%d '', 1:5) = "%s"  (크기 %s)\n', c, mat2str(size(c)));

% workspace 에 남으므로 나중에 다시 쓸 수 있다
msg = sprintf('반지름 %g 일 때 넓이 = %.3f', 2, pi*2^2);
disp(' ')
disp('--- 만들어 둔 문자열을 다시 쓰기 ---')
disp(msg)
fprintf('%s\n', msg);
warning(msg);                      %#ok<SPWRN>  경고 메시지로도 쓸 수 있다

% fprintf 와 나란히 비교
disp(' ')
disp('--- 같은 형식, 다른 목적지 ---')
fprintf('fprintf → 화면에 바로: %6.3f\n', exp(1));
d = sprintf('sprintf → 변수에: %6.3f', exp(1));
disp(d)

% 숫자 → 글자 변환 수단 비교
disp(' ')
disp('--- 숫자를 글자로 바꾸는 세 가지 ---')
x = 1234.5678;
fprintf('num2str(x)            = %s\n', num2str(x));
fprintf('string(x)             = %s\n', string(x));
fprintf('sprintf(''%%10.3f'', x)  = %s  ← 폭까지 내 마음대로\n', sprintf('%10.3f', x));
