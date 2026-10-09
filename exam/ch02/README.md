# Chapter 2 — MATLAB Environment 문제집

원본: `Chapter 02.pdf` (91쪽). 개념 참고: [`textbook/ch02/`](../../textbook/ch02/README.md).

- 문제: [questions.md](questions.md)
- 해답: [answers.md](answers.md)

## 출제 범위

| 절 | 내용 | 슬라이드 | 문제 수 | 번호 |
| --- | --- | --- | --- | --- |
| [2.1](../../textbook/ch02/2.1-getting-started.md) | MATLAB 시작, Desktop 기본 창, `ans` | p.4–p.6 | 3 | Q02-01 ~ Q02-03 |
| [2.2](../../textbook/ch02/2.2-matlab-windows.md) | Command/History/Workspace/Current Folder/Document/Graphics/Edit 창, `clc`·`clear`, `whos`, `plot` | p.7–p.24 | 6 | Q02-04 ~ Q02-09 |
| [2.3](../../textbook/ch02/2.3-variables-and-types.md) | 변수 이름 규칙, `isvarname`, `iskeyword`, 함수 이름 덮어쓰기, 데이터 타입 | p.25–p.33 | 6 | Q02-10 ~ Q02-15 |
| [2.4](../../textbook/ch02/2.4-array-calculations.md) | 스칼라·배열 연산, 대입, 연산자 우선순위, 콜론·`linspace`·`logspace`, `.*` `./` `.^`, 전치, `format` | p.34–p.66 | 21 | Q02-16 ~ Q02-36 |
| [2.5](../../textbook/ch02/2.5-saving-and-scripts.md) | `save`·`load`(.mat/.dat), Import Wizard, 스크립트, 주석, Live Script, Section 모드 | p.67–p.87 | 9 | Q02-37 ~ Q02-45 |
| | | | **45** | |

> 슬라이드의 절 번호(2.3.3 Calculations, 2.4.1 Saving …)는 textbook 절 번호와 한 칸 어긋난다. 이 문제집은 textbook 절 구성을 따른다.

유형별 문제 수:

| 유형 | 문제 수 |
| --- | --- |
| `[출력]` | 24 |
| `[코드]` | 6 |
| `[오류]` | 6 |
| `[빈칸]` | 1 |
| `[변형]` | 1 |
| `[단답]` | 7 |

`[출력]` + `[코드]` = 30 / 45.

## 원본 예제 색인

슬라이드에 나온 코드 예제 전부. 개념 설명만 있는 쪽(p.7–p.9, p.23, p.25, p.32, p.65 등)과 코드가 없는 GUI 화면(p.18 Variable Editor, p.19 `unnamed` 변수, p.87 View 탭)은 적지 않았다. GUI 화면은 Q02-09, Q02-45 단답에서 다룬다.

| 슬라이드 쪽 | 원본 코드 요지 | 절 | 변형 문제 |
| --- | --- | --- | --- |
| p.5, p.6 | `5^2` → `ans = 25`, `cos(pi)` → `ans = -1` | 2.1 | Q02-01, Q02-02, Q02-03 |
| p.10 | Command History에 `clear,clc` `5^2` `cos(pi)` 기록 | 2.2 | Q02-09 |
| p.11 | Workspace 표: `ans` 1×1 `double` 25 | 2.2 | Q02-09, Q02-14 |
| p.12 | Workspace에 `ans` 1x1 -1 (`5^2`, `cos(pi)` 실행 후) | 2.2 | Q02-03 |
| p.13, p.14 | `A=5`, `B=[1, 2, 3, 4]`, `C = [1 2 3 4; 10 20 30 40; 5 10 15 20]` | 2.2 | Q02-04, Q02-05 |
| p.15 | `clc` — 화면만 지우고 Workspace 유지 | 2.2 | Q02-06 |
| p.16 | `clear` — Workspace 변수 삭제 | 2.2 | Q02-06 |
| p.17 | `whos` → Name/Size/Bytes (A 8, B 32, C 96, ans 8) | 2.2 | Q02-05 |
| p.20, p.24 | `x = [1 2 3 4 5];` `y = [10, 20, 30, 40, 50];` `plot(x,y)` | 2.2 | Q02-07 |
| p.22 | 제목 `My Example Graph`, 축 `Time, seconds` / `Distance, meters` | 2.2 | Q02-08 |
| p.27, p.28 | `isvarname cool_beans` → 1, `isvarname cool-beans` → 0 | 2.3 | Q02-10 |
| p.29 | 예약어 `for` `while` `if`, `iskeyword`, `clear max` | 2.3 | Q02-11, Q02-15 |
| p.30 | `max = 5` — 함수 이름을 변수로 | 2.3 | Q02-12 |
| p.31 | `clear max` — 함수로 되돌리기 | 2.3 | Q02-13 |
| p.33 | 데이터 타입: `double`, char/string, logical, `table` | 2.3 | Q02-14 |
| p.34 | 수학 표기 $A=[5]$, $B=[2\ 5]$, $C=[1\ 2;\ 5\ 5]$ | 2.4 | Q02-16 |
| p.36 | `a=1+2` `b=5` `x=a+b` `y=b-a` `z=b^a` `w=3^2` | 2.4 | Q02-17 |
| p.37 | `x = 8`, `x = x + 1`, `=` vs `==` | 2.4 | Q02-18 |
| p.38 | 연산자 우선순위 4단계 | 2.4 | Q02-22 |
| p.40 | `r=5; h=10; SA=2*pi*r^2 + 2*pi*r*h` → 471.2389 | 2.4 | Q02-19, Q02-20 |
| p.41 | `SA = 2*pi*r*(r+h)` → 471.2389 | 2.4 | Q02-19, Q02-20 |
| p.42 | `SA = 2*pi*r*r + h` → 167.0796 | 2.4 | Q02-19 |
| p.43 | `r(r+h)`는 오류, `r*(r+h)` | 2.4 | Q02-21 |
| p.44 | 줄 끝 `;`로 출력 억제, `,`·`;`로 한 줄에 여러 명령 | 2.4 | Q02-23 |
| p.45 | `x = [1 2 3 4]`, `y = [1; 2; 3; 4]`, 여러 줄로 쓴 `a = [1 2 3 4; …]` | 2.4 | Q02-24 |
| p.46, p.47 | `b = 1:5`, `b = [1:5]`, `c = 1:2:5` | 2.4 | Q02-25, Q02-26 |
| p.48, p.49 | `d = linspace(1, 10, 3)` → `1.0000 5.5000 10.0000` | 2.4 | Q02-27 |
| p.50, p.51 | `e = logspace(1, 3, 3)` → `10 100 1000` | 2.4 | Q02-28 |
| p.52, p.53 | `a = [1 2 3]`, `b = a + 5` → `6 7 8` | 2.4 | Q02-29 |
| p.54, p.55 | `c = a + b` → `7 9 11` | 2.4 | Q02-29 |
| p.56, p.57 | `b = [6 7 8]`, `c = a.*b` → `6 14 24` | 2.4 | Q02-29 |
| p.58 | `c = a*b` → `Error using *` Incorrect dimensions … | 2.4 | Q02-30 |
| p.59 | `c = a.^2` → `1 4 9`, `d = a./b` → `0.1667 0.2857 0.3750` | 2.4 | Q02-31 |
| p.60 | `c = 5./a` → `5.0000 2.5000 1.6667` | 2.4 | Q02-32 |
| p.61 | `c = 5/a` → `Error using /` Matrix dimensions must agree. | 2.4 | Q02-32 |
| p.62 | `degrees = [10 15 70 90];` `radians = degrees*pi/180` / `degrees.*pi/180` | 2.4 | Q02-33 |
| p.64 | `degrees'`, `Deg_to_R = [degrees',radians']` | 2.4 | Q02-34 |
| p.66 | Table 2.2 `format short/long/short e/long e/bank/short eng/long eng/+/rat/short g/long g` | 2.4 | Q02-35, Q02-36 |
| p.68 | `a = 5; b = [1, 2, 3]; c = [1, 2; 3, 4];` `save my_example_file` | 2.5 | Q02-37 |
| p.69, p.70 | `save my_new_file a b`, `save my_new_file2.dat a b -ascii` | 2.5 | Q02-38, Q02-39, Q02-44 |
| p.71, p.72 | `clear,clc` `load my_example_file` — 크기가 다른 세 변수 복원 | 2.5 | Q02-37 |
| p.73–p.75 | ASCII 파일은 파일 이름의 변수 하나로, Import Wizard | 2.5 | Q02-38, Q02-39 |
| p.77 | Table 2.3 `myscript`, `run myscript`, `run('myscript')` | 2.5 | Q02-45 |
| p.78 | 스크립트 `example2_3.m`: `drag`, `density`, `velocity = 0:20:200`, `cd`, `results = [velocity',drag']` | 2.5 | Q02-40 |
| p.79 | `% This is a comment.`, `a = 5 % The variable a is defined as 5` | 2.5 | Q02-41 |
| p.80 | Evaluate Section | 2.5 | Q02-44 |
| p.82 | 같은 drag 코드의 Live Script, `cd = 0.16342` | 2.5 | Q02-40 |
| p.84 | `%% Section Name` — `%%` 뒤 공백 | 2.5 | Q02-44 |
| p.85 | `clear,clc, format shortg`, `%% Problem 2.1`, `1 + 3/4` `5*6*4/2` `5/2*6*4` `5^2*3` `5^(2*3)` `1 + 3 + 5/5 + 3 + 1` | 2.5 | Q02-42, Q02-43, Q02-44 |
| p.86 | Live Script 섹션, `(1 + 3 + 5)/(5 + 3 + 1)` → 1 | 2.5 | Q02-42 |

## textbook과 다른 점

해답을 쓰다 발견한 textbook/ch02의 오류다. textbook은 이 PR에서 고치지 않았다.

- [2.3 ⚠️ 함정](../../textbook/ch02/2.3-variables-and-types.md): "`isvarname`은 예약어인지까지는 확인해 주지 않는다"는 틀렸다. `isvarname('for')`는 0이다(Q02-11).
- [2.5 ⚠️ 함정](../../textbook/ch02/2.5-saving-and-scripts.md): "`-ascii` 앞의 하이픈과 뒤 사이에는 공백이 있어야 한다"는 슬라이드 p.70과 반대다. `-ascii`로 붙여 쓴다(Q02-44).

## 확인 필요 목록

MATLAB R2026a에서 실제 화면을 확인할 항목. 자세한 내용은 [answers.md](answers.md)의 `[확인 필요]` 표시.

- Q02-32: `6/a` 오류 둘째 줄 문구(`Matrix dimensions must agree.`).
- Q02-39: 행마다 열 수가 다른 ASCII 파일을 `load`할 때 오류 문구.
