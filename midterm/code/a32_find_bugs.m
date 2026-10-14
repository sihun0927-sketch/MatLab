% 정답 32: find / logical indexing 수정본
clear, clc
temp = [95.3 100.2 98.6; 97.4 99.2 98.9; 100.1 99.3 97];
names = ["A" "B" "C"; "D" "E" "F"; "G" "H" "I"];
hot = find(temp > 98.6 & temp < 100);        % 배열에는 && 대신 &
hot_names = names(hot)'                       % 인덱스는 hot (temp는 실수)
[r, c] = find(temp > 99);
fprintf('row %d col %d\n', [r c]')            % 행·열을 짝지어 전달
status = strings(size(temp));
status(temp > 98.6) = "Sick";
status(~(temp > 98.6)) = "Well"               % 나머지도 채워야 <missing>이 없다
if all(temp(:) > 98.6)                        % 배열 조건은 전부 참일 때만 참
    disp("Everyone has a fever")
else
    fprintf('%d of %d have a fever\n', sum(temp(:) > 98.6), numel(temp))
end
