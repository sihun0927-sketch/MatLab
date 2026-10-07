# Chapter 8 — Logical Functions and Selection Structures

원서: Holly Moore, *MATLAB for Engineers* 6th ed., Chapter 8 (`Chapter 08.pdf`, 69쪽).

> 슬라이드 본문의 절 번호(8.1~8.5)를 따랐다. 학습목표(p.2)의 번호(8.2 find, 8.3 logical indexing, 8.4 if, 8.5 switch, 8.6 장단점 비교)는 본문 번호와 다르다. 시험에서 절 번호를 물으면 **본문 쪽**이 기준이다. Logical indexing은 슬라이드 본문에 번호가 없어서 이 노트에서는 8.4로 두었다.

## 이 장이 다루는 것

코드 토막(control structure)은 세 종류다.

- **sequence**: 명령을 차례대로 하나씩 실행한다. 7장까지 쓴 코드는 전부 이것이다.
- **selection structure**: 조건(conditional statement)으로 실행 경로를 고른다. **이 장**.
- **repetition structure** (loop): 조건이 만족될 때까지 같은 명령을 되풀이한다. 9장.

selection과 repetition의 조건은 **관계 연산자**와 **논리 연산자**로 만든다. 이 장은 연산자(8.1) → 계획 도구(8.2) → MATLAB다운 선택 방법인 `find`(8.3)와 logical indexing(8.4) → 전통적인 `if`·`switch`(8.5) 순서로 간다. 슬라이드의 일관된 메시지는 **"대부분은 `find`나 logical indexing으로 충분하고, 그래야 한다. `if`는 꼭 필요할 때만."** 이다.

## 목차

| 절 | 제목 | 내용 |
|---|---|---|
| [8.1](8.1-relational-logical.md) | 관계·논리 연산자 | control structure 3종, `< <= > >= == ~=`, logical 배열, `==` vs `=`, `& \| ~ xor && \|\|` |
| [8.2](8.2-flowchart-pseudocode.md) | Flowchart와 Pseudocode | pseudocode → 주석 → 코드(mph → ft/s 표), flowchart 기호 4종 |
| [8.3](8.3-find.md) | Logical function `find` | 인덱스 반환, 복합 조건(Naval Academy), `fprintf` 출력, single index vs `[row, col]` |
| [8.4](8.4-logical-indexing.md) | Logical indexing | `find`와 비교(발열 환자), 한 줄 축약, `<missing>`, `~`로 채우기, table |
| [8.5.1](8.5.1-simple-if.md) | Selection structure / simple `if` | `if`가 필요한 경우, 배열 조건은 전 원소가 참이어야 |
| [8.5.2](8.5.2-if-else.md) | `if/else` | `else` 줄에 조건 없음, 배열 입력, `beep` vs `error` |
| [8.5.3](8.5.3-elseif.md) | `elseif` | 중첩 대신 `elseif`, 앞에서 배제된 범위 생략, flowchart |
| [8.5.4](8.5.4-switch-case.md) | `switch/case` | 숫자·문자열, `input(…, "s")`는 char, `otherwise` |
| [8.5.5](8.5.5-menu.md) | `menu` | `menu` + `switch`, `listdlg`, App Designer |
| [solutions.md](solutions.md) | 연습문제 해답 | 각 절 연습문제 해설 |

## 함수/키워드 색인

| 이름 | 한 줄 설명 | 절 |
|---|---|---|
| `<` `<=` `>` `>=` | 크기 비교. 결과는 logical | 8.1 |
| `==`, `~=` | 같다 / 같지 않다. **`=`는 대입**, `!=`는 없다 | 8.1 |
| `logical` | 0/1만 갖는 자료형. 비교의 결과. 인덱스로 쓰면 1인 자리를 고른다 | 8.1, 8.4 |
| `&`, `\|`, `~` | 원소별 and / or / not. 배열에 쓴다 | 8.1 |
| `xor` | 둘 중 **정확히 하나만** 참일 때 참. 함수 형태 | 8.1 |
| `&&`, `\|\|` | short-circuit and / or. **스칼라 전용**, 배열이면 오류 | 8.1 |
| `all`, `any` | 배열 → 스칼라 참/거짓. "전부" / "하나라도" | 8.1, 8.5.1 |
| `%`, `%%` | 주석 / 섹션. pseudocode를 옮겨 적는 자리 | 8.2 |
| `find(cond)` | 조건이 참인 원소의 **인덱스**(열 우선 선형 인덱스) | 8.3 |
| `[r, c] = find(cond)` | 행 번호와 열 번호를 따로 | 8.3 |
| `find(cond, n)`, `"last"` | 처음 n개 / 마지막 n개만 | 8.3 |
| `sub2ind`, `ind2sub` | (행, 열) ↔ 선형 인덱스 | 8.3 |
| `x(cond)` | logical indexing. 조건이 참인 원소만 고른다 | 8.4 |
| `x(cond) = v` | 조건이 참인 자리만 바꾼다. 없던 변수면 새로 만든다 | 8.4 |
| `<missing>`, `ismissing` | string 배열의 빈 자리 / 그 확인 | 8.4 |
| `table(…, VariableNames=…)` | 결과를 열 이름 있는 표로 | 8.3, 8.4 |
| `if … end` | 조건이 참이면 실행, 거짓이면 건너뜀 | 8.5.1 |
| `if … else … end` | 참/거짓 두 갈래. **`else`에는 조건이 없다** | 8.5.2 |
| `beep` | 삑 소리. 프로그램은 계속 간다 | 8.5.2 |
| `error` | 메시지를 내고 **프로그램을 멈춘다** | 8.5.2 |
| `if … elseif … else … end` | 여러 갈래. 처음 참인 블록 하나만 실행 | 8.5.3 |
| `switch … case … otherwise … end` | 한 변수의 **값이 같은지**로 갈래. 부등호 불가 | 8.5.4 |
| `case {a, b}` | 여러 값을 한 `case`에. 중괄호 | 8.5.4 |
| `lower` | 대소문자 맞춘 뒤 비교할 때 | 8.5.4 |
| `menu(prompt, list)` | 버튼 창. 누른 버튼의 **번호**, 닫으면 0 | 8.5.5 |
| `listdlg` | 목록 고르기 창. `[idx, tf]`. `doc listdlg` | 8.5.5 |
| `appdesigner` | App Designer. 현대식 GUI 만들기 | 8.5.5 |
| `usejava('desktop')` | 데스크톱인지 배치인지 판별 (대화형 함수 가드용) | 8.5 전체 |

## 챕터 요약 (시험 직전 체크리스트)

### 연산자

- **관계 연산자 6개**: `< <= > >= == ~=`. **`~=`** 는 수학책에 없는 모양이다.
- **비교 결과는 logical 배열**(0/1). 숫자를 참/거짓으로 읽을 때는 **0이 아니면 참**.
- **배열 비교는 원소별.** 결정(if)에서 배열이 참이려면 **모든 원소가 1**이어야 한다.
- **`==`는 비교, `=`는 대입.**
- **논리 연산자 6개**: `& ~ | xor && ||`. **`&&`, `||`는 스칼라 전용**(short-circuit).
- **`1 < x < 5`는 언제나 참.** `1 < x & x < 5`로 쓴다.

### 계획

- **pseudocode** = 말로 쓴 계획 → 그대로 주석이 된다 → 사이에 코드를 채운다.
- **flowchart 기호**: 타원 = 시작/끝, 평행사변형 = 입력/출력, 마름모 = 결정, 직사각형 = 계산.
- 단순한 문제엔 flowchart가 과하지만 복잡해질수록 쓸모 있다. **좋은 문서화의 필요성은 사라지지 않는다.**

### `find`와 logical indexing

- **`find`는 인덱스를 준다.** 값은 `x(find(…))`.
- **2차원 배열의 `find`는 열 우선 번호.** `[row, col] = find(…)`로 받으면 행·열이 따로 나온다.
- 여러 조건은 `&`, `|`로 묶어 한 번에.
- **logical indexing은 0/1 배열을 그대로 인덱스로 쓴다.** `x(x > 98.6)` 한 줄로 끝난다.
- 없던 string 배열에 logical 인덱스로 대입하면 빈 자리는 **`<missing>`**. `~`로 나머지를 채운다.
- **logical indexing이 `find`보다 대개 효율적이다.**
- `find`와 logical function은 **MATLAB 고유**의 방식이다. 다른 언어 습관으로 `if`와 loop만 쓰지 말 것. 중첩 loop를 피할 수 있다.

### `if` 계열

- **대부분은 `find`나 logical indexing을 써야 한다.** `if`는 실행 경로 자체가 갈릴 때.
- `if`, `else`, `elseif`는 배열에도 쓸 수 있지만 **주로 스칼라용**이다.
- **simple `if`**: 참이면 실행, 거짓이면 `end` 뒤로.
- **`if/else`**: **`else` 줄에 조건을 쓰지 않는다.** 쓰면 R2026a는 그것을 블록의 첫 문장으로 실행한다.
- **`beep` + `disp`는 계속 가고, `error`는 멈춘다.**
- **`elseif`**: 위에서부터 처음 참인 블록 하나만. 앞 조건이 배제한 범위는 다시 쓰지 않는다. **순서가 틀리면 뒤 조건은 죽은 코드.**
- 빈 배열은 거짓, `NaN`과 `""`는 오류.

### `switch/case`, `menu`

- **`switch/case`는 `if/elseif/else`의 대안.** 할 수 있는 일은 같다. 선택지가 많을 때, **텍스트를 다룰 때** 유리하다.
- `case`는 **같은지**만 본다. 범위는 안 된다. 여러 값은 `{ }`.
- **`input(…, "s")`는 char를 준다.** 슬라이드는 `case`도 char로 쓰라고 하지만, R2026a의 `switch`는 char/string을 섞어도 맞는다.
- **`otherwise`는 선택이지만 넣는 것이 좋다.**
- **`menu`는 번호를 돌려준다.** 버튼 밖 값은 못 고르므로 `otherwise`가 필요 없다고 하지만, **창을 닫으면 0**이다.
- `menu`, `listdlg` 같은 GUI와 짝지으면 **사용자 실수의 여지를 줄인다**. 둘 다 2006년 이전 함수이고, 요즘은 App Designer.

## 실행 환경 메모

> **[보강]** 이 장에는 **`-batch`에서 돌릴 수 없는 함수가 셋** 있다: `input`(오류), `menu`·`listdlg`(창을 띄우고 **끝없이 기다린다**). `beep`은 `-batch`에서도 오류 없이 지나간다. 저장소의 예제는 모두 `usejava('desktop')`으로 환경을 보고 갈라, 배치 실행에서는 대체 입력으로 같은 뒷부분을 보여 준다. 데스크톱에서 열면 진짜로 묻는다.
>
> ```matlab
> if usejava('desktop')
>     city = menu(prompt, list);
> else
>     city = 2;   % -batch: Denver 버튼을 눌렀다고 가정
> end
> ```
>
> 예제 몇 개(`ex0851`, `ex0853`, `sol0851_2` 등)는 입력을 바꿔 가며 보여 주려고 `for`를 썼다. 반복문은 9장 내용이다.
>
> MATLAB R2026a에서 `example/ch08/*.m` 37개를 모두 실행해 검증했다. R2026a 기본 figure 테마가 dark라, PNG로 저장하기 전에 `theme(gcf, "light")`를 넣었다. flowchart는 GitHub이 렌더링하는 Mermaid로 그렸다.
