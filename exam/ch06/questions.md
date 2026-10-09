# Chapter 6 — User-Defined Functions · 문제지

- 모든 문제는 MATLAB R2026a 기본 상태(`format short`, `format loose`)를 가정한다.
- `>>` 줄은 Command Window에 한 줄씩 입력한 명령이다. 앞 줄에서 오류가 나도 다음 줄은 따로 입력된다.
- 함수는 기본 MATLAB 함수 외에 문제에 나온 파일만 있다고 가정한다(추가 toolbox 없음).
- 출력이 없는 줄은 "출력 없음"이라고 쓴다.

## 공통 함수 파일

별도 표시가 없으면 현재 폴더에 아래 파일들이 저장되어 있다.

`poly.m`

```matlab
function output = poly(x)
% This function calculates the value of a 3rd-order polynomial
output = 3*x.^3 + 5*x.^2 - 2*x +1;
end
```

`g.m`

```matlab
function output = g(x,y)
% This function multiplies x and y together
% x and y must be the same size arrays
a = x.*y;
output = a;
end
```

`motion.m`

```matlab
function [dist, vel, accel] = motion(t)
% This function calculates the distance, velocity, and
% acceleration of a particular car for a given value of t
% assuming all 3 parameters are initially 0.
accel = 0.5.*t;
vel = t.^2/4;
dist = t.^3/12;
end
```

`star.m`

```matlab
function [] = star( )
theta = pi/2:0.8*pi:4.8*pi;
r = ones(1,6);
polarplot(theta,r)
end
```

---

## 6.1 함수 파일 만들기 (6.1.1–6.1.2)

### Q06-01 [빈칸] ★

원본: p.7

원기둥의 반지름 `r`과 높이 `h`를 입력받아 부피 `V`를 돌려주는 함수 `cyl_vol`을 만들려고 한다.

```matlab
______ ___ = ______(____)
V = pi*r.^2.*h;
end
```

1. 함수 정의줄의 빈칸을 채워라.
2. 이 함수를 별도 파일로 저장할 때 파일 이름은 무엇이어야 하는가?
3. 함수 정의줄에 반드시 들어가는 네 가지 요소를 쓰라.

### Q06-02 [출력] ★

원본: p.9–11

공통 파일 `poly.m`이 현재 폴더에 있다. Command Window 출력을 쓰라.

```
>> poly(2)
>> y = poly([0 1 2]);
>> y(end)
>> z = poly(-1)
```

### Q06-03 [변형] ★★

원본: p.10

`poly.m`의 계산 줄을 다음처럼 바꿔 저장했다.

```matlab
output = 3*x^3 + 5*x^2 - 2*x +1;
```

1. `poly(2)`의 결과는 원본과 같은가 다른가? 결과를 쓰라.
2. `poly([0 1 2])`를 실행하면 어떻게 되는가? 출력 첫 줄과 이유를 쓰라.

### Q06-04 [출력] ★★★

원본: p.10

현재 폴더에 `poly.m`은 **없고**, 아래 내용이 `poly2.m`이라는 이름으로 저장되어 있다.

```matlab
function output = poly(x)
% This function calculates the value of a 3rd-order polynomial
output = 3*x.^3 + 5*x.^2 - 2*x +1;
end
```

```
>> poly2(5)
>> poly(5)
```

Command Window 출력을 쓰고, 두 결과가 다른 이유를 설명하라.

### Q06-05 [출력] ★★

원본: p.13

아래 스크립트를 `example_6_1.m`으로 저장하고 Run 버튼으로 실행했다(workspace는 비어 있었다).

```matlab
%% Problem 1
x = [1,4,7];
y1_scalar = square(-2)
y1_array = square(x);
disp(y1_array)
%% Function Definitions
function output = square(x)
output = x.^2;
end
```

1. Command Window 출력을 쓰라.
2. 실행 후 workspace에 있는 변수 이름을 모두 쓰라.

### Q06-06 [오류] ★★

원본: p.15

아래 live script `EXAMPLE_6_2.mlx`를 실행해 그래프를 그린 뒤, Command Window에 `grain_size(16)`을 입력했다.

```matlab
N = 1:100;
n = grain_size(N);
plot(N,n)
title('ASTM Grain Size')
xlabel('Number of grains per square inch at 100x')
ylabel('ASTM Grain Size')
grid

function output = grain_size(N)
% Calculates the ASTM grain size n
output = (log10(N) + log10(2))./log10(2);
end
```

```
>> grain_size(16)
```

1. 출력되는 오류 메시지 첫 줄을 쓰라.
2. 오류가 나는 이유를 쓰라.
3. Command Window에서도 `grain_size`를 쓰려면 어떻게 해야 하는가?

### Q06-07 [코드] ★★

원본: p.13

스크립트 하나를 실행했더니 Command Window에 아래가 출력되었다. 스크립트는 `x = 1:3`을 쓰고, 세제곱을 계산하는 함수 `cube`를 **스크립트 끝**에 정의해서 사용한다. 이 결과를 만드는 스크립트를 쓰라.

```
y1_scalar =

    27

     1     8    27
```

### Q06-08 [단답] ★

원본: p.8, p.16, p.21

1. 공통 파일 `motion.m`에 대해 `help motion`을 입력하면 어느 줄들이 출력되는가?
2. 그중 첫 줄을 부르는 이름은?
3. 이 장에서 말하는 input(입력 인수)은 나중 장에서 배울 `input` 명령과 어떻게 다른가? 한 문장으로 쓰라.

---

## 6.1.3–6.1.4 다중 입출력, 입출력 없는 함수

### Q06-09 [출력] ★

원본: p.18

공통 파일 `g.m`을 사용한다.

```
>> x = 2:4;
>> y = [1 0 -1];
>> z = g(x,y)
>> g(y,x)
```

### Q06-10 [출력] ★★★

원본: p.18

```
>> g(1:3, (1:3)')
```

### Q06-11 [변형] ★★

원본: p.17–18

`g.m`의 4번째 줄을 `a = x*y;`로 바꿔 저장했다.

```
>> g(3,4)
>> x = 1:5;
>> y = 5:9;
>> z = g(x,y)
```

1. 각 명령의 결과를 쓰라(오류가 나면 첫 줄만).
2. 원본 `g.m`과 결과가 달라지는 명령은 어느 것이며, 왜 그런가?

### Q06-12 [출력] ★

원본: p.21

```
>> [distance, velocity, acceleration] = motion(6)
```

### Q06-13 [출력] ★★

원본: p.23

```
>> motion(6)
>> [a, v] = motion(6)
```

### Q06-14 [코드] ★★

원본: p.23

`motion` 함수를 **한 번만** 호출하고, workspace에 새 변수가 **`acc` 하나만** 생기게 하여 아래 출력을 만드는 한 줄을 쓰라.

```
acc =

     2

```

### Q06-15 [오류] ★★

원본: p.24, p.28

각 명령의 출력을 쓰고 이유를 한 줄로 설명하라.

```
>> A = star
>> star(1)
>> [d, v, a, j] = motion(1)
```

---

## 6.1.5 입력·출력 인수의 개수

### Q06-16 [출력] ★

원본: p.31, p.33

```
>> n1 = nargin("sin")
>> n2 = nargin("rem");
>> n3 = nargin("surf")
>> nargout("max")
```

### Q06-17 [출력] ★★

원본: p.31, p.33

공통 함수 파일을 사용한다.

```
>> nargin("g")
>> nargout("motion")
>> [nargin("star"), nargout("star")]
>> nargin("motion") + nargout("motion")
```

### Q06-18 [출력] ★★★

원본: p.34

현재 폴더에 `mySize.m`이 있다.

```matlab
function [sizeVector,varargout] = mySize(x)
    sizeVector = size(x);
    varargout = cell(1,nargout-1);
    for k = 1:length(varargout)
        varargout{k} = sizeVector(k);
    end
end
```

```
>> [v, r, c] = mySize(zeros(4,7))
>> s = mySize(ones(2,3))
>> nargout("mySize")
>> nargin("mySize")
```

### Q06-19 [출력] ★★

원본: p.35–38

현재 폴더에 `star1.m`이 있다.

```matlab
function A = star1( )
theta = pi/2:0.8*pi:4.8*pi;
r = ones(1,6);
polarplot(theta,r)
axis off
if nargout==1
A = "Twinkle twinkle little star";
end
end
```

Command Window 출력을 쓰라(그림은 무시한다).

```
>> nargout("star1")
>> star1
>> x = star1;
>> disp(x)
>> class(x)
```

### Q06-20 [변형] ★★★

원본: p.36–38

Q06-19의 `star1.m`에서 조건만 `if nargout==0`으로 바꿨다.

```
>> star1
>> x = star1
```

1. 각 명령의 출력을 쓰라(오류가 나면 첫 줄만).
2. 원본 `star1`과 결과가 달라지는 이유를 설명하라.

### Q06-21 [코드] ★★

원본: p.31, p.33

변수 `k`에는 `rem`이 받는 입력 개수를, 이어서 `max`와 `size`의 출력 개수를 차례로 조사했더니 아래가 출력되었다. 입력한 명령 세 줄을 쓰라.

```
k =

     2

ans =

     2

ans =

    -1

```

---

## 6.1.6–6.1.8 local 변수, global 변수, 함수 코드 보기

### Q06-22 [출력] ★

원본: p.40–42

```
>> clear
>> g(3,4)
>> a
>> output
```

1. Command Window 출력을 쓰라.
2. 실행이 끝난 뒤 workspace에 있는 변수 이름을 모두 쓰라.

### Q06-23 [출력] ★★

원본: p.45

현재 폴더에 `distance.m`이 있다.

```matlab
function result = distance(t)
% This function calculates the distance a falling object
% travels due to gravity
g = 9.8; % m/s^2
result = 1/2*g*t.^2;
end
```

```
>> clear
>> g = 9.8
>> distance(2)
>> result
```

### Q06-24 [오류] ★★

원본: p.44

현재 폴더에 공통 파일 `g.m`과 아래 `distance.m`이 있다.

```matlab
function result = distance(t)
% This function calculates the distance a falling object
% travels due to gravity
result = 1/2*g*t.^2;
end
```

```
>> g = 9.8
>> distance(10)
```

1. `distance(10)`에서 나오는 오류 메시지 첫 줄을 쓰라.
2. workspace에 `g = 9.8`이 있는데도 오류가 나는 이유를 쓰라.
3. 현재 폴더에 `g.m`이 없었다면 오류 메시지 첫 줄은 어떻게 바뀌는가?

### Q06-25 [출력] ★★

원본: p.48

현재 폴더의 `distance.m`이 다음과 같다.

```matlab
function result = distance(t)
% This function calculates the distance a falling object
% travels due to gravity
global G
result = 1/2*G*t.^2;
end
```

```
>> global G
>> G = 10;
>> distance(10)
>> G = 9.8
>> distance(10)
```

1. Command Window 출력을 쓰라.
2. 두 `distance(10)` 결과의 표시 형식을 비교하고, 다르다면 그 이유를 쓰라.

### Q06-26 [출력] ★★★

원본: p.48

Q06-25와 같은 `distance.m`(함수 안에 `global G`)을 쓴다. MATLAB을 새로 시작한 직후 다음을 입력했다.

```
>> G = 9.8;
>> distance(10)
>> G
```

### Q06-27 [코드] ★★

원본: p.48

Q06-25의 `distance.m`을 쓴다. 전역 변수 `G`의 값을 5로 정해 `t = 10`에서의 거리를 구했더니 Command Window에 아래만 출력되었다. 입력한 명령 세 줄을 쓰라.

```
ans =

   250

```

### Q06-28 [출력] ★★

원본: p.51–53

`type sphere`를 실행하면 첫 줄이 다음과 같다.

```matlab
function [xx,yy,zz] = sphere(varargin)
```

```
>> nargin("sphere")
>> nargout("sphere")
```

1. 위 두 명령의 출력을 쓰라.
2. `type sphere`는 소스를 보여주는데 `type sin`은 보여주지 못한다. 그 이유를 쓰라.

---

## 6.2 Subfunction

### Q06-29 [출력] ★★

원본: p.57–58

현재 폴더에 `subfunction_demo.m`이 있다.

```matlab
function [addition_result, subtraction_result]=subfunction_demo(x,y)
% This function both adds and subtracts the elements stored in two arrays
addition_result = add(x,y);
subtraction_result = subtract(x,y);

function result = add(x,y) % subfunction add
result = x+y;
end

function output = subtract(x,y) % subfunction subtract
output = x-y;
end;
end
```

```
>> x = [1 2 3]; y = [4 5 6];
>> [s, d] = subfunction_demo(x, y)
```

### Q06-30 [출력] ★★

원본: p.57–58

Q06-29의 `subfunction_demo.m`을 쓴다.

```
>> subfunction_demo(10, 4)
>> [s, d] = subfunction_demo(10, 4);
>> d
>> subtract(10, 4)
```

### Q06-31 [출력] ★★★

원본: p.55

아래 스크립트를 `sample_homework.m`으로 저장하고 실행했다. Command Window 출력을 쓰라(`clc`로 화면이 지워진 뒤부터).

```matlab
clear, clc
x = -2:2;
disp("Problem 1");
disp("The squares of the input values are listed below");
y = square(x);
disp(y)
initial_radius = 0.5;
final_radius = 0.25;
disp("Problem 2");
disp("The percent cold work is");
cold_work(initial_radius, final_radius)
m = [1 2 3];
g = 10;
delta_z = 5;
disp("Problem 3");
disp("The change in potential energy is ");
potential_energy(m,g,delta_z)

function result = square(x)
result = x.^2;
end
function result = cold_work(ri,rf)
result = (ri.^2 - rf.^2)/ri.^2;
end
function result = potential_energy(m,g,delta_z)
result = m.*g.*delta_z;
end
```

### Q06-32 [변형] ★★★

원본: p.55

Q06-31 스크립트의 Problem 2를 벡터 입력으로 바꿨다.

```matlab
initial_radius = [1 2];
final_radius = [0 1];
cold_work(initial_radius, final_radius)
```

1. 출력을 쓰라.
2. 기대한 결과는 각 원소별 cold work `[1 0.75]`였다. 1의 출력이 기대와 같은지 판단하고, 다르다면 원인, `cold_work`를 고치는 법, 고친 뒤의 출력을 쓰라.

### Q06-33 [단답] ★★

원본: p.56–58

Q06-29의 `subfunction_demo.m`에 대해 답하라.

1. 이 파일의 primary function 이름은? 파일 이름과 어떤 관계여야 하는가?
2. Command Window에서 직접 호출할 수 있는 함수는 세 함수 중 어느 것인가?
3. 13번째 줄(마지막 줄)의 `end`는 무엇을 닫는가? 그 결과 `add`와 `subtract`는 어떤 종류의 함수가 되는가?
4. 편집기에서 함수 내용을 회색 대괄호 옆 `+`/`−`로 접고 펴는 기능을 MATLAB은 무엇이라 부르는가?

---

## 6.3 나만의 toolbox

### Q06-34 [단답] ★

원본: p.59

MATLAB이 함수 이름을 찾는 순서 세 단계를 차례로 쓰라.

### Q06-35 [출력] ★★

원본: p.59

현재 폴더에 공통 파일 `poly.m`이 있다. 같은 폴더의 스크립트 `test_poly.m`은 다음과 같다.

```matlab
a = poly(1)
function output = poly(x)
output = 2*x;
end
```

```
>> test_poly
>> poly(1)
```

### Q06-36 [단답] ★

원본: p.59–61

1. Set Path 대화상자를 여는 Command Window 명령은?
2. 내 함수 폴더를 search path에 넣을 때 누르는 버튼 이름은?
3. 이 작업을 할 때 슬라이드가 강조한 주의사항은?

---

## 6.4 Anonymous function과 function handle

### Q06-37 [출력] ★

원본: p.62–63

```
>> ln = @(x) log(x)
>> y = ln(1)
>> ln([1 10 100])
>> class(ln)
```

### Q06-38 [출력] ★★

원본: p.64–65

```
>> ln = @(x) log(x);
>> y = ln(10);
>> save my_ln_function ln
>> clear
>> load my_ln_function
>> ln(10)
>> y
```

1. Command Window 출력을 쓰라.
2. `save` 명령으로 현재 폴더에 생기는 파일 이름을 쓰라.

### Q06-39 [출력] ★★

원본: p.66

Q06-23의 `distance.m`(함수 안에서 `g = 9.8`)을 쓴다.

```
>> distance_handle = @(t) distance(t)
>> distance_handle(2)
>> h = @distance;
>> h(10)
```

### Q06-40 [출력] ★★★

원본: p.67

```
>> a = 5; b = 10; c = 15; d = 20;
>> cf = @(a,b,c,d,x) a*x.^3 + b*x.^2 + c*x + d;
>> new_fun = @(x) cf(a,b,c,d,x)
>> new_fun(1)
>> new_fun([0 2])
>> a = 0;
>> new_fun(1)
```

### Q06-41 [오류] ★★

원본: [보강]

```
>> f = @(x) x^2;
>> f(3)
>> f(1:3)
```

1. 각 명령의 결과를 쓰라(오류가 나면 첫 줄만).
2. 오류의 원인과 고치는 법을 쓰라.

### Q06-42 [코드] ★★

원본: p.62–63

아래 출력을 만드는 명령 두 줄을 쓰라.

```
sq =

  function_handle with value:

    @(x)x.^2

ans =

     1     4     9

```

---

## 6.5 Function function

### Q06-43 [빈칸] ★

원본: p.68–69

`ln = @(x) log(x)`가 정의되어 있다. x가 0.1부터 10까지인 구간에서 ln을 그리고, 제목 `A function plot`, x축 이름 `Independent Variable, x`, y축 이름 `f(x)=ln(x)`를 붙인다.

```
>> _____(____, __________)
>> _____("A function plot")
>> _____("Independent Variable, x")
>> _____("f(x)=ln(x)")
```

1. 빈칸을 채워라.
2. 첫 줄의 함수처럼 다른 함수를 입력으로 받는 함수를 무엇이라 부르는가?

### Q06-44 [오류] ★★

원본: p.69

```
>> fplot(log, [0.1 10])
>> clear
>> fplot(ln(x), [0.1 10])
```

1. 첫째, 셋째 명령의 오류 메시지 첫 줄을 각각 쓰라.
2. 각각 왜 오류가 나는지 쓰고, `log`를 그리도록 올바르게 고친 명령을 하나 쓰라.

### Q06-45 [출력] ★★

원본: [보강]

```
>> apply_twice = @(f, x) f(f(x));
>> apply_twice(@(x) 2*x + 1, 3)
>> arrayfun(@(k) k^2, 1:4)
```
