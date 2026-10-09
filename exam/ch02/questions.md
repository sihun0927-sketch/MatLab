# Chapter 2 — MATLAB Environment 문제

- 모든 문제는 MATLAB R2026a 기본 상태(`format short`, `format loose`)를 가정한다.
- `[출력]` 문제는 Command Window에 찍히는 결과를 빈 줄까지 그대로 쓴다. 출력이 없는 줄은 아무것도 쓰지 않는다.
- `[코드]` 문제는 주어진 화면을 만드는 코드를 쓴다. 세미콜론 위치도 채점한다.
- 각 문제는 새 MATLAB 세션(빈 Workspace)에서 시작한다고 가정한다.

## 2.1 Getting Started

### Q02-01 [출력] ★

원본: p.5, [보강]

```matlab
>> 4^2
>> cos(pi)
>> ans + 1
>> sin(pi)
```

### Q02-02 [코드] ★

원본: p.5

다음 화면을 만드는 명령 두 줄을 쓰시오. 첫 번째 줄은 거듭제곱 연산자를 사용하고, 두 번째 줄은 삼각함수를 사용한다.

```
x =

     9

ans =

    -1

```

### Q02-03 [단답] ★

원본: p.5, p.12

1. MATLAB을 처음 실행했을 때 기본 화면(default view)에 열리는 창 세 개를 쓰시오.
2. 새 세션에서 `5^2`와 `cos(pi)`를 차례로 입력했다. Workspace 창에 보이는 변수의 이름, Size, Value를 쓰시오.
3. `plot` 명령을 실행하면 자동으로 열리는 창의 이름을 쓰시오.

## 2.2 MATLAB Windows

### Q02-04 [출력] ★

원본: p.13

```matlab
>> A = 5;
>> B = [1, 2, 3, 4]
>> C = [1 2 3 4; 10 20 30 40]
```

### Q02-05 [단답] ★★

원본: p.14, p.17

다음을 실행한 뒤 Workspace 창과 `whos` 명령의 결과를 보았다.

```matlab
A = 5;
B = [1, 2, 3, 4];
C = [1 2 3 4; 10 20 30 40; 5 10 15 20];
D = C';
```

1. `A`, `B`, `C`, `D`의 Size를 각각 쓰시오.
2. `whos`의 Bytes 열에 표시되는 값을 각각 쓰시오.
3. Workspace 창의 Value 열에 `C`는 어떻게 표시되는가?

### Q02-06 [오류] ★

원본: p.15, p.16

```matlab
>> A = 5;
>> clc
>> A
>> clear
>> A
```

마지막 명령까지 실행한 뒤 Command Window에 남아 있는 화면을 쓰고, 마지막 줄에서 오류가 나는 이유를 쓰시오.

### Q02-07 [코드] ★★

원본: p.20, p.24

Command Window에 다음만 출력되었고, Graphics Window에는 점 (1, 10)에서 (5, 50)까지 이어지는 직선 그래프가 그려졌다. 두 배열 `x`, `y`를 명시적 목록(explicit list)으로 만들어 이 결과를 내는 코드 세 줄을 쓰시오.

```
x =

     1     2     3     4     5

```

### Q02-08 [빈칸] ★

원본: p.22

제목이 `My Example Graph`, x축 라벨이 `Time, seconds`, y축 라벨이 `Distance, meters`인 그래프를 그리려 한다. 빈칸을 채우시오.

```matlab
x = [1 2 3 4 5];
y = [10, 20, 30, 40, 50];
plot(x, y)
____①____("My Example Graph")
____②____("Time, seconds")
____③____("Distance, meters")
```

### Q02-09 [단답] ★

원본: p.9, p.10, p.11, p.18, p.19

1. Command History 창은 기본 화면에 열리는가? 열려 있지 않다면 어디서 추가하는가?
2. Command History에 기록된 명령을 더블클릭하면 어떻게 되는가?
3. 변수 이름 없이 `5^2`를 입력했을 때 결과가 저장되는 기본 변수 이름과 그 데이터 타입(class)을 쓰시오.
4. Workspace 창에서 변수를 더블클릭하면 열리는 창의 이름을 쓰시오.
5. Workspace 제목줄을 우클릭해 New를 선택하면 만들어지는 변수의 이름을 쓰시오.

## 2.3 변수 이름 규칙과 데이터 타입

### Q02-10 [출력] ★

원본: p.27, p.28

```matlab
>> isvarname cool_beans
>> isvarname Cool_Beans2
>> isvarname 2cool_beans
>> isvarname cool-beans
```

### Q02-11 [출력] ★★

원본: p.29, [보강]

```matlab
>> isvarname('for')
>> iskeyword('for')
>> iskeyword('max')
```

### Q02-12 [오류] ★★

원본: p.30

```matlab
>> max = 5
>> max([3 7 2])
```

Command Window 출력을 쓰고, 두 번째 줄에서 오류가 나는 이유와 고치는 명령을 쓰시오.

### Q02-13 [출력] ★★

원본: p.31

```matlab
>> max = 5;
>> clear max
>> max([3 7 2])
>> ans * 2
```

### Q02-14 [출력] ★★

원본: p.11, p.33, [보강]

```matlab
>> class(3.5)
>> class('engineer')
>> class("engineer")
>> class(5 > 3)
>> size(3.5)
```

### Q02-15 [단답] ★

원본: p.26, p.29

1. 다음 중 유효한 MATLAB 변수 이름을 모두 고르시오.
   `Velocity`, `velocity_2`, `2velocity`, `velocity-2`, `while`, `velocity 2`, `_velocity`
2. 변수 이름의 길이 제한은 어떻게 되는가?
3. `X = 3; x = 10;`을 실행하면 Workspace에 변수가 몇 개 생기는가?
4. MATLAB 예약어 목록을 보여주는 명령을 쓰시오.

## 2.4 스칼라·배열 연산

### Q02-16 [코드] ★

원본: p.34

수학 표기 $`A = [5]`$, $`B = [2\quad 5]`$, $`C = \begin{bmatrix} 1 & 2 \\ 5 & 5 \end{bmatrix}`$ 를 MATLAB 변수 `A`, `B`, `C`로 만든다. Command Window에 다음만 출력되도록 코드 세 줄을 쓰시오.

```
B =

     2     5

C =

     1     2
     5     5

```

### Q02-17 [출력] ★

원본: p.36

```matlab
>> a = 2+1;
>> b = 4
>> x = a+b;
>> y = b-a
>> z = b^a
>> w = 3^2;
```

Command Window 출력을 쓰고, Workspace에 저장된 `x`와 `w`의 값을 쓰시오.

### Q02-18 [출력] ★★

원본: p.37

```matlab
>> x = 8;
>> x = x + 1;
>> x = x * 2
>> x == 18
>> x == 8
```

### Q02-19 [출력] ★★

원본: p.40, p.41, p.42

```matlab
>> r = 3;
>> h = 5;
>> SA = 2*pi*r^2 + 2*pi*r*h
>> SA = 2*pi*r*(r+h);
>> SA = 2*pi*r*r + h
```

### Q02-20 [코드] ★★

원본: p.40, p.41

반지름 5, 높이 10인 원기둥의 겉넓이를 공통 인수로 묶은 식 $2\pi r(r+h)$ 하나로 계산한다. Command Window에 다음만 출력되도록 코드 세 줄을 쓰시오.

```
SA =

  471.2389

```

### Q02-21 [오류] ★★

원본: p.43

```matlab
>> r = 4;
>> h = 6;
>> SA = 2*pi*r(r+h)
```

오류 메시지 첫 줄, 오류가 나는 이유, 고친 코드를 쓰시오.

### Q02-22 [출력] ★★★

원본: p.38

```matlab
>> 2 + 3*4^2/8 - 1
>> (2 + 3)*4^2/(8 - 1)
>> 2^3^2
>> -2^2
```

### Q02-23 [출력] ★

원본: p.44

```matlab
>> a = 1, b = 2; c = a + b
>> d = c*2; e = d - a
```

### Q02-24 [출력] ★★

원본: p.45

```matlab
>> x = [1 2 3 4];
>> y = [1; 2; 3; 4]
>> a = [1 2 3;
        2 3 4]
```

### Q02-25 [출력] ★★

원본: p.46, p.47, [보강]

```matlab
>> b = [2:6]
>> c = 1:3:10
>> e = 5:-2:1
>> f = 5:1
```

### Q02-26 [코드] ★

원본: p.46, p.47

콜론 연산자를 사용해 다음 화면을 만드는 코드 한 줄을 쓰시오.

```
c =

     0     5    10    15    20

```

### Q02-27 [출력] ★★

원본: p.48, p.49, [보강]

```matlab
>> d = linspace(1, 10, 4)
>> g = linspace(0, 10, 5)
>> n = numel(linspace(1, 2))
```

### Q02-28 [출력] ★★

원본: p.50, p.51

```matlab
>> e = logspace(0, 2, 3)
>> k = logspace(0, 1, 3)
```

### Q02-29 [출력] ★★

원본: p.52, p.53, p.54, p.55, p.56, p.57

```matlab
>> a = [1 2 3];
>> b = a + 3
>> c = a + b
>> d = a.*b
>> e = a*b'
```

### Q02-30 [오류] ★★

원본: p.58

```matlab
>> a = [1 2 3];
>> b = [4 5 6];
>> c = a*b
```

오류 메시지 첫 두 줄과 이유를 쓰고, 고치는 방법 두 가지를 결과 값과 함께 쓰시오.

### Q02-31 [출력] ★★

원본: p.59

```matlab
>> a = [1 2 3];
>> b = [6 7 8];
>> c = a.^2
>> d = b./a
>> f = 2.^a
```

### Q02-32 [오류] ★★

원본: p.60, p.61

```matlab
>> a = [1 2 3];
>> c = 6./a
>> c = 6/a
```

Command Window 출력(오류 포함)을 쓰고, 실행이 끝난 뒤 Workspace의 `c` 값을 쓰시오.

### Q02-33 [코드] ★★

원본: p.62

각도 배열 `degrees`(30°, 45°, 90°)를 만들고 라디안으로 바꾸는 코드 두 줄을 쓰시오. 실행 후 Command Window 화면은 다음과 같다.

```
radians =

    0.5236    0.7854    1.5708

```

### Q02-34 [출력] ★★★

원본: p.64

```matlab
>> degrees = [0 30 60];
>> radians = degrees*pi/180;
>> degrees'
>> T = [degrees', radians']
```

Command Window 출력을 쓰고, `T`의 Size를 쓰시오.

### Q02-35 [출력] ★★★

원본: p.65, p.66, [보강]

```matlab
>> x = 1/3;
>> format long
>> x
>> format short e
>> x
>> format short
>> y = x*3
```

### Q02-36 [단답] ★

원본: p.65, p.66

1. `pi`를 `355/113`으로 표시하는 `format` 명령을 쓰시오.
2. `format bank` 상태에서 `pi`는 소수점 아래 몇 자리까지 표시되는가?
3. `format long`으로 바꾸면 계산 정확도가 높아지는가?
4. `format short e` 상태에서 `123.456`은 어떻게 표시되는가?
5. `format long e` 상태에서 `pi`는 어떻게 표시되는가?

## 2.5 파일 저장·불러오기, 스크립트, Section 모드

### Q02-37 [출력] ★★

원본: p.68, p.71, p.72

```matlab
>> a = 5;
>> b = [1, 2, 3];
>> c = [1, 2; 3, 4];
>> save my_example_file
>> clear, clc
>> load my_example_file
>> c
>> a + c
```

`clc` 이후 Command Window에 찍히는 출력을 쓰고, `save`가 만든 파일의 전체 이름과 저장 위치를 쓰시오. 또한 이 파일로 `a`, `b`, `c`를 만든 명령까지 되살릴 수 있는지 쓰시오.

### Q02-38 [출력] ★★★

원본: p.69, p.70, p.73

```matlab
>> c = [1, 2; 3, 4];
>> save my_data.dat c -ascii
>> clear
>> load my_data.dat
>> my_data
>> c
```

### Q02-39 [오류] ★★★

원본: p.70, p.73, p.74

```matlab
>> a = [5 6];
>> b = [1, 2, 3];
>> save my_new_file2.dat a b -ascii
>> clear
>> load my_new_file2.dat
```

마지막 줄에서 오류가 난다. 오류 메시지 첫 두 줄과 이유를 쓰고, 이 파일의 데이터를 불러오는 방법 하나를 쓰시오.

### Q02-40 [출력] ★★★

원본: p.78, p.82

다음 스크립트를 Run 버튼으로 실행했다.

```matlab
% A Script to find Drag
drag = 200;
density = 1.225
velocity = 100*0.4470;
area = 1;
cd = drag*2/(density*velocity^2*area)
velocity = 0:20:60;
velocity = velocity*0.4470;
drag = cd*density*velocity.^2*area/2;
results = [velocity', drag']
```

### Q02-41 [출력] ★★

원본: p.79

다음 스크립트를 실행했다.

```matlab
% a = 3
a = 5 % The variable a is defined as 5
b = a*2; % b is 10
% b = 0
b + 1
```

### Q02-42 [출력] ★★★

원본: p.85, p.86

다음 스크립트 전체를 Run 버튼으로 실행했다. `clc` 이후 Command Window 출력을 쓰시오.

```matlab
%% Problem 2.1
clear, clc, format short
1 + 3/4
5*6*4/2
5/2*6*4;
5^2*3
2^(2*3)
1 + 3 + 5/5 + 3 + 1
(1 + 3 + 5)/(5 + 3 + 1)
```

### Q02-43 [변형] ★★

원본: p.85

슬라이드 원본의 두 줄을 다음처럼 바꿨다. 원본과 변형의 출력을 각각 쓰고, 값이 달라지는 이유를 쓰시오.

| 원본 | 변형 |
| --- | --- |
| `5/2*6*4` | `5/(2*6*4)` |
| `1 + 3 + 5/5 + 3 + 1` | `(1 + 3 + 5)/5 + 3 + 1` |

### Q02-44 [단답] ★★

원본: p.70, p.80, p.84, p.85

1. 스크립트에 `%%Problem 2.1`이라고 썼더니 섹션이 나뉘지 않았다. 이유를 쓰시오.
2. 커서를 섹션 안에 두면 그 섹션은 어떻게 표시되는가?
3. 스크립트의 일부만 드래그로 선택해 실행하는 우클릭 메뉴 이름을 쓰시오.
4. `save my_new_file2.dat a b - ascii`처럼 쓰면 어떤 문제가 생기는가?
5. ASCII 파일로 저장할 때 붙여야 하는 확장자 두 가지를 쓰시오.

### Q02-45 [단답] ★

원본: p.76, p.77, p.81, p.83

1. 현재 폴더에 `myscript.m`이 있다. Command Window에서 이 스크립트를 실행하는 방법 세 가지를 쓰시오.
2. 다음 중 스크립트 파일 이름으로 쓸 수 있는 것을 모두 고르시오.
   `hw2_drag.m`, `hw 2.m`, `2hw.m`, `hw-2.m`, `HW2.m`
3. Live Script 파일의 확장자를 쓰시오.
4. Live Script를 저장할 수 있는 MLX 이외의 형식 세 가지를 쓰시오.
5. 같은 계산을 스크립트와 Live Script로 작성할 때 코드는 달라지는가?
