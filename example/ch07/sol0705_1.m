% sol0705_1.m — 7.5 연습문제 1
% Code Analyzer 가 잡아 주는 경고를 직접 확인하고, 고친 코드와 비교한다.

clear; clc

disp('=== 고치기 전: warn_demo.m ===')
before = checkcode('warn_demo.m', '-id', '-struct');
fprintf('경고 %d 건\n', numel(before));
for k = 1:numel(before)
    fprintf('  %3d 행 [%s] %s\n', before(k).line, before(k).id, before(k).message);
end

% --- 같은 계산을 경고 없이 다시 쓴다 ---
fixed = fullfile(tempdir, 'fixed_demo.m');
fid = fopen(fixed, "wt");
fprintf(fid, '%% fixed_demo.m - warn_demo.m 과 같은 일을 경고 없이 한다\n');
fprintf(fid, 'r = 3;\n');                       % 세미콜론을 붙인다
fprintf(fid, 'area = pi * r^2;\n');
fprintf(fid, 'total = sum(1:5);\n');            % 반복문 대신 벡터 연산
fprintf(fid, 'v = (1:5).^2;\n');                % 자라는 배열 대신 한 번에
fprintf(fid, 'if abs(area - pi*9) < 1e-12\n');  % 실수 == 비교 대신 허용오차
fprintf(fid, '    disp(''같다'')\n');
fprintf(fid, 'end\n');
fprintf(fid, 'fprintf(''total=%%d, v=%%s, area=%%.4f\\n'', total, mat2str(v), area);\n');
fclose(fid);

disp(' ')
disp('=== 고친 뒤 ===')
after = checkcode(fixed, '-struct');
fprintf('경고 %d 건\n', numel(after));
if isempty(after)
    disp('  (없음)')
else
    for k = 1:numel(after)
        fprintf('  %3d 행: %s\n', after(k).line, after(k).message);
    end
end

disp(' ')
disp('=== 고친 코드의 실행 결과 ===')
run(fixed)

disp(' ')
disp('=== 경고를 "일부러" 남길 때는 억제 주석을 붙인다 ===')
fprintf('  줄 끝에 %%#ok<NOPTS> 를 붙이면 그 줄의 NOPTS 경고가 사라진다.\n');
fprintf('  억제는 "의도한 것"이라는 표시다. 이해하지 못한 경고를 덮는 데 쓰면 안 된다.\n');

delete(fixed);
