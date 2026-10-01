% sol0724_1.m — 7.2.4 연습문제 1
% 성적표를 table 로 만들고, 열을 추가하고, 정렬한다.
%
% 주의: 점 표기(T.이름)로 쓰려면 열 이름이 MATLAB 식별자 규칙을 지켜야 한다.
%       한글이나 공백이 든 이름은 T.("이름") 형태로만 접근할 수 있다.

clear; clc

Name  = ["김하늘"; "이바다"; "박구름"; "최바람"];
Mid   = [88; 72; 95; 61];
Final = [91; 80; 89; 77];
HW    = [100; 85; 92; 70];

T = table(Name, Mid, Final, HW);

disp('--- 원본 ---')
disp(T)

% 가중 평균 열을 더한다 (중간 35%, 기말 45%, 과제 20%)
T.Total = 0.35*T.Mid + 0.45*T.Final + 0.20*T.HW;

% 학점 열 — 숫자가 아니라 string 이어도 같은 표에 들어간다
grade = strings(height(T), 1);
grade(T.Total >= 90) = "A";
grade(T.Total >= 80 & T.Total < 90) = "B";
grade(T.Total <  80) = "C";
T.Grade = grade;

disp('--- 총점·학점 추가 ---')
disp(T)

disp('--- 총점 내림차순 정렬 ---')
T = sortrows(T, "Total", "descend");
disp(T)

fprintf('열의 자료형이 섞여 있다: ');
for k = 1:width(T)
    fprintf('%s(%s) ', T.Properties.VariableNames{k}, class(T{:,k}));
end
fprintf('\ntable 을 쓰는 이유가 바로 이것이다. 숫자 행렬 하나로는 할 수 없다.\n');

fprintf('\n반 평균 = %.2f, 최고점 = %.2f (%s)\n', mean(T.Total), T.Total(1), T.Name(1));

disp(' ')
disp('--- 화면에 보일 이름만 한글로 바꾸기 ---')
T.Properties.VariableNames = ["이름", "중간", "기말", "과제", "총점", "학점"];
disp(T)
fprintf('이제 T.총점 은 문법 오류다. T.("총점") 로 써야 한다: 평균 %.2f\n', mean(T.("총점")));
