% sol0704_1.m — 7.4 연습문제 1
% CSV 파일을 만들고 readtable 로 읽어 통계를 낸다.

clear; clc

% --- 자료 파일 만들기 (보통은 실험 장비나 다른 프로그램이 만들어 준다) ---
fname = fullfile(tempdir, 'measure.csv');
fid = fopen(fname, "wt");
fprintf(fid, 'Day,Site,Rainfall,Temp\n');
data = {1,'A',12.5,18.2; 2,'A',0.0,21.4; 3,'A',33.1,16.9; ...
        1,'B',8.2,19.0; 2,'B',2.5,22.1; 3,'B',41.0,15.5};
for k = 1:size(data, 1)
    fprintf(fid, '%d,%s,%.1f,%.1f\n', data{k,1}, data{k,2}, data{k,3}, data{k,4});
end
fclose(fid);

disp('--- 만든 파일 ---')
disp(fileread(fname))

% --- 읽기 ---
T = readtable(fname, TextType="string");
disp('--- readtable 결과 ---')
disp(T)
fprintf('size = %s\n', mat2str(size(T)));
for k = 1:width(T)
    fprintf('  %-10s %s\n', T.Properties.VariableNames{k}, class(T{:,k}));
end

disp(' ')
disp('--- 전체 통계 ---')
fprintf('총 강우량 = %.1f mm, 평균 기온 = %.2f degC\n', sum(T.Rainfall), mean(T.Temp));

disp(' ')
disp('--- 지점별로 묶어서 ---')
G = groupsummary(T, "Site", ["sum" "mean"], ["Rainfall" "Temp"]);
disp(G)

disp(' ')
disp('--- 조건으로 고르기 ---')
wet = T(T.Rainfall > 10, :);
fprintf('강우량 10 mm 초과인 날 %d 건:\n', height(wet));
disp(wet)

delete(fname);
