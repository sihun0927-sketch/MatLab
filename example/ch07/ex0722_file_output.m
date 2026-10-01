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
fclose(fid);

fprintf('fprintf 가 돌려준 값 = %d\n', count);
fprintf('실제 파일 크기       = %d 바이트\n', dir(fname).bytes);
fprintf('한 줄은 [%s] %d 글자 + 줄바꿈 1 = 26 글자, 다섯 줄이니 130 이다.\n', ...
    sprintf('%4.0f feet = %6.0f inches', 1, 12), ...
    numel(sprintf('%4.0f feet = %6.0f inches', 1, 12)));
fprintf('"wt" 모드에서는 \\n 하나가 디스크에 CR+LF 2 바이트로 저장되어 5 바이트가 더 늘었다.\n');

disp(' ')
disp('--- 쓴 파일을 그대로 읽어 보기 ---')
disp(fileread(fname))

% fid 를 생략하면 화면(fid 1)으로 간다
disp('--- fid 없이 쓰면 화면으로 간다 ---')
fprintf('%4.0f feet = %6.0f inches\n', [feet(1:2); inches(1:2)]);
fprintf('fprintf(1, ...) 도 같은 뜻: ');
fprintf(1, '화면\n');

% "wb"(바이너리 모드)로 열면 반환값과 파일 크기가 일치한다
fid = fopen(fname, "wb");
count_b = fprintf(fid, '%4.0f feet = %6.0f inches\n', [feet; inches]);
fclose(fid);
fprintf('\n"wb" 모드: 반환값 = %d, 파일 크기 = %d  ← 일치한다\n', count_b, dir(fname).bytes);

% 이어 쓰려면 "at"(append + text)
fid = fopen(fname, "at");
fprintf(fid, '%s 에 덧붙인 줄\n', 'append');
fclose(fid);
lines = splitlines(strtrim(string(fileread(fname))));
fprintf('\n덧붙인 뒤 마지막 줄: %s\n', lines(end));

delete(fname);
