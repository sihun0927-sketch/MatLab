% 4.4 연습문제 2 - char -> string 변환 후 strlength로 실제 글자 수 구하기
names = char('Kim', 'Lee', 'Park')   % 짧은 이름은 공백으로 패딩됨 (3x4)
namesStr = string(names)              % string으로 변환 (패딩 공백은 남아있음)
realLengths = strlength(namesStr)     % 패딩 공백까지 포함해서 세어진다는 점에 주의
