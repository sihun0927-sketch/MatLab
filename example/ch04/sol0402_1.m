% 4.2 연습문제 1 - * vs .*
A = [1 2; 3 4];
B = [1 2; 3 4];

matrixProduct = A * B         % 행렬곱: (2x2)*(2x2) 선형대수 규칙
elementwiseProduct = A .* B   % 원소별 곱: 같은 위치끼리 곱함
% matrixProduct(1,1) = 1*1 + 2*3 = 7 (행렬곱 규칙)
% elementwiseProduct(1,1) = 1*1 = 1 (같은 자리 원소끼리)
% 두 결과가 다른 이유: '*'는 선형대수의 행렬곱, '.*'는 원소별 곱이기 때문이다.
