% ex0617_global.m — global 변수 (6.1.7)
% 양쪽(호출하는 쪽과 함수)에서 모두 global 로 선언해야 값이 공유된다.
% 관례상 전역 변수는 대문자로 쓴다. 되도록 쓰지 않는 것이 좋다.

clear; clc
clear global G_ACCEL

global G_ACCEL

G_ACCEL = 9.81;                 % 지구
fprintf('지구  : %6.2f N\n', gravity_force(70));

G_ACCEL = 1.62;                 % 달 — 함수를 고치지 않고 값만 바꾼다
fprintf('달    : %6.2f N\n', gravity_force(70));

G_ACCEL = 3.71;                 % 화성
fprintf('화성  : %6.2f N\n', gravity_force(70));

% global 선언을 지우면 함수 쪽에서는 빈 배열로 보인다
clear global G_ACCEL
[~, wid] = lastwarn('', '');                             %#ok<ASGLU>
warning('off', 'gravity_force:defaultG')
F = gravity_force(70);
warning('on', 'gravity_force:defaultG')
fprintf('선언 없이 호출: %6.2f N  (함수가 기본값 9.81 로 되돌아감)\n', F);

% 전역 변수는 "누가 언제 바꿨는지" 추적이 어렵다 → 되도록 입력 인수로 넘긴다
fprintf('권장: 입력으로 넘기기 → %6.2f N\n', 70 * 1.62);

clear global G_ACCEL
