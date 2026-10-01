% ex0704_writetable.m — writetable 로 내보내고 readtable 로 되읽기 (7.4)
% 읽는 함수를 먼저 찾고 그 도움말 끝의 "See Also" 에서 쓰는 함수를 찾는 것이
% MATLAB 에서 내보내기 함수를 찾는 가장 빠른 방법이다.
%   readtable  ↔  writetable
%   readmatrix ↔  writematrix
%   audioread  ↔  audiowrite
%   imread     ↔  imwrite

clear; clc

Name  = ["Ar"; "Cu"; "Fe"; "Au"];
Z     = [18; 29; 26; 79];
Mass  = [39.948; 63.546; 55.845; 196.967];
T = table(Name, Z, Mass, 'VariableNames', ["Symbol", "AtomicNumber", "AtomicMass"]);

disp('--- 내보낼 표 ---')
disp(T)

% 확장자가 저장 형식을 정한다
csvfile = fullfile(tempdir, 'elements.csv');
txtfile = fullfile(tempdir, 'elements.txt');

writetable(T, csvfile);
writetable(T, txtfile, 'Delimiter', '\t');

disp('--- 쓴 CSV 파일의 내용 ---')
disp(fileread(csvfile))

disp('--- 되읽기 ---')
T2 = readtable(csvfile);
disp(T2)
fprintf('되읽은 Symbol 열의 클래스 = %s\n', class(T2.Symbol));
fprintf('(string 으로 썼지만 기본값으로는 cell of char 로 돌아온다)\n');

disp(' ')
disp('--- string 으로 되돌리려면 TextType 을 지정한다 ---')
T3 = readtable(csvfile, 'TextType', 'string');
fprintf('TextType="string" 일 때 = %s\n', class(T3.Symbol));

disp(' ')
disp('--- 숫자 열은 자료형이 보존된다 ---')
fprintf('원본 AtomicMass(1) = %.3f, 되읽은 값 = %.3f, 같은가? %d\n', ...
    T.AtomicMass(1), T2.AtomicMass(1), isequal(T.AtomicMass, T2.AtomicMass));

delete(csvfile); delete(txtfile);
