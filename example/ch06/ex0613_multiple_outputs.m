% ex0613_multiple_outputs.m — 출력이 여러 개인 함수 (6.1.3)

clear; clc

t = 0:2:10;

% 출력 세 개를 모두 받는다
[d, v, a] = motion(t);
disp(table(t(:), d(:), v(:), a(:), ...
    VariableNames=["t", "distance", "velocity", "acceleration"]))

% 출력을 하나만 적으면 첫 번째 출력만 돌아온다 (나머지는 버려진다)
d_only = motion(t);
fprintf('출력 하나만 받으면 distance: %s\n', mat2str(d_only));

% 두 번째만 필요하면 ~ 로 앞의 출력을 건너뛴다
[~, v_only] = motion(t);
fprintf('두 번째 출력만: %s\n', mat2str(v_only));
