% Ch4.3 - magic, fliplr, sum(축 지정), 전치(transpose), 함수 중첩(nesting)

A = magic(4)                  % 4x4 마방진: 모든 행/열/대각선 합이 같다

colSums = sum(A)              % sum(A) 기본은 "열" 합 -> 1x4 행벡터
rowSums = sum(A, 2)           % 두 번째 인자 2 -> "행" 합
rowSumsByTranspose = sum(A')  % 전치(') 후 sum -> 행 합과 같은 결과

diagSum = sum(diag(A))        % diag로 추출 -> sum으로 합산 (함수 중첩 = nesting)

A_flipped = fliplr(A);        % 좌우 반전 (각 행의 열 순서를 뒤집음)
antiDiagSum = sum(diag(A_flipped))  % 반대쪽 대각선 합도 마찬가지로 같다
