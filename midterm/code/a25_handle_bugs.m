% 정답 25: 익명 함수·핸들 수정본
clear, clc, clf
f = @(x) x.^2 - 4;                        % 입력은 @(x)
g = @(x) f(x) + 1
fplot(f, [-3 3])                          % 핸들 자체를 넘긴다 (f(x)는 x가 없어 오류)
root = f(2)
h = @(t) distance(t);
d = h(3)
k = @(x, y) x.*y;                         % 벡터 원소별 곱은 .*
prod3 = k([1 2 3], [4 5 6])
theme(gcf, "light")              % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../img/a25_handle_bugs.png')

function r = distance(t)
    g = 9.8;                              % 함수 안은 별도 작업공간: g를 직접 정의
    r = 0.5*g*t.^2;
end
