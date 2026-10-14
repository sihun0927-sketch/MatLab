% 정답 02: 주어진 출력을 만드는 데이터 분석 명령
clear, clc
x = [4 9 2; 7 1 8; 3 6 5]
colmax = max(x)
[rowmax, where] = max(x, [], 2)
s1 = sort(x, "descend")
s2 = sortrows(x, -2)
m = mean(x, 2)'
n = numel(find(x > mean(x(:))))
