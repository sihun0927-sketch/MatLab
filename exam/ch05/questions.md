# Chapter 5 — Plotting · 문제지

- 모든 코드는 MATLAB R2026a, 기본 상태(`format short`, `format loose`)에서 Command Window에 한 줄씩 입력한다고 가정한다.
- `[출력]` 문제는 Command Window에 찍히는 내용을 빈 줄까지 그대로 쓴다. 그림이 그려지는 줄은 그림에 대해 묻는 경우에만 답한다.
- `[코드]` 문제는 세미콜론 배치까지 맞아야 정답이다.

---

## 5.1 Two-Dimensional Plots

### Q05-01 [출력] ★

원본: p.6

```matlab
x = 0:3:18
y = [0 0.33 4.13 6.29 6.85 11.19 13.19];
n = length(x)
plot(x, y)
```

(1) Command Window 출력을 쓰시오.
(2) 마지막 줄은 오류 없이 실행되는가? 이유를 한 문장으로 쓰시오.

### Q05-02 [오류] ★

원본: p.6

```matlab
x = [0:2:18];
y = [0 0.33 4.13 6.29 6.85 11.19 13.19 13.96 16.33];
plot(x, y)
```

(1) 오류 메시지 첫 두 줄을 쓰시오.
(2) 오류의 원인을 쓰고, `y`를 고치지 않고 `x`만 고쳐서 실행되게 하는 코드 한 줄을 쓰시오.

### Q05-03 [코드] ★★

원본: p.12, p.13, p.14

다음 Command Window 출력과 그림 설명을 모두 만족하는 코드를 쓰시오.

```
x =

     0     4     8    12    16

```

- 그림: `x`에 대해 `y = [0 4.13 6.85 13.19 16.33]`을 잇는 선 그래프 하나.
- 제목 `Laboratory Experiment 1`, x축 이름 `Time, sec`, y축 이름 `Distance, ft`.
- 주 격자와 보조 격자(minor grid)가 모두 보인다.
- 위 출력 외에는 Command Window에 아무것도 찍히지 않는다.

### Q05-04 [출력] ★★

원본: p.8, p.16, p.17, p.20, p.21

```matlab
close all
x = 0:pi/100:2*pi;
y1 = cos(x*4);
plot(x, y1)
figure(3)
y2 = sin(x);
plot(x, y2)
f = gcf;
f.Number
clf
area(x, y1)
```

(1) Command Window 출력을 쓰시오.
(2) 코드가 끝났을 때 열려 있는 figure 창의 번호를 모두 쓰고, 각 창에 무엇이 그려져 있는지 쓰시오.

### Q05-05 [변형] ★★

원본: p.18, p.23, p.24, p.28

```matlab
x = 0:pi/100:2*pi;
y1 = cos(x*4);
plot(x, y1)
hold on
y2 = sin(x);
plot(x, y2)
title("My Example")
hold off
plot(x, y1 + y2)
```

(1) 원본 코드가 끝났을 때 축 위에 남은 선의 개수와, 제목 `My Example`이 남아 있는지 쓰시오.
(2) `hold off` 줄을 지운 변형 코드에서 같은 두 가지를 쓰시오.

### Q05-06 [출력] ★★

원본: p.26, p.27, p.29, p.30, p.31, p.32

```matlab
x = 1:3;
y1 = x.^2;
y2 = x + 1;
Y = [y1; y2]
X = [x; 2*x];
Xt = X'
```

(1) Command Window 출력을 쓰시오.
(2) 위 코드 뒤에 다음을 각각 실행할 때 그려지는 선의 개수와 선 하나당 점의 개수를 쓰시오.

```matlab
plot(x, y1, x, y2)   % (가)
plot(x, Y)           % (나)
plot(X, Y)           % (다)
plot(X', Y')         % (라)
```

### Q05-07 [출력] ★★

원본: p.33

```matlab
x = 0:pi/2:2*pi;
x1 = sin(x)
n = numel(x1)
plot(x1)
```

(1) Command Window 출력을 쓰시오.
(2) 그래프의 가로축 값 범위를 쓰시오.

### Q05-08 [빈칸] ★

원본: p.35, p.36, p.37

각 설명에 맞게 LineSpec 문자열을 빈칸에 쓰시오.

```matlab
x = 1:10;
y = x.^2;
plot(x, y, ___(1)___)   % 검은색 점선(dotted), 각 점에 원(circle) 마커
plot(x, y, ___(2)___)   % 빨간색 파선(dashed), 각 점에 x 마커
plot(x, y, ___(3)___)   % 선 없이 파란 다이아몬드 마커만
plot(x, y, ___(4)___)   % 시안(cyan) 점선, 각 점에 plus 마커
```

(5) `":ok"`와 같은 결과를 내는, 색 이름을 풀어 쓴 문자열을 하나 쓰시오.

### Q05-09 [출력] ★★

원본: p.36, p.37

```matlab
x = 1:3;
y = [58.5 63.8 64.2];
a = y*2
b = y/2;
c = y/2 + x
plot(x, y, ":ok", x, a, "--xr", x, b, "-b")
```

(1) Command Window 출력을 쓰시오.
(2) 마지막 줄로 그려진 세 선의 색과 선 모양을 차례로 쓰시오.
(3) 이어서 `legend("y", "y/2", "2y")`를 실행하면 범례에서 `"y/2"` 옆에 붙는 선은 어느 선인가?

### Q05-10 [오류] ★★

원본: p.39, p.40, p.41

```matlab
x = 1:10;
y = [58.5 63.8 64.2 67.3 71.5 88.3 90.1 90.6 89.5 90.4];
plot(x, y, LineWidth=2, ":ok")
```

(1) 이 코드가 실행되지 않는 이유를 쓰시오.
(2) `Name=Value` 문법을 유지한 채 고친 코드 한 줄을 쓰시오.
(3) 같은 줄을 R2021a 이전 문법(`"Name", Value`)으로 쓰시오.

### Q05-11 [출력] ★★

원본: p.47

```matlab
x = 1:10;
y = x.^2;
plot(x, y)
axis([0, 11, 0, 300])
v = axis
xlim([2 8])
w = axis
```

Command Window 출력을 쓰시오.

### Q05-12 [단답] ★

원본: p.48, p.50

(1) `title("\alpha \beta \gamma")`가 그림에 표시하는 제목을 쓰시오.
(2) `xlabel("Cannon Launch Angle, \theta")`에서 `\theta`는 어떻게 표시되는가?
(3) `legend("g_1=9.8 m/s^2")`에서 아래첨자와 위첨자가 되는 글자를 각각 쓰시오.
(4) 축 이름에 `A_max`라고 쓰면 어떻게 표시되는가? `max` 전체를 아래첨자로 만들려면 어떻게 써야 하는가?

### Q05-13 [출력] ★★★

원본: p.50

```matlab
v = 100;
g1 = 9.8;
theta = [0 pi/12 pi/4];
R1 = v^2./g1.*sin(2*theta)
n = length(0:0.05:pi/2)
```

Command Window 출력을 쓰시오.

### Q05-14 [코드] ★★

원본: p.36, p.46

다음 Command Window 출력과 그림 설명을 모두 만족하는 코드를 쓰시오.

```
y =

   58.5000   63.8000   64.2000   67.3000

n =

     4

```

- `n`은 `y`의 원소 개수를 함수로 구한 값이다.
- 그림: x값 `1, 2, 3, 4`에 대해 `y`를 검은색 점선 + 원 마커로 그린다.
- 범례에 `line 1`, 좌표 (1, 60)에 글상자 `start`.
- 위 출력 외에는 Command Window에 아무것도 찍히지 않는다.

---

## 5.2 Subplots — Tiled Chart Layouts

### Q05-15 [출력] ★

원본: p.54, p.55

```matlab
x = 0:pi/20:2*pi;
n = numel(x)
x(end)
t = tiledlayout(2,1);
nexttile
plot(x, sin(x))
```

Command Window 출력을 쓰시오.

### Q05-16 [단답] ★

원본: p.53, p.56, p.57, p.60

(1) `tiledlayout(2,3)`으로 만든 격자에서 2행 1열 칸의 tile 번호는?
(2) `tiledlayout(2,3)` 다음 `nexttile(2, [2,1])`이 차지하는 tile 번호를 모두 쓰시오.
(3) 몇 개의 그래프를 그릴지 미리 모를 때 쓰는 `tiledlayout`의 입력은?
(4) `t = tiledlayout(2,1);` 뒤에 `title("A")`와 `title(t, "A")`는 각각 어디에 제목을 붙이는가?
(5) `tiledlayout(2,2)` 다음 `nexttile([1,2], 3)`을 실행하면 어떻게 되는가? 이유를 쓰시오.

### Q05-17 [빈칸] ★★

원본: p.60, p.61, p.62

위 칸 두 개에 `sin(x)`와 `sin(x).^2 + cos(x)`를, 아래 줄 전체를 합친 칸에 다항식을 그리고, 창 전체에 두 줄짜리 제목을 붙이려 한다. 빈칸을 채우시오.

```matlab
x = 0:pi/20:2*pi;
tile_name = ___(1)___;
nexttile
plot(x, sin(x))
nexttile
plot(x, sin(x).^2 + cos(x))
___(2)___
plot(x, 2 + 3*x - 8*x.^2 + 1.5*x.^3)
title(___(3)___, ["Some Sample Plots"; "Created by Designating Tile Rows and Columns"])
```

### Q05-18 [출력] ★★

원본: p.71

```matlab
m = ["A Polynomial Plotted"; "Using Multiple Graphing Strategies"]
size(m)
```

Command Window 출력을 쓰시오.

### Q05-19 [오류] ★★

원본: p.71

```matlab
m = ['A Polynomial Plotted'; 'Using Multiple Graphing Strategies'];
```

(1) 오류 메시지 첫 두 줄을 쓰시오.
(2) Q05-18의 코드는 실행되는데 이 코드는 왜 실행되지 않는가?

---

## 5.3.1–5.3.2 Polar Plots · Logarithmic Plots

### Q05-20 [출력] ★

원본: p.64

```matlab
theta = 0:pi/100:pi;
radius = sin(theta);
n = length(theta)
r = radius(51)
polarplot(theta, radius)
```

(1) Command Window 출력을 쓰시오.
(2) 그려지는 도형은 무엇인가?
(3) 첫 줄을 `theta = 0:180;`으로 바꾸면 그림이 어떻게 달라지는가?

### Q05-21 [출력] ★★

원본: p.67, p.68

```matlab
x = 0:1:4;
y = 5*x.^2
semilogx(x, y, "o")
```

(1) Command Window 출력을 쓰시오.
(2) 그래프에 실제로 보이는 원 마커는 몇 개인가? 이유는?
(3) `plot(x, y)`로 그린 뒤 선은 그대로 두고 y축만 로그 눈금으로 바꾸고 싶다. `semilogy(x, y)`를 이어서 실행하는 것과 무엇이 다른가?

### Q05-22 [단답] ★★

원본: p.66, p.69, p.70, p.72, p.73

`x = 0:0.5:50; y = 5*x.^2;`을 네 가지로 그렸다.

(1) `semilogx`, `semilogy`, `loglog` 중 로그 눈금이 되는 축을 각각 쓰시오.
(2) 네 그래프 중 직선으로 보이는 것은 어느 함수로 그린 것인가?
(3) 그 직선의 기울기는 얼마이고, 이것이 데이터 분석에 왜 유용한가?

---

## 5.3.3–5.3.4 Bar Graphs · Pie Charts · Histograms

### Q05-23 [출력] ★

원본: p.2 (Chapter 05_2)

```matlab
x = [1,2,5,4,8];
y = [x; 1:5]
size(y)
```

Command Window 출력을 쓰시오.

### Q05-24 [단답] ★★

원본: p.2, p.3 (Chapter 05_2)

Q05-23의 `x`, `y`에 대해 답하시오.

(1) `pie(x)`의 각 조각에 표시되는 백분율을 `x`의 순서대로 쓰시오.
(2) `bar(y)`는 막대를 몇 개의 그룹으로, 그룹마다 몇 개씩 그리는가?
(3) `pie([1 1 2])`의 백분율을 쓰시오.
(4) `bar([1 -1 2])`와 `pie([1 -1 2])`를 각각 실행하면 어떻게 되는가?

### Q05-25 [코드] ★★

원본: p.5, p.8, p.13, p.14 (Chapter 05_2)

시험 점수 `x = [100,95,74,87,22,78,34,82,93,88,86,69,55,72]`가 있다. 다음 출력을 내는 코드를 쓰시오. 첫 줄은 `x`를 만드는 줄이고, 마지막 줄은 같은 구간으로 히스토그램을 그린다.

```
edges =

     0    60    70    80    90   100

a =

     3     1     3     4     3

```

### Q05-26 [변형] ★★

원본: p.8, p.14 (Chapter 05_2)

Q05-25에서 구간 경계만 `edges = [0,50,70,90,100];`으로 바꾼 뒤 `a = histcounts(x, edges)`를 실행했다.

(1) Command Window 출력을 쓰시오.
(2) 원본 `a`와 원소 개수가 달라진 이유를 쓰시오.

### Q05-27 [출력] ★★★

원본: p.6, p.7, p.14 (Chapter 05_2)

```matlab
x = [100,95,74,87,22,78,34,82,93,88,86,69,55,72];
a = histcounts(x)
b = histcounts(x, 5)
```

(1) Command Window 출력을 쓰시오.
(2) `histogram(x, 5)`와 `histogram(x, [0 50 100])`에서 두 번째 인자의 의미 차이를 쓰시오.

### Q05-28 [출력] ★★★

원본: p.11, p.12 (Chapter 05_2)

```matlab
x = [100,95,74,87,22,78,34,82,93,88,86,69,55,72];
edges = [0,60,70,80,90,100];
d = histcounts(x, edges, Normalization="countdensity")
```

(1) Command Window 출력을 쓰시오.
(2) 구간 폭이 다를 때 `"countdensity"`로 그리는 이유를 쓰시오.

---

## 5.3.5–5.3.6 Graphs with Two y-Axes · Function Plots

### Q05-29 [출력] ★★

원본: p.16, p.17, p.18 (Chapter 05_2)

```matlab
x = 0:pi/20:2*pi;
y1 = sin(x);
y2 = exp(x);
y2(1)
y2(end)
y1(end)
```

(1) Command Window 출력을 쓰시오.
(2) `plot(x, y1, x, y2)`로 한 축에 그리면 `y1` 곡선이 어떻게 보이는가?

### Q05-30 [빈칸] ★★

원본: p.19, p.20 (Chapter 05_2)

`sin(x)`는 왼쪽 y축에, `exp(x)`는 오른쪽 y축에 그리려 한다. 빈칸을 채우시오.

```matlab
x = 0:pi/20:2*pi;
___(1)___
plot(x, sin(x))
xlabel("Angle in Radians"), ylabel("sin(x)")
___(2)___
plot(x, exp(x))
ylabel(___(3)___)          % 축 이름이 e의 x제곱으로 표시되게
```

(4) 빈칸 (1)을 비워 두어도 결과가 같은 이유를 쓰시오.
(5) 코드 끝에 `plot(x, cos(x))`를 한 줄 더 실행하면 두 곡선 중 어느 것이 지워지는가?

### Q05-31 [출력] ★

원본: p.25 (Chapter 05_2)

```matlab
fun = @(x) sin(x)
g = @(x) x.^2 + 1
g(3)
```

Command Window 출력을 쓰시오.

### Q05-32 [오류] ★★

원본: p.23, p.24 (Chapter 05_2)

```matlab
clear
fplot(sin(x), [-2*pi, 2*pi])
```

(1) 오류 메시지 첫 줄을 쓰시오.
(2) 올바르게 고친 코드 한 줄을 쓰시오.
(3) `fplot`에 넘기는 익명 함수에서 `@(x) x^2`보다 `@(x) x.^2`가 권장되는 이유를 쓰시오.

### Q05-33 [코드] ★★

원본: p.25 (Chapter 05_2)

다음 출력을 내고, 이어서 같은 함수를 구간 [-2, 2]에서 `fplot`으로 그리는 코드를 쓰시오. 독립 변수 이름은 `t`다.

```
f =

  function_handle with value:

    @(t)t.^2-1

ans =

     3

```

---

## 5.4 Three-Dimensional Plotting

### Q05-34 [출력] ★

원본: p.28 (Chapter 05_2)

```matlab
x = linspace(0, 10*pi, 5)
y = cos(x);
z = sin(x);
plot3(x, y, z)
grid on
```

Command Window 출력을 쓰시오.

### Q05-35 [오류] ★★

원본: p.28, p.29 (Chapter 05_2)

```matlab
x = linspace(0, 10*pi, 1000);
y = cos(x);
z = sin(x(1:999));
plot3(x, y, z)
```

(1) 오류 메시지 첫 두 줄을 쓰시오.
(2) 오류를 고친 뒤 `plot3` 대신 `comet3(x, y, z)`를 쓰면 무엇이 달라지는가?

### Q05-36 [출력] ★★

원본: p.33, p.34, p.35 (Chapter 05_2)

```matlab
z = [1:10; 2:2:20; 3:12];
size(z)
z(2,5)
z(3,end)
z(:,5)'
mesh(z)
```

(1) Command Window 출력을 쓰시오.
(2) `mesh(z)`의 x축과 y축 값 범위를 각각 쓰시오.

### Q05-37 [출력] ★★

원본: p.41, p.42 (Chapter 05_2)

```matlab
[X, Y] = meshgrid(1:3, 10:10:20)
Z = X.*Y
```

Command Window 출력을 쓰시오.

### Q05-38 [오류] ★★

원본: p.41, p.42 (Chapter 05_2)

```matlab
[X, Y] = meshgrid(1:3, 10:10:20);
Z = X*exp(-X.^2 - Y.^2);
```

(1) 오류 메시지 첫 두 줄을 쓰시오.
(2) 슬라이드처럼 `x = -2:0.2:2; y = -2:0.2:2;`로 만든 `X`, `Y`에서는 같은 실수가 오류를 내지 않는다. 왜 그런가? 그때 `Z`는 올바른가?

### Q05-39 [출력] ★★

원본: p.43, p.46 (Chapter 05_2)

```matlab
[x, y, z] = peaks;
size(z)
[X, Y] = meshgrid(-2:0.2:2);
size(X)
```

(1) Command Window 출력을 쓰시오.
(2) 셋째 줄과 같은 결과를 내는, `meshgrid`에 인자를 두 개 주는 코드를 쓰시오.

### Q05-40 [단답] ★★

원본: p.38, p.40, p.45, p.47, p.48, p.49, p.50, p.51 (Chapter 05_2)

(1) `surf`의 기본 음영 방식 이름과, 격자선을 없애며 색을 부드럽게 섞는 명령을 쓰시오.
(2) 기본 colormap 이름은?
(3) `contour(x, y, z, 20, "k")`에서 `20`과 `"k"`의 의미를 쓰시오.
(4) `pcolor` 위에 등고선을 겹칠 때 `contour` 앞뒤에 필요한 두 명령을 쓰시오.
(5) 등고선과 색 채우기를 한 번에 그리는 함수, 곡면 아래에 등고선을 함께 그리는 함수를 쓰시오.
(6) `h = contour(x, y, z); clabel(h)`에서 `clabel`이 하는 일은?
(7) 49×49인 `peaks` 데이터를 `pcolor(x, y, z)`로 그리면 색칠된 칸은 몇 × 몇인가? 이유는?

### Q05-41 [코드] ★★★

원본: p.36, p.37 (Chapter 05_2)

다음 출력을 낸 뒤, `x`를 x좌표, `y`를 y좌표로 써서 `z`를 `mesh`로 그리는 코드를 쓰시오. `z`의 값은 모두 1이다. `x`와 `y`는 `linspace`로 만든다.

```
x =

    1.0000   25.5000   50.0000

y =

   500   900

```

---

## 5.5–5.8 Editing · Workspace Plots · Saving · Other Plots

### Q05-42 [출력] ★★

원본: p.53, p.56, p.57 (Chapter 05_2)

```matlab
[X, Y, Z] = sphere(4);
size(X)
```

(1) Command Window 출력을 쓰시오.
(2) 이 코드를 실행하면 figure 창에 구가 그려지는가?
(3) 구가 찌그러져 보이지 않게 세 축의 데이터 간격을 같게 만드는 명령을 쓰시오.

### Q05-43 [출력] ★

원본: p.60, p.61 (Chapter 05_2)

```matlab
load seamount
size(x)
scatter3(x, y, z)
```

(1) Command Window 출력을 쓰시오.
(2) Workspace 창에서 `x`, `y`, `z`를 골라 PLOTS 탭으로 같은 그림을 만들면, 그 그림을 다시 만드는 코드는 어디에 나타나는가?

### Q05-44 [단답] ★

원본: p.55, p.57, p.58, p.62, p.64 (Chapter 05_2)

(1) MATLAB 전용 그림 파일 확장자는? 워드 문서에 넣을 그림으로 저장하려면 어떤 형식을 고르는가? (형식 하나)
(2) Property Inspector로 고친 그림을 저장하지 않고 스크립트를 다시 실행하면 어떻게 되는가?
(3) `axis equal`과 `axis square`의 차이를 쓰시오.
(4) 이산 데이터를 줄기(막대 끝에 원) 모양으로 그리는 함수와 계단 모양으로 그리는 함수를 쓰시오.

### Q05-45 [오류] ★★

원본: [보강]

```matlab
x = 0:0.1:1;
plot(x, x.^2)
savefig("result")
exportgraphics(gcf, "result")
```

(1) `savefig` 줄이 만드는 파일 이름을 쓰시오.
(2) `exportgraphics` 줄은 오류가 난다. 이유와 고친 코드 한 줄을 쓰시오(PNG 파일, 해상도 300 dpi).
(3) `.fig` 파일을 다시 여는 명령을 쓰시오.
