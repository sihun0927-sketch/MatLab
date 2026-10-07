# Chapter 7 — User-Controlled Input and Output

원서: Holly Moore, *MATLAB for Engineers* 6th ed., Chapter 7 (`Chapter 07.pdf`, 93쪽).
`Chapter 07_2.pdf`(44쪽)는 7.2.3~7.5와 Summary만 다시 나온 슬라이드다. 대조해서 빠진 부분(Table 7.4, Import Wizard 화면, Step Out 화면 등)만 해당 절에 보탰다.

> 슬라이드 본문의 절 번호(7.1~7.5)를 따랐다. 학습목표(p.2)의 번호(7.4 table, 7.5 sprintf, 7.6 graphical input, 7.7 sections)는 본문 번호와 다르다. 시험에서 절 번호를 물으면 **본문 쪽**이 기준이다.

## 이 장이 다루는 것

6장까지는 프로그램을 **쓰는 사람과 돌리는 사람이 같았다**. 값을 바꾸려면 코드를 고치면 됐다. 7장부터는 둘이 다를 수 있다고 가정한다. 그러면 프로그램이 돌아가는 중에 값을 받고 결과를 보여 주는 수단이 필요하다.

프로그램을 담는 그릇은 두 가지다.

- **script**(`.m`): 명령을 차례로 적은 텍스트 파일
- **live script**(`.mlx`): 코드·서식 있는 글·수식·그림·실행 결과를 한 문서에. 텍스트 파일이 아니다

이 장의 내용은 둘 중 어느 쪽에서도 똑같이 동작한다.

## 목차

| 절 | 제목 | 내용 |
|---|---|---|
| [7.1](7.1-user-input.md) | 사용자 입력 | `input`, 스칼라·배열·string·char 입력, `'s'` 옵션 |
| [7.2.1](7.2.1-disp.md) | 출력 (1) `disp` | 세미콜론 생략, `+` 연결, `num2str`, 따옴표 규칙, `pause` |
| [7.2.2](7.2.2-fprintf.md) | 출력 (2) `fprintf` | `%f %e %g %d %s %c`, `\n`, 폭·정밀도, 열 우선, 파일 출력 |
| [7.2.3](7.2.3-sprintf.md) | 출력 (3) `sprintf` | 문자열을 만들어 두기, 그래프 제목·주석 |
| [7.2.4](7.2.4-table.md) | 출력 (4) `table` | 열 벡터 입력, `VariableNames`, Variable Editor |
| [7.3](7.3-ginput.md) | 그래프로 입력받기 | `ginput`, 좌표 받기, 점에 곡선 맞추기 |
| [7.4](7.4-file-io.md) | 파일 읽고 쓰기 | Import Wizard, `readtable`, `writetable`, `audioread` |
| [7.5](7.5-debugging.md) | 디버깅 | Code Analyzer, 섹션(`%%`), breakpoint, Step In/Out, `try/catch` |
| [solutions.md](solutions.md) | 연습문제 해답 | 각 절 연습문제 해설 |

## 함수/키워드 색인

| 이름 | 한 줄 설명 | 절 |
|---|---|---|
| `input` | 프롬프트를 띄우고 멈춘 뒤, 사용자가 친 것을 코드로 해석해 돌려준다 | 7.1 |
| `input(p, "s")` | 따옴표 없이 글자를 받는다. **결과는 string이 아니라 char** | 7.1 |
| `strlength` | string의 글자 수. `numel`은 1을 준다 | 7.1 |
| `usejava('desktop')` | 데스크톱인지 배치인지 판별 (대화형 함수 가드용) | 7.1 |
| `disp` | 배열 하나를 이름 없이 출력. **인수는 하나만** | 7.2.1 |
| `+` (string) | string끼리 이어 붙이기. char끼리는 ASCII 덧셈 | 7.2.1 |
| `num2str` | 숫자를 글자로. **이름과 달리 char를 만든다** | 7.2.1 |
| `pause` | `pause(n)`은 n초, 인수 없으면 키 입력까지 | 7.2.1 |
| `''`, `""` | char 안의 `'`, string 안의 `"`는 두 번 쳐야 한다 | 7.2.1 |
| `fprintf` | 형식 있는 출력. 화면 또는 파일로 | 7.2.2 |
| `%f %e %g %d` | 고정소수점 / 지수 / 짧은 쪽 / 정수 | 7.2.2 |
| `%s %c` | 문자열 전체 / 글자 하나 | 7.2.2 |
| `\n`, `\t`, `\\`, `%%` | 줄바꿈 / 탭 / 역슬래시 / 퍼센트 | 7.2.2 |
| `%8.2f` | 폭 8(전체), 소수 2자리. **8은 정수부 자릿수가 아니다** | 7.2.2 |
| `fopen`, `fclose` | 파일 열기(fid를 받는다) / 닫기 | 7.2.2 |
| fid | 1=화면, 2=오류 출력, 3이상=사용자 파일 | 7.2.2 |
| `"wt"`, `"at"`, `"rt"` | 새로 쓰기 / 이어 쓰기 / 읽기 (텍스트 모드) | 7.2.2 |
| `sprintf` | `fprintf`와 같은 형식 규칙. 결과를 **돌려준다** | 7.2.3 |
| `title`, `subtitle`, `text`, `legend` | 문자열을 받는 그래프 주석 함수들 | 7.2.3 |
| `table` | 자료형이 다른 열을 한 변수에. **입력은 열 벡터** | 7.2.4 |
| `VariableNames=` | 열 이름 지정. 옛 형식 `'VariableNames', …` 에서만 작은따옴표 강제 | 7.2.4 |
| `T.이름`, `T.("이름")` | 열 꺼내기 / 한글·공백·괄호가 든 이름일 때 | 7.2.4 |
| `T(행,열)`, `T{행,열}` | 부분 표 / 부분 값 | 7.2.4 |
| `height`, `width`, `summary`, `sortrows` | 표의 행 수 / 열 수 / 통계 / 정렬 | 7.2.4 |
| `openvar` | Variable Editor를 연다 (데스크톱 전용) | 7.2.4 |
| `ginput` | 그림창에서 찍은 점의 **그래프 좌표**를 받는다 | 7.3 |
| `gtext` | 마우스로 찍은 자리에 글자를 놓는다 | 7.3 |
| `uiimport` | Import Wizard를 명령으로 띄운다 (대화형) | 7.4 |
| `readtable` / `writetable` | `.dat .txt .csv .xlsx` ↔ table | 7.4 |
| `readmatrix` / `writematrix` | 같은 파일들 ↔ 숫자 행렬. 글자는 `NaN` | 7.4 |
| `readcell` / `writecell` | 같은 파일들 ↔ cell array. 머리글 포함 | 7.4 |
| `audioread` / `audiowrite` | 소리 파일 ↔ `[data, fs]` | 7.4 |
| `sound`, `audioinfo` | 재생 / 파일 정보만 보기 | 7.4 |
| `patients.dat` | MATLAB 내장 예제 자료 (100행 10열) | 7.4 |
| `%%` | 섹션 경계. Run Section(`Ctrl+Enter`) | 7.5 |
| `checkcode` | Code Analyzer를 명령으로. `-struct`, `-id` | 7.5 |
| `%#ok<ID>` | 그 줄의 경고를 억제 | 7.5 |
| `dbstop`, `dbclear`, `dbstatus` | breakpoint 걸기 / 지우기 / 목록 | 7.5 |
| `dbcont`, `dbstep`, `dbstep in/out`, `dbquit` | Continue / Step / Step In·Out / 종료 | 7.5 |
| `dbtype`, `dbstack` | 행 번호 붙여 보기 / 호출 경로 | 7.5 |
| `try`/`catch`, `err.stack` | 오류를 잡아 어디서 났는지 보고 | 7.5 |
| `assert` | 가정을 코드에 적어 logic error를 잡는다 | 7.5 |

## 챕터 요약 (시험 직전 체크리스트)

### 입력

- **`input`은 친 것을 MATLAB 코드처럼 해석한다.** `2+3`을 치면 5가 들어간다. 자료형은 `input`이 아니라 **사용자가 친 모양**이 정한다.
- **`input(prompt, "s")`는 따옴표 없이 받되 언제나 char를 준다.** 이름이 "s"(string)인데 string이 아니다.
- **char는 글자 수만큼 `1xN`, string은 몇 글자든 `1x1`.** 글자 수는 `strlength`.
- 그냥 Enter를 누르면 **빈 배열 `[]`**이 돌아온다. 오류가 아니다.

### 출력

- **`disp`는 인수를 하나만 받는다.** 글자와 숫자를 섞으려면 하나의 배열로 합쳐야 한다.
- **string끼리 `+`는 이어 붙이기, char끼리 `+`는 ASCII 덧셈.** char는 대괄호로 잇는다.
- **`"텍스트" + 배열`은 배열이 된다.** 한 줄로 보려면 `num2str`로 먼저 뭉친다.
- **`num2str`는 char를 만든다.** string이 아니다.
- **`fprintf`는 줄을 바꿔 주지 않는다.** `\n`을 직접 넣는다. `/n`은 그냥 글자다.
- **`%8.2f`의 8은 전체 폭이다.** 그래서 `%2.3f`는 말이 되지 않는다. 폭은 최소일 뿐 값이 잘리지 않는다.
- **형식 타입을 빼먹으면 조용히 아무것도 안 찍힌다.** 오류 메시지가 없다.
- **2차원 배열은 열 우선으로 소비된다.** 한 줄에 들어갈 값들이 **한 열에** 모이도록 `[a; b; c]`로 쌓는다.
- **배열 인수를 여러 개 주면 첫 배열을 다 쓰고 넘어간다.** 짝이 어긋난다.
- **`fprintf`의 반환값은 내보낸 글자 수**이지 파일 크기가 아니다. `"wt"`로 열면 `\n`이 CR+LF가 되어 줄 수만큼 어긋난다. 파일로 쓸 때 `fopen` → `fprintf(fid, ...)` → `fclose`.
- **`sprintf`는 형식 규칙이 `fprintf`와 같고 결과를 돌려준다.** 형식을 큰따옴표로 주면 string, 작은따옴표로 주면 char가 나온다.
- **TeX 기호는 역슬래시 두 번**(`'\\pi'`).

### table

- **입력은 모두 열 벡터여야 한다.** 행 벡터를 줘도 오류가 안 나고 1행짜리 엉뚱한 표가 된다.
- **`VariableNames=[...]`가 권장 형식이다.** 옛 형식 `'VariableNames', [...]`를 쓸 때만 작은따옴표가 강제되고, 거기에 큰따옴표를 쓰면 데이터 열로 오해받아 행 수 오류가 난다.
- **변수 이름이 그대로 열 이름이 된다.**
- **`disp(table(...))`로 감싸면 `ans =`가 사라진다.**
- **한글·공백·괄호가 든 열 이름은 `T.("...")`로만 접근된다.**

### `ginput` / 파일

- **`ginput`은 그래프 좌표를 준다.** 픽셀이 아니다. 개수를 생략하면 Enter까지 받는다. 둘 다 열 벡터다.
- **Import Wizard와 `uiimport`는 사람 손이 필요하다.** 자동화에는 `readtable` 등 전용 함수를 쓴다.
- **`readtable`은 확장자로 파일 종류를 정한다**(Table 7.4: 텍스트 `.txt .dat .csv` / 스프레드시트 `.xls .xlsx …` / `.xml`).
- **`readtable`은 첫 줄을 열 이름으로 쓰고 열마다 자료형을 정한다.** 글자 열의 기본값은 `cell`이므로 `TextType="string"`을 붙이면 좋다.
- **확장자가 저장 형식을 정한다.** `writetable(T, "a.xlsx")`와 `writetable(T, "a.csv")`.
- **읽기 함수 도움말의 "참고 항목"에 쓰기 함수가 있다.**

### 디버깅

- **coding error는 터지고, logic error는 조용히 틀린 답을 낸다.** 후자가 훨씬 어렵다.
- **`%%`가 섹션 경계다.** Run Section(`Ctrl+Enter`)으로 그 토막만 돌린다. 앞 섹션이 만든 변수는 workspace에 남아 있다. `-batch`에서는 그냥 주석이다.
- **주황 = warning(실행은 된다), 빨강 = error(실행이 멈춘다).**
- **경고가 전부 진짜 문제인 것은 아니다.** `%#ok<ID>` 억제는 "의도했다"는 표시로만.
- **회색 breakpoint는 안 걸린 것이다.** 저장했는지, 문법 오류가 남았는지 확인할 것. **문법 오류가 있으면 breakpoint를 쓸 수 없다.**
- **Step In**으로 사용자 정의 함수 안으로 들어가고 **Step Out**으로 나온다.
- **R2021b에서 디버깅 UI가 바뀌었다.** 교재 그림과 다를 수 있다.
- **`try/catch`는 터지는 오류만 잡는다.** logic error는 결과의 크기와 값을 직접 확인해야 한다.

## 실행 환경 메모

> **[보강]** 이 장에는 **`-batch`에서 돌릴 수 없는 함수가 넷** 있다: `input`, `ginput`, `uiimport`, `sound`(그리고 인수 없는 `pause`, `openvar`). 저장소의 예제는 모두 `usejava('desktop')`으로 환경을 보고 갈라, 배치 실행에서는 대체 입력으로 같은 뒷부분을 보여 준다. 데스크톱에서 열면 진짜로 물어본다.
>
> ```matlab
> if usejava('desktop')
>     z = input("Enter a value ");
> else
>     z = 5;   % -batch 에서는 input 을 쓸 수 없다
> end
> ```
>
> MATLAB R2026a에서 검증했다. R2026a 기본 figure 테마가 dark라, PNG로 저장하기 전에 `theme(gcf, "light")`를 넣었다.
