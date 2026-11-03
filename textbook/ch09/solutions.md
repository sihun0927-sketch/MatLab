# Chapter 9 연습문제 해답

해답 코드는 md에 인라인으로만 싣는다(이 장은 `example/ch09/`를 만들지 않았다). 실행 결과는 R2026a `-batch`에서 얻은 것이고, 빈 줄은 줄여 실었다.

> **[보강]** 이 파일 전체가 슬라이드 밖 내용이다. 연습문제와 해답은 모두 시험 대비용으로 추가한 것이다.

---

## 9.1

### 1. 누적 곱으로 6!

```matlab
n = 6;
p = 1;                  % 누적 곱의 초기값은 1 (0이면 계속 0)
for k = 1:n
    p = p * k;
end
fprintf("for: %d, factorial: %d\n", p, factorial(n))
```
```
for: 720, factorial: 720
```

누적 **합**(running total)은 0에서, 누적 **곱**은 1에서 시작한다. 덧셈과 곱셈의 항등원이다. 초기화는 loop **밖**.

### 2. 2차원 index array

```matlab
x = [1 2; 3 4];
for c = x
    disp(c')
end
c
```
```
     1     3
     2     4
c =
     2
     4
```

- index array가 `2×2`이므로 **열 단위로 2번** 돈다. 첫 pass의 `c`는 `[1; 3]`(첫 열), 둘째는 `[2; 4]`.
- `disp(c')`로 행으로 바꿔 찍었으므로 `1 3`, `2 4`가 나온다. 원소별(1, 2, 3, 4)이 **아니다**.
- loop 뒤 `c`는 마지막 값, 즉 **둘째 열 `[2; 4]`** 을 유지한다.

### 3. 음수 개수

```matlab
v = [4, -2, 0, -7, 5, -1];
neg = 0;
for k = 1:length(v)
    if v(k) < 0
        neg = neg + 1;
    end
end
neg                     % 3
sum(v < 0)              % 3 — loop 없이
```

0은 음수가 아니므로 세지 않는다. `v < 0`은 `[0 1 0 1 0 1]`, 합이 3.

---

## 9.2

### 1. `2^n > 1000`인 최소 `n`

```matlab
n = 0;
while 2^n <= 1000       % 아직 1000을 넘지 않았으면 계속
    n = n + 1;
end
n                       % 10
2^n                     % 1024
```

기준을 "**계속할 조건**"으로 써야 한다. 구하는 조건(`2^n > 1000`)의 **반대**(`2^n <= 1000`)가 `while` 줄에 들어간다. `2^9 = 512`, `2^10 = 1024`.

### 2. 손으로 추적

| pass | 검사 시 `k` | `k > 0` | 끝난 뒤 `k` | `passes` |
|---|---|---|---|---|
| 1 | 10 | 참 | 7 | 1 |
| 2 | 7 | 참 | 4 | 2 |
| 3 | 4 | 참 | 1 | 3 |
| 4 | 1 | 참 | −2 | 4 |
| — | −2 | 거짓 | 종료 | |

```
k =
    -2
passes =
     4
```

`k`가 0에서 멈추지 않고 **음수까지** 간다. 기준 검사는 pass 맨 앞에서만 한다.

### 3. 점수 범위 검사

데스크톱 버전:

```matlab
g = input("점수(0~100): ");
while g < 0 || g > 100
    fprintf("%d 은(는) 0~100 밖입니다. 다시 입력하세요.\n", g)
    g = input("점수(0~100): ");
end
fprintf("accepted: %d\n", g)
```

`-batch` 검증 버전(입력값 배열):

```matlab
entries = [105, -4, 87];
i = 1; g = entries(i);
while g < 0 || g > 100
    fprintf("%d 은(는) 0~100 밖입니다. 다시 입력하세요.\n", g)
    i = i + 1; g = entries(i);
end
fprintf("accepted: %d\n", g)
```
```
105 은(는) 0~100 밖입니다. 다시 입력하세요.
-4 은(는) 0~100 밖입니다. 다시 입력하세요.
accepted: 87
```

"범위 **밖**"이 반복 조건이므로 `||`(또는)다. `g < 0 && g > 100`으로 쓰면 절대 참이 될 수 없어 검사가 아예 안 된다.

---

## 9.3

### 1. `continue`로 양수만 더하기

```matlab
v = [3, -2, 5, -1, 4];
total = 0;
for k = 1:length(v)
    if v(k) < 0
        continue        % 음수면 아래 덧셈을 건너뛰고 다음 k로
    end
    total = total + v(k);
end
total                   % 12
sum(v(v > 0))           % 12 — logical indexing
```

`for` loop에서는 `continue`해도 다음 index가 자동으로 들어오므로 무한 루프 걱정이 없다.

### 2. 50 초과인 첫 원소

```matlab
x = [12, 47, 51, 80];
for k = 1:length(x)
    if x(k) > 50
        break
    end
end
fprintf("x(%d) = %d\n", k, x(k))
find(x > 50, 1)         % 3 — 조건을 만족하는 처음 1개
```
```
x(3) = 51
ans =
     3
```

`break` 뒤 `k`는 빠져나온 순간의 값(3)을 유지한다. 80은 검사조차 하지 않는다.

### 3. 찾는 값이 없을 때

```matlab
x = [12, 47, 30];
% (위와 같은 loop)
k                       % 3
```

`break`가 한 번도 실행되지 않아 loop가 끝까지 돌았고, `k`는 **마지막 index 3**을 유지한다. "찾아서 멈춘 3"과 "못 찾고 끝난 3"을 `k`만으로는 **구별할 수 없다.** `x(3) = 30`을 답으로 출력하는 버그가 생긴다. 해결: `found = false;`를 두고 `break` 직전에 `found = true;`로 바꾼 뒤 loop 뒤에서 검사하거나, `find`의 결과가 비었는지(`isempty`) 확인한다.

---

## 9.4

### 1. `k^2 > 50`인 최소 `k`

```matlab
k = 0;
while true
    k = k + 1;
    if k^2 > 50
        break
    end
end
k                               % 8
find((1:100).^2 > 50, 1)        % 8
```

`7^2 = 49`, `8^2 = 64`. `find` 풀이는 후보 범위(1:100)를 미리 정해야 하지만, midpoint break loop는 범위를 몰라도 된다.

### 2. Newton 방법으로 `sqrt(2)`

```matlab
x = 2;
it = 0;
while true
    it = it + 1;
    xnew = (x + 2/x) / 2;
    if abs(xnew - x) < 1e-8 || it >= 50     % 수렴 또는 횟수 제한
        x = xnew;
        break
    end
    x = xnew;
end
fprintf("sqrt(2) ~ %.10f after %d iterations\n", x, it)
```
```
sqrt(2) ~ 1.4142135624 after 5 iterations
```

계산(`xnew`) → 중간 판정(`if … break`) → 나머지(`x = xnew`) → 반복. 전형적인 midpoint break loop다. `it >= 50`은 수렴하지 않을 때의 안전장치.

---

## 9.5

### 1. 곱셈표

```matlab
T = zeros(3, 4);                % 사전할당
for i = 1:3
    for j = 1:4
        T(i, j) = i * j;
    end
end
T
isequal(T, (1:3)' .* (1:4))     % 1
```
```
T =
     1     2     3     4
     2     4     6     8
     3     6     9    12
```

`(1:3)'`(열)과 `(1:4)`(행)의 `.*`는 implicit expansion으로 `3×4` 표를 만든다.

### 2. 전체 최솟값

```matlab
x = [3 9 2; 8 1 6; 5 7 4];
smallest = x(1, 1);             % 첫 원소로 초기화
[r, c] = size(x);
for i = 1:r
    for j = 1:c
        if x(i, j) < smallest
            smallest = x(i, j);
        end
    end
end
smallest                        % 1
min(x, [], "all")               % 1
```

### 3. 삼각형 반복 횟수

안쪽 loop가 `j = i:4`이므로 `i = 1, 2, 3, 4`일 때 각각 4, 3, 2, 1번 돈다. `cnt = 4 + 3 + 2 + 1 = 10`.

```
cnt =
    10
```

---

## 9.6

### 1. 사전할당 유무

| | (가) 사전할당 없음 | (나) `zeros`로 사전할당 |
|---|---|---|
| 시간 | pass마다 메모리 재할당 → **느림** (이번 측정 약 0.34초) | 할당 한 번 → **빠름** (약 0.05초) |
| 결과 `B` 크기 | **`1×1000000`** (없던 변수를 선형 인덱스로 늘리면 행 벡터) | **`1000×1000`** |

(가)의 `clear`는 중요하다. 이전 실행의 `B`가 남아 있으면 사실상 사전할당된 상태로 재게 된다.

### 2. 제곱합 시간 비교

```matlab
N = 1e5;
tic
s = 0;
for k = 1:N
    s = s + k^2;
end
t_loop = toc;
tic
s2 = sum((1:N).^2);
t_vec = toc;
fprintf("loop %.4f s, vector %.4f s, same = %d, s = %d\n", t_loop, t_vec, s == s2, s)
```
```
loop 0.0499 s, vector 0.0043 s, same = 1, s = 333338333350000
```

시간 값은 실행마다 다르지만 vectorized 쪽이 대개 빠르다. 결과는 공식 `N(N+1)(2N+1)/6`과 같다.

> `N = 1e6`으로 키우면 합이 약 `3.3e17`이 되어 double이 정확히 나타낼 수 있는 정수 범위(`2^53 ≈ 9e15`)를 넘는다. 그러면 더하는 순서가 다른 두 방법의 결과가 마지막 자리에서 달라져 `s == s2`가 0이 된다(R2026a에서 확인). 시간 비교와는 별개의 부동소수점 함정이다.

### 3. 세 가지 측정 방법

- `clock`/`etime`과 `tic`/`toc`는 **경과 시간**(시작부터 끝까지 벽시계 시간)을 잰다. 그동안 컴퓨터는 **housekeeping**(시스템 작업, 다른 프로그램)도 하므로 실행마다 값이 다르다.
- `timeit`은 **함수로 저장된** 코드를 여러 번 실행해 그 코드에 쓰인 시간을 더 정확히 추정한다.
