% 문제 29: 반지름 벡터와 높이로 원기둥 부피·겉넓이를 구하고 ASCII 파일로 저장한 뒤
%          다시 불러온다.
%%Define data
clear, clc
2nd_run = 5;
radius = [1 2 3];
height = 4;
volume = pi*radius^2*height
area = 2*pi*radius(radius + height)
%% Save and reload
save results.dat volume area - ascii
load results
