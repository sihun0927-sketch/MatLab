% ex0701_input_s.m — input(prompt, "s") (7.1)
% 두 번째 인수에 "s" 를 주면 따옴표 없이 친 글자를 그대로 받는다.
% 이름이 "s"(string)이지만 돌아오는 것은 char 배열이다.
% string 데이터형이 생기기 전에 만들어진 함수라서 이름이 그렇게 남았다.

clear; clc

interactive = usejava('desktop');

if interactive
    p = input("Enter your name - no need to include quotes ", "s");
else
    disp('[-batch 모드] Lin 을 입력했다고 가정한다.')
    p = 'Lin';
end

fprintf('p = %s\n', p);
fprintf('class(p) = %s   ← "s" 를 줬는데도 string 이 아니라 char\n', class(p));
fprintf('size(p)  = %s\n', mat2str(size(p)));

% string 으로 쓰고 싶으면 직접 변환한다
ps = string(p);
fprintf('string(p) → class %s, size %s\n', class(ps), mat2str(size(ps)));

% "s" 없이 받으면 사용자가 따옴표를 쳐야 한다.
% 따옴표 없이 Lin 이라고 치면 MATLAB 은 Lin 이라는 "변수"를 찾다가 오류를 낸다.
try
    eval('Lin');
catch err
    fprintf('\n따옴표 없이 Lin 을 입력했다면: %s\n', err.message);
end

% "s" 로 받은 숫자는 숫자가 아니라 글자다 — 계산하려면 str2double
age_txt = '42';
fprintf('\n''42'' + 1      = %s  ← char 가 ASCII 코드로 바뀌어 더해진다\n', mat2str(age_txt + 1));
fprintf('str2double 뒤   = %g\n', str2double(age_txt) + 1);
