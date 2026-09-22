%% 2.4 배열 연산: 덧셈/뺄셈, 곱셈(.*  vs *), 나눗셈(./  vs /), 전치, 표시 형식

a = [1 2 3];
b = [6 7 8];

% 스칼라를 배열에 더하고 빼기 -> 모든 원소에 적용
disp(a + 5)
disp(a - 5)

% 배열끼리 더하고 빼기 -> 대응 원소끼리 연산
disp(a + b)
disp(a - b)

% 원소별 곱셈은 .* 를 사용한다
disp(a .* b)

% ⚠️ 함정: 크기가 안 맞는 배열에 *(행렬곱)를 쓰면 오류가 난다
try
    c_wrong = a * b; %#ok<NASGU>
catch err
    fprintf("에러 발생(예상됨): %s\n", err.message)
end

% 원소별 나눗셈은 ./ 를 사용한다
disp(a ./ b)

% ⚠️ 함정: 스칼라를 배열로 나눌 때 /를 쓰면 역행렬로 해석되어 오류가 난다
try
    d_wrong = 10 / a; %#ok<NASGU>
catch err
    fprintf("에러 발생(예상됨): %s\n", err.message)
end
disp(10 ./ a)

% 각도 -> 라디안 변환 예제 (원소별 연산 활용)
degrees = [10 15 70 90];
radians = degrees .* pi ./ 180;
disp(radians)

% 전치 연산자
row = [1 2 3 4];
col = row';
disp(col)

% 숫자 표시 형식
format short
pi
format long
pi
format short
