% sol0722_3.m — 7.2.2 연습문제 3
% 계산 결과를 파일로 내보내고, 쓴 바이트 수를 확인한 뒤 되읽는다.

clear; clc

t = 0:0.5:3;
v0 = 20;  g = 9.81;
h = v0*t - 0.5*g*t.^2;

fname = fullfile(tempdir, 'sol0722_3_out.txt');

fid = fopen(fname, "wt");
if fid == -1
    error('파일을 열 수 없다: %s', fname);
end

n1 = fprintf(fid, '%-8s %-10s\n', 'time(s)', 'height(m)');
n2 = fprintf(fid, '%s\n', repmat('-', 1, 19));
n3 = fprintf(fid, '%-8.1f %-10.3f\n', [t; h]);
fclose(fid);

fprintf('fprintf 반환값: 머리글 %d + 구분선 %d + 본문 %d = %d 글자\n', ...
    n1, n2, n3, n1 + n2 + n3);
fprintf('실제 파일 크기 = %d 바이트\n', dir(fname).bytes);
fprintf('차이 %d 바이트 = 줄 수 %d 개.\n', dir(fname).bytes - (n1+n2+n3), numel(t) + 2);
fprintf('("wt" 모드라 윈도우에서는 \\n 하나가 CR+LF 2 바이트로 저장된다.\n');
fprintf(' 반환값은 글자 수, 파일 크기는 바이트 수라 줄 수만큼 어긋난다.)\n');

disp(' ')
disp('--- 파일 내용 ---')
disp(fileread(fname))

disp('--- 되읽어 다시 계산 ---')
M = readmatrix(fname, NumHeaderLines=2);
fprintf('readmatrix 로 읽은 크기 = %s\n', mat2str(size(M)));
fprintf('최고 높이 = %.3f m (t = %.1f s)\n', max(M(:,2)), M(M(:,2) == max(M(:,2)), 1));

delete(fname);
