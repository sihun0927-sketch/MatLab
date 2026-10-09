# exam/ch07 — User-Controlled Input and Output

지필 시험 대비 문제집. 규칙은 [exam/README.md](../README.md), 개념 정리는 [textbook/ch07](../../textbook/ch07/README.md).

- 문제: [questions.md](questions.md) (45문제)
- 해답: [answers.md](answers.md)

## 출제 범위

원본은 `Chapter 07.pdf`(93쪽)와 `Chapter 07_2.pdf`(44쪽)다. 07_2의 44쪽은 07의 p.50–93과 **쪽마다 픽셀 단위로 같다**(07_2 p.N = 07 p.N+49). 그래서 아래 쪽수는 모두 `Chapter 07.pdf` 기준이다.

| 절 | 슬라이드 | 다루는 것 |
| --- | --- | --- |
| 7.1 | p.5–13 | `input`으로 스칼라·배열·string·char 받기, `'s'` 옵션 |
| 7.2.1 | p.14–26 | 세미콜론 생략, `disp`, string `+`, `num2str`, 따옴표 두 번, 대화 스크립트 |
| 7.2.2 | p.27–49 | `fprintf`, `%f %e %d %g %c %s`, `\n`, 폭·정밀도, 열 우선, 파일 출력, `%%` |
| 7.2.3 | p.50 | `sprintf` |
| 7.2.4 | p.51–60 | `table`, `'VariableNames'`, `disp(table(...))` |
| 7.3 | p.61–63 | `ginput` |
| 7.4 | p.64–75 | Import Wizard, `uiimport`, `audioread`/`sound`, `readtable`/`writetable` |
| 7.5 | p.76–90 | Code Analyzer(주황·빨강), breakpoint, Continue/Step/Step In/Step Out |

p.1–4(표지·학습목표·도입), p.91–93(Summary)에는 코드가 없다.

## 절별 문제 수

| 절 | 문제 | 수 | `[출력]`+`[코드]` |
| --- | --- | --- | --- |
| 7.1 | Q07-01 ~ Q07-06 | 6 | 4 |
| 7.2.1 | Q07-07 ~ Q07-13 | 7 | 5 |
| 7.2.2 | Q07-14 ~ Q07-23 | 10 | 8 |
| 7.2.3 | Q07-24 ~ Q07-27 | 4 | 3 |
| 7.2.4 | Q07-28 ~ Q07-33 | 6 | 3 |
| 7.3 | Q07-34 ~ Q07-36 | 3 | 2 |
| 7.4 | Q07-37 ~ Q07-40 | 4 | 2 |
| 7.5 | Q07-41 ~ Q07-45 | 5 | 2 |
| 합계 | | **45** | **29** |

유형별: `[출력]` 23, `[코드]` 6, `[변형]` 4, `[오류]` 4, `[빈칸]` 2, `[단답]` 6.

## 원본 예제 색인

슬라이드에 나온 코드 예제 전부. 코드 대부분이 스크린샷이라 쪽마다 눈으로 옮겼다.

| 슬라이드 쪽 | 원본 코드 요지 | 절 | 변형 문제 |
| --- | --- | --- | --- |
| p.6–7 | `z = input("Enter a value ")` → `5` | 7.1 | Q07-01, Q07-05 |
| p.8 | `x = input("Enter an array in brackets ")` → `[1, 2, 3; 4, 5, 6]` | 7.1 | Q07-01, Q07-05 |
| p.9 | `y = input("Enter your name in double quotes ")` → `"Holly"` | 7.1 | Q07-02 |
| p.10–11 | `w = input("Enter your name in single quotes ")` → `'Maria'`, `w` 1x5 char vs `y` 1x1 string | 7.1 | Q07-02, Q07-06 |
| p.12–13 | `x = input('Enter your name', 's')`(p.12), `p = input("Enter your name - no need to include quotes ",'s')` → `Lin`(p.13) | 7.1 | Q07-03, Q07-04, Q07-05, Q07-06 |
| p.15 | `x = 1:5`, `x` | 7.2.1 | Q07-07 |
| p.16 | `disp(x)` | 7.2.1 | Q07-07 |
| p.17–18 | `disp("The values in the x array are:")` | 7.2.1 | Q07-08 |
| p.19 | `disp`는 배열 하나만 받는다 | 7.2.1 | Q07-10 |
| p.20 | `disp_example.m` 1절: `x = 1:5; disp("The values in the x array are:"); disp(x)` | 7.2.1 | Q07-08, Q07-13 |
| p.21 | 2절: `y = 5; disp("The value in the y array is : " + y)` | 7.2.1 | Q07-08, Q07-13 |
| p.22 | 3절: `disp("The value in the x array is : " + x')` | 7.2.1 | Q07-09 |
| p.23 | 4절: `disp("The values in the x array are: " + num2str(x))` | 7.2.1 | Q07-09 |
| p.24 | `disp('The moon''s gravity ...')`, `disp("Mark Twain once said ""Age ...""")`, `disp("""If you don't mind, it doesn't matter.""")` | 7.2.1 | Q07-11 |
| p.25–26 | `conversation.m` (`input(...,'s')`, `"Hi"+ name`, `clock`, `pause(2)`) | 7.2.1 | Q07-12 |
| p.28–29 | `cows = 5; fprintf("There are %f cows in the pasture", cows)` | 7.2.2 | Q07-14, Q07-15 |
| p.30 | Table 7.1 `%f %e %d %g %c %s` | 7.2.2 | Q07-14 |
| p.31–32 | `fprintf` 뒤 프롬프트가 같은 줄, `cows = 6` | 7.2.2 | Q07-15 |
| p.33 | `fprintf_example.m`: `fprintf("There are %f cows in the pasture \n", cows)` 두 번 | 7.2.2 | Q07-16 |
| p.34 | `/n`으로 잘못 써서 한 줄에 이어짐 | 7.2.2 | Q07-16 |
| p.35–36 | `%8.2f`, HINT `%2.3f` | 7.2.2 | Q07-17, Q07-18 |
| p.38–42 | `conversions_example.m`: `feet = 1:3; inches = feet.*12; conversions = [feet;inches]; fprintf("%4.0f feet equals %7.2f inches \n",conversions)` | 7.2.2 | Q07-19, Q07-23 |
| p.43 | `fprintf("%4.0f feet equals %7.2f inches \n",feet,inches)` | 7.2.2 | Q07-20 |
| p.44–48 | `file_id = fopen("my_output_file.txt", "wt"); x = linspace(1,10*sin(pi),1000); fprintf(file_id, 'Some example output is %4.2f \n', x)` → `ans = 29000` | 7.2.2 | Q07-21 |
| p.49 | HINT: 형식 type 누락, `fprintf('The interest rate is %5.2f %% \n', 5)` | 7.2.2 | Q07-18, Q07-22 |
| p.50 | `a = sprintf("Some example output is %4.2f \n", pi*1000)` | 7.2.3 | Q07-24, Q07-25, Q07-27 |
| p.52 | `g = [9.8; 1.6]`, `d = 0.5 * g * 100^2`, `p = ["Earth";"Moon"]` | 7.2.4 | Q07-28 |
| p.53 | `table(p,g,d)` (열 이름 = 변수 이름, 입력은 열 벡터) | 7.2.4 | Q07-31, Q07-32 |
| p.54–55 | `table(p,g,d,'VariableNames',["Planet","g","Distance"])` | 7.2.4 | Q07-29, Q07-30 |
| p.56 | `disp(table(p,g,d,'VariableNames',...))` | 7.2.4 | Q07-29, Q07-33 |
| p.57 | `ColNames = ["Planet","g","Distance"]; disp(table(p,g,d,'VariableNames',ColNames))` | 7.2.4 | Q07-29 |
| p.58–60 | `my_earth_moon_data = table(p,g,d,'VariableNames',ColNames);` | 7.2.4 | Q07-31 |
| p.61 | `[x,y] = ginput(n)`, `[x,y] = ginput` | 7.3 | Q07-36 |
| p.62–63 | `ginput_example.m`: `x = 5:30; y = x.^2 - 40.*x + 400; plot(x, y); axis([5,30,-50,250]); grid on; [a,b] = ginput` | 7.3 | Q07-34, Q07-35, Q07-36 |
| p.66 | Table 7.3 지원 파일 형식 | 7.4 | Q07-37 |
| p.67–68 | `uiimport`, Import Wizard(Generate MATLAB code) | 7.4 | Q07-37 |
| p.69 | `[data,fs] = audioread("dave.wav")`, `sound(data,fs)` | 7.4 | Q07-37 |
| p.70 | Table 7.4 `readtable` 확장자 | 7.4 | Q07-39 |
| p.71–74 | `T = readtable("patients.dat");` → `100x10 table` | 7.4 | Q07-38, Q07-40 |
| p.75 | `readtable("filename.xlsx")`, `writetable(T,"filename")` | 7.4 | Q07-39, Q07-40 |
| p.78–80 | Example 7.1 Freefall(`g = input(...)` 등), 주황 경고 "Add a semicolon …" | 7.5 | Q07-41, Q07-43 |
| p.81–82 | 같은 코드의 live script, `loglog(time,distance` → 빨강 "A '(' might be missing a closing ')'" | 7.5 | Q07-42, Q07-43 |
| p.85–88 | Example 7.3 (`range = velocity^2/g*sind(2*theta)`, `text_input=sprintf("%s %4.0f meters \n", t, maximum)`), 7번 줄 breakpoint, Continue, Step | 7.5 | Q07-26, Q07-43, Q07-44 |
| p.89–90 | Example 6.1 `degrees = 0:15:180; radians = DR(degrees); degrees_radians =[degrees;radians]'`, `radians = 0:pi/12:pi;`, `function output=DR(x)`, Step In / Step Out | 7.5 | Q07-45 |

## 슬라이드 밖 / R2026a와 다른 점

- 슬라이드는 R2022a 화면이다. `format loose`(R2026a 기본)의 빈 줄이 슬라이드 캡처에는 대부분 없다. 해답은 R2026a 기준으로 빈 줄을 넣었다.
- 슬라이드 p.50은 `a = sprintf("...")`의 결과를 따옴표 없이 보여 주지만, R2026a는 string을 큰따옴표로 감싸 보인다. 문제는 `\n` 없는 형식으로 바꿔 냈다.
- 슬라이드 p.55는 `"VariableNames"`(큰따옴표)를 쓰면 "적절한 알림"과 함께 오류가 난다고 하지만, R2026a 메시지는 행 수 오류다(Q07-30).
- 확인이 필요한 표시 형식은 [answers.md](answers.md)에 `[확인 필요]`로 남겼다: Q07-03, Q07-11, Q07-15, Q07-18, Q07-30, Q07-33, Q07-42.
