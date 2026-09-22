%% 2.4 연산자 우선순위 - 원기둥 겉넓이 예제
% 겉넓이 S = 2*pi*r^2 + 2*pi*r*h

r = 3;
h = 5;

% 올바른 풀이 1: 두 항으로 나눠서 계산
S1 = 2*pi*r^2 + 2*pi*r*h;

% 올바른 풀이 2: 공통 인수로 묶어서 계산
S2 = 2*pi*r*(r + h);

disp(S1)
disp(S2)

% ⚠️ 함정: 괄호를 잘못 놓으면 다른 값이 나온다
S_wrong = 2*pi*r*r + h;   % r*h가 아니라 h만 더해져 버림 (틀린 식)
disp(S_wrong)

% ⚠️ 함정: MATLAB은 괄호 앞에 곱셈 기호를 생략할 수 없다
% r(r+h)  -> 오류! r을 함수/배열 인덱싱으로 해석함
S_correct_form = r*(r+h);
disp(S_correct_form)
