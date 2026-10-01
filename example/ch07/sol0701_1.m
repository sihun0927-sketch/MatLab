% sol0701_1.m — 7.1 연습문제 1
% 반지름을 입력받아 원의 넓이와 둘레를 출력한다.

clear; clc

if usejava('desktop')
    r = input('반지름을 입력하시오: ');
else
    r = 2.5;
    fprintf('반지름을 입력하시오: %g\n', r);
end

% 입력이 숫자가 맞는지 확인하는 습관을 들이면 좋다
if ~isnumeric(r) || ~isscalar(r) || r <= 0
    error('양수인 스칼라를 입력해야 한다.');
end

area = pi * r^2;
circ = 2 * pi * r;

fprintf('반지름 %g 인 원\n', r);
fprintf('  넓이 = %.4f\n', area);
fprintf('  둘레 = %.4f\n', circ);

% input 은 배열도 그대로 받으므로, 벡터를 넣으면 한 번에 여러 원을 처리할 수 있다
rv = [1 2 3];
fprintf('\n반지름 %s 를 한꺼번에 넣으면\n', mat2str(rv));
fprintf('  r = %g → 넓이 %8.4f, 둘레 %8.4f\n', [rv; pi*rv.^2; 2*pi*rv]);
