# Chapter 11 — Other Kinds of Arrays

원서: Holly Moore, *MATLAB for Engineers* 6th ed., Chapter 11 (`Chapter 11_1.pdf` 47쪽 + `Chapter 11_2.pdf` 72쪽).

> 슬라이드 본문의 절 번호(11.1~11.12)를 따랐다. 학습목표(11_1 p.2)는 11.1~11.6으로 번호를 매기지만(11.1 데이터 종류, 11.2 숫자 배열, 11.3 char·string, 11.4 logical·datetime·categorical, 11.5 다차원, 11.6 cell·structure·table·timetable), 본문 번호와 맞지 않는다. 시험에서 절 번호를 물으면 **본문 쪽**이 기준이다. 11_1은 11.1~11.5, 11_2는 11.6~11.12를 다룬다.

## 이 장이 다루는 것

- MATLAB의 기본 데이터 구조는 **array**다.
- 데이터 타입(data type)은 **class**라고도 부른다.
- array 안에 여러 **2차 데이터 타입(secondary data type)** 을 저장할 수 있다.
  - MATLAB은 **C로 작성**되었으므로 많은 타입이 C의 데이터 타입과 대응한다.
  - 대부분의 array는 **한 가지 타입**만 담는다.
  - **여러 타입**을 함께 담는 array도 있다.
- 타입 사이를 **변환하는 함수**가 있다(`double`, `single`, `int8`, `char`, `string`, `logical`, `categorical`, `datetime`, `cell2table`, `struct2table` …).

### MATLAB Secondary Data Types (배열에 저장하는 데이터의 종류)

```
Types of Data Stored in MATLAB Arrays
├── Text ──────────── Character, String
├── Logical
├── Numeric ───────── Integer ── Multiple signed / unsigned integer types
│                     Floating Point ── Single precision, Double precision
│                                       (각각 Complex, Real)
├── Categorical
├── Time ──────────── Datetime, Duration, Calendar Duration
├── Symbolic
└── Function Handle
```

### MATLAB Array Types (배열의 종류)

```
MATLAB Array Types
├── Single Data Type Arrays
│     Categorical, Text, Logical, Numeric, Time, Symbolic, Function Handles
│     (Logical, Numeric → Sparse Arrays 가능)
└── Multiple Data Type Arrays
      Tables, Cell Arrays, Structure Arrays, Map Containers, Timetables
```

## 목차

| 절 | 제목 | 내용 |
|---|---|---|
| [11.1](11.1-numeric-data-types.md) | Numeric Data Types | double(8 B), `realmax`/`realmin`, Inf·0, single(4 B), 조화급수 round-off, `cumsum`, integer 8종, `intmax`, 복소수 |
| [11.2](11.2-character-and-string-data.md) | Character and String Data | `'char'` vs `"string"`, padding, cell of char, string 배열 메모리, ASCII, `double('a')`, `['a',98]`, `'a'+3` vs `"a"+3` |
| [11.3](11.3-symbolic-data.md) | Symbolic Data | function handle, `syms x`, `S = x^2-2` |
| [11.4](11.4-logical-data.md) | Logical Data | `true/false`, 1 byte, `logical`, `x>y`, `find`, logical indexing |
| [11.5](11.5-sparse-arrays.md) | Sparse Arrays | `sparse(eye(1000))`, 8,000,000 vs 24,008 bytes |
| [11.6](11.6-categorical-arrays.md) | Categorical Arrays | `categorical`, `categories`, `find(W=='A')` |
| [11.7](11.7-time-arrays.md) | Time Arrays | `datetime(year,month,day)`, `diff` → `duration`, Denver/Orlando, `'ConvertFrom'` |
| [11.8](11.8-multidimensional-arrays.md) | Multidimensional Arrays | page, drawer, `(:,:,k)` 대입, `cat(3,…)`, `squeeze` |
| [11.9](11.9-cell-arrays.md) | Cell Arrays | `{ }`, `( )` vs `{ }`, `c{4}(1,2)`, `cell2table`, `table2cell` |
| [11.10](11.10-structure-arrays.md) | Structure Arrays | dot notation, field 추가, 확장, `s(2).f(2)`, variable editor, `struct2table` |
| [11.11](11.11-table-arrays.md) | Table Arrays | `load patients`, `table`, `T(2,3)`, `VariableNames`, `RowNames`, `readtable`, `summary`, `uiimport` |
| [11.12](11.12-timetable-arrays.md) | Timetable Arrays | `readtimetable`, `synchronize`, NaN, `'union','linear'`, `retime` |
| [solutions.md](solutions.md) | 연습문제 해답 | 각 절 연습문제 해설 |

## 함수/연산자 색인

> 절 칸에 `[보강]`이 붙은 행은 슬라이드에 없고 본문의 `[보강]` 블록에서만 다룬 것이다.

| 이름 | 한 줄 설명 | 절 |
|---|---|---|
| `realmax`, `realmin` | double(또는 `"single"`)로 저장 가능한 최대 수 / 최소 양수 | 11.1 |
| `single`, `double` | single ↔ double 변환. `double('a')`는 ASCII 값 | 11.1, 11.2 |
| `cumsum` | 누적합(부분합) | 11.1 |
| `int8`…`int64`, `uint8`…`uint64` | 8가지 integer 타입 변환 | 11.1 |
| `intmax` | integer 타입의 최댓값 | 11.1 |
| `intmin` | integer 타입의 최솟값 | 11.1 [보강] |
| `whos` | 변수의 크기·클래스·바이트 | 11.1 [보강] |
| `char` | string → char, 숫자 → 문자, 여러 char를 padding해 2차원으로 | 11.2 |
| `string` | char(또는 cell of char) → string | 11.2 |
| `{ }` | cell array constructor | 11.2, 11.9 |
| `strlength` | string의 글자 수 | 11.2 [보강] |
| `dec2bin`, `bin2dec` | 10진 ↔ 2진 텍스트 | 11.2 [보강] |
| `syms` | symbolic variable 만들기 | 11.3 |
| `@(x) …` | function handle | 11.3 |
| `true`, `false` | logical 값 | 11.4 |
| `logical` | double → logical (0 아니면 true) | 11.4 |
| `find` | logical 배열에서 true 위치 | 11.4, 11.6 |
| `islogical` | logical인지 확인 | 11.4 [보강] |
| `sparse` | full → sparse | 11.5 |
| `full`, `nnz`, `issparse` | sparse → full, 0 아닌 원소 수, sparse 여부 | 11.5 [보강] |
| `categorical` | string 배열 / cell of char → categorical | 11.6 |
| `categories` | 범주 목록(cell, 정렬됨) | 11.6 |
| `countcats` | 범주별 개수 | 11.6 [보강] |
| `datetime` | 연·월·일 → datetime. `'ConvertFrom','yyyymmdd'` | 11.7 |
| `diff` | 인접 원소 차이. datetime이면 `duration` | 11.7 |
| `bar`, `plot` | datetime x축이면 날짜 눈금 | 11.7 |
| `tiledlayout`, `nexttile` | 여러 그래프 배치 | 11.7 |
| `days`, `hours`, `years`, `between` | duration 단위 변환, 달력 기간 | 11.7 [보강] |
| `(:,:,k)` | k번째 page | 11.8 |
| `cat(dim, A, B, …)` | dim 방향으로 이어 붙이기 | 11.8 |
| `squeeze` | singleton 차원 제거 | 11.8 |
| `c(i)`, `c{i}`, `c{i}(j)` | cell 반환 / 내용물 반환 / 내용물의 원소 | 11.9 |
| `cell2table`, `table2cell` | cell ↔ table | 11.9 |
| `cell` | 빈 cell array 만들기 | 11.9 [보강] |
| `s.field`, `s(k).field(j)` | structure field 접근 | 11.10 |
| `struct2table` | 직사각형 struct → table | 11.10 |
| `fieldnames`, `isfield`, `rmfield`, `struct`, `table2struct` | struct 다루기 | 11.10 [보강] |
| `load patients` | 샘플 데이터 불러오기 | 11.11 |
| `table` | 변수들 → table. `'VariableNames'` | 11.11 |
| `T.Properties.RowNames` | 행 이름 지정 | 11.11 |
| `T(r,c)`, `T("name",:)` | 번호 / 이름으로 table 인덱싱 | 11.11 |
| `readtable` | 파일 → table | 11.11 |
| `summary` | table(또는 timetable) 상세 정보 | 11.11, 11.12 |
| `uiimport` | import wizard 열기 | 11.11 |
| `T{r,c}` | table에서 값 꺼내기 | 11.11 [보강] |
| `readtimetable` | `.csv` → timetable | 11.12 |
| `synchronize` | timetable 합치기. `'union','linear'` | 11.12 |
| `retime` | 일정한 시간 간격으로. `'hourly','spline'` | 11.12 |
| `timetable`, `ismissing` | timetable 만들기, 결측값 확인 | 11.12 [보강] |

## 챕터 요약 (시험 직전 체크리스트)

### 숫자

- 기본 숫자 타입은 **double**(8 bytes, IEEE 754). 1 byte = 8 bits.
- `realmax` ≈ **1.7977e+308**, `realmin` ≈ **2.2251e-308**. 넘치면 **Inf**, 너무 작으면 **0**.
- **single**: 4 bytes, `realmax("single")` ≈ **3.4028e+38**. 드물게 쓰며 **round-off error**에 약하다.
- 조화급수를 `cumsum`으로 더하면 single은 약 **15.4**에서 멈추고 double은 계속 커진다.
- integer **8종**: `int8/16/32/64`, `uint8/16/32/64`. 숫자 = 비트 수. `intmax("int8")` = **127**, `intmax("uint8")` = **255**. unsigned는 부호를 저장하지 않아 양수 범위가 2배.
- 복소수는 실수부·허수부를 둘 다 저장 → **2배** 공간. single, integer로도 저장 가능.

### 텍스트

- `'...'` = **char**(문자 하나하나), `"..."` = **string**(텍스트 덩어리). string은 **R2016b**부터, 새 코드는 string 권장.
- 길이가 다른 이름 목록: **padding**(`char(...)`, 5×7) / **cell of char**(`{...;...}`) / **string 배열**(`["...";"..."]`).
- 메모리: string 하나는 char보다 크지만, **string 배열 < cell of char**.
- ASCII: `double('a')` = **97**, `char(98)` = **'b'**. 2진 1000 = 10진 8.
- 배열에 섞으면 → **전부 char**(`['a',98]` = `'ab'`). 계산하면 → **문자를 숫자로**(`'a'+3` = **100**).
- **`"a"+3` = `"a3"`** (string의 `+`는 이어 붙이기).

### 특수 배열

- **symbolic**: function handle과 symbolic variable 저장. `syms x`, `S = x^2-2`.
- **logical**: 1 byte/원소(double은 8). `logical(T2)`로 변환. 비교 연산 결과. `find`, logical indexing에 쓰인다.
- **sparse**: 대부분 0인 배열. 0이 아닌 값과 위치만 저장. `eye(1000)` 8,000,000 → **24,008** bytes.
- **categorical**: 정해진 범주 중 하나. `categorical(string 또는 cell)`, `categories`, `find(W=='A')`.
- **datetime**: `datetime(year,month,day)`. 차이(`diff` 또는 빼기)는 **duration**(시:분:초). 그래프 x축이 날짜 표기로. `datetime(DATE,'ConvertFrom','yyyymmdd')`.

### 다차원

- 2차원 조각 = **page**, page 묶음 = **drawer**(4차원).
- page마다 `A(:,:,k) = …` 또는 **`cat(3, …)`** (첫 인수 = 차원).
- **`squeeze`**: 3×1×4 → 3×4.

### 여러 타입을 담는 배열: cell, structure, table

- **cell**: `{ }`로 만든다. `c(i)` → **cell**, `c{i}` → **원래 배열**, `c{i}(j)` → 안쪽 원소. `cell2table`/`table2cell`.
- **structure**: **field**와 **dot notation**. `s.f = …`로 field 추가, `s(2).f = …`로 확장, 빈 field는 `[]`. `s(2).f(2)`. `struct2table`.
- **table**: 스프레드시트형 데이터에 최적. `table(…)`, `T(2,3)`, `'VariableNames'`(**작은따옴표 필수**), `T.Properties.RowNames`, `T("Johnson",:)`.
- 파일에서: **`readtable`**(자동), **`uiimport`**(wizard, 함수 생성 가능). `summary`로 열 이름·타입·통계.
- **timetable**: 타임스탬프 데이터. `readtimetable`(csv), `load`(mat). **`synchronize`** → 없는 값 `NaN`, `'union','linear'`로 보간. **`retime`**(`'hourly','spline'`)로 일정 간격.
- 섞인 타입을 저장하는 배열 중 **table이 주류**가 되어 가고 있다.

## 슬라이드와 R2026a가 다른 점

> **[보강]** 슬라이드 그림은 R2022a(일부 R2021a)다. R2026a에서 다시 실행해 보니 다음이 달랐다. 시험 답안에는 슬라이드 설명을 쓰되, 차이를 알아 두자.
>
> | 슬라이드 | R2026a 실제 | 절 |
> |---|---|---|
> | Workspace 바이트: `N`(5×1 cell) 578, `P`(5×1 string) 366, `"Sarah"` 150, `my_cellarray` 644 | 618, 382, 166, 692. 크기 순서(char < string 배열 < cell)는 같다 | 11.2, 11.9 |
> | sparse는 double과 logical | **single sparse도 된다**. integer는 여전히 불가 | 11.5 |
> | datetime 표시 `01-Feb-1990` | 한국어 로케일에서 `1990-02-01` (값은 같음) | 11.7 |
> | 슬라이드 변수 `year`, `month`, `day`, `date` | 같은 이름의 **함수를 가린다**. 이후 `month(dt)`는 오류 | 11.7 |
> | `'VariableNames'`는 작은따옴표만 | 큰따옴표는 여전히 오류. 단 **`VariableNames=names`** (Name=Value)는 된다 | 11.11 |
> | `summary`가 변수별 Min/Median/Max 목록 | 변수 목록 + 통계 표(`NumMissing`, `Min`, `Median`, `Max`, `Mean`, `Std`) | 11.11 |
> | `indoors.csv`, `outdoors.mat` 샘플 | R2026a에 **없다**. 같은 구조의 작은 timetable로 대체해 확인 | 11.12 |
> | table 도입: 11.10은 R2016b, 11.11은 R2013b | table은 **R2013b**. R2016b는 string 도입 | 11.10 |
>
> 오류·경고 메시지는 한국어 로케일에서 한국어로 나온다. 영어 원문을 알 수 있는 것은 각 절에 함께 적었다.

## 실행 환경 메모

> **[보강]** 사용자 요청에 따라 이 장은 `textbook/`만 만들었다. `example/ch11/*.m` 파일은 없고 코드는 md에 인라인으로만 있다. 인라인 코드는 MATLAB R2026a `-batch`에서 실행해 출력을 확인했다(출력은 `format compact`처럼 빈 줄을 줄여 실었다). 다음은 실행하지 못했다.
>
> - **11.3 `syms`**: 이 PC의 R2026a에 Symbolic Math Toolbox가 없다. 출력은 슬라이드 그대로다.
> - **11.7 Orlando 데이터**, Denver 원본 xlsx: 파일이 없다. Denver는 Table 11.3 값을 직접 입력해 실행했다.
> - **11.11 import wizard(`uiimport`)**, variable editor: GUI라 `-batch`로 실행할 수 없다.
> - **11.12 `indoors`/`outdoors`**: R2026a에 샘플 파일이 없다.
>
> 그래프(조화급수 비교, Denver 막대그래프)는 코드가 오류 없이 실행되는 것만 확인했다. 이 장에는 `img/`가 없다.
