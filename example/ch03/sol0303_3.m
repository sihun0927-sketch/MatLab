% sol0303_3.m  (3.3 연습문제 3)
% 조합과 순열
clear; clc

n = 12; k = 3;
comb = nchoosek(n,k);                          % 순서 무관
perm = factorial(n)/factorial(n-k);            % 순서 중요
fprintf("(a) 12명 중 3명 조 편성  : %d 가지\n", comb)
fprintf("(b) 조장/부조장/서기 선출: %d 가지\n", perm)
fprintf("검산: perm = comb * 3! = %d\n", comb*factorial(k))
