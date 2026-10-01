% ex0705_code_analyzer.m — Code Analyzer 를 코드로 돌리기 (7.5.1)
% 편집창 오른쪽 세로 막대에 뜨는 주황(warning)·빨강(error) 표시와
% 같은 정보를 명령으로 받아 보는 함수가 checkcode 다.

clear; clc

disp('=== 경고가 있는 파일 검사 ===')
checkcode('warn_demo.m')

disp(' ')
disp('=== 결과를 구조체로 받아 직접 다루기 ===')
issues = checkcode('warn_demo.m', '-struct');
fprintf('경고 %d 건\n', numel(issues));
for k = 1:numel(issues)
    fprintf('  %3d 행: %s\n', issues(k).line, issues(k).message);
end

disp(' ')
disp('=== 경고 ID 까지 보기 (억제할 때 쓴다) ===')
ids = checkcode('warn_demo.m', '-id', '-struct');
u = unique(string({ids.id}));
fprintf('나온 ID: %s\n', strjoin(u, ', '));
fprintf('특정 줄의 경고를 끄려면 그 줄 끝에 %%#ok<ID> 를 붙인다.\n');

disp(' ')
disp('=== 문법 오류(빨강)는 어떻게 보이는가 ===')
% 문법 오류가 있는 파일은 저장소에 둘 수 없으므로 임시로 만들어 검사한다
badfile = fullfile(tempdir, 'syntax_error_demo.m');
fid = fopen(badfile, 'wt');
fprintf(fid, 'x = 5;\n');
fprintf(fid, 'y = (x + 3;\n');        % 괄호가 닫히지 않았다
fprintf(fid, 'disp(y)\n');
fclose(fid);

checkcode(badfile)

fprintf('\n문법 오류가 남아 있으면 breakpoint 를 걸 수 없다.\n');
delete(badfile);

disp(' ')
disp('=== 경고가 늘 문제인 것은 아니다 ===')
fprintf('warn_demo.m 의 1~2 행은 "세미콜론을 빼서 결과가 출력된다"는 경고다.\n');
fprintf('의도적으로 결과를 보여 주려 한 것이라면 그대로 두면 된다.\n');
