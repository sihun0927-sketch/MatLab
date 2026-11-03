# Chapter 9 — Repetition Structures

원서: Holly Moore, *MATLAB for Engineers* 6th ed., Chapter 9 (`Chapter 09_1.pdf` 35쪽 + `Chapter 09_2.pdf` 43쪽).

> PDF가 둘로 나뉘어 있다. `09_1`은 서론과 9.1 `for` loop, `09_2`는 9.2 `while`부터 끝까지다. 이 노트는 둘을 하나의 `ch09/`로 합쳤다.
>
> 슬라이드 본문의 절 번호(9.1~9.6)를 따랐다. 학습목표(p.2)의 번호(9.3 midpoint break, 9.4 시간 측정, 9.5 효율 개선, 9.6 vectorizing)는 본문 번호(9.3 `break`/`continue`, 9.4 midpoint break, 9.5 nested loop, 9.6 효율)와 다르다. 시험에서 절 번호를 물으면 **본문 쪽**이 기준이다.

## 이 장이 다루는 것

코드 토막은 세 종류로 나눌 수 있다. 8장의 **selection structure**에 이어, 이 장은 마지막 하나인 **repetition structure**(= **loop**)를 다룬다.

| 종류 | 하는 일 | 장 |
|---|---|---|
| sequence | 명령을 차례대로 하나씩 실행 | 2~7장 |
| selection structure | 조건으로 실행 경로를 고름 (`if`, `switch`) | 8장 |
| **repetition structure** | 조건이 만족될 때까지 같은 명령을 되풀이 (`for`, `while`) | **9장** |

**경험 법칙**: 같은 코드 토막을 **세 번보다 많이** 반복한다면 repetition structure 후보다.

### loop의 다섯 부분

모든 loop는 다섯 부분으로 이루어진다.

1. loop를 끝낼지 판단하는 데 쓰는 **parameter**
2. 그 parameter의 **초기화**
3. loop를 한 번 돌 때마다 parameter를 **바꾸는 방법** — 안 바꾸면 loop가 영원히 멈추지 않는다
4. parameter를 기준과 **비교**해서 끝낼지 결정
5. loop 안에서 하는 **계산**

> **[보강]** `for`는 2·3·4를 첫 줄(`for k = 1:n`) 하나가 전부 맡는다. `while`은 2(loop 앞), 3(loop 안), 4(`while` 줄)를 **프로그래머가 따로** 써야 한다. 그래서 `while`에서 무한 루프 실수가 훨씬 잦다.

### loop의 세 종류 — 무엇을 쓸까

| 종류 | 언제 |
|---|---|
| `for` loop | **몇 번 반복할지 알 때** |
| `while` loop | **기준이 만족될 때까지** 반복해야 할 때 |
| midpoint break loop (`break`, `continue`) | loop 안의 명령을 **최소 한 번은** 실행해야 하고, 빠져나갈지는 중간의 기준으로 정할 때 |

### loop를 써야 할까?

MATLAB에서는 loop 없이도 프로그램을 짤 수 있다.

- `find` (8.3)
- logical indexing (8.4)
- **vectorization** — 원소 하나씩이 아니라 벡터 전체에 한 번에 연산

vectorized 해법이 가능하면 loop를 **피하는 것이 좋다**. 더 빠르고, 대개 단계가 적고, 읽기도 쉽다.

## 목차

| 절 | 제목 | 내용 |
|---|---|---|
| [9.1](9.1-for-loops.md) | `for` loop | 구조, index array, pass별 추적, 원소 하나씩 배열 만들기, vectorize, `for`+`if` 카운터, 2차원 index array, 규칙, flowchart |
| [9.2](9.2-while-loops.md) | `while` loop | 구조·flowchart, pass별 추적, 다른 기준, `input` 오류 검사, 무한 루프와 `Ctrl+C` |
| [9.3](9.3-break-continue.md) | `break`와 `continue` | `break` 예제를 debugger Step으로 추적, `continue` 예제 |
| [9.4](9.4-midpoint-break.md) | Midpoint break loop | 중간 탈출 구조, `while(1)`, 0이 아니면 참, 반복 횟수 제한 |
| [9.5](9.5-nested-loops.md) | Nested loop | `max`를 중첩 loop로 흉내 내기 |
| [9.6](9.6-efficiency.md) | loop의 효율 | `clock`/`etime`, 사전할당, `tic`/`toc`, housekeeping, `timeit`, 세미콜론 |
| [solutions.md](solutions.md) | 연습문제 해답 | 각 절 연습문제 해설 |

## 함수/키워드 색인

> 절 칸에 `[보강]`이 붙은 행은 슬라이드에 없고 본문의 `[보강]` 블록에서만 다룬 것이다.

| 이름 | 한 줄 설명 | 절 |
|---|---|---|
| `for index = array … end` | index array의 원소(열) 하나마다 한 번씩 실행 | 9.1 |
| `start:inc:final` | index array를 만드는 가장 흔한 방법 | 9.1 |
| `length` | index array 끝값을 배열 길이로 (`1:length(x)`) | 9.1 |
| `numel` | 원소 개수. 2차원 배열을 하나씩 돌 때 | 9.6 [보강] |
| `count = count + 1` | running total(카운터). **loop 밖에서 0으로 초기화** | 9.1 |
| `disp("Count = " + count)` | string과 숫자를 `+`로 이어 출력 | 9.1 |
| `while criterion … end` | 기준이 참인 동안 반복 | 9.2 |
| `input` | 사용자 입력. `while`과 함께 오류 검사 | 9.2 |
| `Ctrl+C` | 실행 중인 프로그램(무한 루프) 강제 중단 | 9.2 |
| `break` | loop를 **즉시 빠져나와** loop 뒤로 | 9.3 |
| `continue` | **이번 pass만** 건너뛰고 다음 pass로 | 9.3 |
| `while(1)`, `while true` | 일부러 만든 무한 루프. `break`로만 나간다 | 9.4 |
| `max(x)`, `max(x, [], "all")` | 열별 최댓값 / 전체 최댓값 | 9.5 |
| `clock` | 현재 시각 `[년 월 일 시 분 초]` (R2026a: 권장 안 됨) | 9.6 |
| `etime(t1, t0)` | 두 `clock` 값 사이의 경과 초 (R2026a: 권장 안 됨) | 9.6 |
| `tic`, `toc` | 스톱워치 시작 / 경과 시간 | 9.6 |
| `timeit(@f)` | 함수 `f`의 실행 시간을 여러 번 재서 대표값 | 9.6 |
| `ones`, `zeros` | 사전할당(preallocation)용 자리 채우기 배열 | 9.6 |
| `datetime("now")` | `clock`의 권장 대체 | 9.6 [보강] |

## 챕터 요약 (시험 직전 체크리스트)

### 개념

- **loop = repetition structure.** 세 번보다 많이 반복하면 loop 후보.
- MATLAB의 loop는 **`for`와 `while` 두 종류.** `break`, `continue`로 둘 다 **midpoint break loop**로 바꿀 수 있다.
- **`for`**: 반복 횟수를 알 때. **`while`**: 조건이 만족될 때까지.
- `break`, `continue`는 loop를 일찍 끝내는 데 쓰고, 보통 **`if`와 함께** 쓴다.
- vectorized 해법이 있으면 loop를 쓰지 않는다.

### `for`

- 첫 줄 `for index = array`, 끝은 **`end`**.
- **index array의 원소 하나마다 한 번** 실행된다. 원소가 3개면 3번.
- index는 **변수**여야 한다. `k`는 관례일 뿐.
- 2차원 index array면 **열 하나씩** — index가 **열 벡터**가 된다(드물고, 대개 실수).
- loop가 끝나도 index는 **마지막 값을 유지**한다.
- loop 안에서 `a = …`는 매번 덮어쓰고, `a(k) = …`는 배열을 하나씩 늘린다.
- 카운터(running total)는 **loop 밖에서 초기화.**

### `while`

- `while criterion … end`. 기준이 **참인 동안** 반복.
- 기준에 쓰는 변수는 **loop 앞에서 초기화**하고 **loop 안에서 갱신**. 안 그러면 **무한 루프** → `Ctrl+C`.
- `for`로 풀 수 있는 문제는 **전부 `while`로도** 풀 수 있다.
- 흔한 용도: **입력 오류 검사**(양수가 들어올 때까지 다시 묻기).

### `break`, `continue`, midpoint break

- **`break`**: loop를 빠져나와 **loop 뒤의 나머지 프로그램**을 실행.
- **`continue`**: 이번 pass의 나머지를 건너뛰고 **다음 pass**로. 종료 기준이 만족될 때까지 loop는 계속.
- midpoint break loop: 들어가서 계산 → **중간에서** 나갈지 결정 → 나머지 계산 → 반복. 수치해석에서 흔하다.
- **`while(1)`**은 무한 루프. 0이 아니면 참이기 때문. `break`로만 나간다. **반복 횟수 제한**을 넣어 두자.

### 효율

- MATLAB에서 loop는 배열 연산보다 대체로 **느리다**.
- 느린 진짜 이유는 **배열을 한 칸씩 늘리면서 메모리를 매번 새로 할당**하기 때문. → `ones`/`zeros`로 **사전할당**.
- **`clock`/`etime`**, **`tic`/`toc`**: **경과 시간**(elapsed time). 백그라운드 작업(**housekeeping**) 때문에 잴 때마다 다르다.
- **`timeit`**: 그 코드에 쓰인 시간에 더 가깝다. 단, 코드를 **함수로** 만들어야 한다.
- loop 안에서는 **세미콜론으로 출력을 숨긴다.** 화면 출력이 실행 시간을 크게 늘린다.

## 실행 환경 메모

> **[보강]** 사용자 요청에 따라 이 장은 `textbook/`만 만들었다. `example/ch09/*.m` 파일은 없고 코드는 md에 인라인으로만 있다. 인라인 코드는 모두 MATLAB R2026a `-batch`에서 실행해 출력을 확인했다(출력은 `format compact`처럼 빈 줄을 줄여 실었다).
>
> - `input`은 `-batch`에서 오류이므로, `input`이 나오는 예제는 입력값 배열(`entries = [-3, 0, 5]`)로 바꿔 같은 흐름을 확인했다. 본문의 `input` 코드는 데스크톱에서 실행하는 형태 그대로다.
> - 시간 측정값은 컴퓨터와 실행마다 다르다. 본문의 숫자는 한 번 실행한 예시이며 **대소 관계**만 의미가 있다.
> - R2026a의 `toc`는 한국어 로케일에서 `경과 시간은 0.077375초입니다.`로 찍힌다(슬라이드는 `Elapsed time is … seconds.`).
