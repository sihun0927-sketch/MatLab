% ex0616_local_variables.m — local variable 과 workspace 의 분리 (6.1.6)
% 함수 안의 변수는 workspace 에 저장되지 않고, 함수도 workspace 를 볼 수 없다.

clear; clc

x = 1:5;
y = 5:-1:1;
out = elemprod(x, y);

disp('호출 후 workspace 에 있는 변수:')
who            % x, y, out 만 보인다. 함수 내부의 a 는 없다

fprintf('exist(''a'', ''var'') = %d  (0 = workspace 에 없음)\n', exist('a', 'var'));

% 반대 방향도 막혀 있다: 함수는 workspace 변수를 볼 수 없다
g_from_workspace = 9.81;                                 %#ok<NASGU>
try
    w = needs_gravity(70);                               %#ok<NASGU>
catch err
    fprintf('예상된 오류: %s\n', err.message);
end

% 정보를 주고받는 통로는 입력 인수와 반환값뿐이다
fprintf('제대로 넘기면: %g N\n', weight(70, 9.81));

% ---- local functions ----
function w = needs_gravity(m)
% 바깥 workspace 의 g_from_workspace 를 쓰려고 하지만 보이지 않는다 → 오류
w = m * g_from_workspace;                                %#ok<*NODEF>
end

function w = weight(m, g)
% 필요한 값은 전부 입력으로 받는다 — 함수는 자기완결적이어야 한다
w = m * g;
end
