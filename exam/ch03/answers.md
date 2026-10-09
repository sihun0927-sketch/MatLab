# Chapter 3 — Built-In MATLAB Functions 해답

출력은 R2026a 기본 상태(`format short`, `format loose`)를 [`exam/README.md`](../README.md)의 출력 규칙으로 재현한 것이다.
MATLAB으로 실행하지 않았으므로, 표시 형식이 확실하지 않은 곳에는 `[확인 필요]`를 달았다.

---

## 3.1 내장 함수 사용과 도움말

### Q03-01 [출력] ★

원본: p.5 `a = 5`, `b = [1 2 3]`, `sin(a)`, `sin(b)` → 변형: 함수를 `sqrt`로, 값을 완전제곱수로, 세미콜론 섞기, `ans` 재사용

```
>> a = 9;
>> b = [1 4 9]
b =

     1     4     9

>> sqrt(a)
ans =

     3

>> ans * 2
ans =

     6

>> c = sqrt(b);
>> c
c =

     1     2     3

```

- 스칼라를 넣으면 스칼라가, 배열을 넣으면 같은 크기의 배열이 나온다.
- `ans * 2`는 직전 `ans`(3)를 쓰고, 그 결과(6)가 다시 `ans`에 들어간다.
- 근거: [3.1](../../textbook/ch03/3.1-builtin-functions-help.md) 스칼라와 배열

### Q03-02 [출력] ★★

원본: p.7 `rem(10,3)` → 변형: 값 바꾸기, 배열 입력, 음수 피제수

```
>> r1 = rem(17, 5)
r1 =

     2

>> r2 = rem([10 11 12], 4);
>> r3 = rem(-10, 3)
r3 =

    -1

>> r2
r2 =

     2     3     0

```

- `rem`의 결과 부호는 **피제수**를 따른다. -10 = 3×(-3) + (-1)이므로 -1이다. (`mod(-10,3)`이면 2)
- 근거: [3.3](../../textbook/ch03/3.3-elementary-math.md) `[보강]` rem과 mod의 차이

### Q03-03 [출력] ★★

원본: p.8 `d=[1,2,3;4,5,6]; f=size(d)`, p.9 `[rows,cols]=size(d)` → 변형: 3×2 배열, 전치한 뒤 `size`

```
>> d = [1 2; 3 4; 5 6];
>> f = size(d')
f =

     2     3

>> [rows, cols] = size(d)
rows =

     3

cols =

     2

```

- `d`는 3×2, `d'`는 2×3이다. 출력을 하나로 받으면 `[행 열]` 벡터 하나가, 둘로 받으면 각각 따로 나온다.
- 근거: [3.1](../../textbook/ch03/3.1-builtin-functions-help.md) ⚠️ 함정 — 출력이 여러 개인 함수

### Q03-04 [코드] ★★

원본: p.9 `[rows,cols]=size(d)` → 변형: 2×4 배열, 변수 이름 바꾸기

```matlab
>> m = [1 2 3 4; 5 6 7 8];
>> [nr, nc] = size(m)
```

- 세미콜론: `m`을 만드는 줄에는 있어야 하고(화면에 `m =`이 없으므로), `size` 줄에는 없어야 한다.
- 근거: [3.1](../../textbook/ch03/3.1-builtin-functions-help.md) 출력이 여러 개인 함수

### Q03-05 [오류] ★★

원본: p.7 `rem(10,3)` → 변형: 출력 두 개로 받기

```
>> [q, r] = rem(17, 5)
Error using rem
Too many output arguments.
```

- (2) `rem`은 출력이 하나(나머지)뿐인 함수다. 좌변에 출력을 두 개 요구하면 오류가 난다.
- (3) 몫은 `fix`로 따로 구한다.

```matlab
>> q = fix(17/5)
>> r = rem(17, 5)
```

- 근거: [3.1](../../textbook/ch03/3.1-builtin-functions-help.md) 입력이 여러 개인 함수, 출력이 여러 개인 함수

### Q03-06 [단답] ★

원본: p.6 함수의 3요소, p.10 Screen Tips, p.11 `help tan`, `doc tan`

1. 이름(name), 입력(input, 인수 argument), 출력(output)
2. `help tan`
3. `doc tan`
4. `F1`
5. 스크린 팁(screen tip, 함수 힌트). 슬라이드 제목은 "Screen Tips – Adaptive Help"다.

- 근거: [3.1](../../textbook/ch03/3.1-builtin-functions-help.md) 함수의 세 가지 구성요소, ⚠️ 함정 — `help`와 `doc`는 다르다

---

## 3.3 기초 수학 함수

### Q03-07 [출력] ★

원본: p.13 Table 3.1 `abs(-3)`, `sqrt(85)`, `sign(-8)` → 변형: 배열 입력, 함수 중첩, `sign(0)`

```
>> x = [-4 9 -16];
>> a = abs(x)
a =

     4     9    16

>> s = sign(x)
s =

    -1     1    -1

>> r = sqrt(abs(x));
>> r
r =

     2     3     4

>> sign(0)
ans =

     0

```

- `sign`은 음수 -1, 0이면 0, 양수 1이다. `sqrt(abs(x))`는 안쪽부터 계산한다.
- 근거: [3.3](../../textbook/ch03/3.3-elementary-math.md) 3.3.1 일반 계산

### Q03-08 [출력] ★★★

원본: p.13 `nthroot(-2,3)`, `(-2)^(1/3)` → 변형: -8로 바꾸고, 괄호 없는 `-8^(1/3)` 추가

```
>> a = nthroot(-8, 3)
a =

    -2

>> b = (-8)^(1/3)
b =

   1.0000 + 1.7321i

>> c = -8^(1/3)
c =

    -2

```

- `nthroot`는 실수 근을 돌려준다. `^`는 복소수 주근(principal root) 2(cos 60° + i sin 60°) = 1 + 1.7321i를 돌려준다.
- `-8^(1/3)`은 `^`가 단항 `-`보다 우선순위가 높아서 `-(8^(1/3)) = -2`다. 괄호 하나로 결과가 실수와 복소수로 갈린다.
- 근거: [3.3](../../textbook/ch03/3.3-elementary-math.md) ⚠️ 함정 — `nthroot(-2,3)`와 `(-2)^(1/3)`은 다른 답을 준다

### Q03-09 [출력] ★★

원본: p.13 `log(10)`, `log10(10)`, `exp(10)`, p.14·p.15 HINT → 변형: 값 100과 2, `5e2`, `log2`

```
>> a = log(100)
a =

    4.6052

>> b = log10(100);
>> c = exp(2)
c =

    7.3891

>> d = 5e2
d =

   500

>> b
b =

     2

>> log2(8)
ans =

     3

```

- `log`는 자연로그(ln 100 = 4.6052)다. 상용로그는 `log10`이다.
- `exp(2)`는 e²이고, `5e2`는 5×10² = 500이다. 둘의 `e`는 아무 관계가 없다.
- 근거: [3.3](../../textbook/ch03/3.3-elementary-math.md) ⚠️ 함정 — `log`는 상용로그가 아니다, `exp(3)`은 e³, `3e5`는 3×10⁵

### Q03-10 [출력] ★★

원본: p.17 Table 3.2 `round(8.6)`, `fix(-8.6)`, `floor(-8.6)`, `ceil(-8.6)`, `round(8.6436,3)` → 변형: 배열 입력, ±2.5 추가, `round(x,2)`

```
>> x = [-8.6 -2.5 2.5 8.6];
>> r = round(x)
r =

    -9    -3     3     9

>> f = fix(x);
>> fl = floor(x)
fl =

    -9    -3     2     8

>> c = ceil(x)
c =

    -8    -2     3     9

>> f
f =

    -8    -2     2     8

>> round(3.14159, 2)
ans =

    3.1400

```

- `round`는 .5를 0에서 먼 쪽으로 올린다(-2.5 → -3, 2.5 → 3).
- `fix`는 0 쪽, `floor`는 -∞ 쪽, `ceil`은 +∞ 쪽이다. 양수에서는 `fix`와 `floor`가 같고 음수에서 갈린다.
- `round(3.14159, 2)`의 값은 3.14지만 `format short`는 소수 넷째 자리까지 찍으므로 `3.1400`으로 보인다.
- 근거: [3.3](../../textbook/ch03/3.3-elementary-math.md) ⚠️ 함정 — 양수에서는 `fix`와 `floor`가 같아 보인다

### Q03-11 [코드] ★★

원본: p.16 사과 $0.52, 가진 돈 $5.00, `fix` → 변형: $0.75, $10

```matlab
>> price = 0.75;
>> money = 10;
>> apples = money/price
>> n = fix(apples)
```

- 세미콜론: `price`, `money` 줄에는 있어야 하고 `apples`, `n` 줄에는 없어야 한다.
- 10/0.75 = 13.3333이고, 사과는 쪼갤 수 없으므로 버림(`fix` 또는 `floor`)한다. `round`를 쓰면 13이지만 원리상 틀린 선택이다(예: 13.6이면 14가 되어 돈이 모자란다).
- 근거: [3.3](../../textbook/ch03/3.3-elementary-math.md) 3.3.2 반올림 함수

### Q03-12 [출력] ★★

원본: p.26 Table 3.3 `factor(12)`, `gcd(10,15)`, `lcm(2,5)`, `primes(10)`, `isprime(10)` → 변형: 값 바꾸기, 세미콜론 섞기

```
>> factor(60)
ans =

     2     2     3     5

>> g = gcd(12, 18)
g =

     6

>> l = lcm(4, 6);
>> primes(20)
ans =

     2     3     5     7    11    13    17    19

>> p = isprime(9)
p =

  logical

   0

>> l
l =

    12

```

- `primes(n)`은 n **이하**의 소수다. `isprime`은 `double`이 아니라 `logical`을 돌려주므로 `logical` 줄이 먼저 찍힌다.
- 근거: [3.3](../../textbook/ch03/3.3-elementary-math.md) 3.3.3 이산수학

### Q03-13 [출력] ★★

원본: p.20 `factorial(5)`, `5*4*3*2*1`, p.21 `factorial(170)`, p.22 `factorial(171)` → 변형: 4로 바꾸기, `factorial(0)` 추가

```
>> a = factorial(4)
a =

    24

>> b = 4*3*2*1;
>> c = factorial(0)
c =

     1

>> d = factorial(170)
d =

  7.2574e+306

>> e = factorial(171)
e =

   Inf

```

- 0! = 1이다. 170!은 double로 표현 가능한 마지막 팩토리얼이고, 171!은 `realmax`(1.7977e+308)를 넘어 `Inf`가 된다.
- 근거: [3.3](../../textbook/ch03/3.3-elementary-math.md) factorial의 한계 — 시험 포인트

### Q03-14 [변형] ★★★

원본: p.24 `nchoosek(200,2)`, `factorial(200)/(factorial(198)*factorial(2))` → 변형: 200을 172로

(1) 원본

```
>> nchoosek(200, 2)
ans =

       19900

>> factorial(200)/(factorial(198)*factorial(2))
ans =

   NaN

```

(2) 변형

```
>> nchoosek(172, 2)
ans =

       14706

>> factorial(172)/(factorial(170)*factorial(2))
ans =

   Inf

```

- (3) 원본은 분자 `factorial(200)`과 분모의 `factorial(198)`이 모두 `Inf`라 `Inf/Inf = NaN`이다.
  변형은 분자 `factorial(172)`만 `Inf`이고 분모 `factorial(170)*2` ≈ 1.45e+307은 `realmax`보다 작은 유한값이라 `Inf/유한값 = Inf`다.
  어느 쪽이든 정답(19900, 14706)이 아니며, `nchoosek`는 팩토리얼을 계산하지 않으므로 큰 n에서도 정답을 낸다.

> **[확인 필요]** 4자리 이상 정수의 표시 폭. 위에서는 폭 12(`       19900`)로 썼다.

- 근거: [3.3](../../textbook/ch03/3.3-elementary-math.md) factorial의 한계, [3.8](../../textbook/ch03/3.8-computational-limits.md) ⚠️ 함정 — 오버플로는 오류 메시지를 내지 않는다

### Q03-15 [코드] ★★

원본: p.24 200명 중 2명 → 변형: 12명 중 3명

```matlab
>> teams = nchoosek(12, 3)
```

- 세미콜론: 결과가 보이므로 없어야 한다.
- 정의대로 `teams = factorial(12)/(factorial(9)*factorial(3))`도 220이지만, 문제 조건(팩토리얼 직접 계산 금지)에 어긋난다.
- 근거: [3.3](../../textbook/ch03/3.3-elementary-math.md) 팩토리얼과 조합론

### Q03-16 [오류] ★

원본: p.25 HINT "The ! is not a MATLAB operator"

```
>> n = 5!
Error: Invalid use of operator.
```

> **[확인 필요]** 오류 메시지 첫 줄. 문법 오류(parse error)라 줄 전체가 실행되지 않는다는 점이 핵심이다.

- (1) `!`는 MATLAB의 팩토리얼 연산자가 아니다. MATLAB에서 `!`는 줄 맨 앞에서 운영체제 명령을 실행하는 기호다.
- (2) `n = factorial(5)`
- 근거: [3.3](../../textbook/ch03/3.3-elementary-math.md) ⚠️ 함정 — `!`는 MATLAB 연산자가 아니다

---

## 3.4 삼각함수

### Q03-17 [출력] ★★

원본: p.30 Table 3.4 `deg2rad(90)`, `rad2deg(pi)`, `cos(pi)`, `sind(90)`, `asind(1)` → 변형: 값 바꾸기, 세미콜론 섞기

```
>> a = deg2rad(180)
a =

    3.1416

>> b = rad2deg(pi/4);
>> c = cos(pi)
c =

    -1

>> d = asind(1)
d =

    90

>> b
b =

    45

>> s = sind(30)
s =

    0.5000

```

- `cos(pi)`는 부동소수점으로도 정확히 -1이라 정수 형식으로 찍힌다. `sind`, `asind`는 도 단위다.
- 근거: [3.4](../../textbook/ch03/3.4-trigonometry.md) 라디안이 기본이다

### Q03-18 [출력] ★★★

원본: p.28 `sin(pi)` → `1.2246e-016` → 변형: `==` 비교, `sind(180)`, `sin(90)`

```
>> a = sin(pi)
a =

   1.2246e-16

>> b = sin(pi) == 0
b =

  logical

   0

>> c = sind(180)
c =

     0

>> d = sin(90);
>> d
d =

    0.8940

```

- `pi`는 π의 근삿값이라 `sin(pi)`는 0이 아닌 아주 작은 수다. 그래서 `== 0`은 거짓이다.
- `sind(180)`은 도 단위 전용 함수라 정확히 0을 돌려준다.
- `sin(90)`은 90 **라디안**의 사인이다. 90도의 사인(1)이 아니다.
- 슬라이드(구버전)는 지수를 `e-016`처럼 세 자리로 찍었지만 R2026a는 `e-16`으로 찍는다.

> **[확인 필요]** `1.2246e-16` 앞의 공백 수. 위에서는 3칸으로 썼다.

- 근거: [3.4](../../textbook/ch03/3.4-trigonometry.md) ⚠️ 함정 — `sin(pi) == 0`은 거짓이다, `sin(90)`은 1이 아니다

### Q03-19 [오류] ★★

원본: p.29 HINT `a = sin^-1(x)` → 변형: x에 0.5

```
>> a = sin^-1(0.5)
Error using sin
Not enough input arguments.
```

> **[확인 필요]** 오류 메시지. `sin`이 인수 없이 먼저 호출되어 오류가 나는 것으로 보았다.

- (2) 올바른 명령

```
>> a = asin(0.5)
a =

    0.5236

```

- (3) `1/sin(0.5)`는 사인의 **역수**(cosecant, 2.0858)이지 역함수(arcsine)가 아니다.
- 근거: [3.4](../../textbook/ch03/3.4-trigonometry.md) ⚠️ 함정 — `sin^-1(x)`는 MATLAB 문법이 아니다

### Q03-20 [코드] ★★

원본: p.30 `deg2rad(90)`, `rad2deg(pi)` → 변형: 왕복 변환, 결과를 `sind`에 넘기기

```matlab
>> r = deg2rad(90)
>> d = rad2deg(r)
>> s = sind(d);
```

- 세미콜론: `r`, `d` 줄에는 없고 `s` 줄에는 있어야 한다.
- `d = 90`이 정수 형식으로 찍힌 것은 왕복 변환 결과가 정확히 90.0이기 때문이다. 각도에 따라서는 `59.99999999999999`처럼 오차가 남아 `60.0000`으로 찍히기도 한다.
- 근거: [3.4](../../textbook/ch03/3.4-trigonometry.md) 라디안이 기본이다

---

## 3.5 자료 분석 함수

### Q03-21 [출력] ★★

원본: p.32 `x = [1 5 3; 2 4 6]; max(x)`, p.33 `max(x')` → 변형: 값 바꾸기, `min` 추가

```
>> x = [4 1 7; 2 9 3];
>> max(x)
ans =

     4     9     7

>> max(x')
ans =

     7     9

>> m = min(x);
>> m
m =

     2     1     3

```

- 자료 분석 함수는 열 우선이다. `max(x)`는 열마다 최댓값, `max(x')`는 전치한 뒤의 열, 즉 원래 행의 최댓값이다(행벡터로 나온다).
- 근거: [3.5](../../textbook/ch03/3.5-data-analysis.md) 열 우선(column dominant)이라는 대원칙

### Q03-22 [변형] ★★★

원본: p.34 `max(x,[],2)`, p.37 Table 3.5 `max(x,y)` → 변형: `[]`를 빼고 `max(x,5)`

```
>> x = [4 1 7; 2 9 3];
>> a = max(x, [], 2)
a =

     7
     9

>> b = max(x, 5)
b =

     5     5     7
     5     9     5

>> y = [0 6 3; 5 1 9];
>> c = max(x, y)
c =

     4     6     7
     5     9     9

```

- `max(x,[],2)`의 2는 **차원**(행 방향)이고 결과는 열벡터다. `max(x,5)`의 5는 **비교 대상**이라 각 원소와 5 중 큰 값을 고른다.
  `[]` 자리표시자 하나로 의미가 완전히 달라진다.
- `max(x,y)`는 같은 크기의 두 배열을 원소끼리 비교한다.
- 근거: [3.5](../../textbook/ch03/3.5-data-analysis.md) ⚠️ 함정 — `max(x,2)`와 `max(x,[],2)`는 완전히 다르다

### Q03-23 [출력] ★★

원본: p.35 `[a,b]=max(x)` → 변형: 값 바꾸기, 한 행만 잘라 `min`

```
>> x = [4 1 7; 2 9 3];
>> [a, b] = max(x)
a =

     4     9     7

b =

     1     2     1

>> [m, k] = min(x(2,:))
m =

     2

k =

     1

```

- 두 번째 출력은 최댓값이 들어 있던 **행 번호**(벡터면 위치)다.
- `x(2,:)`는 2행 `[2 9 3]`이고, 최솟값 2는 1번째에 있다.
- 근거: [3.5](../../textbook/ch03/3.5-data-analysis.md) 3.5.1 최댓값과 최솟값

### Q03-24 [오류] ★★

원본: p.36 HINT `max = max(x)` → 변형: 그 뒤에 `max(y)` 호출

```
>> x = [4 1 7; 2 9 3];
>> max = max(x)
max =

     4     9     7

>> y = [3 8 1];
>> max(y)
Index exceeds the number of array elements. Index must not exceed 3.
```

- (2) `max = max(x)`로 `max`라는 1×3 **변수**가 생겨 함수를 가렸다. 이제 `max(y)`는 함수 호출이 아니라 변수 `max`의 3, 8, 1번째 원소를 꺼내는 인덱싱이고, 8번째 원소가 없으므로 오류다.
  (R2026a는 이어서 `'max' appears to be both a function and a variable. ...` 안내를 덧붙일 수 있다.)
- (3) `clear max`
- 근거: [3.5](../../textbook/ch03/3.5-data-analysis.md) ⚠️ 함정 — `max`를 변수 이름으로 쓰지 마라, [3.9](../../textbook/ch03/3.9-special-values.md) 함수명을 변수명으로 쓰면 함수가 가려진다

### Q03-25 [출력] ★★

원본: p.39 `mean(x)`, `mean(x,2)`, p.40 Table 3.6 `median`, `mode` → 변형: 값 바꾸기, 짝수 개 median, 최빈값 동률

```
>> x = [2 6 4; 4 8 5];
>> mean(x)
ans =

    3.0000    7.0000    4.5000

>> avg = mean(x, 2)
avg =

    4.0000
    5.6667

>> median([1 5 3 8])
ans =

     4

>> mode([1 2 2 3 3])
ans =

     2

```

- 한 배열에 소수가 하나라도 있으면 전부 소수 형식이다(3.0000, 7.0000).
- `mean(x,2)`는 행 평균이고 열벡터로 나온다. 2행은 17/3 = 5.6667이다.
- 원소가 짝수 개인 `median`은 정렬 후 가운데 두 값(3, 5)의 평균 4다.
- `mode`에서 2와 3이 두 번씩 동률이면 **작은 값** 2를 돌려준다.
- 근거: [3.5](../../textbook/ch03/3.5-data-analysis.md) 3.5.2 평균

### Q03-26 [출력] ★★

원본: p.41 `a = sum(x)`, p.44 Table 3.7 `prod`, p.45 `cumsum`, `cumprod` → 변형: 값 바꾸기, `prod(x,2)`

```
>> x = [1 2 3; 4 5 6];
>> s = sum(x)
s =

     5     7     9

>> p = prod(x, 2);
>> c = cumsum(x)
c =

     1     2     3
     5     7     9

>> p
p =

     6
   120

>> cumprod([1 2 3 4])
ans =

     1     2     6    24

```

- `sum`, `cumsum`은 열 방향이다. `cumsum(x)`는 열마다 위에서부터 누적한다.
- `prod(x,2)`는 행마다 곱한 열벡터다(1·2·3 = 6, 4·5·6 = 120).
- 근거: [3.5](../../textbook/ch03/3.5-data-analysis.md) 3.5.3 합과 곱, 누적

### Q03-27 [출력] ★★★

원본: p.43 `k=1:5; sequence = 1./k`, `format rat`, `series = cumsum(sequence)` → 변형: 1:4, `series(end)`, `./`를 `/`로

```
>> k = 1:4;
>> seq = 1./k
seq =

    1.0000    0.5000    0.3333    0.2500

>> series = cumsum(seq);
>> series(end)
ans =

    2.0833

>> format rat
>> series(end)
ans =

      25/12

>> format short
>> bad = 1/k
Error using  / 
Matrix dimensions must agree.
```

- 1 + 1/2 + 1/3 + 1/4 = 25/12 = 2.0833. `format rat`는 저장값은 그대로 두고 표시만 분수로 바꾼다.
- `1/k`는 원소별 나눗셈이 아니라 행렬 나눗셈(`/`)이다. 스칼라(열 1개)와 1×4 벡터(열 4개)의 열 수가 달라 오류다. 원소별은 `1./k`.

> **[확인 필요]** `format rat`에서 `25/12` 앞뒤의 공백 수, 그리고 `1/k` 오류 메시지(R2026a에서는 `Arguments must have the same number of columns.`일 수 있다).

- 근거: [3.5](../../textbook/ch03/3.5-data-analysis.md) ⚠️ 함정 — `format rat`는 표시 형식일 뿐이다, `1./k`의 점을 빠뜨리지 마라

### Q03-28 [코드] ★

원본: p.47 `sort(x,"descend")` → 변형: 행벡터

```matlab
>> v = [3 8 1 6]
>> sort(v, "descend")
```

- 세미콜론: 두 줄 모두 결과가 보이므로 없어야 한다. 결과를 변수에 저장하지 않았으므로 `ans`로 찍힌다.
- `"descend"` 대신 `'descend'`도 된다.
- 근거: [3.5](../../textbook/ch03/3.5-data-analysis.md) 3.5.4 정렬

### Q03-29 [출력] ★★

원본: p.47 `x = [1 3; 10 2; 3 1; 82 4; 5 5]; sort(x)`, `sort(x,"descend")`, p.49 Table 3.8 → 변형: 4×2 배열

```
>> x = [7 2; 1 9; 4 5; 3 1];
>> sort(x)
ans =

     1     1
     3     2
     4     5
     7     9

>> s = sort(x, "descend");
>> s
s =

     7     9
     4     5
     3     2
     1     1

```

- `sort`는 열마다 **따로** 정렬한다. 그래서 원래 행 `[7 2]`가 깨진다.
- 근거: [3.5](../../textbook/ch03/3.5-data-analysis.md) ⚠️ 함정 — `sort`는 자료를 망가뜨릴 수 있다

### Q03-30 [출력] ★★★

원본: p.48 `sortrows(x,1)`, `sortrows(x,2)`, p.50 `sortrows(x,n)`에서 n이 음수면 내림차순 → 변형: 4×2 배열, 기본값과 -2

```
>> x = [7 2; 1 9; 4 5; 3 1];
>> a = sortrows(x)
a =

     1     9
     3     1
     4     5
     7     2

>> b = sortrows(x, 2)
b =

     3     1
     7     2
     4     5
     1     9

>> c = sortrows(x, -2)
c =

     1     9
     4     5
     7     2
     3     1

```

- `sortrows`는 행을 통째로 옮긴다. 기본 기준은 1열 오름차순, `n`은 기준 열, `-n`은 그 열 내림차순이다.
- 근거: [3.5](../../textbook/ch03/3.5-data-analysis.md) 3.5.4 정렬

### Q03-31 [출력] ★★

원본: p.52 Table 3.10 `size`, `length`, `numel`, `height` → 변형: 전치한 배열, 세미콜론 섞기

```
>> x = [1 5 3; 2 4 6];
>> y = x';
>> size(y)
ans =

     3     2

>> L = length(x)
L =

     3

>> n = numel(y);
>> h = height(y)
h =

     3

>> n
n =

     6

```

- `length`는 가장 큰 차원이다(2×3이면 3). `numel`은 원소 개수, `height`는 행 개수다.
- 근거: [3.5](../../textbook/ch03/3.5-data-analysis.md) ⚠️ 함정 — `length`는 "길이"가 아니라 "가장 큰 차원"이다

### Q03-32 [출력] ★★★

원본: p.56 `std(scores1)`, `var(scores1)`, p.57 Table 3.12 `x = [1,5,3]; std(x)` → 변형: 값 바꾸기, `std(x,1)`, 2×2 배열

```
>> x = [2 4 6];
>> s = std(x)
s =

     2

>> v = var(x);
>> v
v =

     4

>> p = std(x, 1)
p =

    1.6330

>> A = [1 4; 3 8];
>> std(A)
ans =

    1.4142    2.8284

```

- 기본 `std`, `var`는 N−1로 나눈다: 편차제곱합 8 / (3−1) = 4, √4 = 2.
- `std(x,1)`의 1은 차원이 아니라 정규화 방식(N으로 나누기)이다: √(8/3) = 1.6330.
- 배열이면 열마다 계산한다: [1 3]은 √2 = 1.4142, [4 8]은 √8 = 2.8284.
- 근거: [3.5](../../textbook/ch03/3.5-data-analysis.md) ⚠️ 함정 — 분모가 N이 아니라 N−1이다

---

## 3.6 난수

### Q03-33 [코드] ★★

원본: p.60 `x = rand(100,1); x = (x_max-x_min)*x + x_min;`, p.61 10000개 → 변형: 문제 그대로 10000개

```matlab
>> x_max = 10;
>> x_min = 5;
>> x = rand(10000, 1);
>> x = (x_max - x_min)*x + x_min;
>> mean(x)
>> max(x)
>> min(x)
```

- 세미콜론: 변수를 만드는 네 줄에는 있어야 하고(10000개가 찍히면 안 된다), `mean`, `max`, `min` 줄에는 없어야 한다.
- 범위 변환은 "폭을 곱하고 하한을 더한다". 한 줄로 `x = (x_max - x_min)*rand(10000,1) + x_min;`도 정답이다.
- 근거: [3.6](../../textbook/ch03/3.6-random-numbers.md) 3.6.1 균등 난수 rand

### Q03-34 [빈칸] ★★

원본: p.63 `x = standard_deviation * random_data_set + mean`, p.64·p.65 `x = randn(1,500); x = sigma*x + average;` → 변형: 한 줄로 합치기

```matlab
>> x = sigma * randn(1, 500) + average;
```

- (1) `sigma` (2) `randn(1, 500)` (3) `average`
- 기본 `randn`은 평균 0, 표준편차 1이므로 표준편차를 곱하고 평균을 더한다. `randn(500)`이라 쓰면 500×500 배열이 된다.
- 근거: [3.6](../../textbook/ch03/3.6-random-numbers.md) 3.6.2 정규 난수 randn, ⚠️ 함정 — `randn(1,500)`과 `randn(500)`은 다르다

### Q03-35 [출력] ★★

원본: p.66 Table 3.13 `rand(n)`, `rand(m,n)`, `randn(n)`, `randn(m,n)`, `randi(imax,sz)` → 변형: 값 대신 크기 묻기

```
>> A = rand(3);
>> size(A)
ans =

     3     3

>> B = randn(2, 5);
>> numel(B)
ans =

    10

>> C = randn(500);
>> size(C)
ans =

   500   500

>> r = randi(6, [1 4]);
>> size(r)
ans =

     1     4

```

- 난수 값은 실행마다 다르지만 크기는 정해져 있다. 입력 하나 `n`은 n×n이다.
- 근거: [3.6](../../textbook/ch03/3.6-random-numbers.md) ⚠️ 함정 — `randn(1,500)`과 `randn(500)`은 다르다, `[보강]` randi

### Q03-36 [단답] ★

원본: p.53 68-95-99.7, p.58·p.59 균등 난수, p.62 정규 난수

1. 균등 난수 `rand`, 정규 난수 `randn`
2. 틀렸다. 균등(uniform)과 정규(normal, Gaussian)는 다른 분포다. normal 난수를 만드는 것은 `randn`이다.
3. 약 68%, 95%, 99% 이상(99.7%)

- 근거: [3.6](../../textbook/ch03/3.6-random-numbers.md) ⚠️ 함정 — 슬라이드 원문의 용어 오류, [3.5](../../textbook/ch03/3.5-data-analysis.md) 3.5.6 분산과 표준편차

---

## 3.7 복소수

### Q03-37 [출력] ★★

원본: p.70 `A = 5+3i`, `real(A)`, `imag(A)`, `isreal(A)` → 변형: 허수부 음수, 세미콜론 섞기

```
>> A = 4 - 2i
A =

   4.0000 - 2.0000i

>> re = real(A);
>> im = imag(A)
im =

    -2

>> t = isreal(A)
t =

  logical

   0

>> re
re =

     4

```

- 복소수는 실수부·허수부가 정수여도 소수 형식으로 찍힌다. `real`, `imag`의 결과는 실수 double이라 정수 형식이다.
- `imag`는 허수부의 **계수**(-2)를 돌려준다. `-2i`가 아니다.
- `isreal`은 `logical` 0(거짓)이다.
- 근거: [3.7](../../textbook/ch03/3.7-complex-numbers.md) 복소수 함수

### Q03-38 [출력] ★★★

원본: p.71 `A'`, p.72 Table 3.14 `abs`, `angle`, `conj` (x = 3 + 4i) → 변형: `.'` 추가

```
>> x = 3 + 4i;
>> r = abs(x)
r =

     5

>> theta = angle(x)
theta =

    0.9273

>> c = conj(x)
c =

   3.0000 - 4.0000i

>> x'
ans =

   3.0000 - 4.0000i

>> x.'
ans =

   3.0000 + 4.0000i

```

- `abs`는 크기 √(3²+4²) = 5, `angle`은 라디안 각 atan2(4,3) = 0.9273이다.
- `'`는 켤레 전치라 허수부 부호가 바뀌고, `.'`는 순수 전치라 그대로다.
- 근거: [3.7](../../textbook/ch03/3.7-complex-numbers.md) ⚠️ 함정 — 복소수 배열에서 `'`와 `.'`는 다른 답을 준다

### Q03-39 [출력] ★★★

원본: p.69 `x = 1:3; y = [-1,5,12]; complex(x,y)`, p.68 `A = 5 + 3*i` → 변형: 허수부 0 포함, `i`를 변수로 덮어쓰기

```
>> x = 1:3;
>> y = [2 0 -4];
>> z = complex(x, y)
z =

   1.0000 + 2.0000i   2.0000 + 0.0000i   3.0000 - 4.0000i

>> i = 2;
>> B = 5 + 3*i
B =

    11

>> C = 5 + 3i
C =

   5.0000 + 3.0000i

```

- 허수부가 0인 원소도 복소수 배열 안에서는 `+ 0.0000i`로 찍힌다.
- `i = 2`로 `i`가 변수가 되면 `3*i`는 6이라 `B = 11`(실수)이다. 숫자에 붙은 `3i`는 리터럴이라 여전히 허수다.

> **[확인 필요]** 복소수 배열 원소 사이의 공백 수와 `+ 0.0000i` 표기.

- 근거: [3.7](../../textbook/ch03/3.7-complex-numbers.md) ⚠️ 함정 — `i`와 `j`를 변수로 쓰면 허수 단위가 사라진다

---

## 3.8 계산 한계

### Q03-40 [출력] ★★

원본: p.73 `x = 2.5e200; y = 1.0e200; z = x*y`, `realmax` → 변형: 값 바꾸기, 덧셈 추가

```
>> x = 3.0e200;
>> y = 2.0e200;
>> z = x*y
z =

   Inf

>> w = x + y
w =

  5.0000e+200

>> realmax
ans =

  1.7977e+308

```

- 곱은 6e400이라 지수 오버플로로 `Inf`다. 합은 5e200이라 범위 안이다. 오류 메시지는 나오지 않는다.
- 근거: [3.8](../../textbook/ch03/3.8-computational-limits.md) 지수 오버플로, ⚠️ 함정 — 오버플로는 오류 메시지를 내지 않는다

### Q03-41 [출력] ★★

원본: p.74 `x = 25e-200; y = 1.0e200; z = x/y`, `realmin` → 변형: 값 바꾸기, `realmax*10/10`

```
>> x = 3e-200;
>> y = 2e200;
>> z = x/y
z =

     0

>> realmin
ans =

  2.2251e-308

>> q = realmax * 10 / 10
q =

   Inf

```

- 1.5e-400은 표현 가능한 가장 작은 값보다 작아 지수 언더플로로 0이 된다.
- `realmax * 10`이 먼저 `Inf`가 되므로 10으로 나눠도 `realmax`로 돌아오지 않는다. 왼쪽부터 계산된다.
- 근거: [3.8](../../textbook/ch03/3.8-computational-limits.md) 지수 언더플로

### Q03-42 [출력] ★★

원본: p.75 Table 3.15 `intmax`, `intmin` → 변형: `realmax`와 비교

```
>> intmax
ans =

  int32

   2147483647

>> intmin
ans =

  int32

   -2147483648

>> realmax > intmax
ans =

  logical

   1

```

- `intmax`의 결과는 `double`이 아니라 `int32`라 `int32` 줄이 먼저 찍힌다. 약 2.1×10⁹로 `realmax`(1.8×10³⁰⁸)보다 훨씬 작다.

> **[확인 필요]** `int32` 스칼라의 숫자 앞 공백 수.

- 근거: [3.8](../../textbook/ch03/3.8-computational-limits.md) ⚠️ 함정 — `intmax`는 `realmax`보다 훨씬 작다

---

## 3.9 특수값과 기타 함수

### Q03-43 [오류] ★★★

원본: p.77 `sin = 10; sin(5)` → 변형: `sin(1)` 먼저 호출

```
>> sin = 10;
>> a = sin(1)
a =

    10

>> b = sin(5)
Index exceeds the number of array elements. Index must not exceed 1.
```

- (2) `sin`이 1×1 변수(10)가 되어 함수를 가렸다. `sin(1)`은 변수의 1번째 원소 10을 꺼내므로 **오류 없이** 틀린 값이 나온다. `sin(5)`는 5번째 원소가 없어 오류다.
  (슬라이드처럼 `'sin' appears to be both a function and a variable. ...` 안내가 이어질 수 있다.)
- (3) `clear sin`
- 근거: [3.9](../../textbook/ch03/3.9-special-values.md) 함수명을 변수명으로 쓰면 함수가 가려진다, ⚠️ 함정 — 오류 메시지가 원인을 직접 말해주지 않는다

### Q03-44 [출력] ★★

원본: p.78 Table 3.16 `5/0`, `0/0`, `inf/inf`, `j` → 변형: 음수 나누기 0, `b == b`, `2*j`

```
>> a = 5/0
a =

   Inf

>> b = 0/0;
>> c = -1/0
c =

  -Inf

>> d = Inf/Inf
d =

   NaN

>> b == b
ans =

  logical

   0

>> k = 2*j
k =

   0.0000 + 2.0000i

```

- 슬라이드 표의 `Warning: Divide by zero.`는 옛 버전 출력이다. 현재 MATLAB은 경고 없이 `Inf`, `NaN`을 돌려준다.
- `NaN`은 자기 자신과도 같지 않아 `b == b`가 거짓이다. NaN 검사는 `isnan(b)`.
- `j`는 `i`와 같은 허수 단위다.
- 근거: [3.9](../../textbook/ch03/3.9-special-values.md) ⚠️ 함정 — `NaN == NaN`은 거짓이다

### Q03-45 [코드] ★★

원본: p.76 `pi()`, p.78 Table 3.16 `eps` → 변형: `eps`로 부동소수점 비교

```matlab
>> p = pi()
>> 1 + eps/2 == 1
```

- 세미콜론: 두 줄 모두 결과가 보이므로 없어야 한다. 두 번째 줄은 변수에 저장하지 않았으므로 `ans`다.
- `pi`는 상수가 아니라 입력이 없는 함수라 `pi()`도 오류가 아니다.
- `eps`(2.2204e-16)는 1과 그다음 double 사이의 간격이라, 그 절반을 더하면 1로 반올림되어 비교가 참이다.
- 근거: [3.9](../../textbook/ch03/3.9-special-values.md) 특수값, [3.8](../../textbook/ch03/3.8-computational-limits.md) `[보강]` eps
