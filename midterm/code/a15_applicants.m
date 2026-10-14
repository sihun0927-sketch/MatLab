% 정답 15: 의사코드 → 코드. 지원자 자격 심사
clear, clc
% 1. 지원자 데이터 [키(in), 나이] 를 정의한다
applicants = [63 18; 67 19; 65 18; 72 20; 69 36; 78 34; 75 12; 70 25];
% 2. 세 조건을 모두 만족하는 행 번호를 find로 얻는다
qualify = find(applicants(:,1) >= 66 & applicants(:,2) >= 18 & applicants(:,2) < 35);
% 3. 합격 인원과 비율을 구한다
n = numel(qualify);
pct = n / height(applicants) * 100;
% 4. 합격자 번호·키·나이를 한 줄씩 출력한다
results = [qualify, applicants(qualify, :)]';
fprintf('Applicant #%d: %2.0f in, %2.0f yr\n', results)
% 5. 요약을 출력한다
fprintf('%d of %d qualified (%.1f%%)\n', n, height(applicants), pct)
fprintf('Mean height of qualified: %.2f in\n', mean(applicants(qualify, 1)))
% 6. 탈락 사유별 인원 (키 미달 / 나이)
fprintf('Too short: %d, wrong age: %d\n', sum(applicants(:,1) < 66), ...
        sum(applicants(:,2) < 18 | applicants(:,2) >= 35))
