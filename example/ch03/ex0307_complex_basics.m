% ex0307_complex_basics.m
% 3.7 복소수 (Table 3.14)
clear; clc

% 입력 방법 세 가지
A = 5 + 3i;
B = 5 + 3*i;
C = complex(5,3);
fprintf("A = %g %+gi\n", real(A), imag(A))
fprintf("A == B == C : %d\n", isequal(A,B,C))

% 배열 입력도 된다
x = 1:3;
y = [-1 5 12];
D = complex(x,y);
disp("complex(x,y) = " + join(string(D), "   "))

% 실수부/허수부 분리와 판정
fprintf("real(A)   = %g\n", real(A))
fprintf("imag(A)   = %g\n", imag(A))
fprintf("isreal(A) = %d   (0 이면 복소수)\n", isreal(A))
fprintf("isreal(5) = %d\n", isreal(5))

% 크기(절댓값)와 편각
fprintf("abs(3+4i)   = %g\n", abs(3+4i))
fprintf("angle(3+4i) = %.4f rad = %.2f deg\n", angle(3+4i), rad2deg(angle(3+4i)))

% 켤레복소수: conj 또는 전치 연산자 '
fprintf("conj(A) = %g %+gi\n", real(conj(A)), imag(conj(A)))
At  = A';    % 켤레 전치 (complex conjugate transpose)
Adt = A.';   % 단순 전치 (전치만, 켤레 없음)
fprintf("A'  = %g %+gi   <- 켤레까지 취한다\n", real(At),  imag(At))
fprintf("A.' = %g %+gi   <- 켤레를 취하지 않는다\n", real(Adt), imag(Adt))
