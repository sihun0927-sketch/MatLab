% Ch4.4 - 문자열 배열(string array): 큰따옴표, string 변환, 인덱싱

M = char('Steven', 'Jasmin', 'David', 'Terrell', 'Maria');  % 5x7 char (공백 패딩됨)
N = string(M)                    % char 배열의 "행 하나"가 string 원소 하나가 된다 (5x1)
                                   % char 배열에서 왔으므로 패딩 공백이 남아있다

P = ["Steven"; "Jasmin"; "David"; "Terrell"; "Maria"]  % 큰따옴표로 직접 생성
                                                         % -> 불필요한 공백이 없다

second_N = N(2)                   % string 배열은 인덱싱해도 글자 하나가 아니라
second_P = P(2)                   % "문자열 전체"가 한 원소로 나온다 (char 배열과 반대)

sizeP = size(P)
lengthP = length(P)               % 5 (배열의 크기)
charCounts = strlength(P)         % [6;6;5;7;5] (각 원소의 글자 수 - length와 다름)
