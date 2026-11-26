# Chapter 13 — Numerical Techniques

원서: Holly Moore, *MATLAB for Engineers* 6th ed., Chapter 13 (`Chapter 13_1.pdf` 43쪽 + `Chapter 13_2.pdf` 54쪽).

> 슬라이드 본문의 절 번호(13.1~13.6)를 따랐다. 13_1은 13.1~13.3, 13_2는 13.4~13.6을 다룬다. 슬라이드 화면은 **R2022a**다.

> **[보강]** **이 장을 읽기 전에.** 사용자 요청에 따라 이 장은 MATLAB R2026a **실행 검증을 하지 않았다.** 코드 출력은 슬라이드 화면을 옮긴 것이거나 손계산·SciPy로 구한 값이다. 자세한 내용은 맨 아래 [실행 환경 메모](#실행-환경-메모)에 있다.

> ⛔ **기말 시험 범위**: 13_1 전체 + 13_2 PDF 33쪽(13.6.2 연립 ODE)까지. 13.6.3 고계 ODE, 13.6.4 BVP, 13.6.5 PDE는 범위 밖이며 본문에 `⛔ 시험 범위 밖` 구분선으로 표시했다.

## 이 장이 다루는 것

**데이터**(숫자 표)나 **함수**를 가지고 수치적으로 하는 다섯 가지 일이다.

| 하고 싶은 일 | 가진 것이 데이터일 때 | 가진 것이 함수일 때 |
|---|---|---|
| 측정점 **사이**의 값 추정 | `interp1`, `interp2` (13.1) | — |
| 데이터를 **식으로** 모델링 | `polyfit`, `polyval`, `\` (13.2), Basic Fitting (13.3) | — |
| **미분** | `diff`, `gradient` (13.4) | symbolic `diff` (Chapter 12) |
| **적분** | `trapz` (13.5) | `integral`, `integral2`, `integral3` (13.5) |
| **미분방정식** | — | `ode45` 등 (13.6), ⛔ `bvp4c` (13.6.4), `pdepe` (13.6.5)는 범위 밖 |

> **[보강]** Chapter 12(symbolic)와의 관계: Chapter 12는 **식**을 넣어 **식**을 얻는다(`diff`, `int`, `dsolve`). 이 장은 **숫자**를 넣어 **숫자**를 얻는다. 같은 이름 `diff`가 입력에 따라 "미분"과 "이웃 원소의 차이"로 다르게 동작한다.

## 목차

| 절 | 제목 | 내용 |
|---|---|---|
| [13.1](13.1-interpolation.md) | Interpolation | 13.1.1 linear(`interp1`), 13.1.2 cubic spline, 13.1.3 extrapolation, 13.1.4 multidimensional(`interp2`, `interp3`, `interpn`) |
| [13.2](13.2-curve-fitting.md) | Curve Fitting | empirical equation, residual, 13.2.1 linear regression(`polyfit`), 13.2.2 원점 통과(`\`), 13.2.3 polynomial regression, 13.2.4 `polyval` |
| [13.3](13.3-interactive-fitting-tools.md) | Using the Interactive Fitting Tools | 13.3.1 Basic Fitting(Tools 메뉴), display options, Data Statistics, 13.3.2 Curve Fitting Toolbox |
| [13.4](13.4-numerical-differentiation.md) | Differences and Numerical Differentiation | `diff`로 기울기, bar graph, 13.4.2 forward·backward·central difference, `gradient` |
| [13.5](13.5-numerical-integration.md) | Numerical Integration | quadrature, trapezoid rule(`trapz`), `integral`, `integral2`, `integral3` |
| [13.6](13.6-solving-odes.md) | Solving Differential Equations Numerically | solver 표, `ode45` 세 입력, 13.6.1 function handle 입력·연립, ⛔ 13.6.3 고계 ODE(2계, 5계)는 범위 밖 |
| ⛔ [13.6.4](13.6.4-boundary-value-problems.md) | (범위 밖) Boundary Value Problems, 13.6.5 Partial Differential Equations | `bvp4c` 세 입력, residual 함수, `bvpinit`, 결과 structure, `pdepe` |
| [solutions](solutions.md) | 연습문제 해답 | 절별 2~3문제 |

> **[보강]** 슬라이드에는 13.4.1과 13.6.2라는 번호가 나오지 않는다(13.4 → 13.4.2, 13.6.1 → 13.6.3). `diff` 함수 부분과 Systems of Equations 부분이 각각 그 자리에 해당하는 내용이다.

## 함수 색인표

| 함수 | 한 줄 설명 | 절 |
|---|---|---|
| `interp1(x,y,xq)` | 1차원 보간. 기본 linear. 범위 밖은 NaN | [13.1.1](13.1-interpolation.md#1311-linear-interpolation) |
| `interp1(x,y,xq,"linear")` | 방식을 linear로 명시 | [13.1.1](13.1-interpolation.md#1311-linear-interpolation) |
| `interp1(x,y,xq,"spline")` | cubic spline 보간. 점 4개 이상 | [13.1.2](13.1-interpolation.md#1312-cubic-spline-interpolation) |
| `interp1(x,y,xq,method,'extrap')` | 범위 밖으로 외삽 | [13.1.3](13.1-interpolation.md#1313-extrapolation) |
| `interp2(x,y,z,xq,yq)` | 2차원 보간. x는 z의 열, y는 z의 행 | [13.1.4](13.1-interpolation.md#1314-multidimensional-interpolation) |
| `interp3` | 3차원 보간 | [13.1.4](13.1-interpolation.md#higher-dimensions) |
| `interpn` | n차원 보간 | [13.1.4](13.1-interpolation.md#higher-dimensions) |
| `polyfit(x,y,n)` | n차 다항식 최소제곱 적합. 계수 n+1개, 높은 차수부터 | [13.2.1](13.2-curve-fitting.md#the-polyfit-function) |
| `x'\y'` | 원점을 지나는 직선의 기울기(최소제곱). 열벡터로 | [13.2.2](13.2-curve-fitting.md#1322-linear-regression-through-zero) |
| `polyval(a,x)` | 계수 a인 다항식의 x에서의 값 | [13.2.4](13.2-curve-fitting.md#1324-the-polyval-function) |
| Tools → Basic Fitting | figure 메뉴의 대화형 적합 도구 | [13.3.1](13.3-interactive-fitting-tools.md#1331-basic-fitting-tools) |
| Tools → Data Statistics | figure 데이터의 min, max, mean, median, mode, std, range | [13.3.1](13.3-interactive-fitting-tools.md#data-statistics) |
| Curve Fitting Toolbox | 다항식 이외의 곡선 적합 앱(별도 제품) | [13.3.2](13.3-interactive-fitting-tools.md#1332-curve-fitting-toolbox) |
| `diff(x)` | 이웃 원소의 차이. 결과는 원소가 하나 적다 | [13.4](13.4-numerical-differentiation.md#the-diff-function) |
| `diff(y)./diff(x)` | 구간별 기울기(forward/backward difference) | [13.4.2](13.4-numerical-differentiation.md#1342-forward-backward-and-central-difference-techniques) |
| `bar(x,y)` | 막대그래프(구간별 변화율 표시) | [13.4](13.4-numerical-differentiation.md#bar-graphs) |
| `gradient(y,x)` | 양 끝 forward/backward, 안쪽 central. **y가 먼저.** 길이 유지 | [13.4.2](13.4-numerical-differentiation.md#the-gradient-function) |
| `trapz(x,y)` | trapezoid rule로 데이터 적분. **x가 먼저** | [13.5](13.5-numerical-integration.md#the-trapezoid-rule) |
| `integral(f,a,b)` | function handle의 수치 적분 | [13.5](13.5-numerical-integration.md#the-integral-function) |
| `integral2`, `integral3` | 이중·삼중 적분 | [13.5](13.5-numerical-integration.md#double-and-triple-integrals) |
| `ode45(f,tspan,y0)` | nonstiff ODE 초깃값 문제(Runge-Kutta). 첫 시도용 | [13.6](13.6-solving-odes.md#ode-solvers) |
| `ode23` | nonstiff, Runge-Kutta. 첫 시도용 | [13.6](13.6-solving-odes.md#matlab-ode-solvers) |
| `ode78`, `ode89`, `ode113` | nonstiff | [13.6](13.6-solving-odes.md#matlab-ode-solvers) |
| `ode15s`, `ode23s`, `ode23tb` | stiff | [13.6](13.6-solving-odes.md#matlab-ode-solvers) |
| `ode23t` | moderately stiff | [13.6](13.6-solving-odes.md#matlab-ode-solvers) |
| `ode15i` | fully implicit | [13.6](13.6-solving-odes.md#matlab-ode-solvers) |
| `@name` | 이름 있는 함수에 대한 function handle | [13.6.1](13.6-solving-odes.md#1361-function-handle-input) |
| `bvp4c(odefun,bcfun,guess)` | ⛔ 범위 밖. 경계값 문제. 결과는 structure(`x`, `y`, `yp`, `stats`) | [13.6.4](13.6.4-boundary-value-problems.md#the-bvp4c-function-input) |
| `bvpinit(mesh,yinit)` | ⛔ 범위 밖. `bvp4c`의 초기 추정 structure(`x`, `y`, `yinit`) | [13.6.4](13.6.4-boundary-value-problems.md#bvpinit) |
| `pdepe` | ⛔ 범위 밖. 제한적인 PDE solver | [13.6.5](13.6.4-boundary-value-problems.md#1365-partial-differential-equations) |
| `doc pdepe` | ⛔ 범위 밖. 도움말 문서 열기 | [13.6.5](13.6.4-boundary-value-problems.md#1365-partial-differential-equations) |

### `[보강]`에서 추가로 쓴 함수

| 함수 | 한 줄 설명 | 절 |
|---|---|---|
| `interp1(…,"pchip")`, `"nearest"`, `"makima"` | 다른 보간 방식 | [13.1.2](13.1-interpolation.md#1312-cubic-spline-interpolation) |
| `cumtrapz(x,y)` | 누적 사다리꼴 적분 | [13.5](13.5-numerical-integration.md#the-trapezoid-rule) |
| `ode`, `solve` | R2023b 이후의 ODE 객체 구문 | [13.6](13.6-solving-odes.md#the-function-can-also-be-stored-as-an-anonymous-function) |

## 입력 순서 한눈에 보기

> **[보강]** 이 장의 가장 흔한 실수는 **입력 순서**다.
>
> | 함수 | 순서 | 결과 길이 (입력 n개) |
> |---|---|---|
> | `interp1(x, y, 새x)` | x 먼저 | 새x의 길이 |
> | `interp2(x, y, z, 새x, 새y)` | x(열), y(행), z | 새 점의 개수 |
> | `polyfit(x, y, 차수)` | x 먼저 | 차수 + 1 |
> | `polyval(계수, x)` | **계수 먼저** | x의 길이 |
> | `diff(y)` | — | **n − 1** |
> | `gradient(y, x)` | **y 먼저** | n |
> | `trapz(x, y)` | x 먼저 | 1 (스칼라) |
> | `integral(f, a, b)` | handle, 아래끝, 위끝 | 1 |
> | `ode45(f, tspan, y0)` | handle `@(t,y)`, 구간, 초기 조건 | `[t,y]` 열 방향 |
> | `bvp4c(odefun, bcfun, guess)` | ⛔ 범위 밖. ODE, 경계 조건, 추정 | structure |

## 슬라이드의 오탈자

> **[보강]** 슬라이드에서 발견한 표기 문제. 본문에는 고친 형태로 적고 해당 위치에 표시했다.
>
> | 위치 | 슬라이드 | 바른 표기 |
> |---|---|---|
> | 13.2.1 The polyfit function | `y = −2.914x + 14.2857` | 화면 출력은 `-2.9143` |
> | 13.2.3 Second Order Polynomial Fit | `y = 0.0536x² − 3.1821 + 14.4643` | `− 3.1821x` (x 누락) |
> | 13.5 Numerical Integration | "implemented with the trap function" | `trapz` |
> | 13.6.3 | ⛔ 범위 밖. 함수 이름 `fiveth_order` | 철자는 fifth지만 함수 이름이므로 그대로 둠 |
> | 절 번호 | 13.4.1, 13.6.2 없음 | — |

## 실행 환경 메모

> **[보강]** 사용자 요청("textbook 생성, 검증은 필요 없음")에 따라 이 장은 `textbook/ch13/`의 md만 만들었다.
>
> - **`example/ch13/*.m` 파일이 없다.** 코드는 md에 인라인으로만 있다.
> - **`img/` PNG가 없다.** 플롯 예제를 실행하지 않았으므로 그림은 텍스트 설명으로 대신했다.
> - **R2026a에서 실행하지 않았다.** 따라서 "R2026a에서 … 로 변경" 류의 실측 차이는 이 장에 없다.
>
> 숫자의 출처는 세 가지다.
>
> - **슬라이드(R2022a) 화면에 찍힌 출력**: 그대로 옮겼다. 설명 상자에 가려진 값(spline 표의 5열)만 계산으로 채웠다.
> - **손계산**: linear interpolation, trapezoid rule, forward/backward/central difference, Σxy/Σx² 등은 풀이 과정을 적었다.
> - **NumPy/SciPy 계산**: spline·pchip 값, `polyfit` 계수와 잔차 제곱합, `integral` 값, ODE·BVP의 수치해. 슬라이드에 찍힌 값(`3.9417`, `3.0667`, `46.2500`, `-2.9143 14.2857`, `1.8571 3.2381`, `1.9455`, `0.0536 -3.1821 14.4643`, Basic Fitting의 계수, forward difference 표의 0.50692 등)과 같은 계산이 전부 일치하는 것을 확인했다.
>
> **MATLAB과 다를 수 있는 곳**: `ode45`/`bvp4c` 결과의 마지막 자리(허용 오차), 오류 메시지의 문구, `[보강]`으로 적은 최신 구문(`ode` 객체, `integral(…,RelTol=…)`)의 세부 동작. 나중에 실행해 보고 다르면 해당 `[보강]`을 고친다.
