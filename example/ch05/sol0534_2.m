% sol0534_2.m - 5.3.4 연습문제 2
% histcounts로 학점 구간별 인원을 구해 표로 출력한다.

clear; clc; close all

scores = [100,95,74,87,22,78,34,82,93,88,86,69,55,72];
edges  = [0, 60, 70, 80, 90, 100];
labels = ["E","D","C","B","A"];         % edges 구간은 5개

n = histcounts(scores, edges);

for k = 1 : numel(n)
    fprintf("%s (%3d ~ %3d) : %d명\n", labels(k), edges(k), edges(k+1), n(k));
end
fprintf("합계 : %d명\n", sum(n));

histogram(scores, edges)
xlabel("Test Score"); ylabel("Number of Students"); title("Test Results")
