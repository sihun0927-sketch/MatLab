% sol0616_2.m — 6.1.6 연습문제 2
% global 로 쓴 코드를 입력 인수 방식으로 고쳐 쓰고 두 결과가 같은지 확인한다.

clear; clc
clear global RHO

global RHO
RHO = 1000;                     % 물의 밀도 (kg/m^3)

V = [0.001 0.01 0.1];

m_global = mass_global(V);
m_arg    = mass_arg(V, RHO);

disp(table(V(:), m_global(:), m_arg(:), ...
    VariableNames=["부피(m^3)", "global 방식", "입력 방식"]))

fprintf('두 결과가 같은가? %d\n', isequal(m_global, m_arg));

% 입력 방식은 밀도를 바꿔도 함수를 건드릴 필요가 없고, 어떤 값이 쓰였는지 호출부에 드러난다
fprintf('에탄올(789)로: %s\n', mat2str(mass_arg(V, 789)));

clear global RHO

function m = mass_global(V)
% MASS_GLOBAL  전역 변수 RHO 를 가져다 쓴다 — 권장하지 않는 방식.
global RHO
m = RHO * V;
end

function m = mass_arg(V, rho)
% MASS_ARG  밀도를 입력으로 받는다 — 자기완결적이라 권장되는 방식.
m = rho * V;
end
