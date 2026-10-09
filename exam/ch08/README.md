# exam/ch08 — Logical Functions and Selection Structures

원본: `Chapter 08.pdf` (69쪽). 참고: [textbook/ch08](../../textbook/ch08/README.md).

- [questions.md](questions.md) — 문제 45개, 시험지 형식
- [answers.md](answers.md) — 해답, 해설, 근거

## 출제 범위

| 절 | 내용 | 슬라이드 |
| --- | --- | --- |
| 8.1 | control structure 3종, 관계 연산자 6개, logical 배열, `==` vs `=`, 논리 연산자 6개(`& ~ \| xor && \|\|`) | p.3~p.16 |
| 8.2 | pseudocode → 주석 → 코드(mph → ft/s 표), flowchart 기호 4종 | p.17~p.23 |
| 8.3 | `find`(인덱스 반환), 복합 조건(Naval Academy), `fprintf` 출력, 열 우선 번호, `[row,col]`, table | p.24~p.38 |
| 8.4 | logical indexing, `find`와 비교, 한 줄 축약, `<missing>`, `~`로 채우기, table | p.39~p.45 |
| 8.5.1 | simple `if`, 배열 조건은 전 원소가 참이어야 | p.46~p.50 |
| 8.5.2 | `if/else`, `else` 줄에 조건 없음, 배열 입력, `beep` vs `error` | p.51~p.55 |
| 8.5.3 | `elseif`, 앞에서 배제된 범위 생략, flowchart | p.56~p.58 |
| 8.5.4 | `switch/case`, 숫자·문자열, `input(…,"s")`는 char, `otherwise` | p.59~p.62 |
| 8.5.5 | `menu` + `switch`, `listdlg`, App Designer | p.63~p.65 |
| 요약 | Summary | p.66~p.69 |

절 번호는 textbook과 같이 슬라이드 본문을 따랐다. logical indexing은 슬라이드에 번호가 없어서 8.4로 두었다.

## 절별 문제 수

| 절 | 문제 | 수 | `[출력]`+`[코드]` |
| --- | --- | --- | --- |
| 8.1 | Q08-01 ~ Q08-08 | 8 | 6 |
| 8.2 | Q08-09 ~ Q08-12 | 4 | 2 |
| 8.3 | Q08-13 ~ Q08-20 | 8 | 6 |
| 8.4 | Q08-21 ~ Q08-25 | 5 | 4 |
| 8.5.1 | Q08-26 ~ Q08-29 | 4 | 4 |
| 8.5.2 | Q08-30 ~ Q08-34 | 5 | 4 |
| 8.5.3 | Q08-35 ~ Q08-38 | 4 | 2 |
| 8.5.4 | Q08-39 ~ Q08-42 | 4 | 3 |
| 8.5.5 | Q08-43 ~ Q08-45 | 3 | 1 |
| 합계 | | 45 | 32 (71%) |

유형별: `[출력]` 24, `[코드]` 8, `[변형]` 5, `[오류]` 6, `[단답]` 2.

## 원본 예제 색인표

| 슬라이드 쪽 | 원본 코드 요지 | 절 | 변형 문제 |
| --- | --- | --- | --- |
| p.8~p.9 | `x=5; y=1; x<y` → `ans = logical 0` | 8.1 | Q08-01 |
| p.10~p.11 | `x=[1,2,3,4,5]; y=[-2,0,2,4,6]; x<y` → `0 0 0 0 1` | 8.1 | Q08-02 |
| p.13 | `x = 5`, `x == 3` → `ans = 0` (HINT: `==` vs `=`) | 8.1 | Q08-03, Q08-04 |
| p.14 | Table 8.2 논리 연산자 `& ~ \| xor && \|\|` (`&&`, `\|\|`는 스칼라 전용) | 8.1 | Q08-08 |
| p.15 | `z=[8,8,8,8,8]; z>x & z>y` → `1 1 1 1 1` | 8.1 | Q08-05, Q08-06 |
| p.16 | `x>y \| x>z` → `1 1 1 0 0` | 8.1 | Q08-05 |
| p.20 | pseudocode를 주석으로: `% Define a vector of mph values` … `% Display the table` | 8.2 | Q08-11 |
| p.21 | `mph = 0:10:100; fps = mph*5280/3600; chart = [mph;fps]`, `disp`, `fprintf("%8.0f %8.2f \n",chart)` | 8.2 | Q08-09, Q08-10, Q08-11 |
| p.23 | mph 예제 flowchart (Start → 정의 → 계산 → 합치기 → 출력 → End) | 8.2 | Q08-12 |
| p.26~p.27 | `height = [63,67,65,72,69,78,75]; accept = find(height>=66)` → `2 4 5 6 7` | 8.3 | Q08-13, Q08-14 |
| p.28 | `height(accept)` → `67 72 69 78 75` | 8.3 | Q08-13 |
| p.30 | `applicants = [63,18; …]; qualify = find(applicants(:,1)>=66 & applicants(:,2)>=18 & applicants(:,2)<=35)` → `2;4;6` | 8.3 | Q08-15 |
| p.31 | `results = [qualify, applicants(qualify,1), applicants(qualify,2)]'; fprintf("Applicant #%d is %2.0f inches tall and %2.0f years old\n", results)` | 8.3 | Q08-15 |
| p.32~p.36 | `temp = [95.3, 100.2, 98.6; 97.4, 99.2, 98.9; 100.1, 99.3, 97]`, `index = find(temp>98.6)'` → `3 4 5 6 8` | 8.3 | Q08-16, Q08-18 |
| p.37 | `[row,col] = find(temp>98.6)` → `row = 3;1;2;3;2` | 8.3 | Q08-17 |
| p.38 | `x = [1,2,3;10,5,1;12,3,2;8,3,1]`, `index = find(x>9)`, `values = x(index)`, `disp(table(index,values,'VariableNames',[…]))` | 8.3 | Q08-19, Q08-20 |
| p.40 | `Patient_Names = ["Jason",…]; Temp = [98.2, 100.3, 97, 101]; index = find(Temp>98.6); Patient_Names(index)` | 8.4 | Q08-21, Q08-24 |
| p.41 | `fever = Temp>98.6` → `0 1 0 1`, `Patient_Names(fever)` | 8.4 | Q08-21, Q08-23, Q08-24 |
| p.42 | `Patient_Names(Temp>98.6)` (한 줄로) | 8.4 | Q08-21 |
| p.43 | `result(fever) = "Sick"` → `<missing> "Sick" <missing> "Sick"` | 8.4 | Q08-22 |
| p.44 | `result(~fever) = "Well"` | 8.4 | Q08-22 |
| p.45 | `T = ["Patients","Temperature","Diagnosis"]; disp(table(Patient_Names',Temp',result','VariableNames',T))` | 8.4 | Q08-20 |
| p.47 | simple `if` 구문: `if comparison / statements / end` | 8.5.1 | Q08-26 |
| p.48 | `G = input("Enter a value for G "); if G<50 disp(…) disp(G); end`, 5 입력 | 8.5.1 | Q08-26, Q08-28 |
| p.49 | 같은 코드, 70 입력 → 출력 없음 | 8.5.1 | Q08-26 |
| p.50 | 같은 코드, `[5 25 75]` 입력 → 출력 없음 | 8.5.1 | Q08-27 |
| p.52 | `x = input("Enter a value of x: ")`, `if x >0 y = log(x) else disp(…) end`, 5 입력 → `y = 1.6094` | 8.5.2 | Q08-30, Q08-31 |
| p.53 | 같은 코드, -1 입력 → `The input to the log function must be positive` | 8.5.2 | Q08-30, Q08-31, Q08-33 |
| p.54 | 같은 코드, "음수가 섞인 배열이면?" | 8.5.2 | Q08-34 |
| p.55 | HINT: `else beep disp(…)` vs `else error(…)` | 8.5.2 | Q08-32 |
| p.56 | `if / elseif / elseif / else / end` 구문 | 8.5.3 | Q08-38 |
| p.57 | `age = input("Enter your age: ")`, `if age<16 … elseif age<18 … elseif age<70 … else … end`, 50 입력 | 8.5.3 | Q08-35, Q08-36, Q08-37, Q08-38 |
| p.58 | elseif flowchart (마름모 `age<16` → `age<18` → `age<70`) | 8.5.3 | Q08-36 |
| p.59 | `switch variable / case option 1 … / otherwise … / end` 구문 | 8.5.4 | Q08-41 |
| p.60 | `city = input("…in double quotes:")`, `switch city case "Boston" … otherwise … end`, `"Honolulu"` 입력 | 8.5.4 | Q08-39, Q08-41 |
| p.61~p.62 | `city = input("Enter the name of a city :","s")`, `case 'Boston' …`, `Denver` 입력 → `'Denver'`, `$150` | 8.5.4 | Q08-40 |
| p.64 | `prompt = "Select a city from the menu:"; list = ["Boston","Denver","Honolulu"]; city = menu(prompt,list)`, `switch city case 1 …` | 8.5.5 | Q08-43, Q08-44 |
| p.65 | 메뉴 창에서 Denver 선택 → `city = 2`, `$150` | 8.5.5 | Q08-43, Q08-44, Q08-45 |

슬라이드 밖에서 만든 문제(`원본: [보강]`): Q08-07, Q08-25, Q08-29, Q08-41, Q08-42. textbook의 `⚠️ 함정`과 `[보강]`을 문제로 바꾼 것이다.

## `[확인 필요]` 목록

MATLAB에서 확인할 표시 형식과 오류 문구. 위치는 `answers.md`의 해당 문제다.

- Q08-04 스크립트 구문 오류의 머리줄과 열 번호
- Q08-08 `&&`에 배열을 넣었을 때의 R2026a 메시지 문구
- Q08-20 `"VariableNames"` 오류의 영문 머리줄
- Q08-22 없던 변수에 `1 0 1 0` logical 인덱스로 대입한 결과의 크기(1×3)
- Q08-24 벡터 인덱싱에서 `Index in position 1 is invalid.`가 붙는지
- Q08-32 스크립트에서 `error`를 부를 때 머리줄
- Q08-38 `END is missing` 메시지 문구
