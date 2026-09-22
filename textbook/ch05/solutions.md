# Chapter 5 (2/2) 연습문제 해답

[← 목차](README.md)

> **[보강]** 이 문서의 문제와 해답은 전부 슬라이드 밖에서 추가한 것이다.

각 해답의 실행 코드는 `example/ch05/solXXYY_N.m`에 있다. 모두 R2026a에서 오류 없이 실행된다.

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
