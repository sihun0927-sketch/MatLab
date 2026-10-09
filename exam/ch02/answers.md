# Chapter 2 — MATLAB Environment 해답

- 출력은 R2026a 기본 상태(`format short`, `format loose`)를 기준으로 [`exam/README.md`](../README.md)의 "Command Window 출력 규칙"대로 썼다.
- 슬라이드 스크린샷은 `format compact`처럼 빈 줄이 없지만, 시험 답안은 기본값(`format loose`)대로 빈 줄을 넣는다.
- 출력 블록에는 결과만 적고 입력 줄(`>> …`)은 생략한다. `clc`처럼 화면 자체가 문제인 경우만 입력 줄을 함께 적는다.
- `> **[확인 필요]**`는 MATLAB에서 실제 화면을 확인해야 하는 항목이다.

## 2.1 Getting Started

### Q02-01 [출력] ★

원본: p.5 `5^2`, `cos(pi)` → 변형: 값 바꾸기, `ans` 재사용, `sin(pi)` 추가

```
ans =

    16

ans =

    -1

ans =

     0

ans =

   1.2246e-16

```

- 변수 이름 없이 계산하면 결과는 `ans`에 들어가고, 다음 계산이 `ans`를 덮어쓴다. `ans + 1`은 직전 `ans`(-1)를 써서 0이다.
- `cos(pi)`는 정확히 -1이지만 `sin(pi)`는 0이 아니다. `pi`가 π의 근삿값이라서 `1.2246e-16`이 나온다. 아주 작은 수는 과학적 표기법으로 표시된다.
- 근거: [2.1](../../textbook/ch02/2.1-getting-started.md), [2.4](../../textbook/ch02/2.4-array-calculations.md) ⚠️ 함정(`sin(pi)`)

### Q02-02 [코드] ★

원본: p.5 `5^2`, `cos(pi)` → 변형: 결과를 이름 있는 변수에 저장

```matlab
x = 3^2
cos(pi)
```

- 두 줄 모두 결과가 보이므로 세미콜론이 없어야 한다. 두 번째 출력이 `ans =`이므로 대입 없이 식만 쓴다.
- 근거: [2.1](../../textbook/ch02/2.1-getting-started.md)

### Q02-03 [단답] ★

원본: p.5 MATLAB Desktop 기본 화면

1. Command Window, Workspace Window, Current Folder Window.
2. 이름 `ans`, Size `1x1`, Value `-1`. `5^2`의 결과 25는 `cos(pi)`가 `ans`를 덮어써서 사라진다(p.5 스크린샷의 Workspace도 `ans 1x1 -1`).
3. Graphics Window(Figure 창).

- 근거: [2.1](../../textbook/ch02/2.1-getting-started.md), [2.2](../../textbook/ch02/2.2-matlab-windows.md)

## 2.2 MATLAB Windows

### Q02-04 [출력] ★

원본: p.13 `A = 5`, `B = [1, 2, 3, 4]`, `C = [1 2 3 4; 10 20 30 40; 5 10 15 20]` → 변형: `A`에 세미콜론, `C`를 2행으로

```
B =

     1     2     3     4

C =

     1     2     3     4
    10    20    30    40

```

- `A = 5;`는 세미콜론 때문에 출력되지 않는다. 쉼표와 공백은 같은 행의 구분자, 세미콜론은 새 행이다.
- 정수 배열은 원소마다 폭 6으로 오른쪽 정렬된다.
- 근거: [2.2](../../textbook/ch02/2.2-matlab-windows.md) 2.2.3 Workspace Window

### Q02-05 [단답] ★★

원본: p.14 Workspace의 Size·Value, p.17 `whos` → 변형: 전치한 `D` 추가

1. `A` 1x1, `B` 1x4, `C` 3x4, `D` 4x3.
2. `A` 8, `B` 32, `C` 96, `D` 96. `double` 원소 하나가 8바이트이므로 원소 개수 × 8이다(p.17 `whos` 화면: A 8, B 32, C 96, ans 8).
3. `3x4 double`. 원소가 많은 배열은 값 대신 크기와 타입으로 표시된다.

- 근거: [2.2](../../textbook/ch02/2.2-matlab-windows.md) 2.2.3 Workspace Window

### Q02-06 [오류] ★

원본: p.15 `clc`, p.16 `clear` → 변형: 두 명령을 한 흐름으로 연결

```
>> A
A =

     5

>> clear
>> A
Unrecognized function or variable 'A'.
```

- `clc`는 Command Window 화면만 지우므로 `clc` 이전 줄은 남지 않는다. Workspace의 `A`는 그대로라서 `A`를 입력하면 5가 나온다.
- `clear`는 Workspace의 변수를 메모리에서 지운다. 그 뒤 `A`를 부르면 변수가 없어서 오류다.
- 근거: [2.2](../../textbook/ch02/2.2-matlab-windows.md) clc vs clear, ⚠️ 함정

### Q02-07 [코드] ★★

원본: p.20, p.24 `x=[1,2,3,4,5]`, `y=[10,20,30,40,50]`, `plot(x,y)` → 변형: `x`만 출력

```matlab
x = [1 2 3 4 5]
y = [10, 20, 30, 40, 50];
plot(x, y)
```

- `x` 줄에만 세미콜론이 없다. `y`는 출력이 없으므로 세미콜론이 있어야 한다. `plot`은 Command Window에 아무것도 찍지 않는다.
- 근거: [2.2](../../textbook/ch02/2.2-matlab-windows.md) 2.2.6 Graphics Window

### Q02-08 [빈칸] ★

원본: p.22 Example Graph with Annotations

① `title` ② `xlabel` ③ `ylabel`

- 엔지니어는 제목과 단위가 있는 축 라벨 없이 그래프를 내지 않는다(p.21).
- 근거: [2.2](../../textbook/ch02/2.2-matlab-windows.md) 예제 그래프

### Q02-09 [단답] ★

원본: p.9–p.10 Command History, p.11 Workspace, p.18 Document Window, p.19 Variable Editor

1. 열리지 않는다. 툴스트립의 **Layout**에서 추가한다.
2. Command Window로 복사되어 바로 실행된다. 드래그해서 Command Window로 옮길 수도 있다.
3. `ans`, `double`(배정밀도 부동소수점). 값이 하나여도 1x1 배열이다.
4. Document Window(Variable Editor, Array Editor).
5. `unnamed`. 우클릭 → Rename으로 이름을 바꾼다.

- 근거: [2.2](../../textbook/ch02/2.2-matlab-windows.md) 2.2.2, 2.2.3, 2.2.5

## 2.3 변수 이름 규칙과 데이터 타입

### Q02-10 [출력] ★

원본: p.27–p.28 `isvarname cool_beans`, `isvarname cool-beans` → 변형: 대문자·숫자 포함, 숫자로 시작하는 이름 추가

```
ans =

  logical

   1

ans =

  logical

   1

ans =

  logical

   0

ans =

  logical

   0

```

- `Cool_Beans2`는 문자로 시작하고 문자·숫자·밑줄만 써서 유효하다. `2cool_beans`는 숫자로 시작해서, `cool-beans`는 하이픈 때문에 무효다.
- 결과는 숫자 1/0이 아니라 `logical`이다. 그래서 `  logical` 줄이 먼저 나온다.
- 근거: [2.3](../../textbook/ch02/2.3-variables-and-types.md) isvarname으로 이름 검증하기

### Q02-11 [출력] ★★

원본: p.29 예약어 `for`, `while`, `if`와 `iskeyword` → 변형: `isvarname`과 `iskeyword` 비교, 함수 이름 `max`

```
ans =

  logical

   0

ans =

  logical

   1

ans =

  logical

   0

```

- `isvarname`은 예약어도 거짓으로 판정한다. `for`는 형식은 맞지만 예약어라서 변수 이름이 될 수 없다.
- `max`는 예약어가 아니라 함수 이름이다. 그래서 `max = 5`처럼 변수로 덮어쓸 수 있다(Q02-12).
- textbook 2.3 ⚠️ 함정의 "`isvarname`은 예약어인지까지는 확인해 주지 않는다"는 설명은 틀렸다. textbook 해답(solutions.md 2.3-2)의 설명이 맞다.
- 근거: [2.3](../../textbook/ch02/2.3-variables-and-types.md) 대소문자 구분, [solutions.md](../../textbook/ch02/solutions.md)

### Q02-12 [오류] ★★

원본: p.30 `max = 5` → 변형: 덮어쓴 뒤 함수로 호출

```
max =

     5

Index exceeds the number of array elements. Index must not exceed 1.
```

- `max = 5` 이후 `max`는 1x1 변수다. `max([3 7 2])`는 함수 호출이 아니라 변수 `max`의 3번째, 7번째, 2번째 원소를 꺼내는 인덱싱으로 해석되어 범위를 벗어난다.
- 고치는 명령: `clear max`(p.31).
- 근거: [2.3](../../textbook/ch02/2.3-variables-and-types.md) 함수 이름을 변수로 덮어쓰기, ⚠️ 함정

### Q02-13 [출력] ★★

원본: p.31 `clear max` → 변형: 지운 뒤 함수로 다시 호출, `ans` 재사용

```
ans =

     7

ans =

    14

```

- `clear max`로 변수를 지우면 `max`는 다시 내장 함수다. 첫 두 줄은 세미콜론과 `clear` 때문에 출력이 없다.
- 근거: [2.3](../../textbook/ch02/2.3-variables-and-types.md) 함수 이름을 변수로 덮어쓰기

### Q02-14 [출력] ★★

원본: p.33 Introduction to Data Types(numeric, text, logical) → 변형: `class`로 타입 확인

```
ans =

    'double'

ans =

    'char'

ans =

    'string'

ans =

    'logical'

```

- 작은따옴표는 문자 배열(`char`), 큰따옴표는 문자열(`string`)이다. 비교 결과는 `logical`이다.
- `class`는 타입 이름을 `char`로 돌려주므로 결과가 작은따옴표로 표시된다.
- 근거: [2.3](../../textbook/ch02/2.3-variables-and-types.md) 2.3.2 데이터 타입

### Q02-15 [단답] ★

원본: p.26 명명 규칙, p.29 대소문자 구분과 `iskeyword`

1. `Velocity`, `velocity_2`. `2velocity`는 숫자로 시작, `velocity-2`는 하이픈, `while`은 예약어, `velocity 2`는 공백, `_velocity`는 밑줄로 시작해서 무효다.
2. 길이 제한은 없지만 처음 63자만 쓰인다.
3. 2개. 대소문자를 구분하므로 `X`와 `x`는 다른 변수다.
4. `iskeyword`

- 근거: [2.3](../../textbook/ch02/2.3-variables-and-types.md) 2.3.1 변수 사용하기

## 2.4 스칼라·배열 연산

### Q02-16 [코드] ★

원본: p.34 수학 표기의 배열 A, B, C → 변형: MATLAB 코드로 옮기기

```matlab
A = 5;
B = [2 5]
C = [1 2; 5 5]
```

- `A` 줄에만 세미콜론이 있다. `A = [5];`도 같다.
- 근거: [2.2](../../textbook/ch02/2.2-matlab-windows.md) 2.2.3, [2.4](../../textbook/ch02/2.4-array-calculations.md) 명시적 목록

### Q02-17 [출력] ★

원본: p.36 `a=1+2`, `b=5`, `x=a+b`, `y=b-a`, `z=b^a`, `w=3^2` → 변형: 값 바꾸기, 세미콜론 섞기

```
b =

     4

y =

     1

z =

    64

```

- `a`는 3, `z = 4^3 = 64`.
- Workspace: `x = 7`, `w = 9`. 세미콜론은 출력만 막을 뿐 계산과 저장은 한다.
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) 스칼라 연산

### Q02-18 [출력] ★★

원본: p.37 `x = 8`, `x = x + 1` → 변형: 대입을 이어 붙이고 `==` 비교 추가

```
x =

    18

ans =

  logical

   1

ans =

  logical

   0

```

- `=`는 대입이다. `x`는 8 → 9 → 18로 바뀐다. `==`는 같은지 비교해 `logical`을 돌려준다.
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) 대입 연산자

### Q02-19 [출력] ★★

원본: p.40–p.42 `r=5; h=10; SA=2*pi*r^2 + 2*pi*r*h`, `SA = 2*pi*r*(r+h)`, `SA = 2*pi*r*r + h` → 변형: `r = 3`, `h = 5`, 가운데 줄에 세미콜론

```
SA =

  150.7964

SA =

   61.5487

```

- 첫 식은 $2\pi \cdot 9 + 2\pi \cdot 15 = 48\pi$. 가운데 식은 같은 값이지만 세미콜론 때문에 보이지 않는다.
- 마지막 식은 괄호가 빠져 $2\pi r^2 + h = 18\pi + 5$를 계산한다. 슬라이드 원본(r=5, h=10)에서도 471.2389 대신 167.0796이 나왔다.
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) 예제: 원기둥의 겉넓이, ⚠️ 함정

### Q02-20 [코드] ★★

원본: p.40–p.41 원기둥 겉넓이 → 변형: 공통 인수로 묶은 식만 출력

```matlab
r = 5;
h = 10;
SA = 2*pi*r*(r+h)
```

- `r`, `h` 줄에는 세미콜론이 있고, `SA` 줄에는 없다.
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) 예제: 원기둥의 겉넓이

### Q02-21 [오류] ★★

원본: p.43 `r(r+h)`는 오류, `r*(r+h)`로 써야 함

```
Index exceeds the number of array elements. Index must not exceed 1.
```

- MATLAB은 괄호 앞의 곱셈을 생략해 주지 않는다. `r(r+h)`는 `r(15)`, 즉 1x1 변수 `r`의 15번째 원소를 꺼내는 인덱싱이라 범위를 벗어난다.
- 고친 코드: `SA = 2*pi*r*(r+h)`
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) ⚠️ 함정: 괄호를 잘못 놓으면

### Q02-22 [출력] ★★★

원본: p.38 연산자 우선순위 규칙 → 변형: 규칙 네 단계를 한 식에 섞기

```
ans =

     7

ans =

   11.4286

ans =

    64

ans =

    -4

```

- `4^2 = 16` → `3*16/8 = 6`(곱셈·나눗셈은 왼쪽부터) → `2 + 6 - 1 = 7`.
- `5*16/7 = 80/7`.
- `2^3^2`는 왼쪽부터 `(2^3)^2 = 64`. 수학 관습($2^{9} = 512$)과 다르다.
- `-2^2`는 거듭제곱이 부호보다 먼저라서 `-(2^2) = -4`.
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) 연산자 우선순위

> **[보강]** `2^3^2`와 `-2^2`는 슬라이드에 없는 경우다. "코드는 왼쪽에서 오른쪽으로 계산된다"(p.43)와 "거듭제곱이 먼저"(p.38)를 적용한 결과다.

### Q02-23 [출력] ★

원본: p.44 쉼표·세미콜론으로 한 줄에 여러 명령 → 변형: 같은 줄에서 보이는 것과 숨기는 것 섞기

```
a =

     1

c =

     3

e =

     5

```

- 쉼표 뒤 명령은 결과가 보이고, 세미콜론으로 끝난 명령은 숨겨진다. `b`, `d`는 계산만 된다(`d = 6`).
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) 힌트

### Q02-24 [출력] ★★

원본: p.45 `x = [1 2 3 4]`, `y = [1; 2; 3; 4]`, 여러 줄로 쓴 `a` → 변형: `a`를 2행으로

```
y =

     1
     2
     3
     4

a =

     1     2     3
     2     3     4

```

- 세미콜론 구분자는 열벡터를 만든다. 대괄호 안에서 줄을 바꾸면 세미콜론처럼 새 행이 된다.
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) 명시적 목록

### Q02-25 [출력] ★★

원본: p.46–p.47 `b = 1:5`, `b = [1:5]`, `c = 1:2:5` → 변형: 범위·간격 바꾸기, 음수 증분, 빈 배열

```
b =

     2     3     4     5     6

c =

     1     4     7    10

e =

     5     3     1

f =

  1×0 empty double row vector

```

- `시작:증분:끝`에서 끝 값을 넘지 않는 데까지만 만든다. `1:3:10`은 10에 정확히 도달한다.
- 증분 없이 시작이 끝보다 크면(`5:1`) 빈 배열이다. 내려가려면 `5:-2:1`처럼 음수 증분을 쓴다.
- 대괄호는 있어도 없어도 같다.
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) 콜론 연산자

### Q02-26 [코드] ★

원본: p.46–p.47 `c = 1:2:5` → 변형: 시작·증분·끝 바꾸기

```matlab
c = 0:5:20
```

- 결과가 보이므로 세미콜론이 없다. 콜론 조건이 없다면 `linspace(0, 20, 5)`도 같은 결과다.
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) 콜론 연산자

### Q02-27 [출력] ★★

원본: p.48–p.49 `d = linspace(1, 10, 3)` → `1.0000 5.5000 10.0000` → 변형: 개수 바꾸기

```
d =

     1     4     7    10

g =

         0    2.5000    5.0000    7.5000   10.0000

```

- `linspace(시작, 끝, 개수)`. 간격은 (끝-시작)/(개수-1)이다. `d`는 간격 3으로 모두 정수라 정수 형식으로 표시된다.
- `g`는 2.5처럼 소수가 섞여서 전부 소수 형식이 된다. 0은 소수 형식 배열 안에서 `0`으로만 표시된다.
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) linspace

### Q02-28 [출력] ★★

원본: p.50–p.51 `e = logspace(1, 3, 3)` → `10 100 1000` → 변형: 지수 범위 바꾸기

```
e =

     1    10   100

k =

    1.0000    3.1623   10.0000

```

- 인자는 값이 아니라 10의 지수다. `logspace(0, 2, 3)`은 $10^0, 10^1, 10^2$.
- `logspace(0, 1, 3)`의 가운데 값은 $10^{0.5} \approx 3.1623$.
- 슬라이드 원본 화면(p.51)이 `Columns 1 through 2`로 나뉜 것은 창이 좁아서다. 시험에서는 그런 분할을 쓰지 않는다.
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) logspace, ⚠️ 함정

### Q02-29 [출력] ★★

원본: p.52–p.57 `a = [1 2 3]`, `b = a + 5`, `c = a + b`, `c = a.*b` → 변형: 값 바꾸기, 전치로 행렬곱 성립시키기

```
b =

     4     5     6

c =

     5     7     9

d =

     4    10    18

e =

    32

```

- 스칼라는 모든 원소에 더해지고, 같은 크기 배열끼리는 대응 원소끼리 더해진다. `.*`는 원소별 곱이다.
- `a*b'`는 1x3 × 3x1 행렬곱이라 스칼라 `1*4 + 2*5 + 3*6 = 32`가 된다.
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) 배열 연산

### Q02-30 [오류] ★★

원본: p.58 `c = a*b` → Error using `*` → 변형: `b` 값 바꾸기

```
Error using  * 
Incorrect dimensions for matrix multiplication. Check that the number of columns in the first matrix matches the number of rows in the second matrix. To operate on each element of the matrix individually, use TIMES (.*) for elementwise multiplication.
```

- `*`는 행렬곱이다. 1x3 × 1x3은 앞 행렬의 열 수(3)와 뒤 행렬의 행 수(1)가 달라서 곱할 수 없다.
- 고치는 법 1: `c = a.*b` → `4 10 18`(원소별 곱).
- 고치는 법 2: `c = a*b'` → `32`(내적). 크기는 맞지만 뜻이 다르다.
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) ⚠️ 함정: `*`를 잘못 쓰면

### Q02-31 [출력] ★★

원본: p.59 `c = a.^2`, `d = a./b` → 변형: 나누는 순서 뒤집기, 스칼라의 원소별 거듭제곱 추가

```
c =

     1     4     9

d =

    6.0000    3.5000    2.6667

f =

     2     4     8

```

- `d`는 6/1, 7/2, 8/3이다. 하나라도 소수면 배열 전체가 소수 형식이다.
- `2.^a`는 $2^1, 2^2, 2^3$.
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) 나눗셈과 거듭제곱도 마찬가지

### Q02-32 [오류] ★★

원본: p.60 `c = 5./a`, p.61 `c = 5/a` → Error → 변형: 5를 6으로

```
c =

     6     3     2

Error using  / 
Matrix dimensions must agree.
```

- 스칼라를 배열로 나눌 때는 `./`를 써야 한다. `/`는 행렬 나눗셈(역행렬 계산)으로 해석되어 크기가 맞지 않는다.
- 오류가 난 대입은 실행되지 않으므로 `c`는 `[6 3 2]` 그대로다.
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) ⚠️ 함정: 스칼라를 배열로 나눌 때

> **[확인 필요]** 오류 둘째 줄. 슬라이드(R2022a)는 `Matrix dimensions must agree.`다. R2026a에서 문구가 바뀌었는지 확인한다.

### Q02-33 [코드] ★★

원본: p.62 `degrees = [10 15 70 90]; radians = degrees*pi/180` → 변형: 각도 값 바꾸기

```matlab
degrees = [30 45 90];
radians = degrees*pi/180
```

- `degrees` 줄에는 세미콜론, `radians` 줄에는 없다. `pi`와 `180`이 스칼라라서 `degrees.*pi/180`도 같다.
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) 각도를 라디안으로 변환

### Q02-34 [출력] ★★★

원본: p.64 `degrees'`, `Deg_to_R = [degrees',radians']` → 변형: 각도 값 바꾸기

```
ans =

     0
    30
    60

T =

         0         0
   30.0000    0.5236
   60.0000    1.0472

```

- `'`는 행을 열로 바꾼다. 열벡터 두 개를 쉼표로 이어 붙이면 3x2 배열이 된다.
- `radians`에 소수가 있어서 `T` 전체가 소수 형식이다. 슬라이드 원본도 `10.0000 0.1745`처럼 표시된다.
- `T`의 Size: 3x2.
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) 전치 연산자

### Q02-35 [출력] ★★★

원본: p.65–p.66 Table 2.2 Numeric Display Formats → 변형: 같은 값을 형식만 바꿔 다시 표시

```
x =

   0.333333333333333

x =

   3.3333e-01

y =

     1

```

- `format`은 표시만 바꾼다. `x`의 값은 그대로다.
- `format short`로 돌아온 뒤 `x*3`은 정확히 1이 되어 정수 형식으로 찍힌다.
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) 숫자 표시 형식

### Q02-36 [단답] ★

원본: p.48 linspace 기본 개수, p.65–p.66 숫자 표시 형식

1. `format rat`
2. 소수점 아래 둘째 자리(`3.14`).
3. 아니다. 계산은 항상 약 16자리 정밀도로 하고, 표시만 바뀐다.
4. `1.2346e+02`
5. 100개.

- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) 숫자 표시 형식, linspace

## 2.5 파일 저장·불러오기, 스크립트, Section 모드

### Q02-37 [출력] ★★

원본: p.68 `a = 5; b = [1, 2, 3]; c = [1, 2; 3, 4]; save my_example_file`, p.71 `clear,clc` `load my_example_file` → 변형: 불러온 변수로 계산

```
c =

     1     2
     3     4

ans =

     6     7
     8     9

```

- `load`는 아무것도 출력하지 않는다. `.mat` 파일은 세 변수를 원래 이름 그대로 복원한다.
- `a + c`는 스칼라 5를 모든 원소에 더한다.
- 파일: `my_example_file.mat`. 기본 형식이 `.mat`이고 현재 폴더(Current Folder)에 저장된다.
- 근거: [2.5](../../textbook/ch02/2.5-saving-and-scripts.md) 2.5.1 변수 저장하기

### Q02-38 [출력] ★★★

원본: p.69–p.70 `save my_new_file2.dat a b -ascii`, p.73 ASCII 파일은 파일 이름의 변수 하나로 들어옴 → 변형: 변수 하나만 저장하고 다시 불러오기

```
my_data =

     1     2
     3     4

Unrecognized function or variable 'c'.
```

- ASCII 파일을 `load`하면 원래 변수 이름 `c`가 아니라 파일 이름 `my_data` 하나로 들어온다. `c`는 `clear`로 지워졌다.
- 근거: [2.5](../../textbook/ch02/2.5-saving-and-scripts.md) ASCII 파일, ⚠️ 함정

### Q02-39 [오류] ★★★

원본: p.70 `save my_new_file2.dat a b -ascii`, p.74 Command History의 `load my_new_file2.dat`(실패 표시) → 변형 없음, 실패 이유를 묻기

```
Error using load
Number of columns on line 2 of ASCII file my_new_file2.dat must be the same as previous lines.
```

- `-ascii`는 변수들을 줄 단위로 이어 쓴다. 1행에 `a`(값 1개), 2행에 `b`(값 3개)가 들어가 행마다 열 수가 다르므로 표 하나로 읽을 수 없다.
- 불러오는 방법: Current Folder에서 파일을 더블클릭해 Import Wizard로 연다(p.73–p.75). 또는 처음부터 `.mat`으로 저장한다.
- 근거: [2.5](../../textbook/ch02/2.5-saving-and-scripts.md) ASCII 파일, Import Wizard

> **[확인 필요]** 오류 메시지 둘째 줄 문구. 실제로는 파일 이름 자리에 전체 경로가 찍힐 수 있다.

### Q02-40 [출력] ★★★

원본: p.78 Scripts – An Example Program(drag), p.82 같은 코드의 Live Script → 변형: `velocity = 0:20:60`으로 줄이고 세미콜론 위치 바꾸기

```
density =

    1.2250

cd =

    0.1634

results =

         0         0
    8.9400    8.0000
   17.8800   32.0000
   26.8200   72.0000

```

- `cd = 400/(1.225*44.7^2) ≈ 0.16342`(p.82의 Live Script 출력 `0.16342`와 같다).
- `drag`는 $200(v/44.7)^2$와 같으므로 v = 0, 8.94, 17.88, 26.82에서 0, 8, 32, 72다. 열벡터 두 개를 붙인 4x2 배열이고 소수가 섞여 전부 소수 형식이다.
- 스크립트를 실행하면 `>>` 입력 줄 없이 결과만 찍힌다.
- 근거: [2.5](../../textbook/ch02/2.5-saving-and-scripts.md) 스크립트, [2.4](../../textbook/ch02/2.4-array-calculations.md) 전치 연산자

> **[보강]** 슬라이드 코드는 변수 이름으로 `cd`를 쓰는데, `cd`는 현재 폴더를 바꾸는 내장 함수다. Q02-12의 `max`처럼 함수를 변수로 덮어쓴 경우다.

### Q02-41 [출력] ★★

원본: p.79 `% This is a comment.`, `a = 5 % The variable a is defined as 5` → 변형: 주석 줄과 세미콜론 섞기

```
a =

     5

ans =

    11

```

- `%` 뒤는 실행되지 않는다. `% a = 3`, `% b = 0`은 아무 일도 하지 않는다.
- 명령 뒤 주석은 출력에 영향이 없다. `a = 5 % …`는 세미콜론이 없어 출력되고, `b = a*2; % …`는 출력되지 않는다.
- 근거: [2.5](../../textbook/ch02/2.5-saving-and-scripts.md) 주석

### Q02-42 [출력] ★★★

원본: p.85–p.86 Section Mode, `clear,clc, format shortg` / `%% Problem 2.1` → 변형: `format short`로, 한 줄에 세미콜론, `5^(2*3)`을 `2^(2*3)`으로

```
ans =

    1.7500

ans =

    60

ans =

    75

ans =

    64

ans =

     9

ans =

     1

```

- `5/2*6*4`는 세미콜론 때문에 보이지 않는다(값은 60).
- 곱셈·나눗셈은 왼쪽부터: `5*6*4/2 = 60`, `5/2*6*4 = 2.5*24 = 60`. 덧셈 사이의 `5/5`만 먼저 계산되어 `1 + 3 + 1 + 3 + 1 = 9`. 괄호로 묶은 마지막 줄은 `9/9 = 1`.
- 슬라이드 원본은 `format shortg`라서 `1.75`로 보였다. `format short`에서는 `1.7500`이다.
- 근거: [2.5](../../textbook/ch02/2.5-saving-and-scripts.md) 2.5.3 Section 모드, [2.4](../../textbook/ch02/2.4-array-calculations.md) 연산자 우선순위

### Q02-43 [변형] ★★

원본: p.85 `5/2*6*4`, `1 + 3 + 5/5 + 3 + 1` → 변형: 괄호 위치

원본:

```
ans =

    60

ans =

     9

```

변형:

```
ans =

    0.1042

ans =

    5.8000

```

- `5/2*6*4`는 왼쪽부터 `((5/2)*6)*4 = 60`이고, `5/(2*6*4)`는 `5/48`이다.
- `(1 + 3 + 5)/5 + 3 + 1`은 `9/5 + 4 = 5.8`이다. 원본은 `5/5`만 먼저 계산한다.
- 근거: [2.4](../../textbook/ch02/2.4-array-calculations.md) 연산자 우선순위

### Q02-44 [단답] ★★

원본: p.70 `-ascii`, p.80 Evaluate Section, p.84 Section Mode, p.85 활성 섹션

1. `%%` 뒤에 공백이 없어서 섹션 구분자가 아니라 주석으로 인식된다. `%% Problem 2.1`로 쓴다.
2. 노란색으로 강조되어 활성 섹션임을 보여준다.
3. Evaluate Section.
4. `-`와 `ascii` 사이에 공백을 넣으면 오류가 난다. `-ascii`로 붙여 쓴다(p.70).
5. `.dat`, `.txt`.

- textbook 2.5 ⚠️ 함정은 "`-ascii` 앞의 하이픈과 뒤 사이에는 공백이 있어야 한다"고 썼지만 슬라이드 p.70과 반대다. 슬라이드가 맞다.
- 근거: [2.5](../../textbook/ch02/2.5-saving-and-scripts.md) Evaluate Section, 2.5.3 Section 모드

### Q02-45 [단답] ★

원본: p.76 프로그램 이름 규칙, p.77 Table 2.3, p.81 Live Scripts, p.83 Saving Live Scripts

1. `myscript`, `run myscript`, `run('myscript')`. 또는 에디터의 Run 버튼.
2. `hw2_drag.m`, `HW2.m`. `hw 2.m`은 공백, `2hw.m`은 숫자로 시작, `hw-2.m`은 하이픈이라 안 된다.
3. `.mlx`
4. PDF, Word 문서, HTML. Save As에서 MATLAB Code file을 고르면 다시 `.m`이 된다.
5. 달라지지 않는다. 코드는 같고 편집기만 다르다.

- 근거: [2.5](../../textbook/ch02/2.5-saving-and-scripts.md) 2.5.2 프로그램
