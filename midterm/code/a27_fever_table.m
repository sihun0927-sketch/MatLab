% 정답 27: 환자 체온을 세 단계로 분류해 표와 요약 출력 (loop 없음)
clear, clc
names = ["Jason" "Jose" "Wesley" "Rose" "Mia" "Ken"];
temp = [98.2 100.3 97.0 101.0 99.1 102.4];
status = strings(size(temp));
status(temp <= 98.6) = "Well";
status(temp > 98.6 & temp < 101) = "Fever";
status(temp >= 101) = "High fever";
disp(table(names', temp', status', VariableNames = ["Patient" "Temp_F" "Status"]))
fprintf('Well: %d, Fever: %d, High fever: %d\n', sum(status == "Well"), ...
        sum(status == "Fever"), sum(status == "High fever"))
[hottest, who] = max(temp);
fprintf('Highest: %s at %.1f F\n', names(who), hottest)
fprintf('Patients to call: %s\n', strjoin(names(temp >= 101), ", "))
