% 문제 22: 이름 목록과 이름표를 만든다. 기대 출력:
%   full = "Holly Moore"      n = 11
%   greeting = "Hello, Holly Moore!"
%   initials = "HM"           tag = "Trial 11"
%   lens = 각 이름의 글자 수 (6 6 5)
clear, clc
names = ['Steven'; 'Jasmin'; 'David'];
first = "Holly";
last = 'Moore';
full = first + " " + last
n = length(full)
greeting = ['Hello, ' full '!']
initials = full(1) + last(1)
tag = "Trial " + 11
lens = strlength(names)
