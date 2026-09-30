% sol0613_3.m — 6.1.3 연습문제 3
% 입력도 출력도 없는 함수: 단위원과 그 외접 정사각형을 그린다.

clear; clc; close all

unit_circle_box                 % 괄호도 인수도 없이 이름만 쓴다

theme(gcf, "light")        % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../../textbook/ch06/img/sol0613_3.png')

% 반환값이 없으므로 출력을 받으려 하면 오류
try
    z = unit_circle_box;                                 %#ok<NASGU>
catch err
    fprintf('예상된 오류: %s\n', err.message);
end

function [] = unit_circle_box()
% UNIT_CIRCLE_BOX  단위원과 외접 정사각형을 그린다. 입력·출력 없음.
t = linspace(0, 2*pi, 400);
plot(cos(t), sin(t), LineWidth=1.5); hold on
plot([-1 1 1 -1 -1], [-1 -1 1 1 -1], '--', LineWidth=1.5); hold off
axis equal
grid on
xlabel('x'); ylabel('y')
title('단위원과 외접 정사각형')
legend(["단위원", "외접 정사각형"], Location="southoutside")
end
