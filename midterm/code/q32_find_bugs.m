% 문제 32: 체온 행렬에서 98.6 초과 100 미만인 환자의 이름, 99 초과 위치,
%          전원 상태(Sick/Well), 모두 발열인지 여부를 출력한다.
clear, clc
temp = [95.3 100.2 98.6; 97.4 99.2 98.9; 100.1 99.3 97];
names = ["A" "B" "C"; "D" "E" "F"; "G" "H" "I"];
hot = find(temp > 98.6 && temp < 100);
hot_names = names(temp)
[r, c] = find(temp > 99);
fprintf('row %d col %d\n', r, c)
status(temp > 98.6) = "Sick"
if temp > 98.6
    disp("Everyone has a fever")
end
