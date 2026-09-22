% 4.3 연습문제 2 - magic(5)의 행/열/대각선 합이 모두 같은지 확인
A = magic(5)

colSums = sum(A)             % 각 열의 합
rowSums = sum(A, 2)'         % 각 행의 합 (행벡터로 보기 좋게 전치)
mainDiagSum = sum(diag(A))          % 주대각선 합
antiDiagSum = sum(diag(fliplr(A)))  % 반대 대각선 합

allSame = isscalar(unique([colSums, rowSums, mainDiagSum, antiDiagSum]))
