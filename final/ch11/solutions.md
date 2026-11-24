# Chapter 11 해답

## 정답표

| 문제 | 정답 | 절 | 유형 | 주제 |
|---|---|---|---|---|
| 11-01 | ② | 11.1 | 옳은 설명 고르기 | realmax/realmin, Inf·0, single 범위 |
| 11-02 | ⑤ | 11.1 | 옳은 설명 고르기 | double·single·integer 바이트 수 |
| 11-03 | ④ | 11.1 | 출력 고르기 | cumsum 부분합 |
| 11-04 | ⑤ | 11.2 | 빈칸에 들어갈 코드 고르기 | char 함수의 padding |
| 11-05 | ① | 11.2 | 출력 고르기 | 'B'+2 vs "B"+2 vs ['B',67] |
| 11-06 | ④ | 11.2 | 같은 결과를 내는 코드 고르기 | 문자·숫자 혼합 배열은 char |
| 11-07 | ① | 11.3 | 옳은 설명 고르기 | symbolic array, syms |
| 11-08 | ② | 11.4 | 출력 고르기 | logical indexing |
| 11-09 | ⑤ | 11.4 | 같은 결과를 내는 코드 고르기 | find(z)와 find(x>y) |
| 11-10 | ③ | 11.5 | 옳은 설명 고르기 | sparse 저장 방식 |
| 11-11 | ① | 11.6 | 출력 고르기 | categories 정렬, find(G=='low') |
| 11-12 | ③ | 11.7 | 출력 고르기 | datetime 차이는 duration, 윤년 |
| 11-13 | ① | 11.7 | 옳은 설명 고르기 | double 날짜 vs ConvertFrom 그래프 |
| 11-14 | ③ | 11.8 | 출력 고르기 | cat(3,…)과 squeeze |
| 11-15 | ② | 11.9 | 출력 고르기 | c{k}(i,j) 인덱싱 |
| 11-16 | ④ | 11.9 | 오류가 나는 줄·원인 고르기 | ( )는 cell, { }는 내용물 |
| 11-17 | ③ | 11.10 | 옳은 설명 고르기 | struct 확장과 빈 field |
| 11-18 | ② | 11.11 | 빈칸에 들어갈 코드 고르기 | 'VariableNames' 작은따옴표 |
| 11-19 | ⑤ | 11.11 | 옳은 설명 고르기 | RowNames 인덱싱, T(r,c)는 table, uiimport |
| 11-20 | ④ | 11.12 | 출력 고르기 | synchronize 결과 크기와 NaN |

## 11-01 — 정답 ②

`realmax("single")`은 `3.4028e+38`, `realmax`(double)는 `1.7977e+308`이다. single은 double 저장 공간의 절반만 쓰므로 범위가 훨씬 좁다.

- ① double은 8 bytes = 64 bits다. 4 bytes는 single.
- ③ `realmax`보다 큰 값은 `Inf`가 된다. `realmax`에 머무르지 않는다.
- ④ `realmin`보다 훨씬 작은 값은 오류 없이 `0`이 된다.
- ⑤ single은 double의 절반을 쓰고, round-off error가 더 문제가 된다(조화급수 예제).

복습: [11.1 Numeric Data Types](../../textbook/ch11/11.1-numeric-data-types.md)

## 11-02 — 정답 ⑤

원소가 6개(2×3)다. 원소 하나의 크기: double 8 bytes, single 4 bytes(double의 절반), int8은 이름의 숫자가 비트 수이므로 8 bits = 1 byte, uint16은 16 bits = 2 bytes.

- A: 6 × 8 = 48, B: 6 × 4 = 24, C: 6 × 1 = 6, D: 6 × 2 = 12.

- ① uint16도 1 byte로 본 경우. 16은 비트 수라 2 bytes다.
- ② single을 double과 같은 8 bytes로 본 경우.
- ③ 이름의 숫자를 바이트 수로 착각한 경우(int8을 8 bytes, uint16을 16 bytes).
- ④ single이 double의 두 배라고 거꾸로 본 경우.

복습: [11.1 Numeric Data Types](../../textbook/ch11/11.1-numeric-data-types.md)

## 11-03 — 정답 ④

`cumsum`의 k번째 원소는 1번째부터 k번째까지의 합이다.

- `v = [2 -1 3 0 4]` → `s = [2 1 4 4 8]`
- `s(4) - s(2) = 4 - 1 = 3`. 즉 `v(3) + v(4)`.

- ① `v(4) - v(2) = 0 - (-1) = 1`. 누적합이 아니라 원래 벡터에서 뺀 경우.
- ② `v(2) + v(3) + v(4) = 2`. `s(1)`을 빼야 하는데 `s(2)`를 빼면 2번째 원소까지 빠진다는 점을 놓친 경우.
- ③ `s(4)`만 본 경우.
- ⑤ `s(5) - s(2) = 7`. 인덱스를 하나 밀린 경우.

복습: [11.1 Numeric Data Types](../../textbook/ch11/11.1-numeric-data-types.md)

## 11-04 — 정답 ⑤

character array는 직사각형이어야 하므로 길이가 다른 이름을 행으로 쌓으려면 공백으로 채워야(padding) 한다. `char` 함수가 이 일을 한다. 가장 긴 `'Jisoo'`(5글자)에 맞춰 3×5가 되고, `R(1,:)`은 `'Kim  '`(공백 2개 포함)이다. `R(2,:)`은 `'Jisoo'`.

- ① 행마다 글자 수(3, 5, 3)가 달라 세로로 이어 붙일 수 없다. 오류.
- ② cell array of char다. 크기 3×1이고 char 배열이 아니다.
- ③ string 배열이다. 크기 3×1.
- ④ 가로로 이어 붙여 1×11 char `'KimJisooLee'`가 된다.

복습: [11.2 Character and String Data](../../textbook/ch11/11.2-character-and-string-data.md)

## 11-05 — 정답 ①

- `'B' + 2`: 계산에 문자와 숫자가 섞이면 문자를 10진 값으로 바꾼다. 66 + 2 = `68`(double).
- `"B" + 2`: string에서 `+`는 이어 붙이기다. `"B2"`.
- `['B', 67]`: 배열에 문자와 숫자를 섞으면 전부 char가 된다. 67은 `'C'`이므로 `'BC'`(1×2 char).

- ② string `+`를 숫자 덧셈으로 본 경우.
- ③ char `+`의 결과를 문자로 본 경우이고, `['B',67]`에서 67을 글자 `'67'`로 본 경우.
- ④ string도 10진 값으로 계산된다고 보고, 혼합 배열을 double로 본 경우.
- ⑤ 결과를 모두 문자로 본 경우.

복습: [11.2 Character and String Data](../../textbook/ch11/11.2-character-and-string-data.md)

## 11-06 — 정답 ④

`['a', 98]`은 98을 문자 `'b'`로 바꿔 1×2 char `'ab'`를 만든다. `char(98)`도 `'b'`이므로 `['a', char(98)]`은 같은 `'ab'`다.

- ① 계산이므로 97 + 98 = `195`(double).
- ② string 이어 붙이기. `"a98"`(string).
- ③ `'98'`은 두 글자 char다. `'a98'`(1×3 char).
- ⑤ 숫자만 있으므로 double `[97 98]`이다. 보기에는 같은 숫자지만 char가 아니다.

복습: [11.2 Character and String Data](../../textbook/ch11/11.2-character-and-string-data.md)

## 11-07 — 정답 ①

슬라이드: "Symbolic arrays store both function handles and symbolic variables."

- ② `syms x`로 만든 `x`는 symbolic variable이라 값이 없어도 식 `S = x^2-2`를 만들 수 있다.
- ③ `S`는 숫자가 아니라 식 `x^2 - 2` 자체를 저장한다.
- ④ 데이터 타입 트리에서 Symbolic은 Text, Logical, Numeric, Categorical, Time, Function Handle과 나란한 별도 항목이다.
- ⑤ 배열 종류 트리에서 Symbolic은 Single Data Type Arrays 쪽이다. Multiple Data Type Arrays는 table, cell, structure, map container, timetable.

복습: [11.3 Symbolic Data](../../textbook/ch11/11.3-symbolic-data.md)

## 11-08 — 정답 ②

- `k = a > b` → `4>5, 7>2, 1>1, 9>8, 3>6` → `[0 1 0 1 0]`(logical)
- `c = a + b` → `[9 9 2 17 9]`
- `c(k)`는 `k`가 true인 2, 4번째 원소 → `9 17`

- ① `find(k)`의 결과(위치)다.
- ③ `a(k)`의 결과다.
- ④ `c(~k)`의 결과다. 1>1은 false라는 점은 맞게 처리했지만 조건을 뒤집었다.
- ⑤ `c .* k`의 결과다. logical indexing은 false 자리를 0으로 남기지 않고 아예 뺀다.

복습: [11.4 Logical Data](../../textbook/ch11/11.4-logical-data.md)

## 11-09 — 정답 ⑤

`x > y` → `[0 1 0 1 0]`이므로 `find(x > y)` = `2 4`. `z = x > y`로 이름을 붙여도 `z`는 같은 logical 배열이므로 `find(z)`도 `2 4`다(슬라이드의 "Why?").

- ① `x`의 원소가 모두 0이 아니므로 `1 2 3 4 5`.
- ② 위치가 아니라 값 `9 7`을 꺼낸다.
- ③ `x - y = [-2 6 0 6 -3]`에서 0이 아닌 위치 `1 2 4 5`. 음수도 0이 아니다.
- ④ true의 개수 `2`.

복습: [11.4 Logical Data](../../textbook/ch11/11.4-logical-data.md)

## 11-10 — 정답 ③

슬라이드: sparse 형식은 0이 아닌 값만 저장하고 그 위치를 기억해 메모리를 아낀다.

- ① 원소가 400 × 400 = 160,000개이므로 160,000 × 8 = 1,280,000 bytes. 3,200은 400 × 8로 원소 수를 잘못 센 값.
- ② 슬라이드는 full/sparse를 고를 수 있는 것이 double과 logical이라고 했다.
- ④ logical도 sparse로 저장할 수 있다.
- ⑤ 반대다. `eye(1000)`은 full 8,000,000 bytes, sparse 24,008 bytes.

복습: [11.5 Sparse Arrays](../../textbook/ch11/11.5-sparse-arrays.md)

## 11-11 — 정답 ①

- `categories(G)`는 범주 목록을 cell array로 돌려준다. 중복 없이 정렬된 순서(슬라이드에서 입력 A C B D E … → 출력 A B C D E)이므로 `high`, `low`, `mid`(3×1 cell).
- `G == 'low'` → `[0 1 0 1 0 1]`, `find` → `2 4 6`.

- ② 입력에 처음 나온 순서로 본 경우.
- ③ `low`의 개수(3)를 위치로 착각한 경우.
- ④ 범주 목록에서 `low`의 번호(2)를 답한 경우. `find`는 `G`의 원소 위치를 준다.
- ⑤ ②와 ④의 착각을 겹친 경우.

복습: [11.6 Categorical Arrays](../../textbook/ch11/11.6-categorical-arrays.md)

## 11-12 — 정답 ③

`X`는 2024-02-28, 2024-03-01을 담은 2×1 datetime이다. datetime끼리의 차이(`diff` 또는 `X(2)-X(1)`)는 duration이고 시간:분:초로 표시된다. 2024년은 윤년이라 2월 29일이 있으므로 2일 = 48시간 → `48:00:00`.

- ① duration은 double 일 수가 아니다.
- ② 윤년을 무시하고 1일로 계산한 경우.
- ④ 2일을 2시간으로 표시한 경우. duration 표시의 첫 자리는 시간이다.
- ⑤ 슬라이드는 `diff`와 뺄셈 두 방법을 모두 보였다.

복습: [11.7 Time Arrays](../../textbook/ch11/11.7-time-arrays.md)

## 11-13 — 정답 ①

`DATE`가 double이면 `bar`는 20150101 같은 큰 수를 그대로 x값으로 쓰므로 눈금이 `2.015010 ×10^7` 형태가 되어 읽기 어렵다. `datetime(DATE,'ConvertFrom','YYYYMMDD')`로 바꾸면 `Jan 2015` 같은 날짜 눈금이 된다.

- ② 결과는 새 변수 `d`에 저장된다. `DATE`는 그대로 double이다.
- ③ 바뀌는 것은 x축 데이터뿐이다. `EMXT`는 그대로다.
- ④ datetime 배열의 `diff`는 duration 배열이다.
- ⑤ datetime이면 눈금이 표준 날짜 표기로 나온다. 이것이 변환하는 이유다.

복습: [11.7 Time Arrays](../../textbook/ch11/11.7-time-arrays.md)

## 11-14 — 정답 ③

- `p'`, `q'`, `r'`는 모두 4×1 열 벡터다.
- `cat(3, …)`은 첫 인수 3번 차원(page)으로 이어 붙인다 → `A`는 4×1×3.
- `squeeze`는 크기 1인 차원을 없앤다 → `B`는 4×3. page k가 `B`의 k번째 열이 된다: `B = [p' q' r']`.
- `B(2,3)` = `r(2)` = 22.

- ① `squeeze`가 아무것도 바꾸지 않는다고 본 경우.
- ② 결과를 3×4(행마다 `p`, `q`, `r`)로 본 경우. 그러면 `B(2,3)` = `q(3)` = 13.
- ④ 크기는 맞혔지만 행·열을 바꿔 읽은 경우.
- ⑤ page마다 크기만 같으면 무엇이든 이어 붙일 수 있다(여기서는 모두 4×1).

복습: [11.8 Multidimensional Arrays](../../textbook/ch11/11.8-multidimensional-arrays.md)

## 11-15 — 정답 ②

- `c{3}`은 원래 배열 `single([1 2; 3 4])`, `(2,1)`은 2행 1열 → `a = 3`.
- `c{1}`은 `[5 6 7]`, `(end)`는 `7`.
- `d = 7 + 3 = 10`.

- ① `(2,1)`을 1행 2열로 읽어 `a = 2`로 본 경우.
- ③ 2행 2열 값 4를 쓴 경우.
- ④ 중괄호 `{ }`는 cell이 아니라 원래 배열을 꺼낸다. cell이 나오는 것은 `c(1)`.
- ⑤ double과 single은 더할 수 있다. 결과 `d`는 single이다.

복습: [11.9 Cell Arrays](../../textbook/ch11/11.9-cell-arrays.md)

## 11-16 — 정답 ④

소괄호 `( )`는 새 cell array를, 중괄호 `{ }`는 원래 배열을 돌려준다. `c(1)`은 `{[3 6 9]}`인 1×1 cell이므로 숫자처럼 곱할 수 없다. `c{1} * 2`라면 `6 12 18`이다.

- ① cell array의 목적이 서로 다른 타입을 함께 담는 것이다.
- ② `c{1}`은 double `[3 6 9]`이므로 `+ 1`이 된다(`4 7 10`).
- ③ 소괄호 인덱싱은 되고, 결과가 1×1 cell일 뿐이다.
- ⑤ `{ }` 다음 `( )`는 슬라이드의 `my_cellarray{4}(1,2)`와 같은 방식이다. `w = 6`.

복습: [11.9 Cell Arrays](../../textbook/ch11/11.9-cell-arrays.md)

## 11-17 — 정답 ③

- 1~2행: dot notation으로 field `name`, `score`를 가진 1×1 struct.
- 3행: `s(3).name`에 대입하면 struct가 1×3으로 늘어난다. 값을 넣지 않은 field(`s(2).name`, `s(2).score`, `s(3).score`)는 빈 배열 `[]`이다.

- ① field 추가(1~2행)는 크기를 바꾸지 않지만, 3행의 `s(3)` 대입은 크기를 늘린다.
- ② 인덱스 3까지 만들었으므로 1×3이다.
- ④ 다른 원소의 값이 복사되지 않는다. `s(3).score`는 `[]`.
- ⑤ `s(1).score`는 `[80 95]`이고 그 2번째 원소는 `95`.

복습: [11.10 Structure Arrays](../../textbook/ch11/11.10-structure-arrays.md)

## 11-18 — 정답 ②

열 이름은 `table` 함수의 `VariableNames` 속성으로 정한다. 이름 배열 `cols`는 string이어도 되지만, 슬라이드는 속성 이름 `'VariableNames'`는 반드시 작은따옴표(char)여야 한다고 강조했다(string과 char를 모두 받지 않는 드문 경우).

- ① 큰따옴표 `"VariableNames"`는 슬라이드가 금지한 형태다. R2026a에서도 데이터 열로 해석되어 오류가 난다.
- ③ `RowNames`는 행 이름이다. 열 이름이 바뀌지 않는다.
- ④ `cols`를 네 번째 데이터 변수로 넣으려 하는데, 1×3이라 3행인 다른 변수와 행 수가 맞지 않는다.
- ⑤ 변수 `cols`가 아니라 글자 `'cols'` 하나를 이름으로 준 것이다. 열은 3개인데 이름이 하나라 맞지 않는다.

> R2026a에서는 `table(Name, Dept, Score, VariableNames=cols)`도 된다(Name=Value 문법). 슬라이드 기준 답은 ②.

복습: [11.11 Table Arrays](../../textbook/ch11/11.11-table-arrays.md)

## 11-19 — 정답 ⑤

`T`는 3×3 table(`Name`, `Dept`, `Score`)이고, `RowNames`에 `T.Name`을 넣었으므로 행 이름으로 행을 꺼낼 수 있다. `T("Lee", :)`는 Lee 행의 모든 열 → 1×3 table.

- ① `T(행, 열)`처럼 소괄호로 꺼내면 결과는 table이다. `B`는 2×1 table.
- ② `T(3,2)`도 1×1 table이다(슬라이드 `T(2,3)`의 결과가 `Smoker` 열 머리를 가진 table로 표시됨).
- ③ 행 이름은 변수(열)가 아니다. 크기는 3×3 그대로다.
- ④ 슬라이드: import wizard의 타입 선택지에는 logical이 없다. `Smoker`는 categorical로만 바꿀 수 있었다.

복습: [11.11 Table Arrays](../../textbook/ch11/11.11-table-arrays.md)

## 11-20 — 정답 ④

`synchronize`는 두 timetable의 행 시간을 모두 모아 하나의 timetable을 만든다. 같은 시각이 없으므로 행은 3 + 2 = 5개(`00:00`, `00:30`, `01:00`, `01:30`, `02:00`), 변수는 `Temp`, `Hum` 2개다. 한쪽에만 있는 시각의 다른 쪽 값은 `NaN`이다.

- `Temp`가 없는 행: `00:30`, `01:30` → 2개
- `Hum`이 없는 행: `00:00`, `01:00`, `02:00` → 3개
- 합계 `NaN` 5개, 크기 5×2.

- ① 빈 자리는 0이 아니라 `NaN`이다. 채우려면 `'union','linear'`처럼 방법을 지정해야 한다.
- ② 행 시간 열은 변수 수에 들어가지 않는다(슬라이드 `indoors`는 Time, Humidity, AirQuality인데 60×2).
- ③ `A`의 시각만 남긴다고 본 경우. 그러면 `Hum`이 3개 모두 `NaN`이다.
- ⑤ 시각이 달라도 합칠 수 있다. 슬라이드 예도 공통 시각이 없는 두 timetable을 합쳤다.

> 슬라이드는 60행과 51행을 합친 결과를 110×5라고 적으면서 "같은 시각이 없다"고 했다(60 + 51 = 111과 맞지 않음). 이 문제는 같은 시각이 없는 경우만 물으므로 정답에 영향이 없다.

복습: [11.12 Timetable Arrays](../../textbook/ch11/11.12-timetable-arrays.md)
