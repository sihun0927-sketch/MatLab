# Chapter 4 — Manipulating MATLAB Arrays 문제

- 모든 출력은 R2026a 기본 상태(`format short`, `format loose`)의 Command Window 기준으로 쓴다.
- 각 문제의 코드는 새 세션(작업 공간이 빈 상태)에서 위에서부터 한 줄씩 입력한다고 가정한다.
- `[코드]` 문제는 출력이 정확히 같아지도록 세미콜론까지 맞춰 쓴다.

## 4.1 배열의 정의·결합·인덱싱

### Q04-01 [출력] ★

원본: p.6

```matlab
A = [2.5];
B = [1, 4]
C = [-2, 0
      1, 3];
C
```

Command Window 출력을 쓰시오.

### Q04-02 [출력] ★★

원본: p.6

```matlab
v = [3 -1]
w = [3 - 1]
u = [3 -1 + 2]
```

Command Window 출력을 쓰시오.

### Q04-03 [오류] ★★

원본: p.7

```matlab
F = [1, 52, 64,
     55, 82];
```

(1) 오류 메시지 첫 두 줄을 쓰시오. (2) 오류가 나는 이유를 쓰시오. (3) 다섯 값을 담은 1×5 행벡터가 되도록 첫 줄을 고치시오.

### Q04-04 [출력] ★★

원본: p.8

```matlab
B = [2.5, 4];
S = [1, B]
T = [S; 7, 8, 9]
```

Command Window 출력을 쓰시오.

### Q04-05 [오류] ★

원본: p.8

```matlab
S = [1, 2.5, 4];
T = [1, 2; S]
```

오류 메시지 첫 두 줄과 오류가 나는 이유를 쓰시오.

### Q04-06 [출력] ★★

원본: p.9~12

```matlab
S = [4, 1.5, 6];
S(2)
S(2) = -2;
S(5) = 3
```

Command Window 출력을 쓰시오.

### Q04-07 [코드] ★★

원본: p.12~13

아래 출력이 나오도록 코드 두 줄을 쓰시오. 첫 줄에서 `S`를 스칼라 `2`로 만들고, 둘째 줄에서 인덱싱 대입 한 번으로 `S`를 늘린다.

```
S =

     2     0     0     7

```

### Q04-08 [출력] ★

원본: p.16

```matlab
H = 2:5
t = 0:0.25:1
```

Command Window 출력을 쓰시오.

### Q04-09 [출력] ★★

원본: p.17~22

```matlab
M = [1 2 3 4; 5 6 7 8; 9 10 11 12];
x = M(:,2)
z = M(3,:);
w = M(1:2, 3:4)
```

Command Window 출력을 쓰시오.

### Q04-10 [코드] ★★

원본: p.17~20, p.34

`M`은 아래처럼 이미 정의되어 있다(출력 없음).

```matlab
M = [1 2 3 4; 5 6 7 8; 9 10 11 12];
```

아래 출력이 나오도록 코드 두 줄을 쓰시오. `y`는 `end`를 써서 만든다.

```
y =

     4
     8
    12

r =

     5     6     7     8

```

### Q04-11 [출력] ★★

원본: p.23~29

```matlab
M = [1 2 3; 4 5 6];
M(:)
```

Command Window 출력을 쓰시오.

### Q04-12 [출력] ★★★

원본: p.30~33

```matlab
M = [1 2 3 4 5; 2 3 4 5 6; 3 4 5 6 7];
a = M(2,4), b = M(11); c = M(6)
b
```

Command Window 출력을 쓰시오.

### Q04-13 [단답] ★★

원본: p.30~33

3×5 배열 `M`에 대해 답하시오.

1. `M(3,4)`와 같은 원소를 가리키는 단일 인덱스(linear index)는?
2. `M(14)`는 몇 행 몇 열의 원소인가?
3. 원소 하나를 `M(2,3)`처럼 행·열 두 번호로 지정하는 방식을 슬라이드에서는 무엇이라 부르는가?

### Q04-14 [출력] ★

원본: p.34

```matlab
M = [4 8 1; 3 5 9];
M(1,end), M(end,end); M(end)
M(end-1)
```

Command Window 출력을 쓰시오.

### Q04-15 [출력] ★★

원본: p.35

```matlab
a = []
b = 5:1:2
c = 3:-1:1
```

Command Window 출력을 쓰시오.

### Q04-16 [오류] ★★

원본: [보강]

```matlab
S = [10 20 30];
S(0)
S(4)
```

`S(0)`과 `S(4)` 각각에 대해 오류 메시지 첫 줄과 이유를 쓰시오.

## 4.2 원소별 연산과 meshgrid

### Q04-17 [출력] ★

원본: p.37~38

```matlab
x = 4;
y = 2;
A = x*y;
x = 1:4;
B = x*y
C = x.*y;
```

Command Window 출력을 쓰시오.

### Q04-18 [오류] ★★

원본: p.39~40

```matlab
x = 1:4;
y = 1:3;
x*y
```

오류 메시지 첫 두 줄과 오류가 나는 이유를 쓰시오.

### Q04-19 [오류] ★★

원본: p.41

```matlab
x = 1:4;
y = 1:3;
x.*y
```

오류 메시지와 오류가 나는 이유를 쓰시오. Q04-18과 무엇이 다른지도 쓰시오.

### Q04-20 [출력] ★★

원본: p.42

```matlab
x = 1:4;
y = linspace(2,5,4)
A = x.*y
```

Command Window 출력을 쓰시오.

### Q04-21 [변형] ★★★

원본: p.42 `x = 1:5; y = linspace(1,3,5); A = x.*y`

```matlab
x = 1:3;
y = linspace(1,2,3)
A = x.*y
B = x*y'
```

Command Window 출력을 쓰시오. `A`와 `B`가 다른 이유를 쓰시오.

### Q04-22 [출력] ★★

원본: p.44

```matlab
x = 1:3;
y = 1:2;
[new_x, new_y] = meshgrid(x, y)
```

Command Window 출력을 쓰시오.

### Q04-23 [코드] ★★★

원본: p.46

`meshgrid`를 써서 아래 출력이 나오도록 코드를 쓰시오. 출력은 `A` 하나만 보여야 한다.

```
A =

     2     4     6     8
     3     6     9    12

```

### Q04-24 [단답] ★

원본: p.44~45

`x = 1:5; y = 1:3; [X, Y] = meshgrid(x, y);`를 실행했다.

1. `size(X)`의 결과는?
2. `X(2,4)`와 `Y(2,4)`의 값은?
3. 두 벡터를 이렇게 2차원 배열로 바꾸는 작업을 슬라이드에서는 무엇이라 부르는가?

### Q04-25 [변형] ★★

원본: p.46 `A = new_x.*new_y`

```matlab
x = 1:3;
y = 1:2;
[new_x, new_y] = meshgrid(x, y);
A = new_x.^new_y
B = new_x.*new_y
```

Command Window 출력을 쓰시오.

## 4.3 특수 배열

### Q04-26 [출력] ★

원본: p.49~50

```matlab
A = zeros(2)
B = ones(2,3);
C = B*5
```

Command Window 출력을 쓰시오.

### Q04-27 [코드] ★

원본: p.49~50

`zeros`와 `ones`를 한 번씩 써서 아래 출력이 나오도록 코드를 쓰시오.

```
Z =

     0     0     0     0
     0     0     0     0

P =

     1
     1
     1

```

### Q04-28 [출력] ★★

원본: p.51~53

```matlab
A = [2 4 6; 1 3 5; 7 8 9];
diag(A)
diag(A,1)
diag(A,-1)
```

Command Window 출력을 쓰시오.

### Q04-29 [출력] ★★

원본: p.54

```matlab
B = [4, 5];
C = diag(B)
D = diag(C)
```

Command Window 출력을 쓰시오.

### Q04-30 [변형] ★★★

원본: p.54 `B = [1,2,3]; diag(B)`

```matlab
B = [1; 2; 3];
diag(B)
diag(B,1)
```

Command Window 출력을 쓰시오.

### Q04-31 [출력] ★★

원본: p.57~58

`magic(3)`은 `[8 1 6; 3 5 7; 4 9 2]`이다.

```matlab
A = magic(3);
sum(A)
sum(A,2)
sum(A(1:2,:))
```

Command Window 출력을 쓰시오.

### Q04-32 [코드] ★★

원본: p.59

`A = magic(3);`가 이미 실행되어 있다. `sum`을 두 번째 인자 없이 한 번만 써서, 각 **행**의 합이 아래처럼 **행벡터**로 나오게 하는 코드 한 줄을 쓰시오.

```
ans =

    15    15    15

```

### Q04-33 [출력] ★★★

원본: p.60~61

```matlab
A = [1 2 3; 4 5 6; 7 8 9];
sum(diag(A))
A_flipped = fliplr(A)
sum(diag(A_flipped))
```

Command Window 출력을 쓰시오.

### Q04-34 [단답] ★

원본: p.47, p.55~56, p.60

1. `sum(diag(A))`처럼 함수 호출을 다른 함수의 입력으로 넣는 것을 무엇이라 부르는가?
2. 슬라이드에 따르면 `magic`으로 만들 수 있는 마방진의 크기 조건은?
3. `fliplr`과 함께 특수 배열 함수 목록에 나온 `flipud`는 배열을 어떻게 바꾸는가? `flipud([1 2; 3 4])`의 결과를 쓰시오.
4. 슬라이드가 든 `zeros`의 대표 용도 하나를 쓰시오.

### Q04-35 [빈칸] ★

원본: p.63

뒤러의 판화 "Melancholia" 이미지를 화면에 띄우는 슬라이드 코드다. 빈칸을 채우시오.

```matlab
load ______
image(X)
colormap(______)
axis image
axis ______
```

## 4.4 문자 배열과 문자열 배열

### Q04-36 [출력] ★

원본: p.67~70

```matlab
H = 'Chonnam'
H(end)
H(1:3)
```

Command Window 출력을 쓰시오.

### Q04-37 [출력] ★★

원본: p.71, p.77

```matlab
J = 'MATLAB is fun';
length(J)
size(J)
```

Command Window 출력을 쓰시오.

### Q04-38 [오류] ★★

원본: p.72~73

```matlab
M = ['Kim'; 'Park']
```

오류 메시지 첫 두 줄과 이유를 쓰고, `char` 함수로 고친 코드를 쓰시오.

### Q04-39 [출력] ★★★

원본: p.74~77

```matlab
M = char('Kim', 'Lee', 'Park')
M(1,:)
size(M)
numel(M)
length(M)
```

Command Window 출력을 쓰시오.

### Q04-40 [출력] ★★★

원본: p.79~80, p.83

Q04-39의 `M`이 작업 공간에 있다.

```matlab
N = string(M)
N(1)
strlength(N)
```

Command Window 출력을 쓰시오.

### Q04-41 [코드] ★★

원본: p.81~83

큰따옴표로 직접 문자열 배열을 만들어 아래 출력이 나오도록 코드 두 줄을 쓰시오.

```
P = 

  3×1 string array

    "Kim"
    "Lee"
    "Park"

ans = 

    "Park"

```

### Q04-42 [출력] ★

원본: p.84

```matlab
A = "Holly";
B = "Moore";
Name = B + ", " + A
```

Command Window 출력을 쓰시오.

### Q04-43 [변형] ★★★

원본: p.84 `Name = A + " " + B` (`A`, `B`는 string)

```matlab
A = 'ab';
B = 'cd';
A + B
[A B]
```

Command Window 출력을 쓰시오. 원본과 결과가 다른 이유를 쓰시오.

### Q04-44 [출력] ★★★

원본: p.85~86

```matlab
Test = 3.5;
GraphName = "Run " + Test
Label = "N=" + 2 + 3
```

Command Window 출력을 쓰시오.

### Q04-45 [출력] ★★

원본: p.87~88

```matlab
P = ["Steven"; "Ann"; "Bo"];
length(P)
strlength(P)
size(P)
```

Command Window 출력을 쓰시오.
