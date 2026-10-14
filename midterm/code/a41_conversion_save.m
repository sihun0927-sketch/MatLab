% 정답 41: 단위 변환표를 만들고 ASCII 파일로 저장한 뒤 다시 읽어 확인
clear, clc
mph = (0:20:120)';
kmh = mph*1.609;
fps = mph*5280/3600;
table_data = [mph, kmh, fps];
disp("  mph    km/h    ft/s")
fprintf('%5.0f %7.1f %7.2f\n', table_data')
save ../out/speeds.dat table_data -ascii
clear
load ../out/speeds.dat
fprintf('Reloaded %d rows x %d cols; fastest = %.1f km/h\n', size(speeds), max(speeds(:, 2)))
