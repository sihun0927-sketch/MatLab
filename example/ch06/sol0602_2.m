% sol0602_2.m — 6.2 연습문제 2
% local function 은 그 파일 안에서만 보인다는 것을 확인한다.

clear; clc

fprintf('같은 파일 안에서는 호출된다: secret_double(21) = %g\n', secret_double(21));

% 다른 파일(call_by_name.m)에서 이름으로 찾으면 보이지 않는다
try
    call_by_name('secret_double', 21);
catch err
    fprintf('다른 파일에서 호출 → 오류: %s\n', err.message);
end

% 별도 파일로 저장된 mypoly 는 어디서든 보인다
fprintf('call_by_name(''mypoly'', 2) = %g\n', call_by_name('mypoly', 2));

% 다만 같은 파일 안에서 만든 handle 은 밖으로 넘겨도 동작한다
h = @secret_double;
fprintf('handle 로 넘기면 동작: %g\n', apply_it(h, 21));

function y = secret_double(x)
% SECRET_DOUBLE  이 파일 안에서만 쓸 수 있는 local function.
y = 2 * x;
end

function y = apply_it(fh, x)
% APPLY_IT  받은 handle 을 실행한다.
y = fh(x);
end
