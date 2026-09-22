% sol0533_2.m - 5.3.3 연습문제 2
% 월별 강수량을 가로 막대(barh)로 그린다.

clear; clc; close all

months = ["Jan","Feb","Mar","Apr","May","Jun"];
rain   = [32, 45, 61, 88, 120, 210];    % mm

barh(rain)
yticklabels(months)
xlabel("Rainfall, mm")
ylabel("Month")
title("Monthly Rainfall")
grid on
