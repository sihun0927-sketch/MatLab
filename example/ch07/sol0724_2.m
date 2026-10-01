% sol0724_2.m — 7.2.4 연습문제 2
% 열 이름을 미리 배열에 담아 쓰고, 표의 메타정보(단위·설명·행 이름)를 다룬다.

clear; clc

sample = ["S1"; "S2"; "S3"; "S4"; "S5"];
temp   = [20.1; 25.4; 30.2; 35.0; 39.8];
press  = [101.3; 103.1; 105.0; 107.2; 109.4];

ColNames = ["Sample", "Temp", "Press"];
Units    = ["", "degC", "kPa"];
Descr    = ["시료 번호", "측정 온도", "측정 압력"];

T = table(sample, temp, press, VariableNames=ColNames);

% 단위와 설명도 표에 붙여 둘 수 있다
T.Properties.VariableUnits = Units;
T.Properties.VariableDescriptions = Descr;
T.Properties.Description = "7.2.4 연습문제용 측정 자료";

disp('--- 표 ---')
disp(T)

disp('--- 표에 붙은 메타정보 ---')
for k = 1:width(T)
    fprintf('  %-7s 단위=%-5s 설명=%s\n', ...
        T.Properties.VariableNames{k}, ...
        T.Properties.VariableUnits{k}, ...
        T.Properties.VariableDescriptions{k});
end
fprintf('표 설명: %s\n', T.Properties.Description);

disp(' ')
disp('--- 행 이름을 붙이면 이름으로 행을 고를 수 있다 ---')
T2 = T;
T2.Properties.RowNames = cellstr(T2.Sample);
T2.Sample = [];                     % 이름이 행 이름으로 갔으니 열은 지운다
disp(T2)
disp('T2("S3", :) :')
disp(T2("S3", :))

disp(' ')
disp('--- 표 안에서 계산 ---')
R = corrcoef(T.Temp, T.Press);
fprintf('온도-압력 상관계수 = %.6f\n', R(1,2));
p = polyfit(T.Temp, T.Press, 1);
fprintf('직선 맞춤: 압력 = %.4f * 온도 + %.4f\n', p(1), p(2));

disp(' ')
disp('--- 이름에 공백이나 괄호가 들어가면 점 표기를 못 쓴다 ---')
T3 = T;
T3.Properties.VariableNames = ["Sample", "Temp (degC)", "Press (kPa)"];
disp(head(T3, 2))
fprintf('T3.("Temp (degC)") 평균 = %.2f\n', mean(T3.("Temp (degC)")));
fprintf('괄호와 따옴표를 쓰는 이 표기는 한글 이름에도 그대로 쓴다.\n');
