# Chapter 12 연습문제 해답

이 장은 `example/ch12/` 코드 파일을 만들지 않았으므로 해답 코드는 여기에만 있다.

> **[보강]** 이 파일 전체가 슬라이드 밖 내용이다. 연습문제와 해답은 모두 시험 대비용으로 추가한 것이다.

> **[보강]** **검증 방법.** 이 PC의 R2026a에는 Symbolic Math Toolbox가 없어 symbolic 코드를 실행하지 못했다. 아래 답은 다음 기준으로 확인했다.
>
> - **슬라이드 출력에서 바로 읽을 수 있는 답**: 슬라이드(R2022a) 화면 기준.
> - **그 밖의 symbolic 답**: 수학적으로 검증했다(SymPy로 재계산). MATLAB이 항을 적는 **순서나 묶는 방식은 다를 수 있다.** 그런 답에는 "(수식)"이라고 표시했다.
> - **숫자 답**(double 값, function handle 실행): R2026a `-batch`에서 실행했다.

---

## 12.1

### 1. Workspace와 `fun(1,2)`

| 변수 | Class |
|---|---|
| `fun` | `symfun` |
| `x` | `sym` |
| `z` | `sym` |
| `r` | `sym` |

```matlab
syms fun(x,z)
fun(x,z) = 2*x^2 + 4*z;
r = fun(1,2)
```
```
r =
10
```

- `syms fun(x,z)` 한 줄이 `fun`, `x`, `z` **세 개**를 만든다.
- $2\cdot1^2 + 4\cdot2 = 10$. 숫자처럼 보이지만 `r`은 **sym**이다(들여쓰기 없음). 숫자가 필요하면 `double(r)`.

### 2. expression / function / equation

| 코드 | 종류 | 근거 |
|---|---|---|
| `A = pi*r^2` | **expression** | `==`가 없고, 왼쪽이 이름뿐 |
| `g(t) = 5*t^2 + 3` | **function** | 왼쪽에 `이름(입력)` |
| `E1 = m*c^2 == E` | **equation** | `==`로 양변을 이었다 |

### 3. 고치기

```matlab
syms P V n R T          % 쉼표가 아니라 공백으로 구분
gas = P*V == n*R*T      % 방정식의 등호는 ==
```

- 첫 줄: `syms`는 변수를 **공백**으로 구분한다.
- 둘째 줄: `=`가 두 번 나오면 오류다. 대입은 `=` 한 번, 방정식의 등호는 `==`.

---

## 12.1.2

### 1. 결과 예측

```matlab
syms x
simplify((x^2 - 1)/(x - 1))       % x + 1
simplify(sin(x)^2 + cos(x)^2)     % 1
expand((x - 1)*(x + 4))           % x^2 + 3*x - 4
```

- $(x^2-1)/(x-1) = (x-1)(x+1)/(x-1) = x + 1$. 단순화하면 "x = 1에서 정의되지 않는다"는 정보가 사라진다(본문 도입부와 같은 상황).
- $\sin^2x + \cos^2x = 1$.
- $(x-1)(x+4) = x^2 + 3x - 4$.

### 2. 자동 정리와 `simplify`

- (a) MATLAB이 식을 만들 때 **자동으로 항을 합치기** 때문이다. `a + 2*a - 2*a`가 `a`로, 상수 `-1`이 정리되었다. `(a - 3)^2`은 전개하지 않고 둔다.
- (b) `8 - 5*a` (슬라이드 출력).
- (c) **바뀌지 않는다.** 결과는 `ans`에 들어간다. `z`를 바꾸려면 `z = simplify(z)`.

### 3. 함수 고르기

- (a) equation에 쓸 수 없는 것: **`numden`**
- (b) 출력을 두 개 받는 것: **`numden`** (`[n, d] = numden(...)`)
- (c) `(x+2)^3` → `x^3 + 6*x^2 + 12*x + 8`: **`expand`**

---

## 12.2.1

### 1. `solve(x^2 - 5*x + 6)`

```matlab
syms x
r = solve(x^2 - 5*x + 6)
```
```
r =
2
3
```

- 값: 2와 3 ($x^2 - 5x + 6 = (x-2)(x-3)$).
- 크기 **2×1**, Class **sym**.
- `double(r)`을 실행하면 Class가 **double**이 되고 출력이 들여써진다.
  ```
  ans =
       2
       3
  ```

### 2. 이상기체 방정식을 T에 대해

```matlab
syms P V n R T
gas = P*V == n*R*T;
solve(gas, T)
```

결과(수식): $T = \dfrac{PV}{nR}$. MATLAB 표기로는 `(P*V)/(R*n)` 꼴이다.

- x가 없는 식이므로 **둘째 입력에 `T`를 명시**한다.
- 방정식에는 `==`.

### 3. $x^2 = 2$

```matlab
syms x
solve(x^2 - 2)        % (a) expression 전략: 우변을 좌변으로 옮긴다
solve(x^2 == 2)       % (b) equation 전략
```

두 경우 모두 해는 $\pm\sqrt2$ 다. MATLAB은 제곱근을 `^(1/2)`로 적으므로(슬라이드의 `11^(1/2)`와 같은 방식) 다음 꼴로 표시된다(수식 기준 예상 표시).

```
ans =
-2^(1/2)
 2^(1/2)
```
```matlab
double(ans)
```
```
ans =
   -1.4142
    1.4142
```

`roots([1 0 -2])`도 같은 숫자를 준다.

---

## 12.2.2

### 1. 2원 연립방정식

```matlab
syms x y
s = solve(2*x + y == 7, x - y == 2);
s.x
s.y
```
```
ans =
3
ans =
1
```

- 두 식을 더하면 $3x = 9 \Rightarrow x = 3$, $y = x - 2 = 1$.
- `s`는 1×1 **struct**, `s.x`와 `s.y`는 **sym**.

### 2. 출력 순서

- `A` ← **p**, `B` ← **q**, `C` ← **x**. 결과는 **알파벳 순서**로 대입된다.
- tricky한 이유: 출력 변수 이름이나 방정식에 쓴 순서와 **무관하게** 알파벳 순서로 들어가므로, 기대한 변수와 다른 값이 들어갈 수 있다. structure로 받아 `s.p`, `s.q`, `s.x`로 꺼내면 안전하다.

### 3. `A\B`로 풀 수 없는 것

**(b)와 (c).**

- (a) 선형이고 숫자 계수뿐 → `A\B`로 풀 수 있다(그리고 더 빠르다).
- (b) $x^2$ 항이 있는 **비선형** 문제다. 선형대수는 1차 다항식으로 제한된다. `solve`의 해는 $(x, y) = (2, 1)$ 과 $(-1, 4)$.
- (c) 계수에 **기호 a, b**가 있다. 숫자 행렬을 만들 수 없다. `solve`의 해(수식)는 $x = \dfrac{b+1}{a+1}$, $y = \dfrac{1-ab}{a+1}$.

슬라이드 HINT: "`solve`는 더 오래 걸릴 수 있지만 **비선형 문제**와 **symbolic variable이 있는 문제**를 풀 수 있다."

---

## 12.2.3

### 1. `subs`와 원본

```matlab
syms x
f = x^2 + 3*x;
subs(f,x,2)          % 10
subs(f,x,[0 1 2])    % [0, 4, 10]
f                    % x^2 + 3*x  (그대로)
```

- $2^2 + 3\cdot2 = 10$.
- 배열을 대입하면 결과도 배열(1×3 sym): 0, 4, 10. 대괄호와 쉼표로 표시된다.
- `subs`는 **원본을 바꾸지 않는다.**

### 2. 네 변수를 한 번에

```matlab
syms a b c x
e4 = a*x^2 + b*x + c;
v = subs(e4,[a,b,c,x],[1,-3,2,4])     % 6
double(v)                             % 6 (double)
```

$1\cdot16 - 3\cdot4 + 2 = 6$. 변수 배열과 값 배열의 **같은 위치끼리** 짝지어진다.

### 3. `symfun`의 인수 순서

- `h = symfun(e,[x,y])` → `h(1,2)`는 x = 1, y = 2: $1\cdot2 + 2^2 =$ **6**
- `k = symfun(e,[y,x])` → `k(1,2)`는 y = 1, x = 2: $2\cdot1 + 1^2 =$ **3**

`symfun`의 **둘째 입력이 인수의 순서**를 정한다.

---

## 12.3

### 1. 3차식 그리기

```matlab
syms x
y = x^3 - 4*x;
fplot(y,[-3,3])
title("Cubic")
xlabel("x")
ylabel("y")
```

범위를 지정하지 않으면(`fplot(y)`) x축은 **−5부터 5까지** 그려진다.

### 2. 타원 두 가지 방법

```matlab
% (a) 음함수
syms x y
fimplicit(x^2/4 + y^2 == 1,[-2.5,2.5])

% (b) 매개변수
syms t
fplot(2*cos(t),sin(t),[0,2*pi])
```

- (a) `fimplicit`에는 방정식(`==`)을 그대로 넣는다. 타원의 x 범위가 −2 ~ 2이므로 그보다 넓은 구간을 준다.
- (b) `fplot(x식, y식, [t최소, t최대])`. $x = 2\cos t$, $y = \sin t$ 이면 $x^2/4 + y^2 = \cos^2t + \sin^2t = 1$.

### 3. 대응표

| Numeric | Symbolic |
|---|---|
| `plot3` | `fplot3` |
| `mesh` | `fmesh` |
| `surf` | `fsurf` |
| `contour` | `fcontour` |
| `polarplot` | `ezpolar` |

대응하는 숫자 함수가 없는 것: **`fimplicit`**, **`fimplicit3`**.

---

## 12.4

### 1. 3 m + 2 ft

```matlab
u = symunit;
d = 3*u.m + 2*u.ft;          % 2*[ft] + 3*[m] 꼴로 남는다 (자동 단순화 안 됨)
d = simplify(d);
d = unitConvert(d,u.m)
[v, un] = separateUnits(d);
v = double(v)
```

- `unitConvert` 결과: **`(2256/625)*[m]`**
- double 값: **3.6096**

계산: 2 ft = 2 × 0.3048 = 0.6096 m. 3 + 0.6096 = 3.6096 = 2256/625.

### 2. 온도 차와 실제 온도

- `A` = **`25*[K]`**. 기본 가정은 **온도 차**다. 25 °C의 변화 = 25 K의 변화.
- `B` = **`(5963/20)*[K]`** = 298.15 K. `"Temperature","Absolute"`를 주면 **실제 온도**로 변환한다. 25 + 273.15 = 298.15.

### 3. `ratio`의 Class 변화

| 줄 | 값 | Class |
|---|---|---|
| `ratio = (5*u.m)/(10*u.ft)` | `(1/2)*([m]/[ft])` | `sym` |
| `ratio = simplify(ratio)` | `625/381` | `sym` |
| `ratio = double(ratio)` | `1.6404` | `double` |

단위는 자동으로 단순화되지 않고, `simplify`를 거쳐도 여전히 symbolic(분수)이다. `double`을 거쳐야 숫자가 된다.

---

## 12.5.1

### 1. 1차·2차 도함수

```matlab
syms x
diff(x^3 + 2*x)        % 3*x^2 + 2
diff(x^3 + 2*x, 2)     % 6*x
```

둘째 입력이 숫자면 **차수**다.

### 2. 변수가 둘인 식

`y = x^2*t^3` (수식. MATLAB은 `t^3*x^2`처럼 순서를 바꿔 적을 수 있다)

| 명령 | 뜻 | 결과(수식) |
|---|---|---|
| `diff(y)` | x로 1번 (기본 변수 x) | $2xt^3$ |
| `diff(y,t)` | t로 1번 | $3x^2t^2$ |
| `diff(y,t,2)` | t로 2번 | $6x^2t$ |

### 3. 특정 시점의 속도와 가속도

```matlab
syms t
dist = 20 + 20*sin(pi*(t-10)/20);
velocity = diff(dist);            % pi*cos((pi*(t - 10))/20)
acceleration = diff(dist,2);      % -(pi^2*sin((pi*(t - 10))/20))/20

v10 = subs(velocity,t,10)         % pi
double(v10)                       % 3.1416
a20 = subs(acceleration,t,20)     % -pi^2/20
double(a20)                       % -0.4935
```

- (a) t = 10: $\pi\cos 0 = \pi \approx 3.1416$.
- (b) t = 20: $-\dfrac{\pi^2\sin(\pi/2)}{20} = -\dfrac{\pi^2}{20} \approx -0.4935$.
- 숫자 값은 R2026a에서 같은 식을 function handle로 계산해 확인했다.

---

## 12.5.2

### 1. 정적분

```matlab
syms x
int(x^2, 0, 3)        % 9
int(sin(x), 0, pi)    % 2
```

- $\left[\dfrac{x^3}{3}\right]_0^3 = 9$.
- $[-\cos x]_0^\pi = 1 + 1 = 2$.

### 2. 변수가 둘인 식

| 명령 | 뜻 | 결과(수식) |
|---|---|---|
| `int(y)` | x로 부정적분 (t는 상수) | $\dfrac{t\,x^3}{3}$ |
| `int(y,t)` | t로 부정적분 (x는 상수) | $\dfrac{t^2x^2}{2}$ |
| `int(y,t,0,2)` | t로 0 → 2 정적분 | $2x^2$ |

### 3. 설명

- `int(y)`는 **부정적분**(식을 돌려준다), `int(y,2,3)`은 2에서 3까지의 **정적분**(값을 돌려준다).
- `int`는 **symbolic**(해석적) 적분이고, `integral`은 function handle을 받아 **수치**로 적분한다.
- `int(x^3 + sin(x))`의 출력 `x^4/4 - cos(x)`에는 **적분 상수 `+ C`** 가 없다.

---

## 12.6.1

### 1. $dy/dt = -2y$

```matlab
syms y(t)
eqn = diff(y,t) == -2*y;
dsolve(eqn)                 % (a) C1*exp(-2*t)
dsolve(eqn, y(0) == 5)      % (b) 5*exp(-2*t)
```

확인: $y = C_1e^{-2t}$ 이면 $dy/dt = -2C_1e^{-2t} = -2y$. $y(0) = C_1 = 5$.

### 2. 경계 조건 $y(1) = 3$

```matlab
syms y(t)
eqn = diff(y,t)==2*y/t;

dsolve(eqn, y(1)==3)        % 직접 입력

cond = y(1)==3;             % 이름 붙이기
dsolve(eqn, cond)
```

해: **`3*t^2`**. 일반해 $C_1t^2$ 에 t = 1, y = 3을 넣으면 $C_1 = 3$.

### 3. `syms y t`의 문제

`syms y t`는 `y`와 `t`를 **서로 무관한 두 symbolic variable**로 만든다. `y`가 t의 함수가 아니므로 `diff(y,t)`는 **0**이 되고, 방정식은 `0 == 2*y/t`가 된다. 미분방정식이 아니다.

고친 코드:

```matlab
syms y(t)
eqn = diff(y,t) == 2*y/t;
dsolve(eqn)                 % C1*t^2
```

종속 변수는 **함수 표기 `y(t)`** 로 선언해야 한다.

---

## 12.6.2

### 1. $x'' + 4x = 0$

```matlab
syms x(t)
eqn = diff(x,t,2) + 4*x == 0;
dsolve(eqn)

Dx = diff(x);
dsolve(eqn, x(0)==1, Dx(0)==0)
```

- (a) 2차 방정식이므로 상수 **두 개**(`C1`, `C2`). 일반해(수식): $x = C_1\cos 2t + C_2\sin 2t$. MATLAB이 `C2` 앞의 부호를 다르게 적을 수 있다(본문 예처럼).
- (b) **`cos(2*t)`**. $x(0) = C_1 = 1$, $x'(0) = 2C_2 = 0$.

### 2. $x(0) = 0$, $x(\pi/4) = 3$

```matlab
dsolve(eqn, x(0)==0, x(pi/4)==3)
```

해: **`3*sin(2*t)`**. $x(0) = C_1 = 0$, $x(\pi/4) = C_2\sin(\pi/2) = C_2 = 3$.

조건이 **서로 다른 두 시각**(t = 0, t = π/4)에서 주어졌으므로 **경계값 문제(boundary value problem)** 다. 도함수 조건이 없어 `Dx`를 정의할 필요가 없다.

### 3. 3차 방정식과 2차 도함수 조건

- 경계 조건은 차수와 같은 **3개**가 필요하다.
- 2차 도함수를 나타내는 **새 symbolic function**을 먼저 정의한다.

```matlab
syms x(t)
D2x = diff(x,t,2);
% ... dsolve(eqn, ..., D2x(0)==2)
```

1차 도함수 조건이 `Dx = diff(x)` → `Dx(0)==1`인 것과 같은 방식이다.

---

## 12.7

### 1. Class와 값

- `f`: **`function_handle`** (`@(x)-sin(x)`)
- `f(pi/2)`: **`double`**, 값 **−1**

```
ans =
    -1
```

$-\sin(\pi/2) = -1$. `@(x)-sin(x)`를 R2026a에서 실행해 확인했다.

### 2. `dy(5)`와 `g(5)`

```
>> dy(5)
ans =
1/25 - (6*exp(-5))/25

>> g(5)
ans =
    0.0384
```

- `dy`는 **symbolic function** → 결과가 **sym**. `exp(-5)`를 계산하지 않고 정확한 식으로 남긴다. 들여쓰기 없음.
- `g`는 **numeric function**(anonymous function) → 결과가 **double**. 들여쓰기 있음.
- 값은 같다. `dy(5)`를 숫자로: `double(dy(5))` → `0.0384`.

### 3. array 연산자

`matlabFunction`은 식을 **array 연산자(`./`, `.^`, `.*`)** 로 바꿔 anonymous function을 만든다. 그래야 **배열 입력**에 대해 원소별로 계산할 수 있다. symbolic 식에서는 변수가 1×1이라 `/`, `^`, `*`로 충분했지만, 숫자 함수에는 배열이 들어올 수 있다.

`g([1 2 3])`은 오류 없이 실행된다(R2026a 실행).

```
ans =
    0.2642    0.1485    0.0890
```
