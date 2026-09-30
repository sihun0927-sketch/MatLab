% ex0614_star.m — 입력도 출력도 없는 함수 (6.1.4)
% star 는 값을 반환하지 않고 figure 창만 연다.

clear; clc; close all

star                       % 괄호 없이 이름만 써도 호출된다
title('star: 입력도 출력도 없는 함수')

theme(gcf, "light")        % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../../textbook/ch06/img/ex0614_star.png')

% 반환값이 없으므로 출력을 받으려 하면 오류가 난다
try
    z = star;                                            %#ok<NASGU>
catch err
    fprintf('예상된 오류: %s\n', err.message);
end
