% sol0535_2.m - 5.3.5 연습문제 2
% 시간에 따른 온도(섭씨)와 압력(kPa)을 두 y축으로 비교한다.

clear; clc; close all

time        = 0 : 2 : 20;                       % minutes
temperature = 20 + 3*time;                      % degrees C
pressure    = 101 + 0.8*time.^2;                % kPa

yyaxis left
plot(time, temperature, "-o")
ylabel("Temperature, ^oC")

yyaxis right
plot(time, pressure, "-s")
ylabel("Pressure, kPa")

xlabel("Time, minutes")
title("Reactor Conditions")
legend("Temperature", "Pressure", Location="northwest")
