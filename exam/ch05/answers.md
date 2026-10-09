# Chapter 5 — Plotting · 해답

출력은 R2026a 기본 상태(`format short`, `format loose`)를 기준으로 [`exam/README.md`](../README.md)의 출력 규칙대로 썼다. 그림만 그리는 함수(`plot`, `title`, `grid` 등)는 세미콜론이 없어도 Command Window에 아무것도 찍지 않는다.

슬라이드 쪽수에 `(Chapter 05_2)` 표기가 없으면 `Chapter 05_1.pdf`의 쪽이다.

---

## 5.1 Two-Dimensional Plots

### Q05-01 [출력] ★

원본: p.6 `x = [0:2:18]; y = [0 0.33 … 18.17]; plot(x,y)` → 변형: 간격 2를 3으로, `x`·`n` 표시

(1)

```
x =

     0     3     6     9    12    15    18

n =

     7

```

(2) 실행된다. `x`와 `y`의 원소 개수가 7개로 같아서 순서쌍 7개가 만들어진다.

- `y` 줄은 세미콜론이 있어 출력이 없다. `plot`은 출력이 없다.
- 근거: [5.1](../../textbook/ch05/5.1-2d-plots.md) 5.1.1

### Q05-02 [오류] ★

원본: p.6 → 변형: `y`의 마지막 값 `18.17`을 뺐다

(1)

```
Error using plot
Vectors must be the same length.
```

(2) `x`는 10개, `y`는 9개라 순서쌍을 만들 수 없다. `x = [0:2:16];` (또는 `x = 0:2:16;`)

- 근거: [5.1](../../textbook/ch05/5.1-2d-plots.md) 5.1.1

### Q05-03 [코드] ★★

원본: p.12–14 `title("Laboratory Experiment 1")`, `xlabel("Time, sec")`, `ylabel("Distance, ft")`, `grid on`, `grid minor` → 변형: 데이터 5개, `x`만 표시

```matlab
x = 0:4:16
y = [0 4.13 6.85 13.19 16.33];
plot(x, y)
title("Laboratory Experiment 1")
xlabel("Time, sec")
ylabel("Distance, ft")
grid on
grid minor
```

- 세미콜론: `x` 줄에만 없다. `y` 줄에는 반드시 있다. 그림 함수 줄은 있어도 없어도 출력이 없다.
- `x = [0 4 8 12 16]`도 정답. `title`·`xlabel`의 큰따옴표 대신 작은따옴표도 동작한다(p.15).
- 근거: [5.1](../../textbook/ch05/5.1-2d-plots.md) 5.1.1

### Q05-04 [출력] ★★

원본: p.17 `figure` → `plot(x,y2)`, p.20–21 `clf`는 활성 figure만, p.8 `area` → 변형: `gcf`로 창 번호 확인, `clf` 뒤 `area`

(1)

```
ans =

     2

```

(2) 2개. Figure 1에는 `cos(4x)` 곡선이 그대로 남아 있다. Figure 2는 `clf`로 지워진 뒤 `area(x, y1)`로 `cos(4x)` 아래를 칠한 영역 그래프가 그려져 있다.

- `figure`를 인자 없이 부르면 새 창(Figure 2)이 열리고 이후 그림의 대상이 된다. `clf`는 **활성** 창만 지운다.
- `f = gcf;`는 세미콜론이 있어 출력이 없고, `f.Number`는 대입이 없으므로 `ans`로 찍힌다.
- 근거: [5.1](../../textbook/ch05/5.1-2d-plots.md) 5.1.1 figure 창 다루기

### Q05-05 [변형] ★★

원본: p.23–24 `hold on` … `hold off`, p.18·p.28 새 `plot`이 제목을 덮어씀 → 변형: `hold off` 삭제

(1) 원본: 선 **1개**(`y1 + y2`만). 제목은 **지워진다**. `hold off` 상태의 `plot`은 축을 새로 만들어 선·제목·축 이름을 모두 덮어쓴다.
(2) 변형: 선 **3개**(`y1`, `y2`, `y1 + y2`). 제목 `My Example`이 **남는다**. `hold on`이 계속 켜져 있어 새 선이 쌓이기만 한다.

- 슬라이드 p.24 "Don't forget hold off!!"의 이유가 (2)다. 이후 그리는 모든 그림이 같은 축에 쌓인다.
- 근거: [5.1](../../textbook/ch05/5.1-2d-plots.md) ⚠️ 함정 (`hold off`, 제목 덮어쓰기)

### Q05-06 [출력] ★★

원본: p.26 `plot(x, y1, x, y2)`, p.27 `Y = [y1;y2]; plot(x,Y)`, p.29–32 `X = [x1;x2]; plot(X,Y)`, `plot(X',Y')` → 변형: 원소 3개짜리 작은 배열

(1)

```
Y =

     1     4     9
     2     3     4

Xt =

     1     2
     2     4
     3     6

```

(2)

| | 선 개수 | 선 하나당 점 |
|---|---|---|
| (가) `plot(x, y1, x, y2)` | 2 | 3 |
| (나) `plot(x, Y)` | 2 | 3 |
| (다) `plot(X, Y)` | 3 | 2 |
| (라) `plot(X', Y')` | 2 | 3 |

- (나): `x`(길이 3)가 `Y`의 열 개수와 맞으므로 `Y`의 각 행을 한 선으로 그린다.
- (다): 두 입력이 모두 2×3 행렬이면 MATLAB은 **열마다 한 선**(column dominant)을 그린다. 열이 3개라 점 2개짜리 선 3개. 슬라이드에서는 열이 201개라 선 201개가 그려졌다(p.31).
- (라): 전치하면 3×2가 되어 열 2개 → 의도한 선 2개(p.32).
- 근거: [5.1](../../textbook/ch05/5.1-2d-plots.md) MATLAB은 column dominant, ⚠️ 함정

### Q05-07 [출력] ★★

원본: p.33 `x = 0:pi/100:2*pi; x1 = sin(x); plot(x1)` → 변형: 간격 `pi/2`, `x1` 표시

(1)

```
x1 =

         0    1.0000    0.0000   -1.0000   -0.0000

n =

     5

```

(2) 1부터 5까지. 입력이 하나면 x 대신 **인덱스 번호**를 가로축에 쓴다.

- `sin(pi)`는 0이 아니라 `1.2246e-16`, `sin(2*pi)`는 `-2.4493e-16`이다. 정확한 0이 아니므로 배열 전체가 소수 형식으로 찍히고 `0.0000`, `-0.0000`으로 보인다. 정확한 0인 첫 원소만 `0`으로 찍힌다.
- 근거: [5.1](../../textbook/ch05/5.1-2d-plots.md) 입력이 하나뿐일 때

### Q05-08 [빈칸] ★

원본: p.35 `help plot` 표, p.36 `":ok"`, `":oblack"`, p.37 `"--xr"`, `"-b"`

(1) `":ok"` (2) `"--xr"` (3) `"bd"` (4) `"c+:"` (5) `":oblack"`

- 세 기호의 순서는 자유다(`"ko:"`, `"r--x"`도 정답). 작은따옴표도 된다.
- black은 `k`. `b`는 blue다.
- 근거: [5.1](../../textbook/ch05/5.1-2d-plots.md) 5.1.2 ⚠️ 함정

### Q05-09 [출력] ★★

원본: p.37 `plot(x,y,":ok",x,y*2,"--xr",x,y/2,"-b")` → 변형: 원소 3개, `y*2`·`y/2 + x`를 변수로

(1)

```
a =

  117.0000  127.6000  128.4000

c =

   30.2500   33.9000   35.1000

```

(2) 검은색 점선 + 원 마커 / 빨간색 파선 + x 마커 / 파란색 실선(마커 없음)

- 스칼라를 곱하고 나누는 `y*2`, `y/2`는 점 연산자가 없어도 된다. `y/2 + x`는 크기가 같은 벡터의 덧셈이다.
- 정수부가 세 자리면 앞 공백이 2칸으로 줄어 폭 10을 유지한다.
- 근거: [5.1](../../textbook/ch05/5.1-2d-plots.md) 5.1.2

### Q05-10 [오류] ★★

원본: p.39–41 `plot(x,y,"LineWidth",2,"Marker","o","MarkerSize",10)` ↔ `plot(x,y,LineWidth = 2,Marker = "o",MarkerSize = 10)` → 변형: LineSpec을 Name=Value 뒤에 둠

(1) `Name=Value` 인수는 반드시 **모든 위치 인수(데이터, LineSpec) 뒤**에 와야 한다. LineSpec `":ok"`가 뒤에 있어서 문법 오류가 난다.

> **[확인 필요]** 오류 메시지 첫 줄. 문장 구문 단계에서 거부되는 오류(`Error: …`)로 예상한다.

(2) `plot(x, y, ":ok", LineWidth=2)`
(3) `plot(x, y, ":ok", "LineWidth", 2)`

- 근거: [5.1](../../textbook/ch05/5.1-2d-plots.md) 5.1.2 ⚠️ 함정 (문자열이 먼저)

### Q05-11 [출력] ★★

원본: p.47 `axis([0,11,0,300])` → 변형: `axis`를 출력 인자로 불러 현재 범위 확인, `xlim` 추가

```
v =

     0    11     0   300

w =

     2     8     0   300

```

- `axis`를 인자 없이 값으로 받으면 `[xmin xmax ymin ymax]`를 돌려준다. `xlim`은 x축만 바꾸므로 y범위 0~300은 그대로다.
- `axis([0,11,0,300])`, `xlim([2 8])` 줄은 출력이 없다.
- 근거: [5.1](../../textbook/ch05/5.1-2d-plots.md) 5.1.3 `axis`

### Q05-12 [단답] ★

원본: p.48 `title("\alpha \beta \gamma")`, p.50 `xlabel("Cannon Launch Angle, \theta")`, `legend("g_1=9.8 m/s^2", …)`

(1) α β γ
(2) 그리스 문자 θ
(3) 아래첨자 `1`, 위첨자 `2` (g₁ = 9.8 m/s²)
(4) `m` 한 글자만 아래첨자가 되고 `ax`는 그냥 이어진다. `A_{max}`로 쓴다.

- 근거: [5.1](../../textbook/ch05/5.1-2d-plots.md) TeX 문법 ⚠️ 함정

### Q05-13 [출력] ★★★

원본: p.50 Example 5.2 `theta = 0:0.05:pi/2; R1 = v^2./g1.*sin(2*theta)` → 변형: `theta`를 세 각도로

```
R1 =

   1.0e+03 *

         0    0.5102    1.0204

n =

    32

```

- `R1` = 0, 510.2041, 1020.4082. 최댓값이 1000을 넘어 공통 지수 `1.0e+03 *` 줄이 먼저 나온다.
- `0:0.05:pi/2`는 0, 0.05, …, 1.55까지(1.60 > 1.5708) 32개다. 슬라이드 Workspace의 `theta` 크기 1x32와 같다.
- 근거: [5.1](../../textbook/ch05/5.1-2d-plots.md) Example 5.2

### Q05-14 [코드] ★★

원본: p.36 `x = 1:10; y = [58.5 63.8 …]; plot(x,y,":ok")`, p.46 `legend(…)`, `text(1,100,"Label plots with the text command")`

```matlab
x = 1:4;
y = [58.5 63.8 64.2 67.3]
n = length(y)
plot(x, y, ":ok")
legend("line 1")
text(1, 60, "start")
```

- 세미콜론: `y`와 `n` 줄에만 없다. `x` 줄에는 있어야 한다.
- `n = numel(y)`도 정답. `text`의 좌표는 축 값 기준이다.
- 근거: [5.1](../../textbook/ch05/5.1-2d-plots.md) 5.1.3 `legend`, `text`

---

## 5.2 Subplots — Tiled Chart Layouts

### Q05-15 [출력] ★

원본: p.54–55 `x = 0:pi/20:2*pi; tiledlayout(2,1); nexttile; plot(x,sin(x))`

```
n =

    41

ans =

    6.2832

```

- `0:pi/20:2*pi`는 0부터 2π까지 41개(슬라이드 Workspace의 1x41). 마지막 원소는 2π = 6.2832.
- `t = tiledlayout(2,1);`에 세미콜론이 없으면 TiledChartLayout 객체 정보가 길게 찍힌다. 그래서 슬라이드는 세미콜론을 권한다(p.57).
- 근거: [5.2](../../textbook/ch05/5.2-tiled-layout.md)

### Q05-16 [단답] ★

원본: p.53 tile 번호, p.56 `"flow"`, p.57 `title(t, …)`, p.60 `nexttile(3,[1,2])`

(1) 4 (왼쪽→오른쪽, 위→아래 순서. 1행이 1, 2, 3)
(2) 2와 5 (2번 칸에서 시작해 2행 1열 크기)
(3) `"flow"` — `tiledlayout("flow")`
(4) `title("A")`는 현재 tile의 axes 하나에, `title(t, "A")`는 레이아웃 전체 위에 붙는다.

- 근거: [5.2](../../textbook/ch05/5.2-tiled-layout.md) ⚠️ 함정

### Q05-17 [빈칸] ★★

원본: p.61 `tile_name = tiledlayout(2,2); … nexttile(3,[1,2]) … title(tile_name, [...])`

(1) `tiledlayout(2,2)` (2) `nexttile(3, [1,2])` (3) `tile_name`

- `nexttile(3, [1,2])`의 `3`은 시작 칸 번호, `[1,2]`는 1행 2열 크기다. 순서를 바꾸면 오류.
- 근거: [5.2](../../textbook/ch05/5.2-tiled-layout.md) ⚠️ 함정

### Q05-18 [출력] ★★

원본: p.71 `m = ["A Polynomial Plotted"; "Using Multiple Graphing Strategies"]; title(t,m)` → 변형: 세미콜론 제거, `size`

```
m = 

  2×1 string array

    "A Polynomial Plotted"
    "Using Multiple Graphing Strategies"

ans =

     2     1

```

- 큰따옴표 문자열을 `;`로 쌓으면 2×1 string 배열이 된다. 슬라이드 Workspace의 `m` 2x1 string과 같다. `title(t, m)`은 두 줄 제목이 된다.

> **[확인 필요]** string 배열 표시에서 `m = ` 뒤 공백과 `2×1 string array` 줄 앞뒤 빈 줄.

- 근거: [5.2](../../textbook/ch05/5.2-tiled-layout.md) 레이아웃 전체 제목

### Q05-19 [오류] ★★

원본: p.71 → 변형: 큰따옴표를 작은따옴표로

(1)

```
Error using vertcat
Dimensions of arrays being concatenated are not consistent.
```

(2) 작은따옴표는 **char 배열**이라 한 줄이 글자 수만큼의 열을 가진다. 첫 줄은 20글자, 둘째 줄은 34글자라 행으로 쌓을 수 없다. string은 원소 하나가 문장 하나라서 길이가 달라도 2×1로 쌓인다.

- 근거: [5.1](../../textbook/ch05/5.1-2d-plots.md) (p.15 작은따옴표 vs 큰따옴표), [5.2](../../textbook/ch05/5.2-tiled-layout.md)

---

## 5.3.1–5.3.2 Polar Plots · Logarithmic Plots

### Q05-20 [출력] ★

원본: p.64 `theta = 0:pi/100:pi; radius = sin(theta); polarplot(theta,radius)`

(1)

```
n =

   101

r =

     1

```

(2) 원. 원점을 지나고 지름이 1인 원(θ = 90° 방향 꼭대기가 r = 1).
(3) `polarplot`의 θ는 **라디안**이다. 0~180 라디안은 약 28.6바퀴이므로 점 181개가 여러 바퀴를 돌며 이어진 엉뚱한 그림이 된다. 도를 쓰려면 `deg2rad(0:180)`.

- `theta(51)`은 π/2이므로 `sin`이 정확히 1이 되어 정수 형식으로 찍힌다.
- 근거: [5.3](../../textbook/ch05/5.3-other-2d-plots.md) 5.3.1 ⚠️ 함정

### Q05-21 [출력] ★★

원본: p.67–68 `x = 0:0.5:50; y = 5*x.^2; … semilogx(x,y)` → 변형: `x = 0:1:4`, `y` 표시

(1)

```
y =

     0     5    20    45    80

```

(2) 4개. x = 0은 로그 눈금에 올릴 수 없어서(log 0 = −∞) 첫 점이 빠진다.

- 근거: [5.3](../../textbook/ch05/5.3-other-2d-plots.md) 5.3.2 ⚠️ 함정 (0이나 음수)

### Q05-22 [단답] ★★

원본: p.66 Table 5.4, p.69–70 `semilogy`, `loglog`, p.72–73 "Interpreting the Graph"

(1) `semilogx` → x축, `semilogy` → y축, `loglog` → 두 축 모두
(2) `loglog`
(3) 기울기 2. log y = log 5 + 2·log x 이므로 거듭제곱 함수 y = a·xⁿ은 로그–로그 그래프에서 기울기 n인 직선이 된다. 실험 데이터를 `loglog`로 그려 직선이면 기울기에서 지수를 읽을 수 있다.

- 근거: [5.3](../../textbook/ch05/5.3-other-2d-plots.md) 5.3.2

---

## 5.3.3–5.3.4 Bar Graphs · Pie Charts · Histograms

### Q05-23 [출력] ★

원본: p.2 (Chapter 05_2) `x = [1,2,5,4,8]; y = [x;1:5];` → 변형: 세미콜론 제거, `size`

```
y =

     1     2     5     4     8
     1     2     3     4     5

ans =

     2     5

```

- 근거: [5.3.3](../../textbook/ch05/5.3.3-bar-pie.md)

### Q05-24 [단답] ★★

원본: p.2–3 (Chapter 05_2) `bar(x)`, `bar(y)`, `bar3(y)`, `pie(x)`

(1) 5%, 10%, 25%, 20%, 40% (합 20에 대한 비율)
(2) 2개 그룹, 그룹마다 5개. 2차원 배열은 **행 단위**로 묶는다(슬라이드 그림 "A Bar Graph of Array y"의 x눈금 1, 2).
(3) 25%, 25%, 50%

- 근거: [5.3.3](../../textbook/ch05/5.3.3-bar-pie.md) ⚠️ 함정

### Q05-25 [코드] ★★

원본: p.8 (Chapter 05_2) `edges = [0,60,70,80,90,100]; histogram(x,edges)`, p.14 `a = histcounts(x,edges)`

```matlab
x = [100,95,74,87,22,78,34,82,93,88,86,69,55,72];
edges = [0,60,70,80,90,100]
a = histcounts(x, edges)
histogram(x, edges)
```

- 세미콜론: `edges`와 `a` 줄에만 없다. `x` 줄에는 있어야 한다.
- 구간은 [0,60) [60,70) [70,80) [80,90) [90,100]. 마지막 구간만 오른쪽 끝(100)을 포함한다.
- 근거: [5.3.4](../../textbook/ch05/5.3.4-histogram.md)

### Q05-26 [변형] ★★

원본: p.14 (Chapter 05_2) `a = histcounts(x,edges)` → `3 1 3 4 3` → 변형: 경계 `[0,50,70,90,100]`

(1)

```
a =

     2     2     7     3

```

(2) 경계가 5개면 구간은 4개다. [0,50) 22, 34 / [50,70) 55, 69 / [70,90) 74, 87, 78, 82, 88, 86, 72 / [90,100] 100, 95, 93.

- 근거: [5.3.4](../../textbook/ch05/5.3.4-histogram.md)

### Q05-27 [출력] ★★★

원본: p.6–7 (Chapter 05_2) `histogram(x)`, `histogram(x,5)`, p.14 `a = histcounts(x)` → `1 2 8 3`

(1)

```
a =

     1     2     8     3

b =

     2     0     1     5     6

```

(2) 스칼라 `5`는 **구간 개수**, 벡터 `[0 50 100]`은 **구간 경계**(구간 2개)다.

- `a`는 슬라이드 p.14의 출력 그대로다. [0,30) 22 / [30,60) 34, 55 / [60,90) 8개 / [90,120] 100, 95, 93.
- `b`는 최솟값 22부터 최댓값 100까지를 폭 15.6으로 5등분한 구간이다(22, 37.6, 53.2, 68.8, 84.4, 100). 69는 68.8보다 커서 넷째 구간에 들어간다. 슬라이드 p.7 그림의 막대 높이 2, 0, 1, 5, 6과 같다.

> **[확인 필요]** `histcounts(x, 5)`의 자동 경계가 정확히 최솟값~최댓값 등분인지. p.7 그림과는 일치한다.

- 근거: [5.3.4](../../textbook/ch05/5.3.4-histogram.md) ⚠️ 함정

### Q05-28 [출력] ★★★

원본: p.12 (Chapter 05_2) `histogram(x,edges,"normalization","countdensity")` → 변형: `histcounts`로 값 확인

(1)

```
d =

    0.0500    0.1000    0.3000    0.4000    0.3000

```

(2) count density = 개수 ÷ 구간 폭이다. 3/60, 1/10, 3/10, 4/10, 3/10. 폭 60인 첫 구간을 개수(3)로 그리면 다른 구간보다 훨씬 커 보인다(p.11). 넓이가 개수에 비례하게 해야 공정한 비교가 된다.

- 슬라이드 p.12 그림의 막대 높이 0.05, 0.1, 0.3, 0.4, 0.3과 같다.
- 근거: [5.3.4](../../textbook/ch05/5.3.4-histogram.md) ⚠️ 함정

---

## 5.3.5–5.3.6 Graphs with Two y-Axes · Function Plots

### Q05-29 [출력] ★★

원본: p.16–18 (Chapter 05_2) `x = 0:pi/20:2*pi; y1 = sin(x); y2 = exp(x); … plot(x,y1,x,y2)`

(1)

```
ans =

     1

ans =

  535.4917

ans =

  -2.4493e-16

```

(2) `y2`가 1~535로 커서 y축이 0~600이 되고, −1~1인 `y1`은 0 근처의 거의 평평한 선으로 보여 정보가 사라진다(p.18).

- `exp(0)`은 정확히 1이라 정수 형식. `sin(2*pi)`는 0이 아니라 아주 작은 수라 지수 형식으로 찍힌다.
- 근거: [5.3.5](../../textbook/ch05/5.3.5-yyaxis.md)

### Q05-30 [빈칸] ★★

원본: p.19 (Chapter 05_2) `yyaxis left %default - this is not necessary` … `yyaxis right` … `ylabel("e^x")`

(1) `yyaxis left` (2) `yyaxis right` (3) `"e^x"`
(4) 왼쪽 축이 기본값이라 처음 그리는 곡선은 이미 왼쪽 y축을 쓴다.

- 근거: [5.3.5](../../textbook/ch05/5.3.5-yyaxis.md) ⚠️ 함정

### Q05-31 [출력] ★

원본: p.25 (Chapter 05_2) `fun = @(x) sin(x)` → 출력 그대로, 변형 `g` 추가

```
fun =

  function_handle with value:

    @(x)sin(x)

g =

  function_handle with value:

    @(x)x.^2+1

ans =

    10

```

- 표시할 때 MATLAB이 식 안의 공백을 지운다(`@(x)x.^2+1`). `fun` 출력은 슬라이드 p.25 화면과 같다.
- 근거: [5.3.6](../../textbook/ch05/5.3.6-fplot.md)

### Q05-32 [오류] ★★

원본: p.23 (Chapter 05_2) `fplot(@(x) sin(x), [-2*pi,2*pi])` → 변형: `@(x)` 삭제

(1)

```
Unrecognized function or variable 'x'.
```

(2) `fplot(@(x) sin(x), [-2*pi, 2*pi])`
(3) `fplot`은 x값을 **배열**로 넘겨 계산하므로 요소별 연산 `.^`를 써야 한다. `^`는 행렬 거듭제곱이다.

> **[확인 필요]** `fplot(@(x) x^2, [-2 2])`가 오류로 멈추는지, 경고(`Function behaves unexpectedly on array inputs…`)만 내고 그리는지. textbook은 오류로 적었다.

- 근거: [5.3.6](../../textbook/ch05/5.3.6-fplot.md) ⚠️ 함정

### Q05-33 [코드] ★★

원본: p.25 (Chapter 05_2) `fun = @(x) sin(x)` … `fplot(fun, [-2*pi,2*pi])`

```matlab
f = @(t) t.^2 - 1
f(2)
fplot(f, [-2, 2])
```

- 세미콜론: 첫 두 줄에 없다. `f(2)`는 대입하지 않았으므로 `ans`로 찍힌다.
- `f = @(t) t.^2-1`처럼 공백 없이 써도 같다. `t^2`로 쓰면 표시가 `@(t)t^2-1`이 되어 출력과 다르다.
- 근거: [5.3.6](../../textbook/ch05/5.3.6-fplot.md)

---

## 5.4 Three-Dimensional Plotting

### Q05-34 [출력] ★

원본: p.28 (Chapter 05_2) `x = linspace(0,10*pi,1000); y = cos(x); z = sin(x); plot3(x,y,z); grid` → 변형: 점 5개, `x` 표시

```
x =

         0    7.8540   15.7080   23.5619   31.4159

```

- 10π를 4등분: 0, 2.5π, 5π, 7.5π, 10π.
- 근거: [5.4.1](../../textbook/ch05/5.4.1-plot3.md)

### Q05-35 [오류] ★★

원본: p.28–29 (Chapter 05_2) `plot3(x,y,z)`, `comet3(x,y,z)` → 변형: `z`를 한 개 짧게

(1)

```
Error using plot3
Vectors must be the same length.
```

> **[확인 필요]** `plot3`의 길이 불일치 메시지가 `plot`과 같은 문장인지.

(2) 같은 나선이 **그려지는 과정이 애니메이션**으로 보인다. 너무 빠르면 점 개수를 늘린다(p.29).

- 근거: [5.4.1](../../textbook/ch05/5.4.1-plot3.md) ⚠️ 함정

### Q05-36 [출력] ★★

원본: p.33–35 (Chapter 05_2) `z = [1,2,…,10; 2,4,…,20; 3,4,…,12]; mesh(z)`, `z(2,5)`는 10

(1)

```
ans =

     3    10

ans =

    10

ans =

    12

ans =

     5    10     7

```

(2) x축 1~10(열 번호), y축 1~3(행 번호). 입력이 하나면 인덱스가 좌표가 된다.

- `z(:,5)'`는 5열 `[5; 10; 7]`을 전치한 행 벡터다.
- 근거: [5.4.2](../../textbook/ch05/5.4.2-mesh-surf.md)

### Q05-37 [출력] ★★

원본: p.41–42 (Chapter 05_2) `[X,Y] = meshgrid(x,y); Z = X.*exp(-X.^2 - Y.^2);` → 변형: 작은 격자, 세미콜론 제거

```
X =

     1     2     3
     1     2     3

Y =

    10    10    10
    20    20    20

Z =

    10    20    30
    20    40    60

```

- 결과 크기는 `numel(y) × numel(x)` = 2×3. **행이 y, 열이 x**다.
- 근거: [5.4.2](../../textbook/ch05/5.4.2-mesh-surf.md) ⚠️ 함정

### Q05-38 [오류] ★★

원본: p.41–42 (Chapter 05_2) `Z = X.*exp(-X.^2 - Y.^2);` → 변형: `.*`를 `*`로

(1)

```
Error using  * 
Incorrect dimensions for matrix multiplication. Check that the number of columns in the first matrix matches the number of rows in the second matrix. To operate on each element of the matrix individually, use TIMES (.*) for elementwise multiplication.
```

(2) 슬라이드 격자는 21×21 **정방 행렬**이라 행렬 곱이 성립해 오류가 나지 않는다. 하지만 요소별 곱이 아니라 행렬 곱이므로 `Z`는 틀린 값이다. 오류가 안 나는 쪽이 더 위험하다.

- 근거: [5.4.2](../../textbook/ch05/5.4.2-mesh-surf.md) ⚠️ 함정

### Q05-39 [출력] ★★

원본: p.46 (Chapter 05_2) `[x,y,z] = peaks;` (Workspace 49x49), p.43 HINT `[X,Y] = meshgrid(-2:0.2:2)`

(1)

```
ans =

    49    49

ans =

    21    21

```

(2) `[X, Y] = meshgrid(-2:0.2:2, -2:0.2:2);` (또는 `x = -2:0.2:2; [X, Y] = meshgrid(x, x);`)

- 벡터 하나만 주면 `meshgrid(x, x)`로 해석한다(p.43 HINT).
- 근거: [5.4.2](../../textbook/ch05/5.4.2-mesh-surf.md), [5.4.3](../../textbook/ch05/5.4.3-contour-pcolor.md)

### Q05-40 [단답] ★★

원본: p.38 `shading interp`/`flat`, p.40 colormap 목록, p.45 `contour`, `surfc`, p.47–48 `pcolor`, `shading interp`, p.49 `hold on; contour(x,y,z,20,"k"); hold off`, p.50 `contourf(x,y,z,20,"k")`, p.51 `h = contour(x,y,z); clabel(h)` (모두 Chapter 05_2)

(1) 기본은 `faceted`. `shading interp` (`shading flat`은 격자선만 없애고 칸마다 단색)
(2) `parula`
(3) `20`은 등고선 개수, `"k"`는 선 색 검정. 색을 안 정하면 배경 색에 묻혀 안 보인다(p.50).
(4) `hold on`, `hold off`
(5) `contourf`, `surfc` (격자선 곡면이면 `meshc`)
(6) 등고선마다 높이 값을 숫자로 붙인다.

> **[보강]** textbook은 R2026a에서 `clabel(h)` 대신 `contour(x, y, z, ShowText=true)` 또는 `[C, h] = contour(…); clabel(C, h)`를 쓰라고 적었다. 슬라이드 Workspace에는 `h`가 2x510 double(등고선 행렬)로 나온다.

- 근거: [5.4.2](../../textbook/ch05/5.4.2-mesh-surf.md), [5.4.3](../../textbook/ch05/5.4.3-contour-pcolor.md) ⚠️ 함정

### Q05-41 [코드] ★★★

원본: p.36–37 (Chapter 05_2) `x = linspace(1,50,10); y = linspace(500,1000,3); mesh(x,y,z)` → 변형: 점 개수 3과 2

```matlab
x = linspace(1, 50, 3)
y = linspace(500, 900, 2)
z = ones(2, 3);
mesh(x, y, z)
```

- 세미콜론: `x`, `y` 줄에 없고 `z` 줄에 있다.
- `z`는 **행 수 = `y`의 길이(2), 열 수 = `x`의 길이(3)**인 2×3이어야 한다(p.36). `ones(3, 2)`로 만들면 크기가 맞지 않아 오류다.
- 근거: [5.4.2](../../textbook/ch05/5.4.2-mesh-surf.md) ⚠️ 함정

---

## 5.5–5.8 Editing · Workspace Plots · Saving · Other Plots

### Q05-42 [출력] ★★

원본: p.53, p.56–57 (Chapter 05_2) `sphere`로 만든 구, Property Inspector의 Data Aspect Ratio Mode, p.58 HINT `axis equal`

(1)

```
ans =

     5     5

```

(2) 그려지지 않는다. 출력을 받으면 좌표만 계산한다. `sphere(n)`의 좌표 배열은 (n+1)×(n+1)이다.
(3) `axis equal`

- 그리려면 `surf(X, Y, Z)` 또는 출력 없이 `sphere(4)`.
- 근거: [5.5](../../textbook/ch05/5.5-editing-plots.md) ⚠️ 함정

### Q05-43 [출력] ★

원본: p.60–61 (Chapter 05_2) `load seamount`, `scatter3(x,y,z)` (Workspace `x` 294x1)

(1)

```
ans =

   294     1

```

(2) Command Window. PLOTS 탭으로 그림을 만들면 그에 해당하는 명령(`scatter3(x,y,z)`)이 Command Window에 찍힌다. 스크립트에는 저절로 남지 않는다.

- `load seamount`는 `x`, `y`, `z`, `caption` 네 변수를 만든다. 열 벡터라 `size`가 `294 1`이다.
- 근거: [5.6](../../textbook/ch05/5.6-workspace-plots.md) ⚠️ 함정

### Q05-44 [단답] ★

원본: p.55, p.57 대화식 편집, p.58 `axis equal`, p.62 저장 방법 (모두 Chapter 05_2)

(1) `.fig`. 문서용은 `.png`(또는 `.jpg`, `.gif`).
(2) 대화식 편집 결과가 사라진다. 코드로 다시 그린 그림으로 돌아간다(p.57).
(3) `axis equal`은 세 축의 **데이터 단위 간격**을 같게 한다. `axis square`는 축 **상자**를 정사각형으로 만들 뿐 데이터 간격은 다를 수 있다.

- 근거: [5.5](../../textbook/ch05/5.5-editing-plots.md), [5.7](../../textbook/ch05/5.7-saving-plots.md) ⚠️ 함정
