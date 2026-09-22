% Ch4.4 - string 연결(+)과 다른 타입과의 자동 변환

A = "Holly";
B = "Moore";
fullName = A + " " + B          % string은 '+'로 이어붙일 수 있다 (char 배열은 불가)

Test = 11;                       % double(숫자) 타입
GraphName = "Trial Run " + Test  % '+'는 숫자를 string으로 자동 변환해 이어붙인다
                                   % (그래프 제목 등을 만들 때 유용하다)
