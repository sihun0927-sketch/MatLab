% 정답 21: 의사코드 → 코드. 점수 분포 히스토그램과 학점별 인원
clear, clc, clf
% 1. 점수 벡터 정의
scores = [100 95 74 87 22 78 34 82 93 88 86 69 55 72 61 90];
% 2. 학점 경계(edges) 정의
edges = [0 60 70 80 90 100];
% 3. histcounts로 구간별 인원 계산
counts = histcounts(scores, edges);
% 4. 구간 이름과 인원을 표로 출력
labels = ["F" "D" "C" "B" "A"]';
disp(table(labels, counts', VariableNames = ["Grade", "Count"]))
% 5. 히스토그램(edge 지정)과 막대그래프를 나란히 그린다
tiledlayout(1, 2)
nexttile
histogram(scores, edges)
title("Histogram with grade edges"), xlabel("Score"), ylabel("Students")
nexttile
bar(counts)
xticklabels(labels)
title("Students per grade"), xlabel("Grade"), ylabel("Students")
% 6. 평균·표준편차 출력
fprintf('mean = %.1f, std = %.1f, median = %.1f\n', mean(scores), std(scores), median(scores))
theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../img/a21_histogram.png')
