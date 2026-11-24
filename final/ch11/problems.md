# Chapter 11 기말 대비 객관식 20문제

범위: Chapter 11 Other Kinds of Arrays 슬라이드 전체(11.1~11.12). 전부 단일 정답 객관식이다.
MATLAB을 실행하지 않고 손으로 추적해 작성했다. 해답은 [solutions.md](solutions.md).

## 문제 11-01 (절 11.1 · 옳은 설명 고르기)

MATLAB의 floating-point 데이터에 대한 설명으로 옳은 것을 고르시오.

① double 값 하나는 4 bytes(32 bits)를 차지한다.

② `realmax("single")`은 `realmax`보다 작은 값이다.

③ `x = 5e400`을 입력하면 `x`에 `realmax` 값이 저장된다.

④ `x = 1e-400`을 입력하면 underflow 오류가 발생한다.

⑤ single은 double보다 저장 공간을 두 배 쓰므로 round-off error가 더 작다.

---

## 문제 11-02 (절 11.1 · 옳은 설명 고르기)

다음 코드를 실행한 뒤 Workspace 창의 Bytes 열에 표시되는 값을 `A`, `B`, `C`, `D` 순서로 바르게 나열한 것을 고르시오.

```matlab
A = [2 4 6; 8 10 12];
B = single(A);
C = int8(A);
D = uint16(A);
```

① 48, 24, 6, 6

② 48, 48, 6, 12

③ 48, 24, 48, 96

④ 48, 96, 6, 12

⑤ 48, 24, 6, 12

---

## 문제 11-03 (절 11.1 · 출력 고르기)

다음 코드의 출력을 고르시오.

```matlab
v = [2 -1 3 0 4];
s = cumsum(v);
r = s(4) - s(2)
```

① `r = 1`

② `r = 2`

③ `r = 4`

④ `r = 3`

⑤ `r = 7`

---

## 문제 11-04 (절 11.2 · 빈칸에 들어갈 코드 고르기)

세 이름을 행마다 하나씩 담은 3×5 character array `R`을 만들려고 한다. 빈칸에 들어갈 코드를 고르시오.

```matlab
R = ________;
size(R)        % 결과: 3 5
R(2,:)         % 결과: 'Jisoo'
```

① `['Kim';'Jisoo';'Lee']`

② `{'Kim';'Jisoo';'Lee'}`

③ `["Kim";"Jisoo";"Lee"]`

④ `['Kim','Jisoo','Lee']`

⑤ `char('Kim','Jisoo','Lee')`

---

## 문제 11-05 (절 11.2 · 출력 고르기)

`double('A')`가 `65`일 때, 다음 코드를 실행한 뒤 `x`, `y`, `z`의 값으로 옳은 것을 고르시오.

```matlab
x = 'B' + 2;
y = "B" + 2;
z = ['B', 67];
```

① `x`는 `68`, `y`는 `"B2"`, `z`는 `'BC'`

② `x`는 `68`, `y`는 `"D"`, `z`는 `'BC'`

③ `x`는 `'D'`, `y`는 `"B2"`, `z`는 `'B67'`

④ `x`는 `68`, `y`는 `68`, `z`는 `[66 67]`

⑤ `x`는 `'D'`, `y`는 `"D"`, `z`는 `'BC'`

---

## 문제 11-06 (절 11.2 · 같은 결과를 내는 코드 고르기)

다음 코드와 같은 값(같은 타입, 같은 내용)의 `w`를 만드는 코드를 고르시오. `double('a')`는 `97`이다.

```matlab
w = ['a', 98];
```

① `w = 'a' + 'b';`

② `w = "a" + 98;`

③ `w = ['a', '98'];`

④ `w = ['a', char(98)];`

⑤ `w = [97, 98];`

---

## 문제 11-07 (절 11.3 · 옳은 설명 고르기)

Symbolic data에 대한 설명으로 슬라이드 기준 옳은 것을 고르시오. (Symbolic Math Toolbox가 설치되어 있다고 가정한다.)

① symbolic array는 symbolic variable과 function handle을 저장한다.

② `syms x` 다음 `S = x^2-2`를 입력하면 `x`에 숫자 값이 없으므로 오류가 난다.

③ `syms x` 다음 `S = x^2-2`를 입력하면 `S`에는 `x = 0`일 때의 값 `-2`가 저장된다.

④ 데이터 타입 트리에서 Symbolic은 Numeric의 하위 분류다.

⑤ symbolic array는 table, cell array와 같은 Multiple Data Type Arrays에 속한다.

---

## 문제 11-08 (절 11.4 · 출력 고르기)

다음 코드의 출력을 고르시오.

```matlab
a = [4 7 1 9 3];
b = [5 2 1 8 6];
k = a > b;
c = a + b;
c(k)
```

① `ans = 2 4`

② `ans = 9 17`

③ `ans = 7 9`

④ `ans = 9 2 9`

⑤ `ans = 0 9 0 17 0`

---

## 문제 11-09 (절 11.4 · 같은 결과를 내는 코드 고르기)

`x`와 `y`가 다음과 같을 때, `find(x > y)`와 같은 결과를 내는 코드를 고르시오.

```matlab
x = [4 9 2 7 5];
y = [6 3 2 1 8];
```

① `find(x)`

② `x(x > y)`

③ `find(x - y)`

④ `sum(x > y)`

⑤ `z = x > y; find(z)`

---

## 문제 11-10 (절 11.5 · 옳은 설명 고르기)

sparse array에 대한 설명으로 옳은 것을 고르시오. (슬라이드 기준)

① `U = eye(400)`을 full double로 저장하면 3,200 bytes다.

② int8 배열도 full array와 sparse array 중 골라 저장할 수 있다.

③ sparse 형식은 0이 아닌 값과 그 위치만 저장한다.

④ logical 배열은 sparse 형식으로 저장할 수 없다.

⑤ 대부분이 0인 배열은 sparse 형식이 full 형식보다 메모리를 더 쓴다.

---

## 문제 11-11 (절 11.6 · 출력 고르기)

다음 코드를 실행한 뒤 `c`와 `idx`로 옳은 것을 고르시오.

```matlab
G = categorical(["mid","low","high","low","mid","low"]);
c = categories(G);
idx = find(G == 'low');
```

① `c`는 3×1 cell `{'high'}`, `{'low'}`, `{'mid'}`, `idx`는 `2 4 6`

② `c`는 3×1 cell `{'mid'}`, `{'low'}`, `{'high'}`, `idx`는 `2 4 6`

③ `c`는 3×1 cell `{'high'}`, `{'low'}`, `{'mid'}`, `idx`는 `3`

④ `c`는 3×1 cell `{'high'}`, `{'low'}`, `{'mid'}`, `idx`는 `2`

⑤ `c`는 3×1 cell `{'mid'}`, `{'low'}`, `{'high'}`, `idx`는 `2`

---

## 문제 11-12 (절 11.7 · 출력 고르기)

다음 코드의 출력을 고르시오. 2024년은 윤년이다.

```matlab
yr = [2024; 2024];
mo = [2; 3];
dy = [28; 1];
X = datetime(yr, mo, dy);
D = diff(X)
```

① `D = 2` (double)

② `D =` duration `24:00:00`

③ `D =` duration `48:00:00`

④ `D =` duration `2:00:00`

⑤ 오류. datetime 배열에는 `diff`를 쓸 수 없다.

---

## 문제 11-13 (절 11.7 · 옳은 설명 고르기)

`DATE`는 `20150101`, `20150201`, …, `20151201`을 담은 12×1 double이고, `EMXT`는 월별 최고 기온을 담은 12×1 double이다. 다음 코드에 대한 설명으로 옳은 것을 고르시오.

```matlab
bar(DATE, EMXT)
d = datetime(DATE, 'ConvertFrom', 'YYYYMMDD');
bar(d, EMXT)
```

① `bar(DATE, EMXT)`는 x축 눈금이 `×10^7` 지수가 붙은 숫자로 표시되어 날짜로 읽기 어렵다.

② 2행을 실행하면 `DATE` 자체가 datetime 배열로 바뀐다.

③ `bar(d, EMXT)`에서는 막대 높이(`EMXT` 값)도 날짜 형식에 맞게 바뀐다.

④ `diff(d)`의 결과는 일 수를 담은 double 배열이다.

⑤ `bar(d, EMXT)`의 x축 눈금도 `20150101`처럼 원래 숫자로 표시된다.

---

## 문제 11-14 (절 11.8 · 출력 고르기)

다음 코드에서 `size(B)`와 `B(2,3)`의 결과로 옳은 것을 고르시오.

```matlab
p = [1 2 3 4];
q = p + 10;
r = p + 20;
A = cat(3, p', q', r');
B = squeeze(A);
size(B)
B(2,3)
```

① `size(B)`는 `4 1 3`, `B(2,3)`은 `22`

② `size(B)`는 `3 4`, `B(2,3)`은 `13`

③ `size(B)`는 `4 3`, `B(2,3)`은 `22`

④ `size(B)`는 `4 3`, `B(2,3)`은 `13`

⑤ 4행에서 오류. 열 벡터는 3차원으로 이어 붙일 수 없다.

---

## 문제 11-15 (절 11.9 · 출력 고르기)

다음 코드를 실행한 뒤 `d`의 값을 고르시오.

```matlab
c = {[5 6 7], 'hello', single([1 2; 3 4])};
a = c{3}(2,1);
d = c{1}(end) + a
```

① `d = 9`

② `d = 10`

③ `d = 11`

④ 3행에서 오류. `c{1}`은 cell이라 산술 연산을 할 수 없다.

⑤ 3행에서 오류. double과 single은 더할 수 없다.

---

## 문제 11-16 (절 11.9 · 오류가 나는 줄·원인 고르기)

다음 코드를 위에서부터 실행할 때 처음으로 오류가 나는 줄과 원인을 고르시오.

```matlab
A = [3 6 9];          % 1행
B = "Good";           % 2행
c = {A, B};           % 3행
x = c{1} + 1;         % 4행
y = c(2);             % 5행
z = c(1) * 2;         % 6행
w = c{1}(2);          % 7행
```

① 3행. 서로 다른 타입의 배열은 한 cell array에 담을 수 없다.

② 4행. cell array에서 꺼낸 값에는 산술 연산을 할 수 없다.

③ 5행. cell array에는 소괄호 `( )` 인덱싱을 쓸 수 없다.

④ 6행. `c(1)`은 1×1 cell array라서 곱셈을 할 수 없다.

⑤ 7행. 중괄호 `{ }` 뒤에 소괄호 `( )`를 바로 이어 쓸 수 없다.

---

## 문제 11-17 (절 11.10 · 옳은 설명 고르기)

다음 코드를 실행한 뒤의 structure array `s`에 대한 설명으로 옳은 것을 고르시오.

```matlab
s.name = "Kim";
s.score = [80 95];
s(3).name = "Lee";
```

① `size(s)`는 `1 1`이다. field만 늘었기 때문이다.

② `size(s)`는 `1 2`이다.

③ `size(s)`는 `1 3`이고, `s(2).score`는 빈 배열 `[]`이다.

④ `size(s)`는 `1 3`이고, `s(3).score`는 `[80 95]`다.

⑤ `s(1).score(2)`는 `80`이다.

---

## 문제 11-18 (절 11.11 · 빈칸에 들어갈 코드 고르기)

table `T`의 열 이름을 `Student`, `Major`, `Points`로 정하려고 한다. 슬라이드에서 설명한 규칙에 맞는 빈칸 코드를 고르시오.

```matlab
Name = ["Kim";"Lee";"Park"];
Dept = categorical({'EE';'ME';'EE'});
Score = [88; 92; 75];
cols = ["Student","Major","Points"];
T = table(Name, Dept, Score, ________);
```

① `"VariableNames", cols`

② `'VariableNames', cols`

③ `'RowNames', cols`

④ `cols`

⑤ `'VariableNames', 'cols'`

---

## 문제 11-19 (절 11.11 · 옳은 설명 고르기)

다음 코드와 table에 대한 설명으로 옳은 것을 고르시오.

```matlab
Name = ["Kim";"Lee";"Park"];
Dept = categorical({'EE';'ME';'EE'});
Score = [88; 92; 75];
T = table(Name, Dept, Score);
T.Properties.RowNames = T.Name;
A = T("Lee", :);
B = T(["Kim","Park"], "Score");
C = T(3, 2);
```

① `B`는 값 `88`과 `75`를 담은 2×1 double 열 벡터다.

② `C`는 categorical 값 `EE` 하나다.

③ 행 이름을 붙였으므로 `T`의 크기는 3×4가 된다.

④ `uiimport`의 import wizard에서는 0/1로 된 열을 logical 타입으로 바로 지정할 수 있다.

⑤ `A`는 `Lee`의 행 하나를 담은 1×3 table이다.

---

## 문제 11-20 (절 11.12 · 출력 고르기)

timetable `A`와 `B`가 다음과 같다. 두 timetable 사이에 같은 시각은 없다.

- `A`: 행 시간 `00:00`, `01:00`, `02:00`(3행), 변수 `Temp` 1개
- `B`: 행 시간 `00:30`, `01:30`(2행), 변수 `Hum` 1개

`C = synchronize(A, B)`의 크기와 `C`에 들어 있는 `NaN`의 개수로 옳은 것을 고르시오.

① 5×2, `NaN` 0개 (빈 자리는 0으로 채운다)

② 5×3, `NaN` 5개

③ 3×2, `NaN` 3개

④ 5×2, `NaN` 5개

⑤ 오류. 같은 시각이 없는 timetable은 synchronize할 수 없다.

---
