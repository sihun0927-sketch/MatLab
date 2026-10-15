% 문제 51: 결측(NaN)을 제거한 뒤 평균·표준편차를 구하고,
%          반올림했을 때 홀수인 값과 평균보다 큰 값의 개수를 출력한다.
clear, clc
data = [12.5 NaN 9.8 11.2 NaN 10.4 13.1 8.7];
bad = data == NaN;
data(bad) = [];
n = length(data)
avg = sum(data)/n
spread = std(data)
odd = data(rem(round(data), 2) = 1)
fprintf('Mean %5.2f, std %5.2f over %d samples\n', avg, spread, n)
fprintf('%d of %d values are above the mean\n', sum(data > avg))
