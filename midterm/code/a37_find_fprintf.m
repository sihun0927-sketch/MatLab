% 정답 37: 주어진 출력을 만드는 find + fprintf 스크립트
clear, clc
speed = [62 71 58 85 90 67 74];          % km/h
limit = 70;
over = find(speed > limit)
excess = speed(over) - limit
fprintf('Car %d: %d km/h (%d over)\n', [over; speed(over); excess])
fprintf('%d of %d cars speeding, max excess %d km/h\n', numel(over), numel(speed), max(excess))
fine = zeros(size(speed));
fine(speed > limit) = 50 + 5*excess
