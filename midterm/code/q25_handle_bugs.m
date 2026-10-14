% 문제 25: f(x) = x^2 - 4 를 익명 함수로 만들어 그래프를 그리고,
%          낙하 거리 함수를 핸들로 감싸 d(3)을 구한다. k는 두 벡터의 원소별 곱.
clear, clc, clf
f = @x x.^2 - 4;
g = @(x) f(x) + 1
fplot(f(x), [-3 3])
root = f(2)
h = @(t) distance(t);
d = h(3)
k = @(x, y) x*y;
prod3 = k([1 2 3], [4 5 6])

function r = distance(t)
    r = 0.5*g*t.^2;
end
