% sol0804_1.m — 8.4 연습문제 1: 음수를 0 으로 바꾸기

clear; clc

data = [4, -2, 7, -5, 0, 3, -1];

neg = data < 0;
n = sum(neg);
data(neg) = 0

fprintf("%d 개를 0 으로 바꿨다\n", n);

% 한 줄로: data(data < 0) = 0  — 다만 바꾸기 전에 세어 둬야 개수를 알 수 있다
