% 정답 18: 데이터 분석 수정본
clear, clc
scores = [78 92 65; 88 71 95; 60 85 79; 90 68 72];
exam_max = max(scores)                    % max라는 변수명으로 함수를 덮지 않는다
avg = mean(scores, 2)                     % 학생별(행) 평균은 dim = 2
[best, exam] = max(scores, [], 2)         % dim 지정은 빈 자리 [] 뒤
ranked = sortrows(scores, -1)             % 행을 통째로, 1열 내림차순
pass = find(avg >= 75)
fprintf('Student %d passed with average %.1f\n', [pass'; avg(pass)'])
