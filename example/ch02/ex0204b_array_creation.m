%% 2.4 배열 생성 - 명시적 목록, 콜론 연산자, linspace, logspace

% 명시적 목록 (explicit list)
x = [1 2 3 4];
y = [1; 2; 3; 4];              % 세미콜론 -> 열벡터
a = [1 2 3 4; 2 3 4 5; 3 4 5 6]; % 2차원 배열

% 콜론 연산자 (기본 증분 1)
b = 1:5;

% 콜론 연산자 (증분 지정)
c = 1:2:5;

% linspace: 시작값, 끝값, 총 개수
d = linspace(1, 10, 3);

% logspace: 10^시작, 10^끝, 총 개수
e = logspace(1, 3, 3);

disp(b)
disp(c)
disp(d)
disp(e)

% ⚠️ 함정: linspace/logspace 세 번째 인자를 생략하면 기본값 100개가 된다
default_d = linspace(1, 10);
disp(numel(default_d))
