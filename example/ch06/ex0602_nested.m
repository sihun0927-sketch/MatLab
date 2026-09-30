function ex0602_nested()
% EX0602_NESTED  nested function 예제 (6.2)
%   nested function 은 다른 함수 "안"에 정의되고, 바깥 함수의 변수를
%   그대로 읽고 쓸 수 있다. subfunction 은 이것이 불가능하다.
%   nested function 을 쓰려면 바깥 함수를 반드시 end 로 닫아야 한다.

clc

count = 0;
total = 0;

tick(5);
tick(7);
tick(3);

fprintf('호출 횟수 count = %d, 합계 total = %g\n', count, total);
fprintf('→ tick 은 입력만 받고 아무것도 반환하지 않았는데 바깥 변수가 바뀌었다.\n');

% 비교: subfunction 은 바깥 변수를 볼 수 없다
fprintf('subfunction 은 값을 돌려받아야 한다: %g\n', add_pure(total, 10));

    function tick(x)
    % 바깥(ex0602_nested)의 count, total 을 직접 읽고 쓴다
    count = count + 1;
    total = total + x;
    end
end

function y = add_pure(a, b)
% ADD_PURE  nested 가 아닌 평범한 subfunction. 바깥 변수를 볼 수 없다.
y = a + b;
end
