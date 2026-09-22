% sol0305_2.m  (3.5 연습문제 2)
% 1열 기준 내림차순. 행이 흐트러지면 안 되므로 sortrows.
clear; clc

scores = [88 92 75
          79 85 91
          93 70 84
          65 88 77];

disp("sortrows(scores,-1)")
disp(sortrows(scores, -1))

disp("(비교) sort(scores,'descend') - 열마다 따로 정렬되어 학생 정보가 깨진다")
disp(sort(scores, "descend"))
