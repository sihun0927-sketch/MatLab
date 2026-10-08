% sol0803_1.m — 8.3 연습문제 1: 2차원 배열에서 [row, col] = find

clear; clc

% 행 = 학생 1~3, 열 = 과목 1~4
scores = [85, 92, 58, 77;
          45, 88, 91, 66;
          73, 59, 80, 95];

[r, c] = find(scores < 60);
fprintf("학생 %d, 과목 %d: %d 점\n", [r, c, scores(scores < 60)]');

% single index 로 받으면 열 우선 번호가 나온다
find(scores < 60)'          % 2 6 7
