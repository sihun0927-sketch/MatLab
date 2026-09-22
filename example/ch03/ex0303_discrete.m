% ex0303_discrete.m
% 3.3.3 이산수학 함수 (Table 3.3)
clear; clc

disp("factor(12)     = " + join(string(factor(12)), "  "))
fprintf("gcd(10,15)     = %d\n", gcd(10,15))
fprintf("lcm(2,5)       = %d\n", lcm(2,5))
fprintf("lcm(2,10)      = %d\n", lcm(2,10))

% rats 는 부동소수점 수를 분수 문자열로 표현한다
disp("rats(1.5)      = " + strtrim(rats(1.5)))
disp("rats(1/3)      = " + strtrim(rats(1/3)))
disp("rats(pi)       = " + strtrim(rats(pi)) + "   <- 정확한 값이 아니라 근삿값")

fprintf("factorial(6)   = %d\n", factorial(6))
fprintf("nchoosek(10,3) = %d\n", nchoosek(10,3))

disp("primes(10)     = " + join(string(primes(10)), "  "))
fprintf("isprime(7)     = %d\n", isprime(7))
fprintf("isprime(10)    = %d\n", isprime(10))

% 순열(permutation)은 정의식으로 계산한다: n!/(n-k)!
n = 5; k = 2;
fprintf("5P2 = %d,  5C2 = %d\n", factorial(n)/factorial(n-k), nchoosek(n,k))
