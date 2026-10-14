% 정답 20: 반지름을 입력받아 검사한 뒤 구의 부피·겉넓이 출력
clear, clc
% r = input("Enter the radius in cm: ");   % 원래 코드
r = 2.5;                                   % 검증용 고정값
if ~isnumeric(r) || ~isscalar(r)
    error("The radius must be a single number.")
elseif r <= 0
    error("The radius must be positive, not %g.", r)
elseif r > 100
    beep
    disp("Warning: radius larger than 100 cm, check the units")
end
V = 4/3*pi*r^3;
S = 4*pi*r^2;
fprintf('r = %.2f cm -> V = %.3e cm^3, S = %8.2f cm^2\n', r, V, S)
