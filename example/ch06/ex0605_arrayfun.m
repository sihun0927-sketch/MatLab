% ex0605_arrayfun.m — arrayfun / cellfun 도 function function 이다 (6.5)
% [보강] 슬라이드 밖 내용. 배열의 각 원소에 함수를 적용한다.

clear; clc

v = [1 4 9 16 25];

% 원소별로 함수를 적용 — 결과가 숫자면 그대로 배열로 돌아온다
disp('arrayfun(@sqrt, v) =')
disp(arrayfun(@sqrt, v))

% 결과 크기가 원소마다 다르면 UniformOutput=false 로 cell 을 받는다
c = arrayfun(@(n) 1:n, 1:4, UniformOutput=false);
disp('arrayfun(@(n) 1:n, 1:4, UniformOutput=false) =')
celldisp(c, 'c')

% cellfun: cell array 의 각 칸에 적용
names = {'alpha', 'be', 'gamma7'};
fprintf('각 이름의 길이: %s\n', mat2str(cellfun(@numel, names)));

% 함수를 인수로 받는 사용자 함수도 직접 만들 수 있다
fprintf('apply_twice(@(x) x+3, 10) = %g\n', apply_twice(@(x) x+3, 10));
fprintf('apply_twice(@sqrt, 16)    = %g\n', apply_twice(@sqrt, 16));

% ---- local function ----
function y = apply_twice(fh, x)
% APPLY_TWICE  함수 handle fh 를 x 에 두 번 적용한다.
y = fh(fh(x));
end
