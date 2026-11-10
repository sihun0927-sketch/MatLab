# Chapter 11 연습문제 해답

실행 결과는 R2026a `-batch`(`format compact`)에서 얻은 것이다. 이 장은 `example/ch11/` 코드 파일을 만들지 않았으므로 해답 코드는 여기에만 있다.

> **[보강]** 이 파일 전체가 슬라이드 밖 내용이다. 연습문제와 해답은 모두 시험 대비용으로 추가한 것이다.

---

## 11.1

### 1. integer 연산 예측

```matlab
a = int8(100) + int8(100)     % int8  127
b = uint8(3) - uint8(5)       % uint8 0
c = int8(7) / int8(2)         % int8  4
d = int16(5) * 2.5            % int16 13
```

- `a`: 200은 int8 범위(−128~127) 밖 → 최댓값 **127**에 머문다(saturation).
- `b`: −2는 uint8 범위 밖 → **0**.
- `c`: 3.5를 **반올림**해 4. 버림(3)이 아니다.
- `d`: integer × double 스칼라 → 결과는 **int16**. 12.5를 반올림해 **13**.

### 2. 바이트 수

| 변수 | 클래스 | 원소당 | 100원소 |
|---|---|---|---|
| `x` | double | 8 | **800** |
| `single(x)` | single | 4 | **400** |
| `int8(x)` | int8 | 1 | **100** |
| `uint16(x)` | uint16 | 2 | **200** |
| `complex(x,x)` | 복소 double | 16 | **1600** |

```matlab
x = zeros(10,10);
xs = single(x); xi = int8(x); xu = uint16(x); zc = complex(x, x);
whos x xs xi xu zc
```

### 3. single의 범위와 정밀도

```matlab
single(1e39)                  % Inf
single(1e-50)                 % 0
double(single(0.1)) - 0.1     % 1.4901e-09
```

- `1e39`는 `realmax("single")` ≈ 3.4e38보다 크다 → **Inf**.
- `1e-50`은 `realmin("single")` ≈ 1.2e-38보다 훨씬 작다 → **0**.
- 0.1은 이진수로 정확히 표현되지 않는다. single로 저장하면 오차가 커서(약 7자리) double로 되돌려도 `1.49e-9`만큼 차이가 남는다. double 자체 오차(약 1e-17)보다 훨씬 크다. → single이 round-off error에 약한 이유.

---

## 11.2

### 1. char와 숫자 섞기

| 식 | 결과 | 클래스 | 이유 |
|---|---|---|---|
| `['A', 66]` | `'AB'` | char | 배열에 섞으면 숫자 → 문자(66 = 'B') |
| `'A' + 1` | `66` | double | 계산에서는 문자 → 10진 값(65 + 1) |
| `"A" + 1` | `"A1"` | string | string의 `+`는 이어 붙이기 |
| `char('A' + 2)` | `'C'` | char | 67 → 'C' |
| `double('AZ')` | `65 90` | double | 문자별 ASCII 값 |

### 2. 이름을 세 가지 방법으로

```matlab
names_char = char('Kim','Park','Seoyeon')     % 3x7 char
names_cell = {'Kim';'Park';'Seoyeon'}          % 3x1 cell
names_str  = ["Kim";"Park";"Seoyeon"]          % 3x1 string

names_char(2,:)     % 'Park   '  (공백 3개 포함)
names_cell{2}       % 'Park'
names_str(2)        % "Park"
```

- padded char는 **3×7**: 가장 긴 `'Seoyeon'`(7글자)에 맞춰 공백을 채운다.
- cell과 string은 **3×1**: 이름 하나가 원소 하나.

### 3. ASCII 계산으로 대문자 만들기

```matlab
word = 'matlab';
up = char(word - 32)              % 'MATLAB'
dist = double('z') - double('a')  % 25
```

- 소문자와 대문자의 ASCII 값 차이는 32(`'a'` = 97, `'A'` = 65).
- `word - 32`는 double 배열 `[77 65 84 76 65 66]` → `char`로 문자로 되돌린다.
- `'z' - 'a'`처럼 바로 빼도 25가 나온다(계산에서 자동 변환).

---

## 11.3

### 1. function handle vs symbolic

```matlab
f = @(t) t.^2 - 2;
f([0 1 2])        % -2  -1   2
class(f)          % 'function_handle'
```

`f`는 **값을 넣어 숫자를 계산**하는 함수의 별명이고, `S = x^2 - 2`는 `x`에 값 없이 **식 자체를 저장**하는 symbolic 객체다.

### 2. 데이터 타입 트리

정답 **(c)**. categorical array는 Symbolic이 아니라 별도의 **Categorical** 가지에 있다. symbolic array는 symbolic variable과 function handle을 저장한다(슬라이드 11.3).

---

## 11.4

### 1. 음수 처리

```matlab
x = [3 -1 4 -1 5 9 -2 6];
neg = x < 0             % 0 1 0 1 0 0 1 0  (logical)
count = sum(neg)        % 3
pos_idx = find(~neg)    % 1 3 5 6 8
x(neg) = 0              % 3 0 4 0 5 9 0 6
```

- `sum`은 logical의 true(1)를 더해 개수를 센다.
- `~neg`는 "음수가 아님", `find`가 그 위치를 돌려준다.
- logical indexing으로 조건에 맞는 원소에만 대입.

### 2. logical vs double 인덱스

```matlab
x = [10 20 30];
x(logical([1 0 1]))     % 10 30
x([1 0 1])              % 오류
```

```
배열 인덱스는 양의 정수이거나 논리값이어야 합니다.
```

- logical 인덱스: true 위치(1, 3)를 고른다.
- double `[1 0 1]`: "1번, 0번, 1번 원소" → 0번은 없으므로 오류.
- 바이트 수: `logical([1 0 1])` **3**, `[1 0 1]` **24**.

---

## 11.5

### 1. `eye(500)`

```matlab
U = eye(500); V = sparse(U);
whos U V
```

- full: 500 × 500 × 8 = **2,000,000** bytes.
- sparse: **12,008** bytes. 0이 아닌 값 500개(값 8 bytes + 행 위치 8 bytes)와 열 포인터 501개(8 bytes)를 저장한다: 500·16 + 501·8 = 12,008. 같은 계산으로 `eye(1000)`은 1000·16 + 1001·8 = 24,008(슬라이드 값과 일치).

### 2. sparse 표시

```matlab
S = sparse([1 0 0; 0 0 2])
```
```
S =
  2×3 희소 double형 행렬 (0이 아닌 요소 2개)
   (1,1)        1
   (2,3)        2
```

- `nnz(S)` → **2**.
- `full(S')` → `[1 0; 0 0; 0 2]` (3×2).

---

## 11.6

### 1. 등급

```matlab
grades = categorical(["B","A","C","A","B","A"]);
categories(grades)          % {'A'; 'B'; 'C'}
idxA = find(grades == "A")  % 2 4 6
numA = numel(idxA)          % 3
countcats(grades)           % 3 2 1   (A, B, C 순)
```

### 2. 대소문자

```matlab
g = categorical(["low","high","low","mid"]);
find(g == "Low")      % 1×0 빈 배열 (오류 없음)
find(g == "low")      % 1 3
categories(g)         % {'high'; 'low'; 'mid'}
```

- 범주 이름은 대소문자를 구분한다. `"Low"`라는 범주는 없으므로 아무것도 찾지 못한다.
- `categories`는 입력 순서가 아니라 **알파벳 정렬** 순서다.

---

## 11.7

### 1. 기간

```matlab
yr = [2005; 2026];
mo = [3; 11];
dy = [15; 10];
dates = datetime(yr, mo, dy);
age = diff(dates)       % 189840:00:00 (duration)
days(age)               % 7910
years(age)              % 21.6568
```

- 변수 이름을 `year`, `month`, `day` 대신 `yr`, `mo`, `dy`로 썼다. 함수 `year`, `month`, `day`를 가리지 않기 위해서다.
- `years`는 1년 = 365.2425일로 계산한 값이다.

### 2. Denver 최고 기온

```matlab
DATE = [20150101;20150201;20150301;20150401;20150501;20150601; ...
        20150701;20150801;20150901;20151001;20151101;20151201];
EMXT = [75;73.9;81;79;84.9;93.9;97;98.1;91.9;87.1;75;69.1];
dt = datetime(DATE, 'ConvertFrom', 'yyyymmdd');
hot = dt(EMXT > 90)         % 2015-06-01, 07-01, 08-01, 09-01
[~, k] = max(EMXT);
dt(k)                       % 2015-08-01 (98.1°F)
```

datetime 배열도 logical indexing과 `max`의 인덱스 출력으로 고를 수 있다.

---

## 11.8

### 1. 3차원 배열

```matlab
P1 = [1 2; 3 4]; P2 = P1 + 10; P3 = P1 + 20;
A3 = cat(3, P1, P2, P3);
size(A3)                 % 2 2 3
A3(2,1,3)                % 23
sum(A3, 3)               % [33 36; 39 42]
squeeze(A3(1,2,:))'      % 2 12 22
```

- `A3(2,1,3)`: 3번째 page(`P3` = `[21 22; 23 24]`)의 2행 1열 = 23.
- `sum(A3, 3)`: 같은 위치의 page 값 합. (1,1)은 1 + 11 + 21 = 33.
- `A3(1,2,:)`는 1×1×3 → `squeeze`로 3×1 → transpose로 1×3.

### 2. `squeeze` 크기

| 입력 | 결과 |
|---|---|
| `zeros(1,1,5)` | **5×1** |
| `zeros(2,1,3)` | **2×3** |
| `zeros(1,4)` | **1×4** (2차원은 그대로) |
| `zeros(3,4,1)` | **3×4** (끝의 1은 원래 표시 안 됨) |

---

## 11.9

### 1. cell 인덱싱 예측

```matlab
c = {[1 2 3], 'hello', "world", magic(3)};
class(c(2))      % 'cell'
class(c{2})      % 'char'
c{4}(2,3)        % 7
c{2}(1)          % 'h'
c{3}             % "world"
size(c)          % 1 4
```

- `magic(3)` = `[8 1 6; 3 5 7; 4 9 2]` → 2행 3열은 7.
- `( )`는 cell을, `{ }`는 내용물을 돌려준다.

### 2. table로 변환 후 되돌리기

```matlab
Tc = cell2table(c)
c_back = table2cell(Tc);
isequal(c_back, c)       % 1
```
```
Tc =
  1×4 table
        c1            c2          c3            c4     
    ___________    _________    _______    ____________
    1    2    3    {'hello'}    "world"    {3×3 double}
```

열 이름은 변수 이름 `c` 뒤에 번호가 붙은 `c1`~`c4`.

---

## 11.10

### 1. 학생 struct

```matlab
s(1).name = "Kim";  s(1).score = 85;
s(2).name = "Lee";  s(2).score = 92;
s(3).name = "Park"; s(3).score = 78;
size(s)                     % 1 3
avg = mean([s.score])       % 85
[~, best] = max([s.score]);
s(best).name                % "Lee"
Ts = struct2table(s)
```
```
Ts =
  3×2 table
     name     score
    ______    _____
    "Kim"      85  
    "Lee"      92  
    "Park"     78  
```

`[s.score]`가 모든 원소의 `score`를 대괄호로 모아 `[85 92 78]`을 만든다.

### 2. struct 확장 예측

```matlab
r.a = [5 6 7];
r(3).b = "x";
size(r)            % 1 3
r(2)               % a: [], b: []
r(1).a(2)          % 6
isempty(r(3).a)    % 1
```

- `r(3)`에 대입하면 struct가 1×3으로 늘고, field `b`가 **모든 원소**에 생긴다.
- 값을 넣지 않은 자리(`r(2)`의 a, b, `r(3).a`, `r(1).b`)는 모두 `[]`.

---

## 11.11

### 1. patients table

```matlab
load patients
LastName = string(LastName);
P = table(LastName, Age, Smoker);
P.Properties.RowNames = P.LastName;
P{"Smith","Age"}                       % 38
P("Smith","Age")                       % 1x1 table
old_smokers = P(P.Smoker & P.Age > 45, :)
```
```
old_smokers =
  5×3 table
               LastName     Age    Smoker
               _________    ___    ______
    Martin     "Martin"     48     true  
    Stewart    "Stewart"    49     true  
    Reed       "Reed"       50     true  
    Ramirez    "Ramirez"    48     true  
    Hughes     "Hughes"     49     true  
```

- `{ }`는 값(double 38), `( )`는 table.
- `P.Smoker & P.Age > 45`는 100×1 logical → 행 logical indexing.

### 2. `VariableNames` 따옴표

정답 **(b)**. `"VariableNames"`를 큰따옴표로 쓰면 이름-값 쌍이 아니라 **데이터 열**로 해석된다. 3×1인 `a`, `b`와 1×1인 `"VariableNames"`, 1×2인 `["x","y"]`의 행 수가 달라 오류가 난다.

```
모든 테이블 변수는 행 수가 동일해야 합니다.
```

(a)는 슬라이드 방식, (c)는 R2026a의 `Name=Value` 문법이라 둘 다 된다.

### 3. `Gender`를 categorical로

```matlab
T2 = readtable("patients.dat");
T2.Gender = categorical(T2.Gender);
categories(T2.Gender)      % {'Female'; 'Male'}
countcats(T2.Gender)       % 53; 47
```

---

## 11.12

### 1. 두 timetable 동기화

```matlab
Time = datetime(2026,11,10) + hours([0; 2; 4]);
A = timetable(Time, [20; 22; 21], VariableNames="TempA");
Time = datetime(2026,11,10) + hours([1; 2; 3]);
B = timetable(Time, [50; 55; 53], VariableNames="Hum");

AB = synchronize(A, B)
sum(ismissing(AB))          % 2 2
ABl = synchronize(A, B, 'union', 'linear')
```
```
AB =
  5×2 timetable
           Time            TempA    Hum
    ___________________    _____    ___
    2026-11-10 00:00:00      20     NaN
    2026-11-10 01:00:00     NaN      50
    2026-11-10 02:00:00      22      55
    2026-11-10 03:00:00     NaN      53
    2026-11-10 04:00:00      21     NaN
ABl =
  5×2 timetable
           Time            TempA    Hum
    ___________________    _____    ___
    2026-11-10 00:00:00      20     45 
    2026-11-10 01:00:00      21     50 
    2026-11-10 02:00:00      22      55 
    2026-11-10 03:00:00    21.5     53 
    2026-11-10 04:00:00      21     51 
```

- 2시만 겹치므로 시각은 0, 1, 2, 3, 4시의 **5행**(3 + 3 − 1).
- 0시의 `Hum` = 45: `B`의 측정은 1시부터라 0시는 범위 밖이다. 1시(50)→2시(55) 기울기(+5/h)를 그대로 거꾸로 이어 **외삽**한 값이다. 실제 측정값이 아니다.

### 2. `retime`

```matlab
Ah = retime(A, 'hourly', 'linear')      % TempA: 20 21 22 21.5 21
Ap = retime(A, 'hourly', 'previous')    % TempA: 20 20 22 22 21
```

- `'linear'`: 1시는 20과 22의 중간 21, 3시는 22와 21의 중간 21.5.
- `'previous'`: 빈 시각에 **직전 측정값**을 그대로 쓴다(계단형).
