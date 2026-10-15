% 정답 57: all / any / find(cond, n) / "last" / ind2sub
clear, clc
v = [2.1 2.8 1.9 2.4;
     3.6 5.2 4.1 2.9;
     1.2 2.0 2.6 1.8;
     4.4 3.9 6.1 4.8;
     2.7 2.2 3.1 2.5];           % 행 = 기계, 열 = 교대조
quiet = find(all(v < 3, 2))'
fprintf('Machines always below 3.0: %s\n', num2str(quiet))
loudShift = find(any(v > 5))
fprintf('Shifts with a reading above 5.0: %s\n', num2str(loudShift))
first2 = find(v > 4, 2)
[r, c] = ind2sub(size(v), first2);
fprintf('Reading %.1f at machine %d, shift %d\n', [v(first2)'; r'; c'])
lastIdx = find(v > 4, 1, "last");
[rl, cl] = ind2sub(size(v), lastIdx);
fprintf('Last reading above 4.0: machine %d, shift %d (%.1f)\n', rl, cl, v(lastIdx))
machine = ("M" + (1:5))';
peak = max(v, [], 2);
status = strings(5, 1);
status(peak <= 4) = "OK";
status(peak > 4) = "CHECK";
report = table(machine, peak, status, VariableNames = ["Machine" "Peak" "Status"])
