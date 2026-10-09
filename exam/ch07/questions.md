# Chapter 7 — User-Controlled Input and Output · 문제

- 모든 출력은 R2026a 기본 상태(`format short`, `format loose`) 기준이다.
- `[출력]` 문제는 Command Window에 찍히는 결과를 빈 줄까지 그대로 쓴다. 스크립트가 `input`으로 멈추면 프롬프트와 사용자가 친 글자가 한 줄에 함께 보인다.
- 따로 말이 없으면 각 문제는 workspace가 빈 상태에서 시작한다.
- 해답: [answers.md](answers.md)

---

## 7.1 사용자 입력 — `input`

### Q07-01 [출력] ★

원본: p.6–8

다음 스크립트를 실행했다. 사용자는 첫 프롬프트에 `2*4`를, 둘째 프롬프트에 `[1, 2; 3, 4]`를 치고 Enter를 눌렀다. Command Window에 찍히는 결과를 쓰시오.

```matlab
z = input("Enter a value ")
x = input("Enter an array in brackets ");
x
```

### Q07-02 [출력] ★★

원본: p.9–11

다음 스크립트를 실행했다. 사용자는 첫 프롬프트에 `"Holly"`를, 둘째 프롬프트에 `'Maria'`를 (따옴표까지) 쳤다. Command Window에 찍히는 결과를 쓰시오.

```matlab
y = input("Enter your name in double quotes ")
w = input("Enter your name in single quotes ");
n1 = numel(y), n2 = numel(w)
```

### Q07-03 [오류] ★

원본: p.12–13

다음 줄을 실행하고 사용자가 따옴표 없이 `Lin`이라고 쳤다.

```matlab
p = input("Enter your name - no need to include quotes ")
```

1. 무슨 일이 일어나는가? 오류 메시지 첫 줄(또는 핵심 줄)을 쓰시오.
2. 오류가 난 뒤 MATLAB은 어떻게 동작하는가?
3. 사용자가 따옴표 없이 쳐도 되도록 코드를 고치시오.

### Q07-04 [출력] ★★

원본: p.13 (`'s'` 옵션)

다음 스크립트를 실행하고 사용자가 `42`를 쳤다. Command Window에 찍히는 결과를 쓰시오. (`'0'`의 문자 코드는 48이다.)

```matlab
p = input("Enter your age - no need to include quotes ", "s")
q = p + 1
```

### Q07-05 [코드] ★★

원본: p.6–13

스크립트를 실행하자 Command Window가 아래와 같이 되었다. 프롬프트 뒤의 `[3 4 5]`, `Kim`, `21`은 사용자가 친 것이다. 이 결과를 만드는 스크립트(3줄)를 쓰시오. `Kim`은 따옴표 없이 입력되었다.

```
Enter the side lengths [3 4 5]
s =

     3     4     5

Enter your name Kim
Enter your age 21
```

### Q07-06 [단답] ★

원본: p.11–12

1. `w = 'Maria'`와 `y = "Holly"`의 class와 size를 각각 쓰시오.
2. `x = input('Enter your name', 's')`가 돌려주는 값의 class는?
3. 2의 옵션 이름이 `'s'`인데 결과가 그 class인 이유를 한 문장으로 쓰시오.

---

## 7.2.1 출력 (1) — `disp`

### Q07-07 [출력] ★

원본: p.15–16

```matlab
x = 2:2:10
x;
x
disp(x)
```

### Q07-08 [출력] ★★

원본: p.20–21 (`disp_example.m`)

다음 스크립트를 처음부터 끝까지 Run 했다.

```matlab
%%
x = 1:4;
disp("The values in the x array are:")
disp(x)
%%
y = 2.5;
disp("The value in the y array is : " + y)
y
```

### Q07-09 [변형] ★★

원본: p.22–23 (`disp("The value in the x array is : " + x')`, `num2str`)

`x = 1:3;` 다음에 아래 세 줄을 각각 실행할 때의 출력을 쓰고, 셋의 차이를 크기(size)로 설명하시오.

```matlab
disp("x = " + x')          % (a)
disp("x = " + x)           % (b)
disp("x = " + num2str(x))  % (c)
```

### Q07-10 [오류] ★

원본: p.19 (`disp`는 배열 하나만 받는다)

```matlab
disp("The answer is ", 5)
```

1. 오류 메시지를 쓰시오.
2. 같은 줄에 `The answer is 5`가 찍히도록 고치시오.

### Q07-11 [출력] ★★

원본: p.24 (Apostrophes and Double Quotes)

```matlab
disp('The moon''s gravity is 1/6th that of the earth')
disp("She said ""Hi"" to me.")
disp('He said "it''s fine"')
c = 'It''s'
```

### Q07-12 [출력] ★★★

원본: p.25–26 (`conversation.m`)

다음 스크립트를 **2026년 10월**에 실행했다. 사용자는 차례로 `Kim`, `20`, `Yes`를 쳤다. `clock`은 `[연 월 일 시 분 초]`를 돌려준다. `clc`가 화면을 지운 뒤의 Command Window를 쓰시오.

```matlab
clear, clc
disp("Hi There");
name = input("Who are you? ",'s');
disp("Hi"+ name);
age = input("How old are you?");
disp(age + "that's not very old")
today = clock;
computer_age = today(1)-1936;
disp("I'm " + computer_age +" years old")
answer = input("Don't you just love computers? ",'s');
disp(answer + "?");
disp("Goodbye")
```

### Q07-13 [코드] ★★

원본: p.20–21

아래 출력을 만드는 스크립트를 쓰시오. 점수 배열은 `s`라는 이름으로 만들고, 평균은 `mean`으로 구한다.

```
Scores:
    70    80    90
The average is 80
```

---

## 7.2.2 출력 (2) — `fprintf`

### Q07-14 [출력] ★

원본: p.28–30 (`fprintf("There are %f cows in the pasture", cows)`, Table 7.1)

```matlab
cows = 12;
fprintf("There are %f cows\n", cows)
fprintf("There are %e cows\n", cows)
fprintf("There are %g cows\n", cows)
fprintf("There are %d cows\n", cows)
fprintf("There are %d cows\n", 12.5)
```

### Q07-15 [출력] ★★

원본: p.31–32 (New Lines)

Command Window에 아래 세 줄을 차례로 입력했다. 첫 줄부터 마지막 프롬프트(`>>`)까지 화면을 그대로 쓰시오.

```
>> cows = 5;
>> fprintf("There are %d cows in the pasture", cows)
>> cows = 6
```

### Q07-16 [출력] ★★

원본: p.33–34 (Linefeed, `fprintf` from a Script)

```matlab
cows = 5;
fprintf("There are %f cows /n", cows)
cows = 6;
fprintf("There are %.0f cows\n", cows)
fprintf("Done")
fprintf("\n")
```

### Q07-17 [출력] ★★

원본: p.35–36 (Field Identifiers, Common Misconception)

```matlab
x = pi*100;
fprintf("[%8.2f]\n", x)
fprintf("[%2.3f]\n", x)
fprintf("[%.1f]\n", x)
fprintf("[%12.3e]\n", x)
fprintf("[%g]\n", x)
```

### Q07-18 [단답] ★

원본: p.35–36, p.49 (HINT)

1. `%8.2f`의 `8`과 `2`는 각각 무엇을 정하는가?
2. 슬라이드가 `%2.3f`를 "말이 되지 않는다"고 한 이유는?
3. `fprintf`의 형식에서 `f` 같은 type 문자를 빼먹으면 MATLAB은 어떻게 반응하는가?
4. `fprintf`에서 `%` 기호 자체를 찍으려면 어떻게 쓰는가?

### Q07-19 [출력] ★★★

원본: p.38–42 (`conversions_example.m`, Column Dominant)

```matlab
yards = 1:3;
feet = yards.*3;
conversions = [yards; feet]
fprintf("%3.0f yards = %5.1f feet\n", conversions)
```

### Q07-20 [변형] ★★★

원본: p.43 (Variable Number of Arrays)

Q07-19의 `yards`, `feet`를 그대로 두고 마지막 줄만 아래 (a), (b)로 바꿨다. 각각의 출력을 쓰고 Q07-19와 비교하시오.

```matlab
fprintf("%3.0f yards = %5.1f feet\n", yards, feet)        % (a)
fprintf("%3.0f yards = %5.1f feet\n", [yards', feet'])    % (b)
```

### Q07-21 [출력] ★★

원본: p.44–48 (`formatted_output_example.m`)

```matlab
file_id = fopen("my_output_file.txt", "wt");
x = [1.5 10.25 100];
fprintf(file_id, 'Value is %4.2f \n', x)
fclose(file_id);
```

1. Command Window에 찍히는 결과를 쓰시오.
2. `my_output_file.txt`의 내용을 쓰시오.
3. 슬라이드 원본(`x = linspace(1,10*sin(pi),1000);`, 형식 `'Some example output is %4.2f \n'`)에서 `ans = 29000`이 나온 이유를 계산으로 보이시오.

### Q07-22 [출력] ★★

원본: p.49 (HINT, `%%`)

```matlab
rate = 3.5;
fprintf('The interest rate is %5.2f %% \n', rate)
fprintf('%d%%\n', 50)
fprintf('%5.1f%%|\n', [12.34 5])
```

### Q07-23 [코드] ★★

원본: p.38–42

아래 출력을 만드는 스크립트를 쓰시오. 섭씨 배열 `C`와 화씨 배열 `F`(`F = C×9/5 + 32`)를 만들고 `fprintf` 한 번으로 찍는다.

```
  0 C =  32.0 F
 50 C = 122.0 F
100 C = 212.0 F
```

---

## 7.2.3 출력 (3) — `sprintf`

### Q07-24 [출력] ★

원본: p.50 (`a = sprintf("Some example output is %4.2f \n", pi*1000)`)

```matlab
a = sprintf('Some example output is %4.2f', pi*10)
b = sprintf('%8.3f', pi);
b
```

### Q07-25 [변형] ★★

원본: p.50

형식 문자열의 따옴표 종류만 다르게 했다. 출력을 쓰시오. 마지막 줄 (d)에서 `'!'`의 문자 코드는 33, `'3'`은 51, 공백은 32, `'a'`는 97, `'p'`는 112, `'l'`은 108, `'e'`는 101, `'s'`는 115다.

```matlab
s1 = sprintf("%d apples", 3)     % (a)
s2 = sprintf('%d apples', 3)     % (b)
s1 + "!"                         % (c)
s2 + '!'                         % (d)
```

### Q07-26 [출력] ★★

원본: p.85 (Example 7.3, `text_input=sprintf("%s %4.0f meters \n", t, maximum)`)

```matlab
g = 9.9;
velocity = 110;
theta = 0:5:90;
range = velocity^2/g*sind(2*theta);
maximum = max(range)
t = "The maximum range was ";
text_input = sprintf("%s %4.0f meters", t, maximum)
```

### Q07-27 [코드] ★★

원본: p.50, p.85

Q07-26의 `maximum`이 workspace에 있다. 아래 출력을 만드는 한 줄을 쓰시오. 결과는 그래프 제목(`title`)에 쓸 **char** 배열이어야 한다.

```
label =

    'theta = 45 deg, range = 1222 m'

```

---

## 7.2.4 출력 (4) — `table`

### Q07-28 [출력] ★★

원본: p.52 (`g = [9.8; 1.6]`, `d = 0.5 * g * 100^2`, `p = ["Earth";"Moon"]`)

```matlab
g = [9.8; 3.7]
d = 0.5 * g * 10^2;
p = ["Earth"; "Mars"]
d
```

### Q07-29 [빈칸] ★

원본: p.54–57

Q07-28의 `p`, `g`, `d`로 열 이름이 `Planet`, `g`, `Distance`인 표를 만들어 `ans =` 줄 **없이** 보여 주려 한다. 빈칸을 채우시오. (2)는 슬라이드의 옛 형식으로 쓴다.

```matlab
ColNames = ["Planet", "g", "Distance"];
___(1)___(table(p, g, d, ___(2)___, ColNames))
```

(3) (2)를 R2021a 이후 권장 형식(`Name=Value`)으로 바꿔 쓰시오.

### Q07-30 [오류] ★★

원본: p.55 (Using `'VariableNames'`)

```matlab
table(p, g, d, "VariableNames", ["Planet", "g", "Distance"])
```

1. R2026a에서 나는 오류 메시지를 쓰시오.
2. 그 메시지가 `VariableNames`를 언급하지 않고 그런 내용인 이유를 설명하시오.
3. 고치는 법 두 가지를 쓰시오.

### Q07-31 [출력] ★★

원본: p.53, p.58 (`table(p,g,d)`, `my_earth_moon_data = table(...)`)

Q07-28의 `p`, `g`, `d`가 workspace에 있다.

```matlab
my_data = table(p, g, d);
size(my_data)
my_data.Properties.VariableNames
```

### Q07-32 [변형] ★★

원본: p.53 ("all the input vectors need to be columns")

입력을 **행** 벡터로 바꿨다. 출력을 쓰고, 이 표가 왜 의도와 다른지 설명하시오. 오류가 나는가?

```matlab
p = ["Earth" "Mars"];
g = [9.8 3.7];
d = 0.5 * g * 10^2;
T = table(p, g, d);
size(T)
```

### Q07-33 [코드] ★★

원본: p.56 (A cleaner output)

Q07-28의 `p`, `g`, `d`가 workspace에 있다. 아래 출력(`ans =`와 `2×3 table` 줄이 없다)을 만드는 한 줄을 쓰시오.

```
    Planet      g     Distance
    _______    ___    ________

    "Earth"    9.8      490   
    "Mars"     3.7      185   

```

---

## 7.3 그래프로 입력받기 — `ginput`

### Q07-34 [출력] ★★

원본: p.62 (`ginput_example.m`)

```matlab
x = 5:30;
y = x.^2 - 40.*x + 400;
y(1)
[ymin, k] = min(y)
x(k)
```

### Q07-35 [출력] ★★

원본: p.62–63 (`[a,b] = ginput`, Results from ginput)

그래프를 그린 뒤 다음 줄을 실행했다.

```matlab
[a,b] = ginput
```

사용자는 그래프에서 좌표 (10.5, 110.25), (20, −0.5), (29.25, 85.0625)인 세 점을 차례로 찍고 Enter를 눌렀다. Command Window에 찍히는 결과를 쓰시오.

### Q07-36 [단답] ★

원본: p.61–63

1. `[x,y] = ginput(4)`와 `[x,y] = ginput`의 차이는?
2. `ginput`이 돌려주는 값은 픽셀 좌표인가, 그래프(축) 좌표인가?
3. Q07-35에서 `a`의 size는?

---

## 7.4 파일 읽고 쓰기

### Q07-37 [단답] ★

원본: p.66–69 (Table 7.3, Import Wizard, `audioread`)

1. `.wav` 파일 `dave.wav`를 읽어 소리 자료와 샘플링 주파수를 받는 한 줄, 그리고 그것을 재생하는 한 줄을 쓰시오.
2. Import Wizard를 명령으로 띄우는 함수 이름은?
3. Import Wizard는 반복 작업에 불편하다. 슬라이드가 말한 대안 두 가지는?
4. Table 7.3에서 `.mat`, `.csv`, `.xlsx` 확장자는 각각 무엇인가?

### Q07-38 [출력] ★★

원본: p.71–74 (`T = readtable("patients.dat");`, Variable Editor)

`patients.dat`은 100명의 환자에 대해 `LastName`, `Gender`, `Age`, `Location`, `Height`, `Weight`, `Smoker`, `Systolic`, `Diastolic`, `SelfAssessedHealthStatus` 열을 가진 내장 파일이다.

```matlab
T = readtable("patients.dat");
[r, c] = size(T)
T.Properties.VariableNames{1}
```

### Q07-39 [빈칸] ★★

원본: p.70, p.75 (Table 7.4, Exporting Data)

```matlab
T = ___(1)___("patients.dat");     % 표 형식으로 읽기
___(2)___(T, "patients.___(3)___")  % Excel 스프레드시트로 저장
```

(4) Table 7.4에서 `readtable`이 `.txt .dat .csv`를 읽을 때와 `.xls .xlsx`를 읽을 때 각각 어떤 종류의 파일로 취급하는가?

### Q07-40 [코드] ★★

원본: p.71, p.75

스크립트를 실행하자 Command Window에 아래 한 줄만 찍혔다. `patients.dat`을 표로 읽고, 엑셀 파일 `patients.xlsx`로 저장한 뒤 이 줄을 찍는 스크립트(3줄)를 쓰시오. 행 수는 `size`로 구한다.

```
Saved 100 rows to patients.xlsx
```

---

## 7.5 디버깅

### Q07-41 [출력] ★★★

원본: p.78–80 (Example 7.1 Freefall)

다음 스크립트를 실행하고 사용자가 차례로 `10`, `0`, `4`, `2`를 쳤다.

```matlab
clear, clc
g = input("What is the value of acceleration due to gravity? ")
start = input("What starting time would you like? ");
finish = input("What ending time would you like? ");
incr = input("What time increments would you like calculated? ");
time = start:incr:finish
distance = 1/2*g*time.^2;
final_distance = max(distance)
```

1. `clc` 뒤의 Command Window를 쓰시오.
2. Code Analyzer가 주황색 표시를 붙이는 줄은 어느 줄들이고, 메시지는 무엇인가?

### Q07-42 [오류] ★★

원본: p.81–82 (Code Analyzer – Fatal Error)

아래 코드를 `freefall.m` 스크립트로 저장했다.

```matlab
clear, clc
g = input("What is the value of acceleration due to gravity? ");
start = input("What starting time would you like? ");
finish = input("What ending time would you like? ");
incr = input("What time increments would you like calculated? ");
time=start:incr:finish;
distance=1/2*g*time.^2;
% plot the results
loglog(time,distance
title("Distance traveled in Freefall")
```

1. Code Analyzer 표시줄에 무슨 색 표시가 생기고, 마우스를 올리면 어떤 메시지가 보이는가?
2. 이 스크립트를 Run 하면 2번째 줄의 `input` 프롬프트가 뜨는가? 이유는?
3. 고치시오.

### Q07-43 [단답] ★

원본: p.78–84, p.85 (Code Analyzer, Breakpoints)

1. Code Analyzer 표시줄에서 주황과 빨강은 각각 무엇을 뜻하는가?
2. breakpoint는 어떻게 거는가? 표시가 회색이면 무엇을 의심해야 하는가?
3. 문법 오류가 남은 파일에 breakpoint를 걸 수 있는가?
4. 슬라이드 그림과 화면이 다를 수 있다고 한 버전 경계는?

### Q07-44 [단답] ★★

원본: p.85–88 (Example 7.3, Breakpoints, Continue, Step)

```matlab
clear,clc                                          % 1
% Define the input parameters                      % 2
g = 9.9;                                           % 3
velocity = 110;                                    % 4
theta = [0:5:90];                                  % 5
% Calculate the range                              % 6
range = velocity^2/g*sind(2*theta);                % 7
% Calculate the maximum range                      % 8
maximum = max(range);                              % 9
```

7번 줄에 breakpoint를 걸고 Run 했다.

1. 실행이 멈췄을 때 Command Window 프롬프트는 어떤 모양인가?
2. 멈춘 순간 workspace에 있는 변수를 모두 쓰시오.
3. 여기서 **Step**을 한 번 누르면 workspace에 새로 생기는 변수는?
4. **Continue**를 누르면 어떻게 되는가?

### Q07-45 [출력] ★★

원본: p.89–90 (Example 6.1, `DR` 함수, Step In/Out)

`DR.m` 파일과 스크립트가 아래와 같다.

```matlab
function output = DR(x)
output = x*pi/180;
end
```

```matlab
degrees = 0:90:180;
radians = DR(degrees)
degrees_radians = [degrees; radians]'
```

1. 스크립트의 출력을 쓰시오.
2. 2번째 줄에 breakpoint를 걸고 멈췄을 때 `DR` 안으로 들어가려면 어떤 버튼을 누르는가? 함수 안에서 호출한 쪽으로 돌아가려면?
