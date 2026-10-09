# Chapter 8 — Logical Functions and Selection Structures · 문제

- 별도 지시가 없으면 MATLAB R2026a 기본 상태(`format short`, `format loose`)라고 가정한다.
- `[출력]` 문제는 Command Window에 찍히는 내용을 빈 줄까지 그대로 쓴다. 아무것도 찍히지 않으면 "출력 없음"이라고 쓴다.
- 코드 블록 안의 `>>`는 Command Window에 직접 친 명령이다. `>>`가 없는 코드는 스크립트 파일로 저장해 실행한 것이다.
- `input`, `menu`가 있는 문제는 사용자가 입력한 값이 문제에 주어진다.

---

## 8.1 관계·논리 연산자

### Q08-01 [출력] ★

원본: p.8

```matlab
>> x = 2; y = 7;
>> x < y
>> x >= y
>> x ~= y
```

### Q08-02 [출력] ★

원본: p.10

```matlab
>> x = [1,2,3,4,5];
>> y = [-2,0,2,4,6];
>> x >= y
>> x == y
```

### Q08-03 [출력] ★

원본: p.13

```matlab
>> x = 5;
>> x == 3
>> x = 3
>> x == 3
```

### Q08-04 [오류] ★★

원본: p.13

다음 스크립트를 실행하면 오류가 난다. (1) 오류가 나는 이유, (2) 오류 메시지 첫 줄, (3) 고친 코드를 쓰시오.

```matlab
x = 5;
if x = 3
    disp("x is 3")
end
```

### Q08-05 [출력] ★★

원본: p.15, p.16

```matlab
>> x = [1,2,3,4,5];
>> y = [-2,0,2,4,6];
>> z = [3,3,3,3,3];
>> z>x & z>y
>> x>y | x>z
>> ~(x>y)
```

### Q08-06 [코드] ★★

원본: p.15

벡터 `a`를 만들고, `a`의 원소마다 "3보다 크고 7보다 작은가"를 판정했더니 Command Window에 아래와 같이 찍혔다. 이 결과를 만드는 두 줄의 코드를 쓰시오. 콜론 연산자를 사용한다.

```
a =

     2     4     6     8    10

ans =

  1×5 logical array

   0   1   1   0   0

```

### Q08-07 [출력] ★★★

원본: [보강]

```matlab
>> x = [0 3 6 9];
>> 1 < x < 5
>> 1 < x & x < 5
```

### Q08-08 [오류] ★★

원본: p.14

다음 명령은 오류가 난다. (1) 이유, (2) 오류 메시지 첫 줄, (3) 원소별 결과(1×5 logical)를 얻도록 고친 명령을 쓰시오.

```matlab
>> x = [1,2,3,4,5];
>> y = [-2,0,2,4,6];
>> z = [8,8,8,8,8];
>> z>x && z>y
```

---

## 8.2 Flowchart와 Pseudocode

### Q08-09 [출력] ★★

원본: p.21

```matlab
mph = 0:20:60;
fps = mph*5280/3600;
chart = [mph;fps]
disp("Velocity Conversion Table")
disp("     mph      f/s")
fprintf("%8.0f %8.2f \n",chart)
```

### Q08-10 [변형] ★★★

원본: p.21

Q08-09의 세 번째 줄을 `chart = [mph', fps'];`로 바꾸고 나머지는 그대로 실행했다. `fprintf`가 찍는 네 줄을 쓰고, 원래 코드와 결과가 달라지는 이유를 한 문장으로 쓰시오.

### Q08-11 [코드] ★★

원본: p.20, p.21

pseudocode "mph 벡터 정의 → ft/s로 변환 → 두 벡터를 한 배열로 합침 → 제목 출력 → 표 출력"을 코드로 옮겼더니 Command Window에 아래 내용만 찍혔다. 이 결과를 만드는 스크립트를 쓰시오.

```
Velocity Conversion Table
      10    14.67 
      20    29.33 
      30    44.00 
```

### Q08-12 [단답] ★

원본: p.22, p.23

(1) flowchart에서 타원, 평행사변형, 마름모, 직사각형은 각각 무엇을 나타내는가?
(2) 다음 각 명령은 flowchart에서 어떤 도형으로 그리는가?
`fprintf("%8.0f\n", mph)` / `x = input("Enter x: ")` / `if age<16` / `fps = mph*5280/3600`

---

## 8.3 Logical function `find`

### Q08-13 [출력] ★

원본: p.26, p.28

```matlab
height = [63,67,65,72,69,78,75];
accept = find(height>=70)
height(accept)
```

### Q08-14 [변형] ★★

원본: p.26

`height = [63,67,65,72,69,78,75];`일 때, 슬라이드의 `accept = find(height>=66)`을 아래처럼 바꿨다. 각 명령의 출력을 쓰고, (1)이 원래 결과와 같은지 다른지 이유와 함께 쓰시오.

```matlab
>> find(height>66)
>> find(height==66)
```

### Q08-15 [출력] ★★★

원본: p.30, p.31

```matlab
applicants = [63, 18; 67, 19; 65, 18; 72, 20;
              69, 36; 78, 34; 75, 12];
qualify = find(applicants(:,1)>=70 & applicants(:,2)<35)
results = [qualify, applicants(qualify,1), applicants(qualify,2)]';
fprintf("Applicant #%d is %2.0f inches tall and %2.0f years old\n", results)
```

### Q08-16 [출력] ★★

원본: p.32~p.36

```matlab
temp = [95.3, 100.2, 98.6; 97.4, 99.2, 98.9; 100.1, 99.3, 97]
index = find(temp>99)'
```

### Q08-17 [출력] ★★

원본: p.37

Q08-16의 `temp`가 이미 Workspace에 있을 때 다음을 실행했다.

```matlab
>> [row,col] = find(temp>99)
```

### Q08-18 [코드] ★★

원본: p.32~p.36

행렬 `M`의 값은 아래와 같다.

```
4  9  2
3  5  7
8  1  6
```

`M`을 정의하고, `M`에서 5 이상인 원소의 인덱스 번호를 행 벡터로 구했더니 Command Window에 아래만 찍혔다. 두 줄의 코드를 쓰시오.

```
idx =

     3     4     5     8     9

```

### Q08-19 [출력] ★★

원본: p.38

```matlab
x = [1,2,3;10,5,1;12,3,2;8,3,1];
index = find(x>4)
values = x(index)
```

### Q08-20 [오류] ★★

원본: p.38, p.45

(1) Q08-19 다음 줄에 아래 명령을 실행하면 R2026a에서 오류가 난다. 이유와 오류 메시지 첫 줄, 고친 명령을 쓰시오.

```matlab
disp(table(index, values, "VariableNames", ["Index Number","X Value"]))
```

(2) p.45의 `table(Patient_Names', Temp', result', 'VariableNames', T)`에서 세 변수 뒤에 `'`를 붙인 이유를 한 문장으로 쓰시오.

---

## 8.4 Logical indexing

### Q08-21 [출력] ★★

원본: p.40~p.42

```matlab
Patient_Names = ["Jason","Jose","Wesley","Rose"];
Temp = [98.2, 100.3, 97, 101];
fever = Temp > 98
Patient_Names(fever)
Patient_Names(Temp > 100)
```

### Q08-22 [출력] ★★★

원본: p.43, p.44

```matlab
clear
Temp = [99.1, 98.0, 100.4, 97.5];
fever = Temp > 98.6;
result(fever) = "Sick"
result(~fever) = "Well"
```

### Q08-23 [코드] ★★

원본: p.41

`Patient_Names = ["Jason","Jose","Wesley","Rose"]`, `Temp = [98.2, 100.3, 97, 101]`이다. 두 배열을 정의하고 logical indexing으로 열이 98.6보다 높은 환자 이름을 골랐더니 Command Window에 아래만 찍혔다. 네 줄의 코드를 쓰시오.

```
fever =

  1×4 logical array

   0   1   0   1

ans = 

  1×2 string array

    "Jose"    "Rose"

```

### Q08-24 [오류] ★★

원본: p.41

다음 명령은 오류가 난다. (1) 이유, (2) 오류 메시지 첫 줄, (3) `"Jose" "Rose"`를 얻도록 고친 명령을 쓰시오.

```matlab
>> Patient_Names = ["Jason","Jose","Wesley","Rose"];
>> Patient_Names([0 1 0 1])
```

### Q08-25 [출력] ★★

원본: [보강]

```matlab
x = [-2 5 0 -1 3];
a = x(x > 0)
b = x .* (x > 0)
x(x < 0) = []
```

---

## 8.5.1 Simple `if`

### Q08-26 [출력] ★

원본: p.48, p.49

다음 스크립트의 첫 줄이 (1) `G = 30;`일 때와 (2) `G = 50;`일 때의 출력을 각각 쓰시오.

```matlab
G = 30;
if G<50
    disp("G is a small value equal to:")
    disp(G);
end
```

### Q08-27 [출력] ★★

원본: p.50

Q08-26 스크립트의 첫 줄이 (1) `G = [5 25 45];`일 때와 (2) `G = [5 25 50];`일 때의 출력을 각각 쓰시오.

### Q08-28 [코드] ★★

원본: p.48

Q08-26과 같은 `if` 구조의 스크립트를 실행했더니 Command Window에 아래가 찍혔다. 스크립트를 쓰시오. (`input`은 쓰지 않는다.)

```
G =

    20

G is a small value equal to:
    20
```

### Q08-29 [출력] ★★★

원본: [보강]

```matlab
x = [3 7 1];
k = find(x > 10)
if k
    disp("found")
end
if all(x > 0)
    disp("all positive")
end
if any(x > 5)
    disp("some > 5")
end
```

---

## 8.5.2 `if/else`

### Q08-30 [출력] ★★

원본: p.52, p.53

다음 스크립트를 실행하고 사용자가 (1) `1`, (2) `0`을 입력했을 때 Command Window 전체를 각각 쓰시오. (프롬프트 줄은 `Enter a value of x: 1`처럼 입력값까지 쓴다.)

```matlab
x = input("Enter a value of x: ")
if x >0
    y = log(x)
else
    disp("The input to the log function must be positive")
end
```

### Q08-31 [출력] ★★★

원본: p.52, p.53

슬라이드는 "`else` 줄에는 비교식을 쓰지 말라"고 한다. 이 규칙을 어기고 아래처럼 썼다. (1) `x = -1;`일 때와 (2) `x = 5;`일 때의 출력을 각각 쓰시오.

```matlab
x = -1;
if x > 0
    y = log(x)
else x <= 0
    disp("The input to the log function must be positive")
end
```

### Q08-32 [오류] ★★

원본: p.55

두 스크립트 A, B를 각각 실행했다. (1) 각 스크립트의 Command Window 출력을 쓰고, (2) `beep`과 `error`의 차이를 한 문장으로 쓰시오.

```matlab
% A
x = -3;
if x > 0
    y = log(x);
else
    beep
    disp("Input must be positive")
end
disp("Done")
```

```matlab
% B
x = -3;
if x > 0
    y = log(x);
else
    error("Input must be positive")
end
disp("Done")
```

### Q08-33 [코드] ★★

원본: p.53

`if/else`로 `x`가 양수이면 `log(x)`를 구하고 아니면 메시지를 내는 스크립트를 실행했더니 Command Window에 아래가 찍혔다. 스크립트를 쓰시오. (`input`은 쓰지 않는다.)

```
x =

    -4

The input to the log function must be positive
```

### Q08-34 [출력] ★★

원본: p.54

```matlab
x = [4 -1 9];
if x > 0
    y = sqrt(x)
else
    disp("All inputs must be positive")
end
x = [4 1 9];
if x > 0
    y = sqrt(x)
else
    disp("All inputs must be positive")
end
```

---

## 8.5.3 `elseif`

### Q08-35 [출력] ★★

원본: p.57

다음 스크립트의 첫 줄이 (1) `age = 18`일 때와 (2) `age = 70`일 때의 출력을 각각 쓰시오.

```matlab
age = 18
if age<16
    disp("Sorry - You'll have to wait")
elseif age<18
    disp("You may have a youth license")
elseif age<70
    disp("You may have a standard license")
else
    disp("Drivers over 70 require a special license")
end
```

### Q08-36 [변형] ★★★

원본: p.57, p.58

Q08-35에서 조건 순서만 아래처럼 바꿨다. (1) `age = 12;`일 때 출력, (2) 어떤 `age`를 넣어도 절대 출력되지 않는 메시지를 쓰고, (3) 그 이유를 flowchart의 마름모 순서로 설명하시오.

```matlab
age = 12;
if age<70
    disp("You may have a standard license")
elseif age<16
    disp("Sorry - You'll have to wait")
elseif age<18
    disp("You may have a youth license")
else
    disp("Drivers over 70 require a special license")
end
```

### Q08-37 [코드] ★★

원본: p.57

점수 `score`가 90 이상이면 `Grade A`, 80 이상이면 `Grade B`, 그 밖에는 `Grade C`를 출력하는 `if/elseif/else` 스크립트를 실행했더니 아래가 찍혔다. 스크립트를 쓰시오. 앞에서 배제된 범위는 다시 쓰지 않는다.

```
score =

    85

Grade B
```

### Q08-38 [오류] ★★

원본: p.56, p.57

다음 스크립트 파일은 실행되지 않는다. (1) 이유, (2) 오류 메시지의 핵심 문장, (3) 고치는 방법 두 가지를 쓰시오.

```matlab
age = 17;
if age<16
    disp("wait")
else if age<18
    disp("youth")
else
    disp("standard")
end
```

---

## 8.5.4 `switch/case`

### Q08-39 [출력] ★★

원본: p.60

다음 스크립트의 첫 줄이 (1) `city = "Denver"`일 때와 (2) `city = "denver"`일 때의 출력을 각각 쓰시오.

```matlab
city = "Denver"
switch city
    case "Boston"
        disp("$345")
    case "Denver"
        disp("$150")
    case "Honolulu"
        disp("Stay home and study")
    otherwise
        disp("Not on file")
end
```

### Q08-40 [출력] ★★

원본: p.61, p.62

다음 스크립트를 실행하고 사용자가 따옴표 없이 `Boston`을 입력했다. (1) Command Window 전체를 쓰고, (2) Workspace에서 `city`의 Size와 Class를 쓰시오.

```matlab
city = input("Enter the name of a city :","s")
switch city
    case 'Boston'
        disp('$345')
    case 'Denver'
        disp('$150')
    case 'Honolulu'
        disp('Stay home and study')
    otherwise
        disp('Not on file')
end
```

### Q08-41 [변형] ★★★

원본: [보강]

`case`에 부등호를 넣었다. 첫 줄이 (1) `age = 12;`일 때와 (2) `age = 1;`일 때의 출력을 각각 쓰고, 이유를 설명하시오.

```matlab
age = 12;
switch age
    case age < 16
        disp("Sorry - You'll have to wait")
    otherwise
        disp("You may have a license")
end
```

### Q08-42 [코드] ★★

원본: [보강]

`day`가 1 또는 7이면 `Weekend`, 2~6이면 `Weekday`, 그 밖에는 `Invalid day`를 출력하는 `switch/case` 스크립트를 실행했더니 아래가 찍혔다. 스크립트를 쓰시오. 한 `case`에 여러 값을 묶는다.

```
day =

     7

Weekend
```

---

## 8.5.5 `menu`

### Q08-43 [출력] ★★

원본: p.64, p.65

다음 스크립트를 실행해 메뉴 창이 뜨자 사용자가 `Honolulu` 버튼을 눌렀다. Command Window 출력을 쓰시오.

```matlab
prompt = "Select a city from the menu:";
list = ["Boston","Denver","Honolulu"];
city = menu(prompt,list)
switch city
    case 1
        disp("$345")
    case 2
        disp("$150")
    case 3
        disp("Stay home and study")
end
```

### Q08-44 [변형] ★★★

원본: p.64, p.65

Q08-43에서 둘째 줄만 `list = ["Denver","Boston","Honolulu"];`로 바꿨다. (1) 사용자가 `Denver` 버튼을 눌렀을 때의 출력, (2) 사용자가 버튼을 누르지 않고 창을 X로 닫았을 때의 출력을 쓰시오.

### Q08-45 [단답] ★

원본: p.63, p.69

(1) `menu` 함수가 돌려주는 값은 무엇인가?
(2) `menu`와 비슷하지만 옵션이 더 많은 함수의 이름과, 그 도움말을 여는 명령을 쓰시오.
(3) `menu`와 그 함수보다 최근의 GUI 작성 방법은 무엇인가?
(4) `switch/case`를 `menu` 같은 GUI와 짝지으면 좋은 점을 한 문장으로 쓰시오.
