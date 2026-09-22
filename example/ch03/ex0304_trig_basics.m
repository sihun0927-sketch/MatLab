% ex0304_trig_basics.m
% 3.4 삼각함수 (Table 3.4)
clear; clc

% MATLAB 의 기본 삼각함수는 입력 각도를 라디안으로 본다
fprintf("sin(0)       = %g\n", sin(0))
fprintf("cos(pi)      = %g\n", cos(pi))
fprintf("tan(pi)      = %.4e   <- 정확히 0 이 아니다\n", tan(pi))
fprintf("sin(pi)      = %.4e   <- 정확히 0 이 아니다\n", sin(pi))

% 도(degree) 단위 전용 함수는 이름 끝에 d 가 붙는다
fprintf("sind(90)     = %g\n", sind(90))
fprintf("sin(90)      = %.4f   <- 90 라디안의 sin\n", sin(90))

% 단위 변환
fprintf("deg2rad(90)  = %.4f\n", deg2rad(90))
fprintf("rad2deg(pi)  = %g\n", rad2deg(pi))

% 역삼각함수: sin^-1(x) 는 asin(x) 로 쓴다
fprintf("asin(-1)     = %.4f rad\n", asin(-1))
fprintf("asind(1)     = %g deg\n", asind(1))

% 쌍곡선 함수
fprintf("sinh(pi)     = %.4f\n", sinh(pi))
fprintf("asinh(1)     = %.4f\n", asinh(1))

% 두 인수 아크탄젠트: 사분면을 구분한다
fprintf("atan(-1/-1)   = %.4f rad\n", atan(-1/-1))
fprintf("atan2(-1,-1)  = %.4f rad   <- 3사분면을 올바로 반환\n", atan2(-1,-1))
