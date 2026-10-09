# Chapter 8 — Logical Functions and Selection Structures · 해답

- 출력은 R2026a 기본 상태(`format short`, `format loose`)를 [exam/README.md](../README.md)의 "Command Window 출력 규칙"대로 재현했다. MATLAB으로 실행하지 않았다.
- `string` 값을 보여 줄 때 첫 줄은 `ans = `처럼 `=` 뒤에 공백이 하나 있다. 숫자·`logical`·`char`는 `ans =`로 끝난다.
- 슬라이드 화면은 `format compact`처럼 빈 줄이 없지만, 해답은 R2026a 기본값(`format loose`)대로 빈 줄을 넣었다.
- 스크립트 문제의 출력에는 `>>` 프롬프트를 쓰지 않았다.

---

## 8.1 관계·논리 연산자

### Q08-01 [출력] ★

원본: p.8 `x=5; y=1; x<y` → 변형: 값을 바꾸고 `>=`, `~=` 추가

```
>> x = 2; y = 7;
>> x < y
ans =

  logical

   1

>> x >= y
ans =

  logical

   0

>> x ~= y
ans =

  logical

   1

```

- 첫 줄은 둘 다 `;`로 끝나서 아무것도 찍히지 않는다.
- 스칼라끼리 비교한 결과는 `logical` 스칼라(1×1)다. 그래서 `  logical` 줄이 먼저 나온다. 참이면 1, 거짓이면 0이다.
- `~=`는 "같지 않다"이다. 수학책의 ≠, C의 `!=`가 아니다.
- 근거: [8.1](../../textbook/ch08/8.1-relational-logical.md)

### Q08-02 [출력] ★

원본: p.10 `x<y` → 변형: `<`를 `>=`, `==`로

```
>> x = [1,2,3,4,5];
>> y = [-2,0,2,4,6];
>> x >= y
ans =

  1×5 logical array

   1   1   1   1   0

>> x == y
ans =

  1×5 logical array

   0   0   0   1   0

```

- 배열끼리 비교하면 **같은 자리의 원소끼리** 비교한다. 결과는 같은 크기의 logical 배열이다.
- 넷째 원소는 4와 4라서 `>=`와 `==`가 모두 참이다. 원래 `x<y`(0 0 0 0 1)와 비교해 보면 `>=`는 `<`를 정확히 뒤집은 것이다.
- 근거: [8.1](../../textbook/ch08/8.1-relational-logical.md)

### Q08-03 [출력] ★

원본: p.13 `x = 5`, `x == 3` → 변형: 대입 `x = 3`을 끼워 넣음

```
>> x = 5;
>> x == 3
ans =

  logical

   0

>> x = 3
x =

     3

>> x == 3
ans =

  logical

   1

```

- `==`는 비교라서 결과가 `ans`에 들어간다. `x`는 바뀌지 않는다.
- `=`는 대입이라서 `x`에 3이 들어가고, 세미콜론이 없으니 `x =`로 찍힌다(logical이 아니라 double).
- 근거: [8.1](../../textbook/ch08/8.1-relational-logical.md) ⚠️ 함정 "`=`는 대입, `==`는 비교"

### Q08-04 [오류] ★★

원본: p.13 → 변형: 조건 자리에 `==` 대신 `=`

```
Error: File: …  Line: 2  Column: 6
Incorrect use of '=' operator. To assign a value to a variable, use '='. To compare values for equality, use '=='.
```

1. `if` 뒤에는 조건(비교식)이 와야 하는데 대입 연산자 `=`를 썼다. MATLAB은 C처럼 대입을 조용히 실행하지 않고, 실행 전에 구문 오류를 낸다.
2. 핵심 문장은 `Incorrect use of '=' operator.`이다.
3. 고친 코드:

```matlab
x = 5;
if x == 3
    disp("x is 3")
end
```

고치면 `x`가 5라서 조건이 거짓이고, 출력은 없다.

> **[확인 필요]** 스크립트 파일의 구문 오류일 때 첫 줄이 `Error: File: 이름.m Line: 2 Column: 6` 형식으로 나오는지, 열 번호가 몇인지.

- 근거: [8.1](../../textbook/ch08/8.1-relational-logical.md) ⚠️ 함정

### Q08-05 [출력] ★★

원본: p.15 `z>x & z>y`, p.16 `x>y | x>z` → 변형: `z`를 8에서 3으로, `~` 추가

```
>> x = [1,2,3,4,5];
>> y = [-2,0,2,4,6];
>> z = [3,3,3,3,3];
>> z>x & z>y
ans =

  1×5 logical array

   1   1   0   0   0

>> x>y | x>z
ans =

  1×5 logical array

   1   1   1   1   1

>> ~(x>y)
ans =

  1×5 logical array

   0   0   0   1   1

```

- `z>x` = `1 1 0 0 0`, `z>y` = `1 1 1 0 0`이다. 둘 다 1인 자리만 1이 된다(`&`).
- `x>y` = `1 1 1 0 0`, `x>z` = `0 0 0 1 1`이다. 하나라도 1이면 1이 된다(`|`). 원래 슬라이드(z=8)에서는 `x>z`가 전부 0이라 `1 1 1 0 0`이었다.
- `~`는 0과 1을 뒤집는다.
- 관계 연산자가 `&`, `|`보다 먼저 계산되므로 괄호가 없어도 `(z>x) & (z>y)`로 읽힌다.
- 근거: [8.1](../../textbook/ch08/8.1-relational-logical.md)

### Q08-06 [코드] ★★

원본: p.15 `z>x & z>y` → 변형: 한 배열에 두 조건

```matlab
a = 2:2:10
a > 3 & a < 7
```

- 두 줄 모두 결과가 보이므로 세미콜론이 없어야 한다. 둘째 줄은 변수에 담지 않았으므로 `ans =`로 찍힌다.
- `3 < a < 7`로 쓰면 틀린다(Q08-07). 결과가 `1 1 1 1 1`이 된다.
- 근거: [8.1](../../textbook/ch08/8.1-relational-logical.md)

### Q08-07 [출력] ★★★

원본: [보강] 수학식 `1 < x < 5`를 그대로 쓴 경우

```
>> x = [0 3 6 9];
>> 1 < x < 5
ans =

  1×4 logical array

   1   1   1   1

>> 1 < x & x < 5
ans =

  1×4 logical array

   0   1   0   0

```

- `1 < x < 5`는 왼쪽부터 `(1 < x) < 5`로 계산된다. `1 < x`는 `0 1 1 1`이고, 0과 1은 모두 5보다 작으므로 결과는 **언제나 전부 1**이다.
- 범위는 `&`로 나눠 쓴다. 3만 1과 5 사이에 있다.
- 근거: [8.1](../../textbook/ch08/8.1-relational-logical.md) ⚠️ 함정 "`1 < x < 5`는 수학처럼 읽히지 않는다"

### Q08-08 [오류] ★★

원본: p.14 Table 8.2 "`&&`, `||`는 스칼라에만" → 변형: p.15 코드의 `&`를 `&&`로

```
Operands to the logical AND (&&) and OR (||) operators must be convertible to logical scalar values. Use the ANY or ALL functions to reduce operands to logical scalar values.
```

1. `&&`(short-circuit and)는 **스칼라 전용**이다. `z>x`가 1×5 배열이라 오류가 난다.
2. 위 문장이 오류 메시지다.
3. 원소별 결과를 원하면 `&`를 쓴다: `z>x & z>y` → `1 1 1 1 1`. "전부 참인가" 하나만 원하면 `all(z>x) && all(z>y)`.

> **[확인 필요]** R2026a의 오류 메시지 문구. 버전에 따라 `Operands to the || and && operators must be convertible to logical scalar values.`로 짧게 나오기도 한다.

- 근거: [8.1](../../textbook/ch08/8.1-relational-logical.md) ⚠️ 함정 "`&&`, `||`에 배열을 넣으면 오류"

---

## 8.2 Flowchart와 Pseudocode

### Q08-09 [출력] ★★

원본: p.21 `mph = 0:10:100; … chart = [mph;fps]` → 변형: 간격 20, 끝 60

```
chart =

         0   20.0000   40.0000   60.0000
         0   29.3333   58.6667   88.0000

Velocity Conversion Table
     mph      f/s
       0     0.00 
      20    29.33 
      40    58.67 
      60    88.00 
```

- 슬라이드 코드에서도 `chart = [mph;fps]` 줄에는 세미콜론이 없다. 그래서 `chart`가 먼저 찍힌다.
- `fps`에 소수(29.3333…)가 있어서 배열 전체가 소수 형식으로 찍힌다. 정확히 0인 원소만 `0`으로 찍힌다.
- `fprintf`는 `chart`를 **열 순서로** 두 개씩 꺼낸다. 한 열이 (mph, ft/s) 한 쌍이라 한 줄에 한 쌍이 찍힌다.
- `%8.0f`는 폭 8에 소수점 없이, `%8.2f`는 폭 8에 소수 둘째 자리까지다. 서식 문자열의 `\n` 앞 공백 때문에 각 줄 끝에 공백이 하나 있다.
- 근거: [8.2](../../textbook/ch08/8.2-flowchart-pseudocode.md)

### Q08-10 [변형] ★★★

원본: p.21 `chart = [mph;fps]` → 변형: 열로 붙인 `[mph', fps']`

```
       0    20.00 
      40    60.00 
       0    29.33 
      59    88.00 
```

- `chart`는 4×2가 된다. `fprintf`는 열 순서로 `0 20 40 60 0 29.33 58.67 88`을 두 개씩 쓰므로 mph와 ft/s 쌍이 깨진다. 58.6667은 `%8.0f`에서 반올림되어 59가 된다.
- 행으로 쌓아야(`[mph;fps]`) 한 열이 한 줄이 된다.
- 근거: [8.2](../../textbook/ch08/8.2-flowchart-pseudocode.md)

### Q08-11 [코드] ★★

원본: p.20 pseudocode → p.21 코드 → 변형: 10:10:30, 열 제목 생략

```matlab
% Define a vector of mph values
mph = 10:10:30;
% Convert mph to ft/s
fps = mph*5280/3600;
% Combine the mph and ft/s vectors into an array
chart = [mph;fps];
% Create a chart title
disp("Velocity Conversion Table")
% Display the chart
fprintf("%8.0f %8.2f \n",chart)
```

- `mph`, `fps`, `chart` 세 줄에는 세미콜론이 **있어야** 한다. 없으면 변수가 찍힌다. `disp`, `fprintf`는 세미콜론과 상관없이 찍힌다.
- 10 mph = 14.6667 ft/s, 30 mph = 44 ft/s.
- 줄 끝 공백은 종이에서 보이지 않으므로 서식 문자열 `"%8.0f %8.2f\n"`(공백 없이)도 정답으로 본다. 슬라이드 원문은 `\n` 앞에 공백이 있다.
- 주석 줄은 채점 대상이 아니지만, pseudocode를 주석으로 먼저 쓰고 그 사이에 코드를 채우는 것이 슬라이드의 방법이다.
- 근거: [8.2](../../textbook/ch08/8.2-flowchart-pseudocode.md)

### Q08-12 [단답] ★

원본: p.22 Table 8.3, p.23 mph flowchart → 변형: 슬라이드 밖 명령의 도형을 묻는다

1. 타원 = 코드 토막의 시작 또는 끝, 평행사변형 = 입력 또는 출력, 마름모 = 결정 지점, 직사각형 = 계산.
2. `fprintf` → 평행사변형(출력), `input` → 평행사변형(입력), `if age<16` → 마름모(결정), `fps = mph*5280/3600` → 직사각형(계산).

- p.23의 mph flowchart에서도 `disp`/`fprintf`로 표를 찍는 단계만 평행사변형이다.
- 근거: [8.2](../../textbook/ch08/8.2-flowchart-pseudocode.md) ⚠️ 함정 "평행사변형 = 입력/출력, 직사각형 = 계산"

---

## 8.3 Logical function `find`

### Q08-13 [출력] ★

원본: p.26 `accept = find(height>=66)`, p.28 `height(accept)` → 변형: 기준 70

```
accept =

     4     6     7

ans =

    72    78    75

```

- `find`는 조건을 만족하는 원소의 **인덱스 번호**를 준다. 값을 원하면 그 번호로 다시 인덱싱한다.
- `height(accept)`는 변수에 담지 않았으므로 `ans`로 찍힌다.
- 근거: [8.3](../../textbook/ch08/8.3-find.md) ⚠️ 함정 "`find`는 값이 아니라 인덱스를 준다"

### Q08-14 [변형] ★★

원본: p.26 `find(height>=66)` → 변형: `>=`를 `>`, `==`로

```
>> find(height>66)
ans =

     2     4     5     6     7

>> find(height==66)
ans =

  1×0 empty double row vector

```

1. 원래 결과(`2 4 5 6 7`)와 같다. `height`에 66이 정확히 없어서 `>=`와 `>`의 차이가 드러나지 않는다. 경계값이 데이터에 있을 때만 `<`/`<=`가 결과를 바꾼다.
2. 조건을 만족하는 원소가 없으면 `find`는 오류가 아니라 **빈 배열**을 돌려준다. 행 벡터를 검색했으므로 `1×0`이다.

- 근거: [8.3](../../textbook/ch08/8.3-find.md) ⚠️ 함정 "아무것도 없으면 빈 배열"

### Q08-15 [출력] ★★★

원본: p.30 `find(applicants(:,1)>=66 & applicants(:,2)>=18 & applicants(:,2)<=35)`, p.31 `fprintf` → 변형: 키 70 이상이고 나이 35 미만

```
qualify =

     4
     6
     7

Applicant #4 is 72 inches tall and 20 years old
Applicant #6 is 78 inches tall and 34 years old
Applicant #7 is 75 inches tall and 12 years old
```

- 키가 70 이상인 행은 4(72), 6(78), 7(75)이고, 셋 다 나이가 35 미만이다. 나이 하한(18 이상)을 뺐으므로 12세인 7번도 들어간다.
- `applicants(:,1)`은 열 벡터라 `find` 결과도 **열 벡터**다.
- `results`는 3×3을 전치한 것이라, 한 열이 (번호, 키, 나이) 한 쌍이 된다. `fprintf`가 열 순서로 세 개씩 쓰므로 한 줄에 지원자 하나가 찍힌다. `results` 줄은 `;`라서 찍히지 않는다.
- 근거: [8.3](../../textbook/ch08/8.3-find.md) ⚠️ 함정 "`fprintf`에 표를 넘길 때는 전치를 잊지 말 것"

### Q08-16 [출력] ★★

원본: p.32~p.36 `index = find(temp>98.6)'` → 변형: 기준 99

```
temp =

   95.3000  100.2000   98.6000
   97.4000   99.2000   98.9000
  100.1000   99.3000   97.0000

index =

     3     4     5     6

```

- `temp` 줄에 세미콜론이 없어서 `temp`가 먼저 찍힌다. 소수가 있으므로 전부 소수 넷째 자리까지 찍힌다(97 → `97.0000`).
- 번호는 **열 우선**으로 센다. 1열 = 1~3, 2열 = 4~6, 3열 = 7~9. 99보다 큰 것은 100.1(3), 100.2(4), 99.2(5), 99.3(6)이다.
- `find`의 결과는 열 벡터인데 `'`로 전치해서 행 벡터로 찍힌다.
- 근거: [8.3](../../textbook/ch08/8.3-find.md) ⚠️ 함정 "2차원 배열의 `find` 번호는 열 우선이다"

### Q08-17 [출력] ★★

원본: p.37 `[row,col] = find(temp>98.6)` → 변형: 기준 99

```
>> [row,col] = find(temp>99)
row =

     3
     1
     2
     3

col =

     1
     2
     2
     2

```

- 출력이 둘이면 선형 인덱스 대신 **행 번호와 열 번호**가 따로 나온다. 둘 다 열 벡터이고 `row`, `col` 순서로 찍힌다.
- Q08-16의 `3 4 5 6`과 한 줄씩 짝이 맞는다: 3 = (3,1), 4 = (1,2), 5 = (2,2), 6 = (3,2).
- 근거: [8.3](../../textbook/ch08/8.3-find.md) ⚠️ 함정 "출력 개수에 따라 결과의 뜻이 다르다"

### Q08-18 [코드] ★★

원본: p.32~p.36 `index = find(temp>98.6)'` → 변형: 다른 행렬, `>=`

```matlab
M = [4 9 2; 3 5 7; 8 1 6];
idx = find(M>=5)'
```

- `M` 줄은 출력에 없으므로 세미콜론이 **있어야** 하고, `idx` 줄은 세미콜론이 없어야 한다.
- 열 우선 번호: 8(3), 9(4), 5(5), 7(8), 6(9). `'`를 빼면 열 벡터로 찍혀 출력 모양이 달라진다.
- 근거: [8.3](../../textbook/ch08/8.3-find.md)

### Q08-19 [출력] ★★

원본: p.38 `index = find(x>9)`, `values = x(index)` → 변형: 기준 4, `x`에 세미콜론

```
index =

     2
     3
     4
     6

values =

    10
    12
     8
     5

```

- `x`는 4×3이다. 1열(1, 10, 12, 8)에서 2, 3, 4번, 2열(2, 5, 3, 3)에서 6번이 4보다 크다. 3열에는 없다.
- 행렬에서 `find`한 결과는 열 벡터이고, 그 번호로 꺼낸 `values`도 열 벡터다.
- 근거: [8.3](../../textbook/ch08/8.3-find.md)

### Q08-20 [오류] ★★

원본: p.38 `table(index,values,'VariableNames',[…])`, p.45 `table(Patient_Names',Temp',result','VariableNames',T)` → 변형: 옵션 이름을 큰따옴표로

(1)

```
All table variables must have the same number of rows.
```

- R2026a는 큰따옴표 `"VariableNames"`를 옵션 이름이 아니라 **데이터 열**로 읽는다. 1행짜리 string이 4행짜리 `index`와 행 수가 맞지 않아 오류가 난다.
- 고친 명령(둘 중 하나):

```matlab
disp(table(index, values, VariableNames=["Index Number","X Value"]))
disp(table(index, values, 'VariableNames', ["Index Number","X Value"]))
```

(2) `Patient_Names`, `Temp`, `result`가 모두 **행 벡터**(1×4)라서다. table의 변수(열)는 열 벡터여야 환자 한 명이 한 행이 된다.

> **[확인 필요]** 영문 메시지 첫 줄이 `Error using table`로 시작하는지. textbook은 한국어 환경에서 `모든 테이블 변수는 행 수가 동일해야 합니다.`를 확인했다.

- 근거: [8.3](../../textbook/ch08/8.3-find.md) `[보강]` VariableNames, [8.4](../../textbook/ch08/8.4-logical-indexing.md) table로 정리

---

## 8.4 Logical indexing

### Q08-21 [출력] ★★

원본: p.41 `fever = Temp>98.6`, `Patient_Names(fever)`, p.42 `Patient_Names(Temp>98.6)` → 변형: 기준 98, 100

```
fever =

  1×4 logical array

   1   1   0   1

ans = 

  1×3 string array

    "Jason"    "Jose"    "Rose"

ans = 

  1×2 string array

    "Jose"    "Rose"

```

- 98.2도 98보다 크므로 Jason이 들어간다. logical 배열의 1인 자리만 뽑힌다.
- 비교식을 괄호 안에 **직접** 넣어도(p.42) 결과는 같다. 100보다 큰 것은 100.3, 101이다.
- string 배열은 `ans = `(공백 하나), `1×3 string array` 줄, 큰따옴표로 찍힌다.
- 근거: [8.4](../../textbook/ch08/8.4-logical-indexing.md)

### Q08-22 [출력] ★★★

원본: p.43 `result(fever)="Sick"`, p.44 `result(~fever)="Well"` → 변형: 마지막 환자가 정상인 데이터

```
result = 

  1×3 string array

    "Sick"    <missing>    "Sick"

result = 

  1×4 string array

    "Sick"    "Well"    "Sick"    "Well"

```

- `fever`는 `1 0 1 0`이다. 없던 변수 `result`에 logical 인덱스로 대입하면 1인 자리(1, 3번)까지만 배열이 만들어진다. 그래서 길이가 4가 아니라 **3**이고, 값을 주지 않은 2번은 `<missing>`이다.
- `~fever`는 `0 1 0 1`이다. 2번과 4번에 `"Well"`을 넣으면서 배열이 4로 늘어난다.
- 슬라이드 데이터는 마지막 환자(101)가 발열이라 처음부터 1×4였다.
- 맨 위의 `clear`가 없으면 이전 실행의 `result`가 남아 결과가 달라진다.

> **[확인 필요]** 없던 변수에 `1 0 1 0` logical 인덱스로 대입했을 때 크기가 1×3인지(1×4가 아닌지).

- 근거: [8.4](../../textbook/ch08/8.4-logical-indexing.md) 새 배열 만들기, ⚠️ 함정 "`clear` 없이 다시 돌리면 이전 `result`가 남는다"

### Q08-23 [코드] ★★

원본: p.41 `fever = Temp>98.6`, `Patient_Names(fever)` → 변형: 출력에서 코드를 거꾸로 쓴다

```matlab
Patient_Names = ["Jason","Jose","Wesley","Rose"];
Temp = [98.2, 100.3, 97, 101];
fever = Temp > 98.6
Patient_Names(fever)
```

- 두 데이터 줄은 출력에 없으므로 세미콜론이 **있어야** 한다. `fever` 줄과 마지막 줄은 세미콜론이 없어야 한다.
- 마지막 줄은 변수에 담지 않아야 `ans = `로 찍힌다.
- 근거: [8.4](../../textbook/ch08/8.4-logical-indexing.md)

### Q08-24 [오류] ★★

원본: p.41 `Patient_Names(fever)` → 변형: logical 대신 double 0/1

```
Index in position 1 is invalid. Array indices must be positive integers or logical values.
```

1. `[0 1 0 1]`은 logical이 아니라 **double**이다. double은 "번호"로 읽히므로 0번 원소를 찾다가 오류가 난다.
2. 위 문장이 오류 메시지다.
3. 고친 명령(셋 중 하나):

```matlab
>> Patient_Names(logical([0 1 0 1]))
>> Patient_Names([2 4])
>> Patient_Names(Temp > 98.6)
```

> **[확인 필요]** 벡터 인덱싱에서도 `Index in position 1 is invalid.` 앞부분이 붙는지.

- 근거: [8.4](../../textbook/ch08/8.4-logical-indexing.md) ⚠️ 함정 "logical 배열의 크기는 원본과 같아야 한다", [8.1](../../textbook/ch08/8.1-relational-logical.md) ⚠️ 함정 "비교 결과는 `double`이 아니라 `logical`"

### Q08-25 [출력] ★★

원본: [보강] 고르기, 0 만들기, 지우기의 차이

```
a =

     5     3

b =

     0     5     0     0     3

x =

     5     0     3

```

- `x(x > 0)`은 조건이 참인 원소만 **고른다**. 길이가 줄어든 새 배열이다.
- `x .* (x > 0)`은 길이 그대로, 조건이 거짓인 자리를 **0으로** 만든다(-2 × 0 = 0으로 찍힌다).
- `x(x < 0) = []`은 원본 `x`에서 음수를 **지운다**. 0은 음수가 아니므로 남는다.
- 근거: [8.4](../../textbook/ch08/8.4-logical-indexing.md) ⚠️ 함정 "고르기와 지우기와 0 만들기는 다르다"

---

## 8.5.1 Simple `if`

### Q08-26 [출력] ★

원본: p.48 `G = input(…)`, 5 입력 / p.49 70 입력 → 변형: `input` 대신 값, 경계값 50

(1)

```
G is a small value equal to:
    30
```

(2) 출력 없음.

- `G = 30;`은 세미콜론이 있어 찍히지 않는다. `disp(G);`는 세미콜론이 있어도 `disp`라서 찍힌다. `disp`는 변수 이름 없이 값만 찍는다.
- `50 < 50`은 거짓이다. 조건이 거짓이면 `end` 뒤로 바로 간다.
- 근거: [8.5.1](../../textbook/ch08/8.5.1-simple-if.md)

### Q08-27 [출력] ★★

원본: p.50 `[5 25 75]` → 변형: 원소 값

(1)

```
G is a small value equal to:
     5    25    45
```

(2) 출력 없음.

- 배열 조건은 **모든 원소가 참**일 때만 참이다. (1)은 셋 다 50보다 작아서 실행된다. (2)는 50이 `G<50`을 만족하지 않아 통째로 건너뛴다.
- 근거: [8.5.1](../../textbook/ch08/8.5.1-simple-if.md) ⚠️ 함정 "배열 조건은 '모든 원소가 참'일 때만 참"

### Q08-28 [코드] ★★

원본: p.48 `G = input(…); if G<50 … end` → 변형: `input` 대신 값 20, `G` 줄의 세미콜론 제거

```matlab
G = 20
if G<50
    disp("G is a small value equal to:")
    disp(G);
end
```

- 첫 줄은 `G =`가 찍혀야 하므로 세미콜론이 **없어야** 한다. `disp` 두 줄은 세미콜론과 상관없이 찍힌다.
- 조건은 20이 참이 되는 것이면 된다(예: `G<50`).
- 근거: [8.5.1](../../textbook/ch08/8.5.1-simple-if.md)

### Q08-29 [출력] ★★★

원본: [보강] 빈 배열 조건, `all`, `any`

```
k =

  1×0 empty double row vector

all positive
some > 5
```

- 10보다 큰 원소가 없어 `k`는 빈 배열이다. **빈 배열은 거짓**이라 `"found"`는 찍히지 않는다. 오류도 나지 않는다.
- `all(x > 0)`은 모든 원소가 양수라 참, `any(x > 5)`는 7이 있어 참이다.
- 근거: [8.5.1](../../textbook/ch08/8.5.1-simple-if.md) ⚠️ 함정 "빈 배열은 거짓"

---

## 8.5.2 `if/else`

### Q08-30 [출력] ★★

원본: p.52 5 입력, p.53 -1 입력 → 변형: 1과 경계값 0

(1)

```
Enter a value of x: 1
x =

     1

y =

     0

```

(2)

```
Enter a value of x: 0
x =

     0

The input to the log function must be positive
```

- 슬라이드 코드도 `x = input(…)` 줄에 세미콜론이 없어서 `x`가 다시 찍힌다.
- `log(1)`은 정확히 0이라 `0`으로 찍힌다(`0.0000`이 아니다).
- 0은 `x > 0`을 만족하지 않으므로 `else` 쪽이 실행된다.
- 근거: [8.5.2](../../textbook/ch08/8.5.2-if-else.md)

### Q08-31 [출력] ★★★

원본: p.52~p.53 "There should never be a comparison listed on the else line" → 변형: `else` 줄에 조건을 씀

(1)

```
ans =

  logical

   1

The input to the log function must be positive
```

(2)

```
y =

    1.6094

```

- `else x <= 0`의 `x <= 0`은 조건이 아니라 **`else` 블록의 첫 문장**이다. 세미콜론이 없으니 비교 결과가 `ans`로 찍힌다.
- (2)는 `if` 쪽만 실행되고 `else` 블록 전체(그 비교 문장 포함)는 건너뛴다. 결과가 맞아 보여서 더 위험하다.
- 조건이 필요하면 `elseif`를 쓴다.
- 근거: [8.5.2](../../textbook/ch08/8.5.2-if-else.md) `[보강]` "쓰면 어떻게 되는가?"

### Q08-32 [오류] ★★

원본: p.55 HINT `beep` vs `error` → 변형: 두 코드 뒤에 `disp("Done")`을 붙여 계속 실행 여부를 드러냄

(1) A:

```
Input must be positive
Done
```

B:

```
Input must be positive
```

- B의 메시지는 빨간 오류 메시지로 찍히고 프로그램이 멈춘다. `Done`은 찍히지 않는다.

(2) `beep` + `disp`는 소리와 메시지만 내고 **다음 줄을 계속 실행**하지만, `error`는 메시지를 내고 **프로그램을 중단**한다.

> **[확인 필요]** 스크립트에서 `error`를 부를 때 메시지 위에 `Error using B (line 6)` 같은 머리줄이 붙는지.

- 근거: [8.5.2](../../textbook/ch08/8.5.2-if-else.md) HINT — `beep`, ⚠️ 함정 "`beep` + `disp`는 프로그램을 멈추지 않는다"

### Q08-33 [코드] ★★

원본: p.53 `x = input(…)`, -1 입력 → 변형: `input` 대신 값 -4

```matlab
x = -4
if x > 0
    y = log(x)
else
    disp("The input to the log function must be positive")
end
```

- 첫 줄은 세미콜론이 **없어야** `x =`가 찍힌다. `y` 줄은 실행되지 않으므로 세미콜론이 있든 없든 출력에 영향이 없다.
- `else` 줄에는 조건을 쓰지 않는다.
- 근거: [8.5.2](../../textbook/ch08/8.5.2-if-else.md)

### Q08-34 [출력] ★★

원본: p.54 "x가 음수가 섞인 배열이면?" → 변형: `log` 대신 `sqrt`, 두 배열

```
All inputs must be positive
y =

     2     1     3

```

- 첫 배열은 -1 하나 때문에 조건 전체가 거짓이라 `else`로 간다. 4와 9도 계산되지 않는다.
- 둘째 배열은 모두 양수라 `if` 쪽이 실행된다. 제곱근이 모두 정수라 정수 형식으로 찍힌다.
- 근거: [8.5.2](../../textbook/ch08/8.5.2-if-else.md) 배열을 넣으면?, ⚠️ 함정 "배열은 '전부 참'일 때만 `if` 쪽"

---

## 8.5.3 `elseif`

### Q08-35 [출력] ★★

원본: p.57 `age = input(…)`, 50 입력 → 변형: 경계값 18, 70

(1)

```
age =

    18

You may have a standard license
```

(2)

```
age =

    70

Drivers over 70 require a special license
```

- 18은 `age<16`, `age<18`이 거짓이고 `age<70`이 처음 참인 조건이다.
- 70은 `age<70`도 거짓이라 `else`로 간다. 메시지는 "over 70"이지만 코드상 **70세도** special이다.
- 근거: [8.5.3](../../textbook/ch08/8.5.3-elseif.md) ⚠️ 함정 "'over 70' 같은 메시지와 실제 부등호를 구분할 것"

### Q08-36 [변형] ★★★

원본: p.57 코드, p.58 flowchart → 변형: 조건 순서를 바꿈

1. 출력: `You may have a standard license`
2. 절대 출력되지 않는 메시지: `Sorry - You'll have to wait`, `You may have a youth license`
3. 첫 마름모 `age<70`이 70 미만을 모두 가져간다. 그래서 둘째 마름모(`age<16`)에 도착하는 값은 70 이상뿐이고, `age<16`과 `age<18`은 영원히 거짓이다. `elseif`는 위에서부터 **처음 참인 블록 하나만** 실행한다.

- 근거: [8.5.3](../../textbook/ch08/8.5.3-elseif.md) ⚠️ 함정 "조건 순서가 틀리면 뒤의 조건이 영원히 실행되지 않는다"

### Q08-37 [코드] ★★

원본: p.57 `if age<16 … elseif age<18 … elseif age<70 … else … end` → 변형: 나이 대신 점수, 부등호 방향 `>=`

```matlab
score = 85
if score >= 90
    disp("Grade A")
elseif score >= 80
    disp("Grade B")
else
    disp("Grade C")
end
```

- 첫 줄은 세미콜론이 **없어야** `score =`가 찍힌다.
- 둘째 조건을 `score >= 80 & score < 90`으로 쓸 필요가 없다. 90 이상은 앞에서 이미 배제됐다(p.57 "line 5를 `age>=16 & age<18`로 쓸 필요가 없다").
- 근거: [8.5.3](../../textbook/ch08/8.5.3-elseif.md) ⚠️ 함정 "앞에서 배제된 범위를 다시 쓸 필요가 없다"

### Q08-38 [오류] ★★

원본: p.56 `if/elseif/else` 구문, p.57 → 변형: `elseif`를 `else if`로 띄어 씀

```
At least one END is missing: the statement may begin here.
```

1. `else if`는 `else` 블록 안에 **새 `if`를 중첩**한 것이다. 바깥 `if`와 안쪽 `if`가 각각 `end`를 하나씩 필요로 하는데 `end`가 하나뿐이다.
2. 핵심 문장은 위와 같다(파일 구문 오류라서 한 줄도 실행되지 않는다).
3. 고치는 법: (가) `else if`를 `elseif`로 붙여 쓴다. (나) 중첩을 유지하려면 맨 끝에 `end`를 하나 더 쓴다. 어느 쪽이든 17세는 `youth`가 찍힌다.

> **[확인 필요]** R2026a의 정확한 메시지 문구와 머리줄(`Error: File: … Line: 2 Column: 1`).

- 근거: [8.5.3](../../textbook/ch08/8.5.3-elseif.md) ⚠️ 함정 "`elseif` ≠ `else if`"

---

## 8.5.4 `switch/case`

### Q08-39 [출력] ★★

원본: p.60 `"Honolulu"` 입력 → 변형: `input` 대신 값, 대소문자

(1)

```
city = 

    "Denver"

$150
```

(2)

```
city = 

    "denver"

Not on file
```

- `city`가 string이라 `city = `(공백 하나)와 큰따옴표로 찍힌다.
- `case`는 대소문자까지 **정확히 같아야** 맞는다. `"denver"`는 어느 `case`에도 맞지 않아 `otherwise`로 간다.
- 근거: [8.5.4](../../textbook/ch08/8.5.4-switch-case.md) `[보강]` 대소문자, ⚠️ 함정 "대소문자·공백까지 정확히 같아야 한다"

### Q08-40 [출력] ★★

원본: p.61~p.62 `input(…,"s")`, `Denver` 입력 → 변형: `Boston` 입력

(1)

```
Enter the name of a city :Boston
city =

    'Boston'

$345
```

(2) Size `1x6`(슬라이드 p.61 Workspace 표기 그대로), Class `char`.

- `input`의 두 번째 인수 `"s"`는 입력을 **문자 그대로** 받는다. 결과는 char라서 `city =`(공백 없음)와 작은따옴표로 찍힌다.
- 슬라이드는 그래서 `case`도 char(`'Boston'`)로 쓰라고 한다. R2026a의 `switch`는 char와 string을 섞어도 맞지만, 시험에서 자료형을 물으면 답은 char다.
- 근거: [8.5.4](../../textbook/ch08/8.5.4-switch-case.md) `[보강]` "R2026a에서는 char와 string을 섞어도 맞는다"

### Q08-41 [변형] ★★★

원본: [보강] p.59 `switch` 구문 "variable is equal to option"에서 → 변형: `case`에 부등호

(1) `You may have a license`
(2) `Sorry - You'll have to wait`

- `case age < 16`은 범위 검사가 아니다. 먼저 `age < 16`을 계산해 **logical 1**을 만들고, `switch`는 "`age`가 1과 같은가"를 본다.
- (1) 12 ≠ 1이라 `otherwise`로 간다. 12세인데 "license"가 찍힌다.
- (2) 1 == 1이라 우연히 맞는다.
- 범위는 `switch`가 아니라 `if/elseif`로 쓴다.
- 근거: [8.5.4](../../textbook/ch08/8.5.4-switch-case.md) ⚠️ 함정 "`case`에는 부등호를 쓸 수 없다"

### Q08-42 [코드] ★★

원본: [보강] 한 `case`에 여러 값

```matlab
day = 7
switch day
    case {1, 7}
        disp("Weekend")
    case {2, 3, 4, 5, 6}
        disp("Weekday")
    otherwise
        disp("Invalid day")
end
```

- 첫 줄은 세미콜론이 **없어야** `day =`가 찍힌다.
- 여러 값은 **중괄호** `{ }`로 묶는다. `case [1, 7]`은 "`day`가 배열 `[1 7]`과 같은가"가 되어 맞지 않는다.
- 근거: [8.5.4](../../textbook/ch08/8.5.4-switch-case.md) `[보강]` 여러 값을 한 `case`에, ⚠️ 함정 "여러 값은 `{ }`로 묶는다"

---

## 8.5.5 `menu`

### Q08-43 [출력] ★★

원본: p.64~p.65 `Denver` 선택 → 변형: `Honolulu` 선택

```
city =

     3

Stay home and study
```

- `menu`는 누른 버튼의 **번호**를 돌려준다. 버튼 이름이 아니다. `city`는 double 3이고, 세미콜론이 없어 찍힌다.
- `prompt`, `list` 줄은 세미콜론이 있어 찍히지 않는다.
- 근거: [8.5.5](../../textbook/ch08/8.5.5-menu.md)

### Q08-44 [변형] ★★★

원본: p.64~p.65 → 변형: 버튼 순서를 바꿈, 창 닫기

(1)

```
city =

     1

$345
```

(2)

```
city =

     0

```

- (1) `Denver`가 첫 번째 버튼이 되어 1이 돌아온다. `case`는 번호로 갈리므로 Boston 요금이 찍힌다. 버튼 순서를 바꾸면 `case` 번호도 바꿔야 한다.
- (2) 창을 닫으면 `menu`는 **0**을 돌려준다. 0에 맞는 `case`도 `otherwise`도 없어서 아무 메시지도 찍히지 않는다. 슬라이드는 "`otherwise`가 필요 없다"고 하지만 이 경우는 조용히 지나간다.
- 근거: [8.5.5](../../textbook/ch08/8.5.5-menu.md) ⚠️ 함정 "`menu`는 번호를 돌려준다", "창을 닫으면 0"

### Q08-45 [단답] ★

원본: p.63 menu 설명, p.69 Summary

1. 사용자가 누른 버튼의 번호(1, 2, 3, …). 창을 닫으면 0.
2. `listdlg`, `doc listdlg`.
3. App Designer(슬라이드 표현은 "app creator"). `menu`와 `listdlg`는 2006년 이전에 도입됐다.
4. 사용자가 목록에 있는 값만 고를 수 있어서 **사용자 실수의 여지가 줄어든다**(철자·대소문자 오류가 없다).

- 근거: [8.5.5](../../textbook/ch08/8.5.5-menu.md)
