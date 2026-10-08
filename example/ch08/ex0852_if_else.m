% ex0852_if_else.m — if/else (8.5.2)
% else 줄에는 조건을 쓰지 않는다. if 가 거짓일 때만 실행된다.

clear; clc

if usejava('desktop')
    x = input("Enter a value of x: ")
else
    x = 5                   % -batch: 5 를 입력했다고 가정
end

if x > 0
    y = log(x)
else
    disp("The input to the log function must be positive")
end

%% 음수를 넣으면 else 쪽
x = -1;
if x > 0
    y = log(x)
else
    disp("The input to the log function must be positive")
end

%% 배열을 넣으면? 원소 하나라도 0 이하면 조건 전체가 거짓 → else
x = [5 -1 2];
if x > 0
    y = log(x)
else
    disp("x = " + mat2str(x) + " → else 실행 (모든 원소가 양수가 아니다)")
end

%% 양수인 원소만 log 를 구하고 싶다면 if 가 아니라 logical indexing
y = NaN(size(x));
ok = x > 0;
y(ok) = log(x(ok))
