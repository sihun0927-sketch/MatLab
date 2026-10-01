% ex0704_readtable_patients.m — readtable 로 데이터 파일 읽기 (7.4)
% readtable 은 .dat .txt .csv .xls .xlsx 등을 읽어 table 로 만든다.
% 열 이름은 파일 첫 줄에서, 각 열의 자료형은 내용에서 자동으로 정한다.

clear; clc

% patients.dat 은 MATLAB 이 기본으로 들고 있는 예제 파일이라
% search path 위에 있어 경로 없이 이름만 줘도 찾는다.
fprintf('patients.dat 의 위치:\n  %s\n\n', which('patients.dat'));

T = readtable("patients.dat");

fprintf('class(T) = %s,  size(T) = %s\n\n', class(T), mat2str(size(T)));

disp('--- 열 이름 (파일 첫 줄에서 가져온다) ---')
disp(T.Properties.VariableNames')

disp('--- 처음 다섯 행 ---')
disp(head(T, 5))

disp('--- 열마다 자료형이 다르게 잡힌다 ---')
for k = 1:width(T)
    fprintf('  %-22s %s\n', T.Properties.VariableNames{k}, class(T{:,k}));
end

disp(' ')
disp('--- 표를 자료처럼 다루기 ---')
fprintf('평균 나이 = %.2f 세\n', mean(T.Age));
fprintf('흡연자 수 = %d 명 / %d 명\n', sum(T.Smoker), height(T));
fprintf('수축기 혈압 최대 = %d, 최소 = %d\n', max(T.Systolic), min(T.Systolic));

disp(' ')
disp('--- 조건으로 행 고르기 ---')
old_smokers = T(T.Smoker == 1 & T.Age > 40, {'LastName', 'Age', 'Systolic'});
fprintf('40 세 초과 흡연자 %d 명 중 앞 세 명:\n', height(old_smokers));
disp(head(old_smokers, 3))

% 데스크톱에서는 workspace 에서 T 를 더블클릭하면 Variable Editor 로 열린다.
% 100 행짜리 표는 명령창보다 Variable Editor 로 보는 편이 낫다.
