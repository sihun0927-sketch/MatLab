%% 2.4 연습문제 2: logspace(0, 2, 5) 손 계산 vs 실행 결과
% 10^0 = 1 부터 10^2 = 100 까지 5개 값, 지수가 0, 0.5, 1, 1.5, 2로 균등 분할됨
expected = [1, 10^0.5, 10, 10^1.5, 100];
actual = logspace(0, 2, 5);

disp(expected)
disp(actual)
disp(isequal(round(expected, 4), round(actual, 4)))   % 1 (true)
