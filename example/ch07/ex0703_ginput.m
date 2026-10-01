% ex0703_ginput.m — 그래프에서 점을 찍어 입력받기 (7.3)
%   [x, y] = ginput(n)   그림창에서 점 n 개를 고를 때까지 기다린다
%   [x, y] = ginput      Enter 를 누를 때까지 몇 개든 받는다
% 돌아오는 x, y 는 "그래프 좌표"다(픽셀이 아니다).
%
% ginput 은 사람이 마우스로 찍어야 하므로 -batch 에서는 쓸 수 없다.
% 아래에서는 미리 정한 좌표로 같은 뒷부분을 보여 준다.

clear; clc; close all

x = 0:0.1:10;
y = x.^2 - 10*x + 15;

figure
plot(x, y, LineWidth=1.5)
grid on
xlabel('x'); ylabel('y')
title('그래프 위에서 점을 고르시오 (Enter 로 종료)')

if usejava('desktop')
    [a, b] = ginput;            % 개수를 안 주면 Enter 까지 계속 받는다
else
    disp('[-batch 모드] 점 세 개를 골랐다고 가정한다.')
    a = [1.0; 5.0; 9.0];
    b = interp1(x, y, a);       % 그래프 위 점이라고 두고 y 를 계산
end

fprintf('고른 점의 개수: %d\n', numel(a));
fprintf('a(=x) 의 크기 = %s, b(=y) 의 크기 = %s  ← 둘 다 열 벡터\n', ...
    mat2str(size(a)), mat2str(size(b)));
for k = 1:numel(a)
    fprintf('  점 %d: (%6.3f, %8.3f)\n', k, a(k), b(k));
end

hold on
plot(a, b, 'ro', MarkerFaceColor='r', MarkerSize=8)
for k = 1:numel(a)
    text(a(k), b(k), sprintf('  (%.1f, %.1f)', a(k), b(k)), VerticalAlignment='bottom')
end
hold off
title(sprintf('ginput 으로 고른 점 %d 개', numel(a)))

theme(gcf, "light")        % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../../textbook/ch07/img/ex0703_ginput.png')
