% Ch4.3 - [보강] diag로 대각선에 값 더하기, zeros/ones로 블록 행렬 만들기

A = magic(4);
A_plusDiag = A + diag([10 20 30 40])   % 대각선에만 값을 더하고 싶을 때
                                          % diag(vector)로 대각행렬을 만들어 더한다

topBlock = [ones(2,2), zeros(2,2)];     % 4.1의 concatenation과 4.3의 zeros/ones를
bottomBlock = [zeros(2,2), ones(2,2)];  % 함께 활용해 블록 행렬을 만들 수 있다
blockMatrix = [topBlock; bottomBlock]
