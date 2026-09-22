%% 2.3 변수 이름 규칙과 isvarname / iskeyword

disp(isvarname("cool_beans"))   % 1 (true) - 문자로 시작, 문자/숫자/밑줄만 사용
disp(isvarname("cool-beans"))   % 0 (false) - 하이픈은 허용되지 않음
disp(isvarname("2cool"))        % 0 (false) - 숫자로 시작할 수 없음

keywordList = iskeyword;
disp(keywordList(1:5))          % 예약어 목록의 앞부분만 확인

%% 함수 이름을 변수로 덮어쓰는 사례와 clear로 복구
max = 10;                       % max는 원래 내장 함수 이름
disp(max)                       % 이제 변수 max(=10)를 가리킨다
clear max                       % 변수 max를 삭제해 함수로 되돌린다
disp(max([3 7 2]))              % 다시 내장 함수 max로 동작

%% 2.3 데이터 타입 확인
numericVar = 3.5;
charVar = 'engineer';
stringVar = "engineer";
logicalVar = (5 > 3);
tableVar = table([1;2], ["A";"B"], VariableNames=["id","label"]);

disp(class(numericVar))   % double
disp(class(charVar))      % char
disp(class(stringVar))    % string
disp(class(logicalVar))   % logical
disp(class(tableVar))     % table
