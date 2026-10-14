% 정답 17: meshgrid로 복리 원리금 표 만들기
clear, clc
P = 1000;
rate = [0.03 0.05 0.08 0.10];       % 연이율
years = (0:5:30)';                  % 년
[R, N] = meshgrid(rate, years);     % R: 열마다 이율, N: 행마다 연수
A = P*(1 + R).^N;
disp("Year    3%       5%       8%      10%")
fprintf('%4d %8.0f %8.0f %8.0f %8.0f\n', [years, A]')
below = sum(A < 2*P);               % 열별 "아직 두 배 미만"인 연수 개수
double_year = years(below + 1)';    % 처음 두 배를 넘는 연도
fprintf('Rate %.0f%%: doubles by year %d\n', [rate*100; double_year])
