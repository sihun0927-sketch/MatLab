% 4.1 연습문제 2 - end와 콜론으로 부분행렬 추출하기
M = [4 8 1 6
     3 5 9 2
     7 0 2 4];

lastColumn = M(:,end)
subMatrix = M(2:end, 1:2)
