% Ch4.3 - [보강] eye로 단위행렬 만들기 (zeros/ones/diag와 같은 계열의 함수)

I = eye(3)          % 3x3 단위행렬 (대각선만 1, 나머지는 0)
I2 = eye(2, 4)       % 정사각형이 아니어도 만들 수 있다 (2x4)

% diag(ones(1,3))로도 같은 결과를 얻을 수 있다
same = isequal(I, diag(ones(1,3)))
