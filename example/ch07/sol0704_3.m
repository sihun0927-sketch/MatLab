% sol0704_3.m — 7.4 연습문제 3
% readtable / readmatrix / readcell 이 같은 파일을 어떻게 다르게 읽는지 비교한다.

clear; clc

fname = fullfile(tempdir, 'mixed.csv');
fid = fopen(fname, "wt");
fprintf(fid, 'Name,Score,Pass\n');
fprintf(fid, 'Ann,88,1\n');
fprintf(fid, 'Bob,72,0\n');
fprintf(fid, 'Cid,95,1\n');
fclose(fid);

disp('--- 파일 ---')
disp(fileread(fname))

disp('=== readtable: 열 이름을 살리고 열마다 자료형을 정한다 ===')
T = readtable(fname, 'TextType', 'string');
disp(T)
fprintf('class = %s, size = %s\n', class(T), mat2str(size(T)));

disp(' ')
disp('=== readmatrix: 숫자만 남기고 글자는 NaN 이 된다 ===')
M = readmatrix(fname);
disp(M)
fprintf('class = %s, size = %s\n', class(M), mat2str(size(M)));
fprintf('머리글 줄은 자동으로 건너뛰었고, Name 열은 NaN 이 되었다.\n');

disp(' ')
disp('=== readcell: 모든 칸을 있는 그대로 cell 에 담는다 ===')
C = readcell(fname);
disp(C)
fprintf('class = %s, size = %s  ← 머리글 줄도 들어 있다\n', class(C), mat2str(size(C)));

disp(' ')
disp('=== 짝이 되는 쓰기 함수 ===')
fprintf('  readtable  ↔  writetable\n');
fprintf('  readmatrix ↔  writematrix\n');
fprintf('  readcell   ↔  writecell\n');
fprintf('  audioread  ↔  audiowrite\n');
fprintf('  imread     ↔  imwrite\n');
fprintf('읽는 함수의 도움말 맨 아래 "참고 항목"에 쓰는 함수가 적혀 있다.\n');

disp(' ')
disp('=== 자료가 순수 숫자라면 readmatrix 가 가장 간단하다 ===')
nfile = fullfile(tempdir, 'numbers.txt');
writematrix(magic(4), nfile);
disp(fileread(nfile))
disp(readmatrix(nfile))

delete(fname); delete(nfile);
