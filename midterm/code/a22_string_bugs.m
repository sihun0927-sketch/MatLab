% 정답 22: 문자열 수정본
clear, clc
names = ["Steven"; "Jasmin"; "David"];      % 길이가 다르면 string 배열(또는 char())
first = "Holly";
last = 'Moore';
full = first + " " + last                   % string + char → string. 문제 없음
n = strlength(full)                         % length(string 스칼라)는 1
greeting = "Hello, " + full + "!"           % [char string char]는 1x3 string 배열이 된다
f = char(full);                             % string은 full(1)이 통째로 나온다
initials = string(f(1)) + last(1)           % char + char는 숫자 덧셈이므로 string으로 바꾼다
tag = "Trial " + 11                         % 문제 없음
lens = strlength(names)                     % strlength는 text(string) 입력
