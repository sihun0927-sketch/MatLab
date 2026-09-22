% Ch4.4 - 문자 배열(character array): 작은따옴표, 인덱싱, 2차원 char 배열

H = 'Holly'                    % 작은따옴표 -> char 배열, 원소 하나하나가 글자
fifthChar = H(5)                % 문자 배열도 숫자 배열처럼 인덱싱한다

J = 'MATLAB is fun';            % 공백도 글자 하나로 센다
spaceCounts = length(J)         % 13 (공백 포함)

% 이름마다 길이가 달라 그냥 세로로 합치면(vertcat) 에러가 난다.
% M = ['Steven';'Jasmin';'David';'Terrell';'Maria']  % <- 이 줄은 에러 예시(실행하지 않음)

% char()로 여러 char 배열을 넘기면 짧은 쪽을 공백으로 채워(pad) 2차원 배열을 만든다
M = char('Steven', 'Jasmin', 'David', 'Terrell', 'Maria')

row3 = M(3,:)                   % 2차원 char 배열도 행/열 인덱싱이 그대로 된다

sizeM = size(M)                 % [5 7]
numelM = numel(M)               % 35
lengthM = length(M)             % 7 (가장 큰 차원의 크기)

% > **[보강]** char끼리 '+'를 하면 문자열 이어붙이기가 아니라
% 문자 코드(ASCII) 값끼리 숫자 덧셈이 된다 - string과 정반대 동작이다.
asciiSum = 'a' + 1               % 'a'는 97 -> 98 (double 타입)
