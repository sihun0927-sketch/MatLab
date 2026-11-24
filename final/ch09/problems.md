# Chapter 09 기말 대비 객관식 20문제

범위: Chapter 9 Repetition Structures (도입, 9.1 `for` ~ 9.6 효율). 슬라이드 `09_1`(도입·9.1)에서 10문제, `09_2`(9.2~9.6)에서 10문제.
모든 문제는 정답이 하나인 객관식이다. 코드는 MATLAB을 실행하지 않고 손으로 추적해 작성했다. 별도 언급이 없으면 각 코드는 빈 workspace에서 시작한다.
해답: [solutions.md](solutions.md)

## 문제 09-01 (절 도입 · 옳은 설명 고르기)

loop에 대한 설명으로 옳은 것을 고르시오.

① `for` loop는 기준이 만족될 때까지 반복할 때, `while` loop는 반복 횟수를 미리 알 때 쓴다.

② midpoint break loop는 loop 안의 명령이 한 번도 실행되지 않을 수 있어야 할 때 쓴다.

③ loop의 parameter를 pass마다 바꾸는 부분이 없으면 loop가 끝나지 않을 수 있다.

④ vectorized 해법이 있어도 loop가 더 빠르므로 loop를 쓰는 편이 낫다.

⑤ 같은 코드 토막이 두 번 이상 반복되기만 하면 반드시 loop로 바꿔야 한다.

---

## 문제 09-02 (절 도입 · 같은 결과를 내는 코드 고르기)

다음 코드가 끝난 뒤의 `s`와 같은 값을 loop 없이 만드는 코드를 고르시오.

```matlab
x = [4 -1 7 0 -3 2];
s = 0;
for k = 1:length(x)
    if x(k) > 0
        s = s + x(k);
    end
end
```

① `s = sum(x > 0)`

② `s = sum(find(x > 0))`

③ `s = sum(x) - sum(x < 0)`

④ `s = sum(x(x > 0))`

⑤ `s = x(x > 0)`

---

## 문제 09-03 (절 9.1 · 출력 고르기)

다음 코드의 출력을 고르시오.

```matlab
total = 0;
for k = [3, 1, 4]
    total = total + k^2;
end
fprintf("total = %d, k = %d\n", total, k)
```

① `total = 26, k = 4`

② `total = 26, k = 3`

③ `total = 8, k = 4`

④ `total = 16, k = 4`

⑤ `total = 26, k = 5`

---

## 문제 09-04 (절 9.1 · 오류가 나는 줄·원인 고르기)

다음 스크립트를 실행한 결과로 옳은 것을 고르시오.

```matlab
clear                 % 1행
for k = 1:3           % 2행
    p = 4^k;          % 3행
end                   % 4행
q = p(2)              % 5행
```

① 오류 없이 `q = 16`이 출력된다.

② 5행에서 오류가 난다. `p`는 마지막 값 하나만 담은 스칼라라 `p(2)`가 없다.

③ 3행에서 오류가 난다. loop 안에서는 `p(k)`처럼 인덱스를 붙여야만 대입할 수 있다.

④ 오류 없이 `q = 64`가 출력된다.

⑤ 5행에서 오류가 난다. loop가 끝나면 `p`가 workspace에서 지워진다.

---

## 문제 09-05 (절 9.1 · 같은 결과를 내는 코드 고르기)

다음 loop가 만드는 `y`와 같은 `y`를 만드는 vectorized 코드를 고르시오.

```matlab
for k = 1:4
    y(k) = 2*k^2 - 1;
end
```

① `k = 1:4; y = 2*k^2 - 1`

② `k = 1:4; y = (2*k).^2 - 1`

③ `y = 2*(1:4).^2`

④ `k = 1:4; y = 2.*k^2 - 1`

⑤ `k = 1:4; y = 2*k.^2 - 1`

---

## 문제 09-06 (절 9.1 · 빈칸에 들어갈 코드 고르기)

출력이 `Hot days = 3`이 되도록 빈칸에 들어갈 코드를 고르시오.

```matlab
temps = [31, 28, 35, 33, 29, 36];
hot = 0;
for k = ________
    if temps(k) >= 33
        hot = hot + 1;
    end
end
disp("Hot days = " + hot)
```

① `temps`

② `0:length(temps)`

③ `1:length(temps)`

④ `1:length(temps)-1`

⑤ `1:2:length(temps)`

---

## 문제 09-07 (절 9.1 · 출력 고르기)

10보다 큰 원소의 개수를 세려고 쓴 코드다. 출력을 고르시오.

```matlab
v = [12, 7, 15, 9, 20];
for k = 1:length(v)
    n = 0;
    if v(k) > 10
        n = n + 1;
    end
end
disp("n = " + n)
```

① `n = 3`

② `n = 1`

③ `n = 0`

④ `n = 5`

⑤ 오류: `n`이 정의되지 않았다.

---

## 문제 09-08 (절 9.1 · 출력 고르기)

다음 코드가 끝난 뒤 `passes`와 `col`의 값으로 옳은 것을 고르시오.

```matlab
M = [2 4;
     6 8;
     1 3];
passes = 0;
for col = M
    passes = passes + 1;
end
```

① `passes = 6`, `col = 3`

② `passes = 3`, `col = [1 3]`

③ `passes = 2`, `col = [4 8 3]` (1×3 행 벡터)

④ `passes = 2`, `col = [4; 8; 3]` (3×1 열 벡터)

⑤ `passes = 1`, `col`은 `M` 전체

---

## 문제 09-09 (절 9.1 · 틀린 설명 고르기)

`for` loop에 대한 설명으로 틀린 것을 고르시오.

① index array는 colon 연산자뿐 아니라 배열을 만드는 어떤 방법으로도 만들 수 있다.

② index 이름으로 `k` 대신 다른 변수 이름을 써도 된다. `k`는 스타일 문제다.

③ index array가 행 벡터이면 pass마다 원소를 하나씩 index에 대입한다.

④ Live Script에서 실행하면 출력이 command window가 아니라 프로그램 파일 안에 표시된다.

⑤ `for` loop가 끝나면 index 변수는 workspace에서 지워지므로 loop 뒤에서 쓸 수 없다.

---

## 문제 09-10 (절 9.1 · 출력 고르기)

다음 코드의 출력을 고르시오.

```matlab
s = 0;
for k = 2:3:12
    s = s + k;
end
disp("s = " + s + ", k = " + k)
```

① `s = 26, k = 11`

② `s = 26, k = 12`

③ `s = 26, k = 14`

④ `s = 38, k = 12`

⑤ `s = 15, k = 8`

---

## 문제 09-11 (절 9.2 · 출력 고르기)

다음 코드의 출력을 고르시오.

```matlab
x = 1;
n = 0;
while x < 50
    x = x * 3;
    n = n + 1;
end
fprintf("x = %d, n = %d\n", x, n)
```

① `x = 27, n = 3`

② `x = 27, n = 4`

③ `x = 81, n = 4`

④ `x = 81, n = 3`

⑤ `x = 243, n = 5`

---

## 문제 09-12 (절 9.2 · 같은 결과를 내는 코드 고르기)

다음 `for` loop와 같은 `b`를 오류 없이 만드는 `while` loop를 고르시오. 각 보기는 빈 workspace에서 실행한다.

```matlab
for k = 1:3
    b(k) = 3^k;
end
```

①
```matlab
k = 1;
while k < 3
    k = k + 1;
    b(k) = 3^k;
end
```

②
```matlab
k = 0;
while k < 3
    k = k + 1;
    b(k) = 3^k;
end
```

③
```matlab
while k < 3
    k = k + 1;
    b(k) = 3^k;
end
```

④
```matlab
k = 0;
while k < 3
    b(k) = 3^k;
    k = k + 1;
end
```

⑤
```matlab
k = 0;
while k <= 3
    k = k + 1;
    b(k) = 3^k;
end
```

---

## 문제 09-13 (절 9.2 · 옳은 설명 고르기)

사용자는 입력 요청이 올 때마다 `-4`, `0`, `9`를 이 순서로 입력하려 한다(요청이 오지 않으면 남은 값은 입력하지 않는다). 프로그램 실행에 대한 설명으로 옳은 것을 고르시오. 보기의 "메시지"는 `Negative value. Try again.`을 가리킨다.

```matlab
v = input("Enter a value: ");
while v < 0
    disp("Negative value. Try again.")
    v = input("Enter a value: ");
end
fprintf("sqrt(%d) = %4.2f\n", v, sqrt(v))
```

① 메시지가 2번 출력되고, 마지막 줄은 `sqrt(9) = 3.00`이다.

② 메시지가 1번 출력되고, 마지막 줄은 `sqrt(9) = 3.00`이다.

③ 메시지가 2번 출력되고, 마지막 줄은 `sqrt(0) = 0.00`이다.

④ 메시지는 출력되지 않고, 첫 입력 `-4`에서 바로 마지막 `fprintf` 줄로 넘어간다.

⑤ 메시지가 1번 출력되고, `0`을 입력한 직후 loop가 끝나 `sqrt(0) = 0.00`이 출력된다.

---

## 문제 09-14 (절 9.3 · 출력 고르기)

다음 코드의 출력을 고르시오.

```matlab
vals = [4, 9, -2, 16, -5];
total = 0;
k = 0;
while k < 5
    k = k + 1;
    if vals(k) < 0
        break
    end
    total = total + vals(k);
end
fprintf("k = %d, total = %d\n", k, total)
```

① `k = 2, total = 13`

② `k = 3, total = 11`

③ `k = 5, total = 29`

④ `k = 3, total = 13`

⑤ `k = 5, total = 22`

---

## 문제 09-15 (절 9.3 · 빈칸에 들어갈 코드 고르기)

출력이 `s = 12, c = 3`이 되도록 빈칸에 들어갈 코드를 고르시오.

```matlab
data = [3, -1, 4, -1, 5];
s = 0;
c = 0;
for k = 1:length(data)
    if data(k) < 0
        ________
    end
    s = s + data(k);
    c = c + 1;
end
fprintf("s = %d, c = %d\n", s, c)
```

① `continue`

② `break`

③ `s = 0;`

④ `data(k) = 0;`

⑤ `disp("skip")`

---

## 문제 09-16 (절 9.4 · 출력 고르기)

다음 코드의 출력을 고르시오.

```matlab
x = 100;
count = 0;
while (1)
    x = x / 4;
    count = count + 1;
    if x < 2
        break
    end
end
fprintf("%d %.4f\n", count, x)
```

① `2 6.2500`

② `3 6.2500`

③ `4 0.3906`

④ 아무것도 출력되지 않는다. `while (1)`이라 loop가 끝나지 않는다.

⑤ `3 1.5625`

---

## 문제 09-17 (절 9.4 · 옳은 설명 고르기)

midpoint break loop와 `while(1)`에 대한 설명으로 옳은 것을 고르시오.

① `while` loop는 첫 줄의 기준이 참이 될 때까지 반복된다.

② midpoint break 구조는 `while` loop에만 쓸 수 있고 `for` loop에는 쓸 수 없다.

③ `while(1)`은 기준을 항상 참으로 만들어 무한 루프가 되므로, 이 loop를 빠져나가려면 `break` 구조를 써야 한다.

④ 컴퓨터는 1만 참으로 보므로 `while(5)`로 시작한 loop는 한 번도 실행되지 않는다.

⑤ `4 < 2`를 계산하면 결과는 `-1`이고, 음수는 거짓으로 취급된다.

---

## 문제 09-18 (절 9.5 · 출력 고르기)

다음 코드가 끝난 뒤 `m`의 값을 고르시오.

```matlab
x = [2 9 4;
     7 1 8];
[rows, cols] = size(x);
for k = 1:cols
    m(k) = x(1, k);
    for j = 1:rows
        if x(j, k) < m(k)
            m(k) = x(j, k);
        end
    end
end
```

① `m = [7 9 8]`

② `m = [2 1 4]`

③ `m = [2 1]`

④ `m = [2; 1; 4]` (3×1 열 벡터)

⑤ `m = 1`

---

## 문제 09-19 (절 9.6 · 옳은 설명 고르기)

loop의 실행 시간과 효율에 대한 설명으로 옳은 것을 고르시오.

① `clock`/`etime`은 경과 시간이 아니라 그 코드에 쓰인 컴퓨터 시간만 잰다.

② `timeit`은 `tic`/`toc`처럼 재려는 코드 앞뒤에 한 줄씩 두어 쓰며, 코드를 함수로 만들 필요가 없다.

③ `tic`/`toc`로 같은 코드를 다시 재면 housekeeping 작업과 무관하게 항상 같은 값이 나온다.

④ 사전할당 없는 loop가 느린 주된 이유는 pass마다 배열에 원소가 하나씩 추가되어 메모리를 매번 다시 할당하기 때문이다.

⑤ loop 안 계산의 출력은 세미콜론 유무와 관계없이 실행 시간에 영향을 주지 않는다.

---

## 문제 09-20 (절 9.6 · 빈칸에 들어갈 코드 고르기)

슬라이드 방식대로 `B`에 필요한 메모리를 loop 전에 한 번에 확보하려 한다. `(가)`에 들어갈 코드로 알맞은 것을 고르시오.

```matlab
clear
A = ones(500);
t0 = clock;
________          % (가)
for k = 1:length(A(:))
    B(k) = A(k)*2;
end
time = etime(clock, t0)
```

① `B = A;`

② `B = 0;`

③ `B = ones(1, 500);`

④ `B = [];`

⑤ `B = A(k);`

---
