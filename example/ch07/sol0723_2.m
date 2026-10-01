% sol0723_2.m — 7.2.3 연습문제 2
% sprintf 로 여러 줄짜리 영수증 문자열을 "만들어 두고" 나중에 쓴다.

clear; clc

item  = ["연필"; "공책"; "지우개"];
qty   = [12; 3; 2];
price = [300; 1200; 500];
total = qty .* price;

% 숫자 자리(%d)에는 숫자를, 글자 자리(%s)에는 글자를 줘야 한다.
% 한 줄에 글자와 숫자가 섞이면 cell 로 묶어 한꺼번에 넘기는 편이 쉽다.
rows = strings(numel(item), 1);
for k = 1:numel(item)
    rows(k) = sprintf("%-8s %4d %8d %9d", item(k), qty(k), price(k), total(k));
end
lines = join(rows, newline) + newline;

% format 을 큰따옴표로 주면 결과도 string 이라 + 로 이어 붙일 수 있다.
% 작은따옴표로 주면 char 가 돌아오고, char + char 는 "덧셈"이 되어 버린다.
header  = sprintf("%-8s %4s %8s %9s\n", '품목', '수량', '단가', '금액');
divider = sprintf("%s\n", repmat('=', 1, 33));
footer  = sprintf("%-8s %4s %8s %9d\n", '합계', '', '', sum(total));

receipt = divider + header + divider + lines + divider + footer + divider;

disp('--- 만들어 둔 영수증 (아직 화면에 찍기 전) ---')
fprintf('class(receipt) = %s, 글자 수 = %d, 줄 수 = %d\n\n', ...
    class(receipt), strlength(receipt), numel(splitlines(strtrim(receipt))));

disp('--- 이제 출력 ---')
fprintf('%s', receipt);

disp('--- 같은 문자열을 파일로도 보낼 수 있다 ---')
fname = fullfile(tempdir, 'receipt.txt');
fid = fopen(fname, "wt");
fprintf(fid, '%s', receipt);
fclose(fid);
fprintf('%s 에 %d 바이트 저장\n', fname, dir(fname).bytes);
delete(fname);

disp(' ')
disp('--- 함정 1: char format 이면 + 가 문자열 연결이 아니라 덧셈이 된다 ---')
fprintf('sprintf(''ab'') + sprintf(''cd'') = %s  ← ASCII 코드끼리 더해졌다\n', ...
    mat2str(sprintf('ab') + sprintf('cd')));
fprintf('sprintf("ab") + sprintf("cd") = %s  ← 이쪽이 연결이다\n', ...
    sprintf("ab") + sprintf("cd"));

disp(' ')
disp('--- 함정 2: %d 자리에 string 을 주면 오류다 ---')
try
    sprintf('%d\n', string(qty));
catch err
    fprintf('sprintf(''%%d'', string(qty)) → %s\n', err.message);
end
fprintf('반대로 %%s 자리에는 숫자를 줄 수 있다(문자 코드로 해석된다): "%s"\n', sprintf('%s', 65:67));

fprintf('\n문자열을 한 번 만들어 두면 화면, 파일, 그래프 제목 어디로든 보낼 수 있다.\n');
fprintf('이것이 fprintf 대신 sprintf 를 쓰는 이유다.\n');
