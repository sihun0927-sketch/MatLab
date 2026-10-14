% 정답 38: string 배열 처리
clear, clc
names = ["Steven" "Jasmin" "David" "Terrell" "Maria" "Lin"];
scores = [88 92 75 60 95 81];
len = strlength(names);
long_names = names(len > 5)
[sorted_scores, order] = sort(scores, "descend");
ranking = names(order) + " (" + sorted_scores + ")"
report = names + ": " + scores;
fprintf('%s\n', report(scores >= 80))
label = "Top: " + names(order(1)) + ", bottom: " + names(order(end))
longest = names(len == max(len))
total_chars = sum(len)
