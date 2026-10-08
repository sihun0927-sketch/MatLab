% ex0804_fever.m — find 와 logical indexing 비교, 새 배열 만들기, table (8.4)

clear; clc

Patient_Names = ["Jason", "Jose", "Wesley", "Rose"];
Temp = [98.2, 100.3, 97, 101];

%% find 사용: 인덱스 → 이름
index = find(Temp > 98.6)               % 2 4
Patient_Names(index)                    % "Jose" "Rose"

%% logical indexing 사용: 0/1 배열 → 이름
fever = Temp > 98.6                     % 0 1 0 1  (logical)
Patient_Names(fever)                    % "Jose" "Rose"

%% 한 줄로
Patient_Names(Temp > 98.6)              % "Jose" "Rose"

%% 새 배열 만들기: 아직 없는 result 에 logical 인덱스로 대입
clear result
result(fever) = "Sick"                  % <missing> "Sick" <missing> "Sick"

%% ~ 로 나머지를 채운다
result(~fever) = "Well"                 % "Well" "Sick" "Well" "Sick"

%% table 로 정리 — table 에는 열 벡터를 넣는다
T = ["Patients", "Temperature", "Diagnosis"];
disp(table(Patient_Names', Temp', result', VariableNames=T))
