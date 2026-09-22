% 4.2 연습문제 2 - meshgrid로 크기가 다른 두 벡터 결합하기
x = 1:3;                     % 1x3
y = 1:4;                     % 1x4

[X, Y] = meshgrid(x, y);     % X, Y 모두 4x3
Z = X + Y;                   % 이제 크기가 같으므로 원소별 덧셈 가능

sizeX = size(X)
sizeY = size(Y)
sizeZ = size(Z)
