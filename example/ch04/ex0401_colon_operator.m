% Ch4.1 - 콜론(:) 연산자: 배열 생성, 행/열 추출, end 키워드

H = 1:8                      % start:end  (증가폭 1)
t = 0.0:0.5:2.0               % start:step:end

M = [1 2 3 4 5
     2 3 4 5 6
     3 4 5 6 7];              % 3x5 배열

col1 = M(:,1)                 % 콜론이 인덱스 자리에 오면 "그 방향 전체"
row1 = M(1,:)                 % 1행 전체
block = M(2:3, 4:5)           % "2행부터 3행까지, 4열부터 5열까지"

allAsColumn = M(:)             % 배열 이름에 콜론 하나만 쓰면 한 줄 긴 열로 바뀐다
                               % (열 우선 순서: 1열 -> 2열 -> 3열 -> ... 순서로 이어붙인다)

subscriptValue = M(2,3)        % 행,열 표기(subscript)
linearValue = M(8)             % 단일 인덱스(linear index) - 열 우선 순서로 센 값
                               % subscriptValue와 linearValue는 같은 값이다

lastInRow1 = M(1,end)          % end는 "그 방향의 마지막 인덱스"를 의미한다
lastElement = M(end,end)
lastLinear = M(end)
