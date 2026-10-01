% ex0724_table_basics.m — table 로 자료형이 다른 열을 한 표에 (7.2.4)
% disp 나 fprintf 로는 글자 열과 숫자 열을 섞어 보기 좋게 내기가 번거롭다.
% table 은 서로 다른 자료형의 열을 한 변수에 담는다.

clear; clc

% 지구와 달에서 100 초 동안 떨어진 거리
p = ["Earth"; "Moon"];        % 행성 이름 (열 벡터, string)
g = [9.81; 1.62];             % 중력가속도 (열 벡터, double)
t = 100;
d = 0.5 * g * t^2;            % 낙하 거리

disp('--- 입력은 모두 열 벡터여야 한다 ---')
fprintf('size(p) = %s, size(g) = %s, size(d) = %s\n', ...
    mat2str(size(p)), mat2str(size(g)), mat2str(size(d)));

disp(' ')
disp('--- (1) 변수 이름이 그대로 열 이름이 된다 ---')
table(p, g, d)      %#ok<NOPTS>

disp('--- (2) VariableNames 로 열 이름 지정 ---')
table(p, g, d, 'VariableNames', ["Planet", "Gravity", "Distance"])   %#ok<NOPTS>

disp('--- (3) disp 로 감싸면 ans = 줄이 사라진다 ---')
disp(table(p, g, d, 'VariableNames', ["Planet", "Gravity", "Distance"]))

disp(' ')
disp('--- VariableNames 는 작은따옴표로 써야 한다 ---')
try
    table(p, g, "VariableNames", ["A", "B"]);
    disp('큰따옴표도 받아들였다.')
catch err
    fprintf('큰따옴표를 쓰면: %s\n', err.message);
    fprintf('(옵션 이름이 아니라 "데이터 열"로 취급되어 행 수가 안 맞는다고 한다)\n');
end

disp(' ')
disp('--- 행 벡터를 주면 오류는 안 나지만 표가 엉뚱해진다 ---')
T_wrong = table(p', g');
fprintf('size(T_wrong) = %s  ← 행이 1 개뿐이다\n', mat2str(size(T_wrong)));
disp(T_wrong)
fprintf('각 변수가 1x2 짜리 "한 칸"이 되어 버렸다: size(T_wrong.Var1) = %s\n', ...
    mat2str(size(T_wrong.Var1)));
