% 정답 28: 의사코드 → 코드. 파일에서 읽어 선별 후 저장
clear, clc
% 1. 표 데이터를 읽는다 (내장 파일 patients.dat)
T = readtable("patients.dat");
% 2. 크기 확인
fprintf('%d patients, %d variables\n', height(T), width(T))
% 3. 흡연자이면서 수축기 혈압 125 이상인 환자 선별 (logical indexing)
risky = T(T.Smoker == 1 & T.Systolic >= 125, :);
fprintf('%d at-risk patients\n', height(risky))
% 4. 체질량지수 BMI 열 추가 (lb, in → kg, m)
risky.BMI = risky.Weight*0.4536 ./ (risky.Height*0.0254).^2;
% 5. 수축기 혈압 내림차순으로 정렬해 앞 5명 표시
risky = sortrows(risky, "Systolic", "descend");
disp(risky(1:5, ["LastName" "Age" "Systolic" "BMI"]))
% 6. 결과를 파일로 저장
writetable(risky, "../out/risky_patients.csv")
fprintf('Saved %d rows to risky_patients.csv\n', height(risky))
