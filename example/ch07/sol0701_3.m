% sol0701_3.m — 7.1 연습문제 3
% 사용자가 입력한 벡터의 개수·평균·최댓값·최솟값을 보고한다.
% 빈 입력(그냥 Enter)이면 기본값을 쓴다.

clear; clc

if usejava('desktop')
    v = input('벡터를 대괄호로 입력하시오 (그냥 Enter 면 기본값): ');
else
    v = [];
    disp('벡터를 대괄호로 입력하시오 (그냥 Enter 면 기본값): ');
end

% 그냥 Enter 를 누르면 input 은 빈 배열 [] 을 돌려준다.
if isempty(v)
    v = [4 8 15 16 23 42];
    fprintf('입력이 비어 있어 기본값 %s 를 쓴다.\n', mat2str(v));
end

fprintf('\n개수   = %d\n', numel(v));
fprintf('합계   = %g\n', sum(v));
fprintf('평균   = %.4f\n', mean(v));
fprintf('최댓값 = %g (%d 번째)\n', max(v), find(v == max(v), 1));
fprintf('최솟값 = %g (%d 번째)\n', min(v), find(v == min(v), 1));
fprintf('표준편차 = %.4f\n', std(v));
