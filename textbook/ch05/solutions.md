# Chapter 5 연습문제 해답

[← 목차](README.md)

> **[보강]** 이 문서 전체가 슬라이드 밖 내용이다. 문제와 해답 모두 시험 대비용으로 새로 만들었으므로, 원본 슬라이드와 대조할 때는 이 파일을 제외하면 된다.

각 해답의 실행 코드는 `example/ch05/solXXYY_N.m`에 있다. 번호 규칙은 `sol` + 장(05) + 절 + `_` + 문제 번호다. 38개 모두 R2026a에서 오류 없이 실행된다.

> 문제 번호는 절 문서의 표기를 그대로 따른다. 5.1 ~ 5.3.2 는 `5.1.1-1` 처럼 절 번호를 붙여 세고, 5.3.3 이후는 절 안에서 `1.`, `2.` 로 센다.

| 문제 | 해답 코드 |
|---|---|
| 5.1.1-1 | [`sol0501_1.m`](../../example/ch05/sol0501_1.m) |
| 5.1.1-2 | [`sol0501_2.m`](../../example/ch05/sol0501_2.m) |
| 5.1.1-3 | [`sol0501_3.m`](../../example/ch05/sol0501_3.m) |
| 5.1.2-1 | [`sol0501_4.m`](../../example/ch05/sol0501_4.m) |
| 5.1.2-2 | [`sol0501_5.m`](../../example/ch05/sol0501_5.m) |
| 5.1.2-3 | [`sol0501_6.m`](../../example/ch05/sol0501_6.m) |
| 5.1.3-1 | [`sol0501_7.m`](../../example/ch05/sol0501_7.m) |
| 5.1.3-2 | [`sol0501_8.m`](../../example/ch05/sol0501_8.m) |
| 5.1.3-3 | [`sol0501_9.m`](../../example/ch05/sol0501_9.m) |
| 5.2-1 | [`sol0502_1.m`](../../example/ch05/sol0502_1.m) |
| 5.2-2 | [`sol0502_2.m`](../../example/ch05/sol0502_2.m) |
| 5.2-3 | [`sol0502_3.m`](../../example/ch05/sol0502_3.m) |
| 5.3.1-1 | [`sol0503_1.m`](../../example/ch05/sol0503_1.m) |
| 5.3.1-2 | [`sol0503_2.m`](../../example/ch05/sol0503_2.m) |
| 5.3.2-1 | [`sol0503_3.m`](../../example/ch05/sol0503_3.m) |
| 5.3.2-2 | [`sol0503_4.m`](../../example/ch05/sol0503_4.m) |
| 5.3.3-1 | [`sol0533_1.m`](../../example/ch05/sol0533_1.m) |
| 5.3.3-2 | [`sol0533_2.m`](../../example/ch05/sol0533_2.m) |
| 5.3.4-1 | [`sol0534_1.m`](../../example/ch05/sol0534_1.m) |
| 5.3.4-2 | [`sol0534_2.m`](../../example/ch05/sol0534_2.m) |
| 5.3.5-1 | [`sol0535_1.m`](../../example/ch05/sol0535_1.m) |
| 5.3.5-2 | [`sol0535_2.m`](../../example/ch05/sol0535_2.m) |
| 5.3.6-1 | [`sol0536_1.m`](../../example/ch05/sol0536_1.m) |
| 5.3.6-2 | [`sol0536_2.m`](../../example/ch05/sol0536_2.m) |
| 5.4.1-1 | [`sol0541_1.m`](../../example/ch05/sol0541_1.m) |
| 5.4.1-2 | [`sol0541_2.m`](../../example/ch05/sol0541_2.m) |
| 5.4.2-1 | [`sol0542_1.m`](../../example/ch05/sol0542_1.m) |
| 5.4.2-2 | [`sol0542_2.m`](../../example/ch05/sol0542_2.m) |
| 5.4.3-1 | [`sol0543_1.m`](../../example/ch05/sol0543_1.m) |
| 5.4.3-2 | [`sol0543_2.m`](../../example/ch05/sol0543_2.m) |
| 5.5-1 | [`sol0550_1.m`](../../example/ch05/sol0550_1.m) |
| 5.5-2 | [`sol0550_2.m`](../../example/ch05/sol0550_2.m) |
| 5.6-1 | [`sol0560_1.m`](../../example/ch05/sol0560_1.m) |
| 5.6-2 | [`sol0560_2.m`](../../example/ch05/sol0560_2.m) |
| 5.7-1 | [`sol0570_1.m`](../../example/ch05/sol0570_1.m) |
| 5.7-2 | [`sol0570_2.m`](../../example/ch05/sol0570_2.m) |
| 5.8-1 | [`sol0580_1.m`](../../example/ch05/sol0580_1.m) |
| 5.8-2 | [`sol0580_2.m`](../../example/ch05/sol0580_2.m) |

---

## 5.1.1 기본 plotting

### 5.1.1-1 자유낙하 거리

```matlab
t = 0:0.5:10;                    % s
d = 0.5*9.81*t.^2;               % m

plot(t, d)
title("자유낙하 거리")
xlabel("시간 t, s")
ylabel("낙하 거리 d, m")
grid on
```

![5.1.1-1](img/sol0501_1.png)

핵심은 `t.^2`다. `t`가 벡터이므로 `t^2`(행렬 거듭제곱)는 오류가 난다.

### 5.1.1-2 두 선을 그리는 세 가지 방법

```matlab
x  = 0:pi/50:4*pi;
y1 = sin(x);
y2 = sin(x)/2;

% (a) hold on
plot(x, y1), hold on, plot(x, y2), hold off

% (b) x, y 쌍을 번갈아
plot(x, y1, x, y2)

% (c) 2차원 배열
Y = [y1; y2];
plot(x, Y)
```

![5.1.1-2](img/sol0501_2.png)

세 그림이 동일하다. (c)에서 `[y1; y2]`는 2×201이고 `x`는 1×201이다. 이때 MATLAB은 `Y`의 각 **행**을 한 선으로 그린다 — `x`의 길이(201)와 맞는 쪽이 열이기 때문이다.

### 5.1.1-3 `plot(A)`의 선 개수

`A = [1 2 3; 4 5 6]`은 2행 3열이다.

- MATLAB은 **열마다 한 선**을 그린다 → **선 3개**
- 각 선은 행 수만큼 점을 갖는다 → **점 2개씩**
- `x`를 주지 않았으므로 x축은 행 인덱스 1, 2

```matlab
A = [1 2 3; 4 5 6];              % 2 x 3
plot(A, "-o")
legend("1열: [1;4]", "2열: [2;5]", "3열: [3;6]", Location="northwest")

fprintf("선 %d개, 각 선의 점 %d개\n", size(A, 2), size(A, 1));
% 선 3개, 각 선의 점 2개
```

→ [`sol0501_3.m`](../../example/ch05/sol0501_3.m)

![5.1.1-3](img/sol0501_3.png)

---

## 5.1.2 선, 색, 마커 스타일

### 5.1.2-1 LineSpec 문자열만으로

```matlab
plot(x, sin(x), "--rs", x, cos(x), ":k*")
```

![5.1.2-1](img/sol0501_4.png)

`--rs` = 파선(`--`) + 빨강(`r`) + 사각 마커(`s`). `:k*` = 점선(`:`) + 검정(`k`) + 별 마커(`*`). 세 문자의 **순서는 상관없다**. black이 `k`인 점에 주의.

### 5.1.2-2 선마다 다른 굵기

```matlab
plot(x, sin(x), "--rs", LineWidth=3)
hold on
plot(x, cos(x), ":k*",  LineWidth=1)
hold off
```

![5.1.2-2](img/sol0501_5.png)

`plot` 한 번으로는 안 된다. `Name=Value` 속성은 **그 호출로 그려지는 모든 선에 똑같이** 적용되기 때문이다. 선마다 다르게 하려면 `plot`을 나눠 부르고 `hold on`으로 겹쳐야 한다.

### 5.1.2-3 `"b"` / `"bo"` / `"o"`

| 문자열 | 결과 |
|---|---|
| `"b"` | 파란 **실선**, 마커 없음 (선 문자를 안 썼으므로 기본 실선) |
| `"bo"` | 파란 **원 마커만**, 선 없음 |
| `"o"` | 기본색 **원 마커만**, 선 없음 |

```matlab
plot(x, y, "b")      % 파란 실선
plot(x, y, "bo")     % 파란 원 마커만
plot(x, y, "o")      % 기본색 원 마커만
```

→ [`sol0501_6.m`](../../example/ch05/sol0501_6.m)

![5.1.2-3](img/sol0501_6.png)

규칙: 마커 문자를 쓰고 선 문자를 **안 쓰면 선이 사라진다**. 산점도를 만드는 요령이다.

---

## 5.1.3 축 크기 조절과 주석 달기

### 5.1.3-1 감쇠 진동

```matlab
lambda = 0.3;                    % 감쇠상수
x = 0:0.1:10;
y = exp(-lambda*x).*sin(3*x);

plot(x, y, LineWidth=1.5)
axis([0 10 -1 1])
title("감쇠 진동  y = e^{-\lambda x} sin(3x),  \lambda = 0.3")
xlabel("x"), ylabel("진폭 y"), grid on
```

![5.1.3-1](img/sol0501_7.png)

`exp(-lambda*x).*sin(3*x)`의 `.*`가 핵심이다. 두 벡터의 원소별 곱이다. 제목의 `e^{-\lambda x}`는 중괄호로 지수 전체를 묶었고, `\lambda`는 그리스 문자 λ다.

> ⚠️ **함정** — 제목에 그리스 문자를 넣으라는 요구를 채우려고 **그리는 함수에 없는 기호를 끼워 넣으면 안 된다.** 예를 들어 `sin(3x)`를 그려 놓고 제목에 `sin(3\omega x)`라 적으면, 그래프와 설명이 서로 다른 함수를 가리키게 된다. 여기서는 감쇠상수에 λ라는 이름을 실제로 붙여 해결했다.

### 5.1.3-2 초기속도에 따른 사거리

```matlab
g = 9.81;
v = [50 100 150];
theta = 0:0.01:pi/2;

R1 = v(1)^2 ./ g .* sin(2*theta);
R2 = v(2)^2 ./ g .* sin(2*theta);
R3 = v(3)^2 ./ g .* sin(2*theta);

plot(theta, R1, theta, R2, theta, R3, LineWidth=1.2)
legend("v_1 = 50 m/s", "v_2 = 100 m/s", "v_3 = 150 m/s", Location="south")

[Rmax, idx] = max(R3);
text(theta(idx), Rmax, sprintf("  \\leftarrow 최대 %.0f m at \\theta = %.3f rad", Rmax, theta(idx)))
```

![5.1.3-2](img/sol0501_8.png)

최대 사거리는 `sin(2θ) = 1`, 즉 **θ = π/4 ≈ 0.7854 rad (45°)**에서 나온다. `theta`가 0.01 간격의 이산 표본이므로 `max`가 실제로 돌려주는 값은 **0.7900 rad**이다. 이론값과 정확히 같지 않은 것이 정상이다 — `max`는 **표본점 중에서** 가장 큰 것을 고를 뿐이고, π/4는 표본점에 들어 있지 않다.

사거리는 v²에 비례하므로 속도를 3배로 올리면 사거리는 9배가 된다.

`sprintf` 안에서 TeX 명령을 쓸 때는 역슬래시를 **두 번**(`\\theta`) 적어야 한다. `sprintf`가 `\t`를 탭 문자로 해석하기 때문이다.

### 5.1.3-3 `A_max` vs `A_{max}`

```matlab
plot(x, sin(x))
title("A_max 와 A_{max}")
```

→ [`sol0501_9.m`](../../example/ch05/sol0501_9.m)

![5.1.3-3](img/sol0501_9.png)

TeX에서 `_`는 **바로 다음 글자 하나**만 아래 첨자로 만든다.

- `A_max` → `A` 아래에 `m`만 붙고, `ax`는 본문 크기로 따라 나온다.
- `A_{max}` → 중괄호가 `max`를 한 덩어리로 묶어 전체가 아래 첨자가 된다.

위 첨자 `^`도 규칙이 같다. `x^10`은 10이 아니라 1만 위 첨자가 되므로 `x^{10}`으로 써야 한다.

---

## 5.2 Tiled Chart Layouts

### 5.2-1 2×2 격자

```matlab
t = tiledlayout(2, 2);

nexttile, plot(x, sin(x)), title("sin(x)"), xlabel("x, rad"), ylabel("y"), grid on
nexttile, plot(x, cos(x)), title("cos(x)"), xlabel("x, rad"), ylabel("y"), grid on
nexttile, plot(x, tan(x)), ylim([-5 5]), title("tan(x)"), xlabel("x, rad"), ylabel("y"), grid on
nexttile, plot(x, sin(x).*cos(x)), title("sin(x)cos(x)"), xlabel("x, rad"), ylabel("y"), grid on

title(t, "삼각함수 네 가지")
```

![5.2-1](img/sol0502_1.png)

`tan(x)`는 x = π/2, 3π/2에서 발산한다. `ylim([-5 5])`로 자르지 않으면 y축이 ±10¹⁵까지 늘어나 나머지가 전부 평평한 선으로 보인다.

### 5.2-2 flow의 재배치

```matlab
% 그림 3개
t3 = tiledlayout("flow");
nexttile, plot(x, sin(x)), title("sin(x)"), grid on
nexttile, plot(x, cos(x)), title("cos(x)"), grid on
nexttile, plot(x, tan(x)), ylim([-5 5]), title("tan(x)"), grid on
title(t3, "flow, 그림 3개")

% 그림 4개 — 위에 한 줄만 더 붙인다
figure
t4 = tiledlayout("flow");
nexttile, plot(x, sin(x)), title("sin(x)"), grid on
nexttile, plot(x, cos(x)), title("cos(x)"), grid on
nexttile, plot(x, tan(x)), ylim([-5 5]), title("tan(x)"), grid on
nexttile, plot(x, sin(x).*cos(x)), title("sin(x)cos(x)"), grid on
title(t4, "flow, 그림 4개")
```

→ [`sol0502_2.m`](../../example/ch05/sol0502_2.m)

![5.2-2, 그림 3개](img/sol0502_2a.png)
![5.2-2, 그림 4개](img/sol0502_2b.png)

`flow`는 각 tile이 대략 4:3 비율이 되도록 격자 크기를 고른다. 그림이 3개면 **2×2 격자를 만들고 네 번째 칸을 빈 채로 둔다** — 남은 칸에 폭을 나눠 주지는 않는다. 그림이 4개가 되면 그 빈 칸이 채워져 2×2가 꽉 찬다.

즉 `flow`가 해 주는 일은 "**칸 수를 미리 정하지 않아도 되게** 하는 것"이지, 빈 자리를 예쁘게 메워 주는 것이 아니다. 배치를 정확히 통제하고 싶으면 `tiledlayout(m, n)`으로 직접 지정하거나 칸 합치기를 쓴다.

### 5.2-3 3×3에서 위 두 줄 합치기

```matlab
t = tiledlayout(3, 3);

nexttile(1, [2, 3])              % 1번 칸부터 2행 3열
plot(x, sin(x), x, cos(x), LineWidth=1.2)

nexttile, plot(x, sin(2*x)), title("sin(2x)"), grid on
nexttile, plot(x, sin(3*x)), title("sin(3x)"), grid on
nexttile, plot(x, sin(4*x)), title("sin(4x)"), grid on
```

![5.2-3](img/sol0502_3.png)

`nexttile(1, [2, 3])`으로 1번 칸에서 시작해 2행 3열을 차지하게 만들면 위 두 줄이 하나의 축이 된다. 그 뒤의 `nexttile`은 남은 7, 8, 9번 칸을 순서대로 채운다.

---

## 5.3.1 극좌표 그래프

### 5.3.1-1 limaçon

```matlab
theta = 0:pi/360:2*pi;
r = 1 + 2*cos(theta);
polarplot(theta, r, LineWidth=1.2)
```

![5.3.1-1](img/sol0503_1.png)

`r < 0`이 되는 조건은 `cos(θ) < −1/2`, 즉 **θ ∈ (2π/3, 4π/3)**이다. `polarplot`은 음수 `r`을 **반대 방향(θ + π)** 에 찍는다. 그래서 이 구간의 점들이 원점을 지나 맞은편으로 넘어가면서 **안쪽 고리**를 만든다.

일반적으로 `r = a + b·cos(θ)`에서 `|b| > |a|`이면 안쪽 고리가 생기고, `|b| = |a|`이면 카디오이드, `|b| < |a|`이면 고리 없는 볼록한 곡선이 된다.

### 5.3.1-2 장미 곡선의 잎 개수

```matlab
theta = 0:pi/720:2*pi;

t = tiledlayout(1, 2);
nexttile, polarplot(theta, cos(2*theta), LineWidth=1.2), title("r = cos(2\theta)")
nexttile, polarplot(theta, cos(5*theta), LineWidth=1.2), title("r = cos(5\theta)")
title(t, "n 이 짝수면 2n 장, 홀수면 n 장")
```

→ [`sol0503_2.m`](../../example/ch05/sol0503_2.m)

![5.3.1-2](img/sol0503_2.png)

- `r = cos(2θ)` → **잎 4장** (n = 2, 짝수 → 2n)
- `r = cos(5θ)` → **잎 5장** (n = 5, 홀수 → n)

이유: n이 홀수면 θ를 0~2π 도는 동안 후반부가 전반부와 **같은 잎을 덧그린다**. n이 짝수면 음수 `r`이 만드는 잎이 기존 잎 사이 빈 자리에 들어가 겹치지 않는다.

---

## 5.3.2 로그 그래프

### 5.3.2-1 멱함수

```matlab
x = logspace(-1, 3, 100);        % 0.1 ~ 1000
y = 3*x.^1.5;

t = tiledlayout(1, 2);
nexttile, plot(x, y),   title("plot - 선형/선형"),  xlabel("x"), ylabel("y"), grid on
nexttile, loglog(x, y), title("loglog - 로그/로그"), xlabel("x"), ylabel("y"), grid on
title(t, "y = 3x^{1.5}")
```

→ [`sol0503_3.m`](../../example/ch05/sol0503_3.m)

![5.3.2-1](img/sol0503_3.png)

선형 그래프에서는 x = 0.1 ~ 10 구간이 원점 근처에 뭉개져 전혀 보이지 않는다. 네 자릿수(0.1 ~ 1000)에 걸친 데이터이므로 **loglog가 읽기 쉽다**.

덤으로, loglog에서 직선의 기울기를 재면 2.0이 아니라 **1.5** — 정확히 지수와 같다.

```matlab
n = (log10(y(end)) - log10(y(1))) / (log10(x(end)) - log10(x(1)));
% n = 1.5000
```

### 5.3.2-2 지수함수

```matlab
x = 0:0.5:10;
y = 2*exp(0.8*x);

t = tiledlayout(1, 2);
nexttile, plot(x, y),     title("plot - 선형/선형"),   xlabel("x"), ylabel("y"), grid on
nexttile, semilogy(x, y), title("semilogy - 선형/로그"), xlabel("x"), ylabel("y"), grid on
title(t, "y = 2e^{0.8x}")
```

→ [`sol0503_4.m`](../../example/ch05/sol0503_4.m)

![5.3.2-2](img/sol0503_4.png)

`y = 2e^{0.8x}` 양변에 상용로그를 취하면

```
log₁₀(y) = log₁₀(2) + 0.8x·log₁₀(e)
```

세로축이 `log₁₀(y)`, 가로축이 `x`이므로 **기울기 0.8·log₁₀(e) ≈ 0.3474인 직선**이다. 실행하면 측정 기울기가 이 값과 일치한다.

정리하면,

| 그래프에서 직선이면 | 관계식 | 기울기의 뜻 |
|---|---|---|
| `loglog` | `y = a·xⁿ` (멱함수) | 지수 n |
| `semilogy` | `y = a·10^{bx}` (지수함수) | b |
| `plot` | `y = ax + b` (일차함수) | a |

측정 데이터를 세 방식으로 그려 보고 어느 쪽이 직선인지 보는 것이, 관계식을 추측하는 표준적인 방법이다.

---

## 5.3.3 막대 그래프와 파이 차트

### 1. 학점 분포를 막대 그래프와 파이 차트로

코드: [`sol0533_1.m`](../../example/ch05/sol0533_1.m)

```matlab
grades = ["A", "B", "C", "D", "E"];
counts = [4, 7, 9, 3, 1];

t = tiledlayout(1,2);
title(t, "Grade Distribution")

nexttile
bar(counts)
xticklabels(grades)         % 막대 아래 눈금 이름 바꾸기
xlabel("Grade"); ylabel("Number of Students")
title("Bar Graph")

nexttile
pie(counts, grades)         % 두 번째 입력이 조각 레이블
title("Pie Chart")
```

`bar`의 x축은 인덱스(1~5)이므로 `xticklabels`로 이름을 붙인다.
`pie`는 두 번째 입력으로 레이블 배열을 바로 받는다.

### 2. 월별 강수량을 가로 막대로

코드: [`sol0533_2.m`](../../example/ch05/sol0533_2.m)

```matlab
months = ["Jan","Feb","Mar","Apr","May","Jun"];
rain   = [32, 45, 61, 88, 120, 210];

barh(rain)
yticklabels(months)         % 가로 막대이므로 y축 눈금
xlabel("Rainfall, mm"); ylabel("Month")
title("Monthly Rainfall")
grid on
```

가로 막대에서는 값이 **x축**, 항목이 **y축**이다. 라벨을 붙일 축이 바뀐다는 점이 요점이다.

---

## 5.3.4 히스토그램

### 1. 난수 1000개의 확률 히스토그램

코드: [`sol0534_1.m`](../../example/ch05/sol0534_1.m)

```matlab
rng(0)                      % 재현 가능한 난수
data = randn(1, 1000);

histogram(data, 20, Normalization="probability")
xlabel("Value"); ylabel("Probability")
title("1000 Normally Distributed Random Numbers")

sum(histcounts(data, 20, Normalization="probability"))   % 1.000
```

`"probability"`는 각 bin의 개수를 전체 개수로 나누므로 모든 막대 높이의 합이 1이다.
(면적이 1이 되는 것은 `"pdf"`다. bin 폭이 1이 아니면 둘은 다르다.)

### 2. `histcounts`로 학점별 인원 표 만들기

코드: [`sol0534_2.m`](../../example/ch05/sol0534_2.m)

```matlab
scores = [100,95,74,87,22,78,34,82,93,88,86,69,55,72];
edges  = [0, 60, 70, 80, 90, 100];
labels = ["E","D","C","B","A"];     % 경계 6개 -> 구간 5개

n = histcounts(scores, edges);      % n = [3 1 3 4 3]

for k = 1 : numel(n)
    fprintf("%s (%3d ~ %3d) : %d명\n", labels(k), edges(k), edges(k+1), n(k));
end
fprintf("합계 : %d명\n", sum(n));
```

출력은 `E 3명, D 1명, C 3명, B 4명, A 3명`, 합계 14명이다.
100점이 A에 포함되는 이유는 **마지막 bin만 오른쪽 경계를 포함**하기 때문이다.

---

## 5.3.5 y축이 두 개인 그래프

### 1. `sin(x)`와 `x^3`

코드: [`sol0535_1.m`](../../example/ch05/sol0535_1.m)

```matlab
x = linspace(0, 10, 100);

yyaxis left
plot(x, sin(x));  ylabel("sin(x)")

yyaxis right
plot(x, x.^3);    ylabel("x^3")

xlabel("x"); title("Two Scales on One Figure"); grid on
```

한 축에 그리면 `sin(x)`는 최대 1이고 `x^3`은 1000까지 가므로 사인 곡선이 직선처럼 눌린다.

### 2. 반응기 온도와 압력

코드: [`sol0535_2.m`](../../example/ch05/sol0535_2.m)

```matlab
time        = 0 : 2 : 20;
temperature = 20 + 3*time;
pressure    = 101 + 0.8*time.^2;

yyaxis left
plot(time, temperature, "-o");  ylabel("Temperature, ^oC")
yyaxis right
plot(time, pressure, "-s");     ylabel("Pressure, kPa")

xlabel("Time, minutes"); title("Reactor Conditions")
legend("Temperature", "Pressure", Location="northwest")
```

legend 순서는 **왼쪽 축 계열 → 오른쪽 축 계열**이다.
`^oC`처럼 위 첨자는 TeX 표기 `^`로 쓴다.

---

## 5.3.6 함수 플롯

### 1. 감쇠 진동

코드: [`sol0536_1.m`](../../example/ch05/sol0536_1.m)

```matlab
fplot(@(x) exp(-x/3) .* sin(3*x), [0, 10])
xlabel("x"); ylabel("f(x)"); title("Damped Oscillation"); grid on
```

`exp(-x/3)`과 `sin(3*x)`를 곱할 때 `.*`를 쓰는 것이 핵심이다.
`fplot`이 x를 배열로 넘기기 때문에 `*`를 쓰면 오류가 난다.

### 2. 함수 핸들과 근 확인

코드: [`sol0536_2.m`](../../example/ch05/sol0536_2.m)

```matlab
g = @(x) x.^2 - 3*x + 2;    % function_handle

fplot(g, [-1, 4])
yline(0, "--")
xlabel("x"); ylabel("g(x)"); title("g(x) = x^2 - 3x + 2"); grid on

g(1)    % 0
g(2)    % 0
```

함수 핸들은 변수처럼 다룰 수 있어서 `g(1)`처럼 값을 구할 수도 있고,
`fplot(g, ...)`처럼 다른 함수에 넘길 수도 있다.

---

## 5.4.1 3차원 선 그래프

### 1. 나선

코드: [`sol0541_1.m`](../../example/ch05/sol0541_1.m)

```matlab
t = linspace(0, 6*pi, 500);
plot3(cos(t), sin(t), t)
grid on
xlabel("x"); ylabel("y"); zlabel("z = t"); title("Helix")
```

x, y는 원을 그리고 z가 계속 증가하므로 용수철 모양이 된다.
`t`를 촘촘히(500점) 잡아야 곡선이 각지지 않는다.

### 2. 리사주 곡선과 시점

코드: [`sol0541_2.m`](../../example/ch05/sol0541_2.m)

```matlab
t = linspace(0, 2*pi, 400);
x = sin(3*t); y = sin(4*t); z = sin(5*t);

nexttile, plot3(x,y,z), grid on, title("기본 시점")
nexttile, plot3(x,y,z), grid on, view(0, 90), title("view(0,90) - 위에서")
```

`view(az, el)`의 첫 인자는 방위각, 둘째는 고도각이다. `view(0,90)`은 z축 방향에서 내려다본
모습이라 xy 평면의 리사주 곡선이 보인다.

---

## 5.4.2 곡면 그래프

### 1. 멕시코 모자

코드: [`sol0542_1.m`](../../example/ch05/sol0542_1.m)

```matlab
[X, Y] = meshgrid(-8 : 0.5 : 8);    % 벡터 하나 -> meshgrid(x,x)
R = sqrt(X.^2 + Y.^2) + eps;        % 원점에서 R = 0 이므로 eps를 더한다
Z = sin(R) ./ R;

surf(X, Y, Z)
shading interp
colorbar
xlabel("x"); ylabel("y"); zlabel("z"); title("Sombrero: z = sin(r)/r")
```

`eps`(약 2.2e-16)를 더하는 이유는 원점에서 `0/0 = NaN`이 되는 것을 막기 위해서다.
`NaN`이 있으면 그 자리에 구멍이 뚫린 곡면이 그려진다.

### 2. 입력 1개와 3개의 축 차이

코드: [`sol0542_2.m`](../../example/ch05/sol0542_2.m)

```matlab
z = magic(6);
x = linspace(0, 100, 6);    % size(z,2) = 6
y = linspace(10, 60, 6);    % size(z,1) = 6

nexttile, mesh(z),          title("mesh(z)")
nexttile, mesh(x, y, z),    title("mesh(x,y,z)")
```

곡면의 **모양은 같고 축 눈금만** 달라진다. 왼쪽은 1~6(인덱스), 오른쪽은 0~100과 10~60이다.
`magic(6)`이 정사각 행렬이라 x와 y를 바꿔 넣어도 오류가 나지 않는다 — 오히려 그래서 위험하다.

---

## 5.4.3 등고선과 의사 색상 그래프

### 1. 값이 표시된 등고선

코드: [`sol0543_1.m`](../../example/ch05/sol0543_1.m)

```matlab
[x, y, z] = peaks;

contour(x, y, z, 20, ShowText=true)
xlabel("x"); ylabel("y"); title("Labeled Contour Plot of peaks")
colorbar
```

`ShowText=true`가 `clabel`을 대신한다. 세 번째 인자 `20`은 등고선 개수다.

### 2. `pcolor`와 `contourf` 비교

코드: [`sol0543_2.m`](../../example/ch05/sol0543_2.m)

```matlab
[x, y, z] = peaks;

nexttile, pcolor(x,y,z), shading interp, colorbar, title("pcolor + shading interp")
nexttile, contourf(x,y,z,20,"k"), colorbar, title("contourf(...,20,""k"")")
```

`pcolor`는 값이 연속적으로 변하는 인상을, `contourf`는 층(level)으로 끊어 읽는 인상을 준다.
문자열 안에서 큰따옴표를 쓰려면 `""`처럼 두 번 쓴다.

---

## 5.5 플롯 편집

### 1. 코드로 구 그리기

코드: [`sol0550_1.m`](../../example/ch05/sol0550_1.m)

```matlab
[X, Y, Z] = sphere(40);

surf(X, Y, Z)
shading interp
axis equal              % Property Inspector의 Data Aspect Ratio = manual 과 같은 일
colorbar
xlabel("x"); ylabel("y"); zlabel("z"); title("Unit Sphere")
```

메뉴로 하던 편집을 모두 코드로 옮겼기 때문에 스크립트를 다시 실행해도 같은 그림이 나온다.

### 2. 원기둥과 `axis equal`

코드: [`sol0550_2.m`](../../example/ch05/sol0550_2.m)

```matlab
[X, Y, Z] = cylinder(1, 40);

nexttile, surf(X,Y,Z),             title("axis equal 없음")
nexttile, surf(X,Y,Z), axis equal, title("axis equal 적용")
```

`cylinder`의 기본 높이는 0~1이다. `axis equal`을 적용하면 반지름 1, 높이 1의 비율이 실제대로 보인다.

---

## 5.6 Workspace 창에서 플롯 만들기

### 1. 제안 목록을 코드로 재현

코드: [`sol0560_1.m`](../../example/ch05/sol0560_1.m)

```matlab
load seamount

nexttile, plot(x, y, ".")                       % 측정 위치
nexttile, scatter(x, y, 12, z, "filled")        % 색 = 수심
nexttile, stem3(x, y, z, "Marker", "none")      % 수심을 막대로
```

PLOTS 탭에서 `x`, `y`, `z`를 고르면 제안되는 것들이다.
`scatter`의 세 번째 인자는 마커 크기, 네 번째 인자는 색으로 쓸 값이다.

### 2. 시점 바꾸기

코드: [`sol0560_2.m`](../../example/ch05/sol0560_2.m)

```matlab
load seamount

nexttile, scatter3(x, y, z, 12, z, "filled")            % 기본 시점
nexttile, scatter3(x, y, z, 12, z, "filled"), view(2)   % 위에서
colorbar
```

`view(2)`로 보면 3차원 산점도가 색으로 수심을 나타내는 2차원 지도처럼 보인다.

---

## 5.7 플롯 저장하기

### 1. `.fig`로 저장하고 다시 열어 편집

코드: [`sol0570_1.m`](../../example/ch05/sol0570_1.m)

```matlab
x = linspace(0, 4*pi, 200);
plot(x, sin(x) .* exp(-x/8))
title("Original Title")

outDir = tempname; mkdir(outDir);
figFile = fullfile(outDir, "work.fig");
savefig(figFile)
close all

f  = openfig(figFile);                      % 그림이 그대로 살아난다
ax = findobj(f, "Type", "axes");
title(ax, "Edited After Reopening")         % 다시 편집 가능
exportgraphics(f, fullfile(outDir, "work.png"))
```

`.fig`는 데이터와 축 속성을 모두 담고 있어 다시 열어 편집할 수 있다.
`.png`로만 저장했다면 제목을 고칠 수 없다.

### 2. 해상도 비교

코드: [`sol0570_2.m`](../../example/ch05/sol0570_2.m)

```matlab
exportgraphics(gcf, lowFile)                    % 기본 (150 dpi)
exportgraphics(gcf, highFile, Resolution=300)   % 300 dpi
```

해상도를 올리면 픽셀 수가 늘어 파일이 몇 배 커진다.
인쇄물에는 300 dpi, 화면용에는 기본값으로 충분하다.

---

## 5.8 그 밖의 플롯들

### 1. `stem`과 `stairs`

코드: [`sol0580_1.m`](../../example/ch05/sol0580_1.m)

```matlab
n = 0 : 15;
y = 0.8.^n;

nexttile, stem(n, y, "filled"), title("stem")
nexttile, stairs(n, y),         title("stairs")
```

`stem`은 값이 **점으로만** 존재한다는 뜻(이산 신호), `stairs`는 다음 값까지 **유지된다**는 뜻이다.
같은 데이터라도 물리적 해석이 다르다.

### 2. `bubblechart`와 `imagesc`

코드: [`sol0580_2.m`](../../example/ch05/sol0580_2.m)

```matlab
nexttile, bubblechart(x, y, sz)     % 세 번째 변수를 버블 크기로
nexttile, imagesc(magic(8)), colorbar, axis equal tight
```

`bubblechart`는 변수 세 개(x, y, 크기)를 2차원에 담는다.
`imagesc`는 행렬 값을 색으로 바꿔 보여 주며, `image`와 달리 값 범위를 colormap 전체로 늘려 준다.
