% ex0722_file_output.m — fprintf 로 파일에 쓰기 (7.2.2)
% 1) fopen 으로 파일을 열고 file identifier(fid)를 받는다
% 2) fprintf 의 첫 인수로 fid 를 준다
% 3) fclose 로 닫는다

clear; clc

fname = fullfile(tempdir, 'my_output_file.txt');

% "wt" = write + text 모드. 윈도우에서 \n 을 CRLF 로 바꿔 준다.
fid = fopen(fname, "wt");
if fid == -1
    error('파일을 열 수 없다: %s', fname);
end
fprintf('fopen 이 돌려준 fid = %d\n', fid);
fprintf('(1 = 화면, 2 = 오류 출력. 사용자 파일은 3 부터 받는다)\n');

% fprintf 는 "파일에 쓴 바이트 수"를 돌려준다
feet = 1:5;
inches = feet * 12;
count = fprintf(fid, '%4.0f feet = %6.0f inches\n', [feet; inches]);
fprintf('파일에 쓴 바이트 수 = %d\n', count);

fclose(fid);

disp(' ')
disp('--- 쓴 파일을 그대로 읽어 보기 ---')
disp(fileread(fname))

% fid 를 생략하면 화면(fid 1)으로 간다
disp('--- fid 없이 쓰면 화면으로 간다 ---')
fprintf('%4.0f feet = %6.0f inches\n', [feet(1:2); inches(1:2)]);
fprintf('fprintf(1, ...) 도 같은 뜻: ');
fprintf(1, '화면\n');

% 이어 쓰려면 "at"(append + text)
fid = fopen(fname, "at");
fprintf(fid, '%s 에 덧붙인 줄\n', 'append');
fclose(fid);
lines = splitlines(strtrim(string(fileread(fname))));
fprintf('\n덧붙인 뒤 마지막 줄: %s\n', lines(end));

delete(fname);
