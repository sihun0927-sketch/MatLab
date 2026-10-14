% 정답 03: 센서 온도 행렬에서 한계 초과값 찾기·보고·NaN 치환
clear, clc
temp = [21.5 22.0 25.8 23.1;        % 행 = 센서, 열 = 시각(1~4시)
        20.9 26.2 26.7 22.4;
        22.3 21.8 22.0 27.5];
limit = 25;
[sensor, hour] = find(temp > limit);
n_over = numel(sensor);
report = [sensor, hour, temp(sub2ind(size(temp), sensor, hour))]';   % 3 x n
fprintf('Sensor %d, hour %d: %.1f C\n', report)
fprintf('%d readings exceeded %.0f C\n', n_over, limit)
clean = temp;
clean(temp > limit) = NaN
avg_ok = mean(temp(temp <= limit));
fprintf('Mean of valid readings: %.2f C\n', avg_ok)
