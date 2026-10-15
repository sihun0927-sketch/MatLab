% 정답 51: NaN 제거 통계 수정본
clear, clc
data = [12.5 NaN 9.8 11.2 NaN 10.4 13.1 8.7];
bad = isnan(data);                 % == NaN 은 항상 false
data(bad) = [];
n = length(data)                   % 벡터이므로 numel과 같다 (오류 아님)
avg = sum(data)/n
spread = std(data)
odd = data(rem(round(data), 2) == 1)   % 비교는 ==
fprintf('Mean %5.2f, std %5.2f over %d samples\n', avg, spread, n)
fprintf('%d of %d values are above the mean\n', sum(data > avg), n)  % 인수 2개
