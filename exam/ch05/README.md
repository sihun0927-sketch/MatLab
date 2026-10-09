# exam/ch05 — Plotting

원본: `Chapter 05_1.pdf`(73쪽) + `Chapter 05_2.pdf`(69쪽). 개념 정리는 [`textbook/ch05/`](../../textbook/ch05/README.md).
출제 규칙과 출력 규칙은 [`exam/README.md`](../README.md)를 따른다.

- [문제지](questions.md) — 44문제
- [해답](answers.md)

## 출제 범위 요약

플롯 장이라 Command Window에 찍히는 것이 적다. 그래서 `[출력]` 문제는 그림을 그리기 **전후의 데이터**(`x`, `y`의 값과 크기, `histcounts`, `meshgrid`, 함수 핸들 표시, `axis`·`size`의 반환값)를 묻고, 그림 자체는 "선이 몇 개인가", "축 범위가 어떻게 되는가" 같은 하위 문항으로 묻는다.

| 절 | 다루는 것 | 문제 | 수 |
|---|---|---|---|
| 5.1 | `plot`, `area`, `figure`/`clf`, `hold`, 여러 선, column dominant, LineSpec, `Name=Value`, `axis`, `legend`, `text`, TeX, Example 5.2 | Q05-01 ~ Q05-14 | 14 |
| 5.2 | `tiledlayout`, `nexttile`, `"flow"`, 칸 합치기, 레이아웃 제목 | Q05-15 ~ Q05-19 | 5 |
| 5.3.1–5.3.2 | `polarplot`, `semilogx`, `semilogy`, `loglog` | Q05-20 ~ Q05-22 | 3 |
| 5.3.3–5.3.4 | `bar`, `pie`, `histogram`, `histcounts`, edge, countdensity | Q05-23 ~ Q05-28 | 6 |
| 5.3.5–5.3.6 | `yyaxis`, `fplot`, 함수 핸들 | Q05-29 ~ Q05-33 | 5 |
| 5.4 | `plot3`, `comet3`, `mesh`, `surf`, `meshgrid`, `shading`, `colormap`, `contour`, `pcolor`, `peaks` | Q05-34 ~ Q05-41 | 8 |
| 5.5–5.8 | `sphere`, `axis equal`, `load seamount`, PLOTS 탭, 그림 저장 | Q05-42 ~ Q05-44 | 3 |

> 5.3과 5.4, 5.5~5.8은 소절마다 코드 예제가 한두 개라서 소절을 묶어 절 헤더 하나로 출제했다. 묶은 단위마다 3문제 이상이다.

유형별 문제 수: `[출력]` 22, `[코드]` 5 (합 27 / 44), `[오류]` 6, `[변형]` 2, `[빈칸]` 3, `[단답]` 6.

## 원본 예제 색인

쪽수 뒤에 `(2)`가 붙은 것은 `Chapter 05_2.pdf`, 없는 것은 `Chapter 05_1.pdf`의 쪽이다.

| 슬라이드 쪽 | 원본 코드 요지 | 절 | 변형 문제 |
| --- | --- | --- | --- |
| p.6–7 | `x = [0:2:18]; y = [0 0.33 4.13 … 18.17]; plot(x,y)` | 5.1.1 | Q05-01, Q05-02 |
| p.8–10 | `area(x,y)` — 새 그림이 기존 그림을 대체 | 5.1.1 | Q05-04 |
| p.12 | `title("Laboratory Experiment 1")`, `xlabel("Time, sec")`, `ylabel("Distance, ft")` | 5.1.1 | Q05-03 |
| p.13–14 | `grid on`, `grid minor` | 5.1.1 | Q05-03 |
| p.16 | `figure(2)` | 5.1.1 | Q05-04 |
| p.17 | `x = 0:pi/100:2*pi; y1 = cos(x*4); plot(x,y1); figure; y2 = sin(x); plot(x,y2)` | 5.1.1 | Q05-04 |
| p.18 | live script: `plot(x,y); title("My First Example Plot"); plot(x,y2); title(…)` | 5.1.1 | Q05-05 |
| p.20–21 | `clf` — 활성 figure만 지움 | 5.1.1 | Q05-04 |
| p.22 | `close all` | 5.1.1 | Q05-04 |
| p.23–24 | `plot(x,y1); hold on; y2 = sin(x); plot(x,y2); hold off` | 5.1.1 | Q05-05 |
| p.25–26 | `plot(x, y1, x, y2)`, `title("My Example")`, `xlabel("time, seconds")` | 5.1.1 | Q05-06 |
| p.27–28 | `Y = [y1;y2]; plot(x,Y)` — 제목·축 이름이 덮어써짐 | 5.1.1 | Q05-05, Q05-06 |
| p.29–31 | `x1 = x; x2 = 2*x; X = [x1;x2]; plot(X,Y)` → 선 201개 | 5.1.1 | Q05-06 |
| p.32 | `plot(X',Y')` | 5.1.1 | Q05-06 |
| p.33 | `x1 = sin(x); plot(x1)`, `xlabel("Vector Index Number")` | 5.1.1 | Q05-07 |
| p.35 | `help plot` — 색·마커·선 기호 표, `plot(X,Y,'c+:')`, `plot(X,Y,'bd')` | 5.1.2 | Q05-08 |
| p.36 | `x = 1:10; y = [58.5 63.8 …]; plot(x,y,":ok")`, `plot(x,y,":oblack")` | 5.1.2 | Q05-08, Q05-09, Q05-14 |
| p.37 | `plot(x,y,":ok",x,y*2,"--xr",x,y/2,"-b")` | 5.1.2 | Q05-09 |
| p.39–40 | `plot(x,y,"LineWidth",2,"Marker","o","MarkerSize",10)` | 5.1.2 | Q05-10 |
| p.41–43 | `plot(x,y,LineWidth = 2,Marker = "o",MarkerSize = 10)`, `hold on`, `plot(x,y*2,LineWidth=1,Marker="h",…)`, `hold off` | 5.1.2 | Q05-10 |
| p.46 | `legend("line 1","line 2","line 3")`, `text(1,100,"Label plots with the text command")` | 5.1.3 | Q05-14 |
| p.47 | `axis([0,11,0,300])`, `title("Example Graph for Chapter 5")` | 5.1.3 | Q05-11 |
| p.48 | `title("\alpha \beta \gamma")` | 5.1.3 | Q05-12 |
| p.50–51 | Example 5.2 `theta = 0:0.05:pi/2; R1 = v^2./g1.*sin(2*theta)`, `xlabel("… \theta")`, `legend("g_1=9.8 m/s^2",…)` | 5.1.3 | Q05-12, Q05-13 |
| p.54–55 | `x = 0:pi/20:2*pi; tiledlayout(2,1); nexttile; plot(x,sin(x)); … grid minor` | 5.2 | Q05-15 |
| p.56 | `tiledlayout("flow")` | 5.2 | Q05-16 |
| p.57–59 | `t = tiledlayout(2,1);`, `title(t,"My Example Tiled Chart")` | 5.2 | Q05-16 |
| p.60–62 | `tile_name = tiledlayout(2,2); … nexttile(3,[1,2]); plot(x,2+3*x-8*x.^2+1.5*x.^3); title(tile_name,[…])` | 5.2 | Q05-16, Q05-17 |
| p.64–65 | `theta = 0:pi/100:pi; radius = sin(theta); polarplot(theta,radius)` | 5.3.1 | Q05-20 |
| p.67–68 | `t = tiledlayout("flow"); x = 0:0.5:50; y = 5*x.^2; … semilogx(x,y)` | 5.3.2 | Q05-21, Q05-22 |
| p.69–70 | `semilogy(x,y)`, `loglog(x,y)` | 5.3.2 | Q05-22 |
| p.71 | `m = ["A Polynomial Plotted"; "Using Multiple Graphing Strategies"]; title(t,m)` | 5.2 | Q05-18, Q05-19 |
| p.2–3 (2) | `x = [1,2,5,4,8]; y = [x;1:5]; bar(x), bar(y), bar3(y), pie(x)`, `title(t,…)` | 5.3.3 | Q05-23, Q05-24 |
| p.5–6 (2) | `x = [100,95,74,…,72]; histogram(x)` | 5.3.4 | Q05-25, Q05-27 |
| p.7 (2) | `histogram(x,5)` | 5.3.4 | Q05-27 |
| p.8–10 (2) | `edges = [0,60,70,80,90,100]; histogram(x,edges)` | 5.3.4 | Q05-25, Q05-26 |
| p.12 (2) | `histogram(x,edges,"normalization","countdensity")` | 5.3.4 | Q05-28 |
| p.13 (2) | `xlabel("Test Score")`, `ylabel("Number of Students")`, `title("Test Results")` | 5.3.4 | Q05-25 |
| p.14 (2) | `a = histcounts(x,edges)` → `3 1 3 4 3`, `a = histcounts(x)` → `1 2 8 3` | 5.3.4 | Q05-25, Q05-26, Q05-27 |
| p.16–18 (2) | `x = 0:pi/20:2*pi; y1 = sin(x); y2 = exp(x); … plot(x,y1,x,y2)` | 5.3.5 | Q05-29 |
| p.19–20 (2) | `yyaxis left`, `plot(x,y1)`, `yyaxis right`, `plot(x,y2)`, `ylabel("e^x")` | 5.3.5 | Q05-30 |
| p.23–24 (2) | `fplot(@(x) sin(x), [-2*pi,2*pi])`, `title("My Graph of the Sin Function")` | 5.3.6 | Q05-32 |
| p.25 (2) | `fun = @(x) sin(x)` → `function_handle with value:`, `fplot(fun,[-2*pi,2*pi])` | 5.3.6 | Q05-31, Q05-33 |
| p.28 (2) | `x = linspace(0,10*pi,1000); y = cos(x); z = sin(x); plot3(x,y,z); grid` | 5.4.1 | Q05-34, Q05-35 |
| p.29–31 (2) | `comet3(x,y,z)` | 5.4.1 | Q05-35 |
| p.33–35 (2) | `z = [1,…,10; 2,…,20; 3,…,12]; mesh(z)`, `z(2,5)`은 10 | 5.4.2 | Q05-36 |
| p.37 (2) | `x = linspace(1,50,10); y = linspace(500,1000,3); mesh(x,y,z)` | 5.4.2 | Q05-41 |
| p.38–39 (2) | `surf`, `shading interp`, `shading flat` | 5.4.2 | Q05-40 |
| p.40 (2) | `colormap(map_name)` — 기본 `parula` | 5.4.2 | Q05-40 |
| p.41–42 (2) | `x = [-2:0.2:2]; [X,Y] = meshgrid(x,y); Z = X.*exp(-X.^2 - Y.^2); mesh(X,Y,Z); surf(X,Y,Z)` | 5.4.2 | Q05-37, Q05-38 |
| p.43 (2) | `[X,Y] = meshgrid(x,x)`, `[X,Y] = meshgrid(-2:0.2:2)` | 5.4.2 | Q05-39 |
| p.45 (2) | `contour(X,Y,Z)`, `surfc(X,Y,Z)` | 5.4.3 | Q05-40 |
| p.46–48 (2) | `[x,y,z] = peaks;`, `pcolor(x,y,z)`, `shading interp` | 5.4.3 | Q05-39, Q05-40 |
| p.49 (2) | `hold on; contour(x,y,z,20,"k"); hold off` | 5.4.3 | Q05-40 |
| p.50 (2) | `contourf(x,y,z,20,"k")` | 5.4.3 | Q05-40 |
| p.51 (2) | `h = contour(x,y,z); clabel(h)` | 5.4.3 | Q05-40 |
| p.53–57 (2) | `sphere` — Insert 메뉴, Property Inspector, Data Aspect Ratio Mode | 5.5 | Q05-42, Q05-44 |
| p.58 (2) | HINT `axis equal` | 5.5 | Q05-42, Q05-44 |
| p.60–61 (2) | `load seamount`, `scatter3(x,y,z)` | 5.6 | Q05-43 |
