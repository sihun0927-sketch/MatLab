% ex0701_input_types.m — input 으로 scalar, array, string, char 받기 (7.1)
% input(prompt) 는 프롬프트를 출력하고 멈춘 뒤, 사용자가 친 것을
% "MATLAB 코드처럼" 해석해서 그 값을 돌려준다.
%
% 주의: input 은 키보드를 기다리므로 matlab -batch 에서는 실행할 수 없다.
%       아래처럼 데스크톱 여부를 보고 갈라 두면 두 환경에서 모두 돌아간다.

clear; clc

interactive = usejava('desktop');   % -batch 로 돌리면 0

if interactive
    z = input("Enter a value ");                    % 스칼라
    x = input("Enter an array in brackets ");       % 배열
    y = input("Enter your name in double quotes "); % string
    w = input("Enter your name in single quotes "); % char
else
    disp('[-batch 모드] 아래 값을 직접 입력했다고 가정한다.')
    z = 5;                  % Enter a value 5
    x = [1, 2, 3; 4, 5, 6]; % Enter an array in brackets [1, 2, 3; 4, 5, 6]
    y = "Holly";            % Enter your name in double quotes "Holly"
    w = 'Maria';            % Enter your name in single quotes 'Maria'
end

% 입력한 "모양" 그대로 자료형이 정해진다 — input 은 자료형을 강제하지 않는다
vars = {'z', 'x', 'y', 'w'};
vals = {z, x, y, w};
fprintf('%-4s %-8s %-10s\n', '이름', '크기', '클래스');
for k = 1:numel(vars)
    fprintf('%-4s %-8s %-10s\n', vars{k}, mat2str(size(vals{k})), class(vals{k}));
end

% 핵심 함정: char 배열은 글자 수만큼 길지만, string 은 몇 글자든 1x1 이다
fprintf('\nw = %s  → char,   size = %s  (글자 %d 개)\n', w, mat2str(size(w)), numel(w));
fprintf('y = %s  → string, size = %s  (문자열 1 개)\n', y, mat2str(size(y)));
fprintf('string 의 글자 수를 세려면 strlength: %d\n', strlength(y));
