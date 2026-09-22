# Chapter 4 — Manipulating MATLAB Arrays

원서: Holly Moore, *MATLAB for Engineers* 6th ed., Chapter 4 (`Chapter 04.pdf`, 94쪽).

## 목차

| 절 | 제목 | 내용 |
|---|---|---|
| [4.1](4.1-array-basics.md) | 배열의 정의·결합·인덱싱 | 배열 정의, concatenation, 콜론 연산자, `end`, 빈 배열 |
| [4.2](4.2-elementwise-meshgrid.md) | 원소별 연산과 meshgrid | `*` vs `.*`, 크기가 다른 두 벡터 다루기 (`meshgrid`) |
| [4.3](4.3-special-arrays.md) | 특수 배열 | `zeros`, `ones`, `diag`, `magic`, `fliplr` |
| [4.4](4.4-char-string.md) | 문자 배열과 문자열 배열 | `char` vs `string`, `+` 연결, `strlength` |
| [solutions.md](solutions.md) | 연습문제 해답 | 각 절 연습문제 해설 |

## 함수/연산자 색인

| 이름 | 한 줄 설명 | 절 |
|---|---|---|
| `[ ]`, `;`, `...` | 배열 리터럴, 새 행 구분, 줄 이어쓰기 | 4.1 |
| `:` (콜론 연산자) | 범위 생성, 행/열 전체 또는 구간 추출 | 4.1 |
| `end` | 그 방향의 마지막 인덱스 | 4.1 |
| `isempty` | 배열이 비어있는지 확인 | 4.1 |
| `*` | 행렬곱 (선형대수 규칙) | 4.2 |
| `.*` | 원소별(elementwise) 곱 | 4.2 |
| `meshgrid` | 크기가 다른 두 벡터를 같은 크기의 2차원 격자로 매핑 | 4.2 |
| `zeros` | 0으로 채워진 배열 생성 | 4.3 |
| `ones` | 1로 채워진 배열 생성 | 4.3 |
| `diag` | (행렬 입력) 대각선 추출 / (벡터 입력) 대각 행렬 생성 | 4.3 |
| `magic` | 행·열·대각선 합이 모두 같은 마방진 생성 | 4.3 |
| `fliplr` | 배열을 좌우로 반전 | 4.3 |
| `eye` | 단위행렬(대각선만 1) 생성 | 4.3 |
| `sum` | 합계 (기본은 열 합, 두 번째 인자로 축 지정) | 4.3 |
| `'` (전치) | 행과 열을 뒤바꿈 | 4.3 |
| `char` | 문자 배열 생성, 또는 여러 문자 배열을 패딩해 결합 | 4.4 |
| `string` | 문자열 배열로 변환하거나 큰따옴표로 직접 생성 | 4.4 |
| `strlength` | 문자열 배열의 각 원소별 글자 수 | 4.4 |
| `+` | 문자열 연결 (string 전용, char 배열은 숫자 덧셈이 됨에 주의) | 4.4 |
| `num2str` | 숫자를 char 배열 텍스트로 변환 | 4.4 |
| `isstring`, `ischar` | 변수가 string/char 타입인지 확인 | 4.4 |
| `size` | 배열 각 차원의 크기 | 4.1, 4.4 |
| `length` | 가장 큰 차원의 크기 | 4.1, 4.4 |
| `numel` | 전체 원소 개수 | 4.4 |

## 챕터 요약 (시험 직전 체크리스트)

- **배열 정의·결합**: `[ ]` 안에 공백/쉼표로 원소를, 세미콜론/줄바꿈으로 행을 구분한다. 이미 만든 배열을 원소처럼 넣어 새 배열을 만들 수 있다(concatenation).
- **콜론 연산자**: `시작:끝`, `시작:증가폭:끝`으로 배열을 만든다. 인덱스 자리의 콜론은 "그 방향 전체", `M(:)`는 배열 전체를 **열 우선(column-major)** 순서로 한 줄로 편 것이다.
- **인덱싱**: 행·열 두 개로 찾는 subscript 방식과, 번호 하나로 찾는 linear index 방식은 같은 원소를 가리키는 두 가지 표현이다. `end`로 크기를 몰라도 마지막 위치를 가리킬 수 있다.
- **빈 배열**: 콜론 연산자의 방향이 맞지 않으면 에러 대신 빈 배열이 조용히 만들어진다.
- **`meshgrid`**: 크기가 다른 두 벡터를 같은 크기의 2차원 격자로 매핑해서 원소별 연산이 가능하게 해준다. 두 배열을 곱할 때 `*`(행렬곱)와 `.*`(원소별 곱)를 구분해야 한다.
- **특수 배열**: `zeros`, `ones`, `eye`로 정해진 값의 배열을, `diag`로 대각선을 추출하거나(행렬 입력) 대각 행렬을 생성한다(벡터 입력). `magic`은 행·열·대각선 합이 모두 같은 마방진을 만든다. `sum`은 기본이 열 합이며 두 번째 인자로 행 합도 구할 수 있다.
- **문자 배열 vs 문자열 배열**: 작은따옴표(`char`, 글자 하나하나가 원소) vs 큰따옴표(`string`, 텍스트 덩어리가 원소). `string`만 `+`로 이어붙일 수 있고, `char`끼리 `+`는 문자 코드 숫자 덧셈이 된다. 대부분의 경우 `string`을 쓰는 것이 좋다. `strlength`는 원소별 글자 수, `length`는 배열 크기라는 점을 구분해야 한다.

## ⚠️ 함정 모음 (빠른 복습용)

| 함정 | 절 |
|---|---|
| `[1 -1]`(원소 2개) vs `[1 - 1]`(뺄셈, 스칼라 0) — 음수 부호와 공백 | 4.1 |
| 인덱스는 1부터 시작, 0이나 음수 인덱스는 에러 | 4.1 |
| `M(:)`은 행 우선이 아니라 **열 우선(column-major)**으로 펼쳐진다 | 4.1 |
| `시작:증가폭:끝`의 방향이 안 맞으면 에러 없이 조용히 빈 배열이 된다 | 4.1 |
| `*`(행렬곱) vs `.*`(원소별 곱) — 헷갈리면 에러거나 결과가 조용히 틀림 | 4.2 |
| `diag`는 입력이 행렬이면 추출, 벡터면 생성 — 정반대로 동작 | 4.3 |
| `sum(A)` 기본은 열 합, 행 합은 `sum(A,2)` | 4.3 |
| char 배열끼리 `+`는 연결이 아니라 ASCII 코드 숫자 덧셈 | 4.4 |
| `length`(배열 크기) vs `strlength`(문자열 원소별 글자 수) | 4.4 |
| `char`로 패딩된 문자열은 `string`으로 바꿔도 패딩 공백이 남는다 | 4.4 |

## 원서 슬라이드 절 대응표

원서 슬라이드는 4.1~4.6으로 나뉘어 있지만, 이 문서에서는 이슈에 맞춰 4개 절로 재구성했다.

| 원서 슬라이드 절 | 이 문서의 절 |
|---|---|
| 4.1 Manipulate numeric arrays / 4.2 Extract data from numeric arrays | [4.1](4.1-array-basics.md) |
| 4.3 Solve problems with two array variables of different sizes using meshgrid | [4.2](4.2-elementwise-meshgrid.md) |
| 4.4 Create and use special numeric arrays | [4.3](4.3-special-arrays.md) |
| 4.5 Explain the difference between character and string arrays / 4.6 Manipulate textual data | [4.4](4.4-char-string.md) |

## 예제 코드

`example/ch04/`에 절별 예제(`exXXYY_*.m`)와 연습문제 해답 코드(`solXXYY_N.m`)가 있다.
모든 코드는 MATLAB R2026a에서 오류 없이 실행 확인했다.
