% sol0704_2.m — 7.4 연습문제 2
% patients.dat 에서 조건에 맞는 행만 골라 새 파일로 내보낸다.
% 읽기(readtable) → 고르기 → 쓰기(writetable) 가 자료 처리의 기본 흐름이다.

clear; clc

T = readtable("patients.dat", 'TextType', 'string');
fprintf('원본: %d 행 x %d 열\n', height(T), width(T));

% --- 고르기: 비흡연자이면서 수축기 혈압이 120 미만 ---
sel = T(T.Smoker == 0 & T.Systolic < 120, ...
        ["LastName", "Age", "Height", "Weight", "Systolic", "Diastolic"]);
fprintf('조건에 맞는 환자 = %d 명\n\n', height(sel));

% --- 열 하나 더 계산해서 붙이기: BMI ---
% patients.dat 의 Height 는 인치, Weight 는 파운드다
sel.BMI = 703 * sel.Weight ./ sel.Height.^2;

disp('--- 앞 다섯 명 ---')
disp(head(sel, 5))

fprintf('평균 나이 %.2f 세, 평균 BMI %.2f\n', mean(sel.Age), mean(sel.BMI));

% --- 내보내기 ---
out_csv  = fullfile(tempdir, 'healthy.csv');
out_xlsx = fullfile(tempdir, 'healthy.xlsx');

writetable(sel, out_csv);
fprintf('\nCSV  로 저장: %d 바이트\n', dir(out_csv).bytes);

writetable(sel, out_xlsx);
fprintf('XLSX 로 저장: %d 바이트  ← 확장자만 바꾸면 형식이 바뀐다\n', dir(out_xlsx).bytes);

% --- 되읽어 확인 ---
back = readtable(out_csv, 'TextType', 'string');
fprintf('\n되읽은 크기 = %s, 원본과 같은가? %d\n', ...
    mat2str(size(back)), isequal(size(back), size(sel)));
fprintf('BMI 가 그대로인가? %d\n', max(abs(back.BMI - sel.BMI)) < 1e-10);

delete(out_csv); delete(out_xlsx);
