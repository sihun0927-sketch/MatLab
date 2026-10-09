# Chapter 6 — User-Defined Functions · 해답

문제지: [questions.md](questions.md). 출력은 R2026a 기본 상태(`format short`, `format loose`)의 Command Window 화면이다. `>>` 프롬프트 줄은 생략하고 화면에 찍히는 내용만 쓴다.

---

## 6.1 함수 파일 만들기 (6.1.1–6.1.2)

### Q06-01 [빈칸] ★

원본: p.7 `function result = calculation(a)` → 변형: 입력 두 개, 이름 `cyl_vol`

```matlab
function V = cyl_vol(r, h)
```

1. 위와 같다. 입력이 여럿이면 괄호 안에 쉼표로 나열한다.
2. `cyl_vol.m`. 함수 이름과 파일 이름이 같아야 한다.
3. ① `function` 키워드 ② 출력 변수 ③ 함수 이름 ④ 입력 변수. 함수 이름과 입출력 변수 이름은 프로그래머가 정한다.

- 근거: [6.1](../../textbook/ch06/6.1-function-files.md) 6.1.1 함수의 구조와 문법

### Q06-02 [출력] ★

원본: p.9–11 `poly(5)` → 변형: 입력값을 2, 벡터, −1로

```
ans =

    41

ans =

    41

z =

     5

```

- `poly(2) = 3·8 + 5·4 − 2·2 + 1 = 41`.
- `y = poly([0 1 2]);`는 세미콜론 때문에 출력 없음. `y`는 `[1 7 41]`이고 `y(end)`는 41.
- `poly(-1) = −3 + 5 + 2 + 1 = 5`.
- 근거: [6.1](../../textbook/ch06/6.1-function-files.md) 별도 파일로 저장한 함수

### Q06-03 [변형] ★★

원본: p.10 `output = 3*x.^3 + 5*x.^2 - 2*x +1;` → 변형: `.^`를 `^`로

1. 같다. 스칼라에는 `^`와 `.^`의 차이가 없다.

```
ans =

    41

```

2. 오류.

```
Error using  ^ 
Incorrect dimensions for raising a matrix to a power. Check that the matrix is square and the power is a scalar. To operate on each element of the matrix individually, use POWER (.^) for elementwise power.
```

- `x^3`은 행렬 거듭제곱(`x*x*x`)이라 1×3 벡터처럼 정방이 아닌 행렬이면 오류다. 원소별 거듭제곱은 `.^`.
- 근거: [6.1](../../textbook/ch06/6.1-function-files.md) ⚠️ 함정

### Q06-04 [출력] ★★★

원본: p.10 "The function name must be the same as the file name." → 변형: 파일 이름을 `poly2.m`으로

```
ans =

   491

ans =

     1    -5

```

- MATLAB은 **파일 이름**으로 함수를 찾는다. `poly2(5)`는 `poly2.m`을 실행하므로 491이다(파일 안의 `poly`라는 이름은 무시된다).
- 현재 폴더에 `poly.m`이 없으므로 `poly(5)`는 MATLAB 내장 `poly`(특성다항식 계수)를 부른다. 스칼라 5의 특성다항식은 `λ − 5`이므로 `[1 -5]`.
- 슬라이드 예제처럼 `poly.m`으로 저장하면 거꾸로 내장 `poly`를 가린다(shadowing).
- 근거: [6.1](../../textbook/ch06/6.1-function-files.md) ⚠️ 함정 "기존 함수 이름 덮어쓰기"

### Q06-05 [출력] ★★

원본: p.13 `x = [2,5,6]; y1_scalar = square(3)` → 변형: 값 변경, `y1_array`에 세미콜론 + `disp`

1. 출력

```
y1_scalar =

     4

     1    16    49
```

2. `x`, `y1_scalar`, `y1_array`. 함수 안의 `output`은 local 변수라 남지 않는다.

- `y1_array = square(x);`는 세미콜론으로 숨겨지고, `disp`는 변수 이름과 빈 줄 없이 값만 찍는다.
- 근거: [6.1](../../textbook/ch06/6.1-function-files.md) 프로그램 안에 함수를 넣는 경우

### Q06-06 [오류] ★★

원본: p.15 `n = grain_size(N);` (live script 끝의 local function) → 변형: Command Window에서 `grain_size(16)` 직접 호출

1. 출력

```
Unrecognized function or variable 'grain_size'.
```

2. 스크립트(live script) 끝에 정의한 함수는 local function이라 **그 파일 안에서만** 보인다. Command Window나 다른 프로그램에서는 호출할 수 없다.
3. 함수 부분을 `grain_size.m`이라는 별도 함수 파일로 저장해 현재 폴더(또는 search path)에 둔다.

- 근거: [6.1](../../textbook/ch06/6.1-function-files.md) 프로그램 안에 함수를 넣는 경우

### Q06-07 [코드] ★★

원본: p.13 → 변형: `square` 대신 `cube`, `disp`로 배열 출력

```matlab
x = 1:3;
y1_scalar = cube(3)
y1_array = cube(x);
disp(y1_array)

function output = cube(x)
output = x.^3;
end
```

- 세미콜론이 없어야 하는 줄은 `y1_scalar = cube(3)` 하나뿐이다. `x`, `y1_array`, 함수 안의 `output` 줄은 세미콜론이 있어야 한다(함수 안 줄에 세미콜론이 없으면 `output =`이 추가로 찍힌다. p.12 HINT).
- 배열 줄은 이름 없이 값만 나왔으므로 `disp`다. 함수는 스크립트 **맨 끝**에 두고 `end`로 닫는다.
- 근거: [6.1](../../textbook/ch06/6.1-function-files.md) 프로그램 안에 함수를 넣는 경우

### Q06-08 [단답] ★

원본: p.8 HINT, p.16, p.21 `motion.m`의 주석 → 변형: `help motion`이 찍는 줄 묻기

1. 함수 정의줄 **바로 다음**에 이어지는 주석 세 줄(`This function calculates the distance, velocity, and` / `acceleration of a particular car for a given value of t` / `assuming all 3 parameters are initially 0.`).
2. H1 line.
3. 입력 인수는 함수를 호출할 때 괄호 안에 넣는 값이고, `input` 명령은 실행 중 사용자에게 키보드 입력을 받는 별개의 명령이다.

- 근거: [6.1](../../textbook/ch06/6.1-function-files.md) 6.1.2 주석과 help (H1 line)

---

## 6.1.3–6.1.4 다중 입출력, 입출력 없는 함수

### Q06-09 [출력] ★

원본: p.18 `x=1:5; y=5:9; z=g(x,y)` → 변형: 값 변경, 인수 순서 교환

```
z =

     2     0    -4

ans =

     2     0    -4

```

- `[2 3 4].*[1 0 -1] = [2 0 -4]`. 원소별 곱은 교환법칙이 성립하므로 순서를 바꿔도 같다.
- 근거: [6.1.3](../../textbook/ch06/6.1.3-multiple-io.md)

### Q06-10 [출력] ★★★

원본: p.18 → 변형: 한쪽을 열벡터로(`'` 전치)

```
ans =

     1     2     3
     2     4     6
     3     6     9

```

- 1×3과 3×1을 `.*`하면 오류가 아니라 implicit expansion으로 3×3 행렬이 된다. 주석의 "same size arrays"는 MATLAB이 검사하지 않는다.
- 근거: [6.1.3](../../textbook/ch06/6.1.3-multiple-io.md)

### Q06-11 [변형] ★★

원본: p.17 `a = x.*y;` → 변형: `.*`를 `*`로

1. 출력

```
ans =

    12

Error using  * 
Incorrect dimensions for matrix multiplication. Check that the number of columns in the first matrix matches the number of rows in the second matrix. To operate on each element of the matrix individually, use TIMES (.*) for elementwise multiplication.
```

(`x = 1:5;`, `y = 5:9;`는 출력 없음)

2. `z = g(x,y)`. 스칼라끼리는 `*`와 `.*`가 같지만, 1×5와 1×5의 행렬 곱은 안쪽 차원(5와 1)이 맞지 않아 오류다. 원본은 `[5 12 21 32 45]`.

- 근거: [6.1.3](../../textbook/ch06/6.1.3-multiple-io.md)

### Q06-12 [출력] ★

원본: p.21 `[distance, velocity, acceleration] = motion(10)` → 변형: t = 6

```
distance =

    18

velocity =

     9

acceleration =

     3

```

- `dist = 6^3/12 = 18`, `vel = 6^2/4 = 9`, `accel = 0.5·6 = 3`. 모두 정수라 정수 형식으로 찍힌다(원본 t = 10은 `83.3333`).
- 함수 안의 출력 이름(`dist`)과 호출 쪽 이름(`distance`)은 달라도 된다.
- 근거: [6.1.3](../../textbook/ch06/6.1.3-multiple-io.md)

### Q06-13 [출력] ★★

원본: p.23 `motion(10)` → `ans = 83.3333` → 변형: t = 6, 출력 두 개

```
ans =

    18

a =

    18

v =

     9

```

- 출력을 요청하지 않으면 **첫 번째** 출력(`dist`)만 `ans`로 돌아온다.
- `[a, v]`는 이름과 상관없이 **위치**로 채워진다. `a`에 가속도가 아니라 거리 18이 들어간다.
- 근거: [6.1.3](../../textbook/ch06/6.1.3-multiple-io.md) ⚠️ 함정

### Q06-14 [코드] ★★

원본: p.23 → 변형: 세 번째 출력만 받기

```matlab
[~, ~, acc] = motion(4)
```

- 세미콜론이 없어야 `acc =`이 보인다. `accel = 0.5·4 = 2`.
- `~`는 그 자리의 출력을 버리면서 위치를 지킨다. `[d, v, acc] = motion(4)`는 `d`, `v`가 생기고 셋 다 출력되므로 조건에 맞지 않는다.
- 근거: [6.1.3](../../textbook/ch06/6.1.3-multiple-io.md)

### Q06-15 [오류] ★★

원본: p.24, p.28 `A = star` → 변형: 입력 초과, 출력 초과

```
Error using star
Too many output arguments.
```

```
Error using star
Too many input arguments.
```

```
Error using motion
Too many output arguments.
```

- `function [] = star( )`의 `[]`는 출력 없음, `( )`는 입력 없음이다. 돌려줄 값이 없는데 `A`에 담으려 했고, 받지 않는 입력을 넣었다.
- `motion`은 출력이 3개뿐인데 4개를 요청했다. 적게 받는 것은 괜찮지만 많이 받으면 오류다.
- 근거: [6.1.3](../../textbook/ch06/6.1.3-multiple-io.md) 6.1.4 입출력 없는 함수

---

## 6.1.5 입력·출력 인수의 개수

### Q06-16 [출력] ★

원본: p.31 `nargin("sin")`, `nargin("rem")`, `nargin("surf")`, p.33 `nargout("max")` → 변형: 변수에 담기, 세미콜론 섞기

```
n1 =

     1

n3 =

    -1

ans =

     2

```

- `n2`(= 2)는 세미콜론으로 숨겨진다. `surf`는 가변 입력이라 음수 −1.
- 근거: [6.1.5](../../textbook/ch06/6.1.5-nargin-nargout.md)

### Q06-17 [출력] ★★

원본: p.31, p.33 → 변형: 사용자 정의 함수에 적용

```
ans =

     2

ans =

     3

ans =

     0     0

ans =

     4

```

- `g(x,y)`는 입력 2개, `motion`은 출력 3개, `star`는 입출력 0개, `motion`은 입력 1 + 출력 3 = 4.
- 근거: [6.1.5](../../textbook/ch06/6.1.5-nargin-nargout.md)

### Q06-18 [출력] ★★★

원본: p.34 `fun = 'mySize'; nargout(fun)` → `ans = -2` → 변형: 실제 호출 추가

```
v =

     4     7

r =

     4

c =

     7

s =

     2     3

ans =

    -2

ans =

     1

```

- 출력 3개를 요청하면 `nargout = 3`이라 `varargout`은 칸 2개짜리 cell이 되고, 행 수·열 수가 하나씩 들어간다.
- 출력 1개만 요청하면 `varargout`은 빈 cell(`cell(1,0)`)이라 루프가 돌지 않는다.
- `nargout("mySize")`가 −2인 것은 "고정 출력 1개 + `varargout`"이라는 뜻이다(음수의 절댓값 = `varargout`을 포함한 위치). 입력은 `x` 하나라 1.
- 근거: [6.1.5](../../textbook/ch06/6.1.5-nargin-nargout.md) ⚠️ 함정

### Q06-19 [출력] ★★

원본: p.35–38 `nargout("star1")`, `star1`, `x = star1` → 변형: 세미콜론 추가, `disp`, `class`

```
ans =

     1

Twinkle twinkle little star
ans =

    'string'

```

- `star1`만 입력하면 `nargout = 0`이라 `A`를 만들지 않는다. 출력을 요청하지 않았으므로 오류도 없고 아무것도 찍히지 않는다(그림만 그려짐).
- `x = star1;`은 `nargout = 1`이라 `A`가 만들어지지만 세미콜론 때문에 숨겨진다. `disp`는 따옴표 없이 내용만 찍는다.
- 큰따옴표로 만든 값이므로 `string` 클래스다. `class`의 결과는 char이므로 작은따옴표로 표시된다.
- 근거: [6.1.5](../../textbook/ch06/6.1.5-nargin-nargout.md)

### Q06-20 [변형] ★★★

원본: p.36–38 `if nargout==1` → 변형: `nargout==0`

1. 출력

```
ans = 

    "Twinkle twinkle little star"

```

```
Output argument "A" (and possibly others) not assigned a value in the execution with "star1" function.
```

> **[확인 필요]** R2026a에서 이 오류 앞에 `Error using star1` 줄이 먼저 찍히는지 확인할 것.

2. `star1`만 입력하면 `nargout = 0`이라 이번에는 `A`가 만들어지고, 값이 있는 출력은 세미콜론이 없으므로 `ans`로 표시된다. `x = star1`은 `nargout = 1`이라 `A`가 만들어지지 않는데 출력을 요청했으므로 오류다. 원본과 정확히 반대로 동작한다.

- 근거: [6.1.5](../../textbook/ch06/6.1.5-nargin-nargout.md)

### Q06-21 [코드] ★★

원본: p.31 `nargin("rem")`, p.33 `nargout("max")`, `nargout("size")` → 변형: 출력에서 명령 역추적, 변수 `k`에 담기

```matlab
k = nargin("rem")
nargout("max")
nargout("size")
```

- 세 줄 모두 결과가 보이므로 세미콜론이 없다. 첫 줄만 변수 `k`에 담고 나머지는 `ans`로 받는다.
- 함수 이름은 `'rem'`처럼 char로 줘도 같다.
- 근거: [6.1.5](../../textbook/ch06/6.1.5-nargin-nargout.md)

---

## 6.1.6–6.1.8 local 변수, global 변수, 함수 코드 보기

### Q06-22 [출력] ★

원본: p.40–42 `g(10,20)` → `ans = 200`, `a` → 오류 → 변형: 값 변경, `output`도 확인

1. 출력

```
ans =

    12

Unrecognized function or variable 'a'.
Unrecognized function or variable 'output'.
```

2. `ans`뿐이다.

- `a`, `x`, `y`, `output`은 `g` 안의 local 변수라 함수가 끝나면 사라진다. 함수와 workspace는 입력 인수와 반환값으로만 통한다.
- 근거: [6.1.6](../../textbook/ch06/6.1.6-local-global.md)

### Q06-23 [출력] ★★

원본: p.45 `distance(10)` → `ans = 490.0000` → 변형: t = 2, `result` 확인

```
g =

    9.8000

ans =

   19.6000

Unrecognized function or variable 'result'.
```

- 함수 안의 `g`와 workspace의 `g`는 이름만 같은 별개 변수다. 함수 안에서 정의했으므로 workspace 값과 무관하게 동작한다.
- `result`는 local 변수라 workspace에 없다. 실행 후 workspace에는 `g`, `ans`만 있다.
- 근거: [6.1.6](../../textbook/ch06/6.1.6-local-global.md)

### Q06-24 [오류] ★★

원본: p.44 `g = 9.8`, `distance(10)` → 오류

1. 출력

```
g =

    9.8000

Not enough input arguments.
```

(이어서 `Error in g (line 4)`, `Error in distance (line 4)`가 찍힌다.)

2. 함수는 workspace 변수를 볼 수 없다. `distance` 안에서 `g`라는 변수가 없으니 MATLAB은 현재 폴더의 함수 `g.m`을 찾아 **입력 없이** 호출하고, `g` 안의 `x.*y`에서 입력이 부족해 오류가 난다.
3. `Unrecognized function or variable 'g'.`

- 고치는 법: 함수 안에서 `g = 9.8;`을 정의하거나(p.45) 입력 인수로 받는다.
- 근거: [6.1.6](../../textbook/ch06/6.1.6-local-global.md)

### Q06-25 [출력] ★★

원본: p.48 `global G`, `G = 9.8;`, `distance(10)` → 변형: G = 10 먼저, `G = 9.8` 세미콜론 제거

1. 출력

```
ans =

   500

G =

    9.8000

ans =

  490.0000

```

2. 9.8은 이진수로 정확히 표현되지 않아 `1/2*9.8*100`이 490보다 아주 조금 큰 값(490.00000000000006)이 된다. 정수가 아니므로 소수 4자리 형식으로 찍힌다. G = 10일 때는 정확히 500이라 정수 형식이다. 슬라이드도 `490.0000`으로 표시한다.

- `global G`는 Command Window와 함수 양쪽에 선언되어 있으므로 함수를 고치지 않고 `G`만 바꿔 결과를 바꿀 수 있다.
- 근거: [6.1.6](../../textbook/ch06/6.1.6-local-global.md) 6.1.7

### Q06-26 [출력] ★★★

원본: p.48 → 변형: Command Window 쪽 `global` 선언 누락

```
ans =

     []

G =

    9.8000

```

- Command Window의 `G`는 global이 아닌 일반 변수다. 함수 안의 `global G`는 아직 없는 전역 변수 `G`를 빈 배열로 만든다.
- `1/2*[]*100`은 오류 없이 `[]`가 된다. **조용히 틀리는** 함정이다. 양쪽 모두 `global`로 선언해야 공유된다.
- 근거: [6.1.6](../../textbook/ch06/6.1.6-local-global.md) ⚠️ 함정

### Q06-27 [코드] ★★

원본: p.48 → 변형: G = 5

```matlab
global G
G = 5;
distance(10)
```

- `G = 5` 줄에 세미콜론이 있어야 한다(없으면 `G =` / `5`가 찍힌다). `distance(10)`은 결과가 보이므로 세미콜론이 없다. `global G`는 원래 아무것도 출력하지 않는다.
- `1/2·5·10² = 250`.
- 관례상 global 변수 이름은 대문자로 쓴다(p.49).
- 근거: [6.1.6](../../textbook/ch06/6.1.6-local-global.md) 6.1.7

### Q06-28 [출력] ★★

원본: p.51–53 `type sphere` → 변형: 정의줄에서 `nargin`/`nargout` 값 읽기

1. 출력

```
ans =

    -1

ans =

     3

```

2. `sin`은 built-in 함수라 소스 코드 파일이 없다. `sphere`는 toolbox에 `.m` 파일로 들어 있어 `type`으로 내용을 볼 수 있다.

> **[확인 필요]** R2026a에서 `type sin`의 출력이 `'sin' is a built-in function.`인지, 파일이 없다는 오류인지 확인할 것.

- 입력이 `varargin` 하나뿐이라 `nargin`은 −1, 출력은 `xx, yy, zz` 3개다.
- 근거: [6.1.6](../../textbook/ch06/6.1.6-local-global.md) 6.1.8

---

## 6.2 Subfunction

### Q06-29 [출력] ★★

원본: p.57–58 `subfunction_demo` → 변형: 벡터 두 개로 실제 호출

```
s =

     5     7     9

d =

    -3    -3    -3

```

- `add`가 `x+y`, `subtract`가 `x-y`를 원소별로 계산한다. 음수도 폭 6에 맞춰 오른쪽 정렬된다.
- 근거: [6.2](../../textbook/ch06/6.2-subfunctions.md)

### Q06-30 [출력] ★★

원본: p.57–58 → 변형: 출력 하나만 받기, subfunction 직접 호출

```
ans =

    14

d =

     6

Unrecognized function or variable 'subtract'.
```

- 출력을 요청하지 않으면 첫 번째 출력(`addition_result`)만 `ans`로 온다.
- `subtract`는 `subfunction_demo.m` 안에서만 보이는 함수라 Command Window에서 부를 수 없다(기본 MATLAB에 같은 이름의 함수가 없다고 가정).
- 근거: [6.2](../../textbook/ch06/6.2-subfunctions.md) 바깥에서는 보이지 않는다

### Q06-31 [출력] ★★★

원본: p.55 sample_homework → 변형: `x = -2:2`, `g = 10`, live script 대신 `.m` 스크립트

```
Problem 1
The squares of the input values are listed below
     4     1     0     1     4
Problem 2
The percent cold work is
ans =

    0.7500

Problem 3
The change in potential energy is 
ans =

    50   100   150

```

- `disp`는 이름 없이 내용만 찍고 빈 줄도 없다. 세미콜론 없는 함수 호출 두 줄만 `ans =` 형식으로 찍힌다.
- `(0.5² − 0.25²)/0.5² = 0.1875/0.25 = 0.75`. `[1 2 3]·10·5 = [50 100 150]`.
- 슬라이드는 live script라 결과가 편집기 오른쪽에 `ans = 0.75`처럼 표시되지만, Command Window에서는 위 형식이다.
- 근거: [6.2](../../textbook/ch06/6.2-subfunctions.md)

### Q06-32 [변형] ★★★

원본: p.55 `result = (ri.^2 - rf.^2)/ri.^2;` → 변형: 벡터 입력

1. 출력

```
ans =

    0.7647

```

2. 분모 앞의 `/`가 원소별 나눗셈이 아니라 **행렬 나눗셈**(mrdivide)이다. `[1 3]/[1 4]`는 `x·[1 4] ≈ [1 3]`을 만족하는 스칼라 `x`를 최소제곱으로 구해 `13/17 ≈ 0.7647`이 된다. 오류도 나지 않아 알아채기 어렵다. `./`로 고친다.

```matlab
result = (ri.^2 - rf.^2)./ri.^2;
```

```
ans =

    1.0000    0.7500

```

- 스칼라 입력(슬라이드 원본)에서는 `/`와 `./`가 같아서 문제가 드러나지 않는다.
- 근거: [6.2](../../textbook/ch06/6.2-subfunctions.md)

### Q06-33 [단답] ★★

원본: p.56–58 `subfunction_demo.m` → 변형: `end` 구조와 호출 가능 범위 묻기

1. `subfunction_demo`. 파일 이름(`subfunction_demo.m`)과 같아야 한다.
2. `subfunction_demo`뿐이다. `add`, `subtract`는 그 파일 안에서만 보인다.
3. primary function `subfunction_demo`를 닫는다. primary 함수가 `add`, `subtract` 앞에서 닫히지 않았으므로 두 함수는 primary **안에** 정의된 nested function이 된다(8행 `end`는 `add`, 12행 `end;`는 `subtract`를 닫는다). 이 예제는 nested 변수 공유를 쓰지 않으므로 결과는 일반 subfunction과 같다.
4. folding.

- 근거: [6.2](../../textbook/ch06/6.2-subfunctions.md) Nested function

---

## 6.3 나만의 toolbox

### Q06-34 [단답] ★

원본: p.59 함수 탐색 순서 → 변형: 세 단계를 순서대로 쓰기

① 현재 프로그램 파일의 끝(local function) → ② 현재 폴더 → ③ search path(위에서부터). 먼저 찾은 것이 쓰인다.

- 근거: [6.3](../../textbook/ch06/6.3-toolbox-search-path.md)

### Q06-35 [출력] ★★

원본: p.59 함수 탐색 순서 → 변형: 같은 이름의 local function과 폴더 함수

```
a =

     2

ans =

     7

```

- 스크립트 안에서는 파일 끝의 local function `poly`(`2*x`)가 현재 폴더의 `poly.m`보다 먼저 찾아진다.
- Command Window에서는 그 local function이 보이지 않으므로 현재 폴더의 `poly.m`이 쓰인다. `3 + 5 − 2 + 1 = 7`.
- 근거: [6.3](../../textbook/ch06/6.3-toolbox-search-path.md)

### Q06-36 [단답] ★

원본: p.59–61 `pathtool`, Add Folder → 변형: 명령·버튼·주의사항 묻기

1. `pathtool` (또는 Home 탭의 Set Path).
2. Add Folder… (하위 폴더까지 넣으려면 Add with Subfolders…).
3. 공용 컴퓨터에서는 path를 **영구적으로** 바꾸지 말 것(Save 금지).

- 근거: [6.3](../../textbook/ch06/6.3-toolbox-search-path.md)

---

## 6.4 Anonymous function과 function handle

### Q06-37 [출력] ★

원본: p.62–63 `ln = @(x) log(x)`, `y = ln(10)` → 변형: 입력 1, 벡터, `class`

```
ln =

  function_handle with value:

    @(x)log(x)

y =

     0

ans =

         0    2.3026    4.6052

ans =

    'function_handle'

```

- 표시할 때 공백이 빠져 `@(x)log(x)`가 된다.
- `log(1) = 0`은 정수라 정수 형식. 벡터에 소수가 섞이면 0은 `0`으로만 찍히고 폭 10에 맞춰진다.
- 근거: [6.4](../../textbook/ch06/6.4-anonymous-functions.md)

### Q06-38 [출력] ★★

원본: p.64–65 `save my_ln_function ln`, `clear`, `load my_ln_function` → 변형: 복원 뒤 호출, `y` 확인

1. 출력

```
ans =

    2.3026

Unrecognized function or variable 'y'.
```

2. `my_ln_function.mat`

- `save 파일이름 변수`는 지정한 변수 `ln`만 저장한다. `clear`로 `ln`, `y`가 모두 사라진 뒤 `load`는 `ln`만 되살린다.
- 근거: [6.4](../../textbook/ch06/6.4-anonymous-functions.md)

### Q06-39 [출력] ★★

원본: p.66 `distance_handle = @(t) distance(t)` → 변형: 호출, `@함수이름` 형태

```
distance_handle =

  function_handle with value:

    @(t)distance(t)

ans =

   19.6000

ans =

  490.0000

```

- `@(t) distance(t)`는 기존 함수를 한 겹 감싼 anonymous function, `@distance`는 기존 함수에 바로 붙인 handle이다. 둘 다 함수처럼 호출된다.
- `490.0000`이 되는 이유는 Q06-25와 같다.
- 근거: [6.4](../../textbook/ch06/6.4-anonymous-functions.md)

### Q06-40 [출력] ★★★

원본: p.67 `new_fun = @(x) complicated_function(a, b, c, d, x)` → 변형: 실제 함수, 값 변경 후 재호출

```
new_fun =

  function_handle with value:

    @(x)cf(a,b,c,d,x)

ans =

    50

ans =

    20   130

ans =

    50

```

- `new_fun(1) = 5 + 10 + 15 + 20 = 50`, `new_fun(0) = 20`, `new_fun(2) = 40 + 40 + 30 + 20 = 130`.
- anonymous function은 **만들 때의** `a, b, c, d` 값을 복사해 둔다. 나중에 `a = 0`으로 바꿔도 `new_fun`에는 반영되지 않는다. 바뀐 값을 쓰려면 `new_fun`을 다시 만들어야 한다.
- 근거: [6.4](../../textbook/ch06/6.4-anonymous-functions.md) ⚠️ 함정

### Q06-41 [오류] ★★

원본: [보강] textbook 6.4 ⚠️ 함정 "원소별 연산 점 누락"

1. 출력

```
ans =

     9

Error using  ^ 
Incorrect dimensions for raising a matrix to a power. Check that the matrix is square and the power is a scalar. To operate on each element of the matrix individually, use POWER (.^) for elementwise power.
```

2. `x^2`는 행렬 거듭제곱이라 1×3 벡터에는 정의되지 않는다. `f = @(x) x.^2;`로 고친다.

- 근거: [6.4](../../textbook/ch06/6.4-anonymous-functions.md) ⚠️ 함정

### Q06-42 [코드] ★★

원본: p.62–63 `ln = @(x) log(x)` → 변형: `@(x) x.^2`를 출력에서 역추적

```matlab
sq = @(x) x.^2
sq(1:3)
```

- 두 줄 모두 결과가 보이므로 세미콜론이 없다. 두 번째 줄은 변수에 담지 않아 `ans`로 나온다.
- `.^`를 써야 벡터 입력이 된다. `sq([1 2 3])`도 정답.
- 근거: [6.4](../../textbook/ch06/6.4-anonymous-functions.md)

---

## 6.5 Function function

### Q06-43 [빈칸] ★

원본: p.68–69 `fplot(ln, [0.1, 10])` → 변형: 함수 이름 빈칸

```matlab
fplot(ln, [0.1, 10])
title("A function plot")
xlabel("Independent Variable, x")
ylabel("f(x)=ln(x)")
```

1. 위와 같다. `fplot`은 ① 함수(handle)와 ② 그릴 구간 두 입력을 받는다.
2. function function.

- 근거: [6.5](../../textbook/ch06/6.5-function-functions.md)

### Q06-44 [오류] ★★

원본: p.69 `fplot(ln, [0.1, 10])` → 변형: handle 대신 함수 호출을 넘김

1. 출력

```
Error using log
Not enough input arguments.
```

```
Unrecognized function or variable 'x'.
```

> **[확인 필요]** `clear`로 `ln`과 `x`가 둘 다 지워졌다. MATLAB이 `ln(x)`의 인수 `x`를 먼저 평가해 `'x'`를 보고하는지, `'ln'`을 보고하는지 확인할 것.

2. `log`를 `@` 없이 쓰면 handle이 아니라 **인수 없이 호출**한 것이 되어 `log` 자신이 오류를 낸다. `ln(x)`도 handle이 아니라 호출 결과를 넘기는 것이고, `clear`로 `ln`과 `x`가 모두 지워져 그 계산에서 먼저 오류가 난다. 올바른 예: `fplot(@log, [0.1 10])` (또는 `ln`을 다시 정의한 뒤 `fplot(ln, [0.1 10])`).

- 근거: [6.5](../../textbook/ch06/6.5-function-functions.md) ⚠️ 함정

### Q06-45 [출력] ★★

원본: [보강] textbook 6.5 `arrayfun`, 직접 만드는 function function

```
ans =

    15

ans =

     1     4     9    16

```

- `apply_twice`는 함수를 입력으로 받는 function function이다. `f(3) = 7`, `f(7) = 15`.
- `arrayfun`은 각 원소에 따로 함수를 적용하므로 `k^2`(점 없음)도 스칼라마다 계산되어 오류가 없다.
- 근거: [6.5](../../textbook/ch06/6.5-function-functions.md)
