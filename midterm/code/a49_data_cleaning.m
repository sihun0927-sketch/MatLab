% 정답 49: 의사코드 → 코드. 측정 데이터 정리 (find / logical indexing)
clear, clc
% 1. 측정값 벡터 (-999는 결측, 0 미만·200 초과는 이상치)
raw = [23.1 24.0 -999 25.2 310 24.8 -999 23.9 -5 24.4];
% 2. 결측 위치를 find로 찾아 보고
missing = find(raw == -999);
fprintf('Missing at index: %s\n', num2str(missing))
% 3. 이상치(0 미만 또는 200 초과, 결측 제외) 위치 보고
bad = raw ~= -999 & (raw < 0 | raw > 200);
fprintf('Outliers at index: %s (values %s)\n', num2str(find(bad)), num2str(raw(bad)))
% 4. 유효 데이터만 추출
valid = raw(raw ~= -999 & ~bad);
% 5. 통계 출력
fprintf('%d valid of %d; mean %.2f, std %.2f\n', numel(valid), numel(raw), mean(valid), std(valid))
% 6. 결측·이상치를 유효 평균으로 치환한 벡터
filled = raw;
filled(raw == -999 | bad) = mean(valid);
disp(filled)
