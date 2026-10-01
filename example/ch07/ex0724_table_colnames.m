% ex0724_table_colnames.m — 열 이름을 미리 배열에 담기, 표 저장·열람 (7.2.4)

clear; clc

p = ["Earth"; "Moon"; "Mars"];
g = [9.81; 1.62; 3.72];
t = 100;
d = 0.5 * g * t^2;

% 열 이름을 따로 변수에 담아 두면 재사용하기 좋다
ColNames = ["Planet", "Gravity (m/s^2)", "Distance (m)"];
T = table(p, g, d, VariableNames=ColNames);

disp('--- 이름을 붙여 workspace 에 저장한 표 ---')
disp(T)

fprintf('class(T) = %s\n', class(T));
fprintf('size(T)  = %s   (행 3, 변수 3)\n', mat2str(size(T)));
fprintf('height(T) = %d, width(T) = %d\n', height(T), width(T));

disp(' ')
disp('--- 열 하나 꺼내기 ---')
% 이름에 공백·괄호가 있으면 점 표기 대신 괄호와 따옴표를 쓴다
disp(T.Planet')
disp(T.("Gravity (m/s^2)")')
fprintf('두 번째 열의 클래스 = %s\n', class(T{:,2}));

disp(' ')
disp('--- 행 고르기 ---')
disp(T(T.("Gravity (m/s^2)") > 3, :))

disp(' ')
disp('--- 열 추가 / 이름 바꾸기 ---')
T.Ratio = g / 9.81;
T.Properties.VariableNames(4) = "지구 대비";
disp(T)

disp(' ')
disp('--- 요약 ---')
summary(T(:, 2:3))

% 데스크톱에서는 workspace 창에서 변수 이름을 더블클릭하면
% Variable Editor 가 열려 표를 직접 보고 고칠 수 있다.
% 코드로 여는 명령은 openvar 다.
if usejava('desktop')
    openvar('T')
else
    disp('(-batch 모드라 Variable Editor 는 열지 않는다. 데스크톱에서는 openvar(''T''))')
end
