# Chapter 5 — Plotting

원본: Holly Moore, *MATLAB for Engineers* 6th ed., 출판사 강의 슬라이드 `Chapter 05_1.pdf` (73쪽) + `Chapter 05_2.pdf` (69쪽).
검증 환경: MATLAB **R2026a**.

## 학습 목표 (슬라이드 Learning Objectives)

| | 내용 | 문서 |
|---|---|---|
| 5.1 | 2차원 그래프를 그리고 이름을 붙인다 | [5.1](5.1-2d-plots.md) |
| 5.2 | 그래프의 겉모습을 조절한다 | [5.1](5.1-2d-plots.md) (5.1.2, 5.1.3) |
| 5.3 | 창을 tiled chart layout으로 나눠 여러 그래프를 배치한다 | [5.2](5.2-tiled-layout.md) |
| 5.4 | 3차원 그래프를 그린다 | [5.4.1](5.4.1-plot3.md), [5.4.2](5.4.2-mesh-surf.md), [5.4.3](5.4.3-contour-pcolor.md) |
| 5.5 | 대화형 plotting 도구를 쓴다 | [5.5](5.5-editing-plots.md), [5.6](5.6-workspace-plots.md) |

> 슬라이드의 목표 번호와 본문 절 번호가 어긋난다. 본문 절 번호(5.1 Two-Dimensional Plots, 5.2 Subplots, 5.3 Other Types of Two-Dimensional Plots)를 기준으로 삼는다.

## 목차

| 절 | 문서 | 다루는 것 |
|---|---|---|
| 5.1 | [2차원 그래프](5.1-2d-plots.md) | 5.1.1 `plot`·`area`·figure 창·`hold on`·다중 선·column dominant / 5.1.2 LineSpec·`Name=Value` / 5.1.3 `axis`·`legend`·`text`·TeX·Example 5.2 탄도 |
| 5.2 | [Tiled Chart Layouts](5.2-tiled-layout.md) | `tiledlayout`, `nexttile`, `"flow"`, 칸 합치기 |
| 5.3.1~5.3.2 | [다른 종류의 2차원 그래프](5.3-other-2d-plots.md) | 5.3.1 `polarplot` / 5.3.2 `semilogx`·`semilogy`·`loglog` |
| 5.3.3 | [막대 그래프와 파이 차트](5.3.3-bar-pie.md) | `bar`, `barh`, `bar3`, `pie`, `pie3` |
| 5.3.4 | [히스토그램](5.3.4-histogram.md) | `histogram`, bin과 edge, 정규화, `histcounts` |
| 5.3.5 | [y축이 두 개인 그래프](5.3.5-yyaxis.md) | `yyaxis`, Example 5.5 |
| 5.3.6 | [함수 플롯](5.3.6-fplot.md) | `fplot`, 익명 함수, 함수 핸들 |
| 5.4.1 | [3차원 선 그래프](5.4.1-plot3.md) | `plot3`, `comet3`, `view` |
| 5.4.2 | [곡면 그래프](5.4.2-mesh-surf.md) | `mesh`, `surf`, `shading`, `colormap`, `meshgrid` |
| 5.4.3 | [등고선과 의사 색상](5.4.3-contour-pcolor.md) | `contour`, `contourf`, `surfc`, `pcolor`, `peaks` |
| 5.5 | [플롯 편집](5.5-editing-plots.md) | figure 메뉴, Property Inspector, `sphere`, `axis equal` |
| 5.6 | [Workspace에서 플롯 만들기](5.6-workspace-plots.md) | PLOTS 탭, `seamount` |
| 5.7 | [플롯 저장하기](5.7-saving-plots.md) | `.fig`, `savefig`, `openfig`, `exportgraphics` |
| 5.8 | [그 밖의 플롯들](5.8-other-plots.md) | 플롯 종류 표, 챕터 요약 |
| — | [연습문제 해답](solutions.md) | 위 절들의 문제 38개 |

> 5.3 은 파일이 둘로 나뉜다. 5.3.1~5.3.2 는 `5.3-other-2d-plots.md` 한 파일에, 5.3.3 이후는 `5.3.3-*.md` 처럼 소절마다 한 파일이다. 두 PDF(`Chapter 05_1`, `Chapter 05_2`)를 따로 정리한 흔적이다.

## 함수 색인

| 함수 | 한 줄 설명 | 절 |
|---|---|---|
| `plot` | x–y 2차원 선 그래프 | 5.1.1 |
| `area` | `plot`과 같되 선 아래를 채운다 | 5.1.1, 5.8 |
| `title` | 그래프(또는 레이아웃) 제목 | 5.1.1, 5.2 |
| `xlabel` | x축 이름. 단위를 반드시 넣는다 | 5.1.1 |
| `ylabel` | y축 이름 | 5.1.1 |
| `grid` | 격자선 켜기/끄기. `grid minor`는 보조 격자선 | 5.1.1 |
| `figure` | 새 figure 창을 열거나 기존 창을 활성화 | 5.1.1 |
| `clf` | **활성** figure 창의 내용만 지운다 | 5.1.1 |
| `close all` | 열린 figure 창을 전부 닫는다 | 5.1.1 |
| `hold on` / `hold off` | 같은 축에 선을 겹쳐 그리기 시작/끝 | 5.1.1 |
| `help plot` | 쓸 수 있는 선·색·마커 문자 목록 | 5.1.2 |
| `axis` | 축 범위를 `[xmin xmax ymin ymax]`로 지정하거나 동결 | 5.1.3 |
| `xlim` / `ylim` | 한 축만 범위 지정 | 5.1.3 |
| `legend` | 범례. `Location`으로 위치 지정 | 5.1.3 |
| `text` | 축 값 좌표에 글상자 배치 | 5.1.3 |
| `tiledlayout` | 창을 m×n 격자 또는 `"flow"`로 나눈다 | 5.2 |
| `nexttile` | 다음 칸을 활성화. `nexttile(n, [r c])`로 칸 합치기 | 5.2 |
| `polarplot` | 극좌표 그래프. θ는 **라디안** | 5.3.1 |
| `rlim` / `thetalim` | 극좌표의 반지름/각도 범위 | 5.3.1 |
| `semilogx` | x축만 로그 눈금 | 5.3.2 |
| `semilogy` | y축만 로그 눈금 | 5.3.2 |
| `loglog` | 두 축 모두 로그 눈금 | 5.3.2 |
| `logspace` | 로그 간격으로 점 만들기 (`linspace`의 짝) | 5.3.2 |
| `bar` / `barh` | 세로 / 가로 막대 그래프 | 5.3.3 |
| `bar3` / `bar3h` | 3차원 막대 그래프 | 5.3.3 |
| `pie` / `pie3` | 파이 차트 (값을 비율로 자동 변환) | 5.3.3 |
| `xticklabels` / `yticklabels` | 축 눈금 이름 바꾸기 | 5.3.3 |
| `histogram` | 구간별 도수를 막대로 (bin 개수 또는 경계 지정) | 5.3.4 |
| `histcounts` | 그림 없이 도수만 계산 | 5.3.4 |
| `yyaxis left` / `right` | 이후 그리기 명령이 쓸 y축 선택 | 5.3.5 |
| `fplot` | 배열 없이 함수와 범위만으로 곡선 그리기 | 5.3.6 |
| `@(x) ...` | 익명 함수 / 함수 핸들 만들기 | 5.3.6 |
| `yline` / `xline` | 기준선 긋기 | 5.3.6 |
| `plot3` | (x,y,z) 순서쌍을 잇는 3차원 선 그래프 | 5.4.1 |
| `comet` / `comet3` | 2차원 / 3차원 선을 애니메이션으로 그리기 | 5.4.1 |
| `view` | 3차원 시점 바꾸기 (`view(2)`, `view(az,el)`) | 5.4.1 |
| `mesh` / `meshc` | 격자선 곡면 (+ 아래쪽 등고선) | 5.4.2 |
| `surf` / `surfc` | 색이 칠해진 곡면 (+ 등고선) | 5.4.2 |
| `shading` | `faceted` / `interp` / `flat` 음영 방식 | 5.4.2 |
| `colormap` / `colorbar` | 색 배합 지정 / 색-값 대응 막대 | 5.4.2 |
| `meshgrid` | 벡터 두 개를 2차원 격자 배열로 확장 | 5.4.2 |
| `contour` / `contourf` | 등고선 / 색을 채운 등고선 | 5.4.3 |
| `clabel` | 등고선에 값 표시 — `[C,h] = contour(...)`와 함께 (`ShowText=true` 권장) | 5.4.3 |
| `pcolor` | 격자 칸을 값에 따라 칠하는 의사 색상 플롯 | 5.4.3 |
| `peaks` | 실습용 예제 곡면 데이터 | 5.4.3 |
| `sphere` / `cylinder` | 실습용 예제 도형 좌표 | 5.5 |
| `axis equal` | 세 축의 데이터 간격을 같게 (`square`, `tight`, `off`) | 5.5 |
| `load seamount` | 내장 실측 데이터 (경도·위도·수심) | 5.6 |
| `scatter` / `scatter3` | 산점도 (네 번째 인자로 색 지정 가능) | 5.6 |
| `stem3` | 3차원 이산 데이터 막대 | 5.6 |
| `savefig` / `openfig` | `.fig` 저장 / 다시 열기 | 5.7 |
| `exportgraphics` | 그림을 파일로 내보내기 (`Resolution=300`) | 5.7, 검증용 |
| `gcf` / `gca` | 현재 figure / 현재 axes 핸들 | 5.7 |
| `stairs` / `stem` | 계단 / 이산 막대 | 5.8 |
| `errorbar` | 오차 막대 | 5.8 |
| `bubblechart` | 세 번째 변수를 버블 크기로 | 5.8 |
| `image` / `imagesc` | 행렬을 이미지로 (`imagesc`는 값 범위를 늘림) | 5.8 |
| `theme` | figure 테마 지정 (R2025a 이후) | 검증용 |

## 예제 코드

| 파일 | 절 | 내용 |
|---|---|---|
| [`ex0501_plot.m`](../../example/ch05/ex0501_plot.m) | 5.1.1 | 기본 `plot` + 제목·축 이름·격자 |
| [`ex0501_area.m`](../../example/ch05/ex0501_area.m) | 5.1.1 | `area` |
| [`ex0501_figure.m`](../../example/ch05/ex0501_figure.m) | 5.1.1 | `figure`, `clf`, `close all` |
| [`ex0501_hold.m`](../../example/ch05/ex0501_hold.m) | 5.1.1 | `hold on` / `hold off` |
| [`ex0501_multiline.m`](../../example/ch05/ex0501_multiline.m) | 5.1.1 | 한 `plot`으로 여러 선 |
| [`ex0501_column.m`](../../example/ch05/ex0501_column.m) | 5.1.1 | column dominant 함정과 전치 |
| [`ex0501_singleinput.m`](../../example/ch05/ex0501_singleinput.m) | 5.1.1 | 입력이 하나일 때 x축은 인덱스 |
| [`ex0501_linespec.m`](../../example/ch05/ex0501_linespec.m) | 5.1.2 | LineSpec 문자열 |
| [`ex0501_multistyle.m`](../../example/ch05/ex0501_multistyle.m) | 5.1.2 | 선마다 다른 LineSpec |
| [`ex0501_namevalue.m`](../../example/ch05/ex0501_namevalue.m) | 5.1.2 | `Name=Value` 속성 |
| [`ex0501_holdstyle.m`](../../example/ch05/ex0501_holdstyle.m) | 5.1.2 | 선마다 다른 속성 |
| [`ex0501_axis.m`](../../example/ch05/ex0501_axis.m) | 5.1.3 | `axis` |
| [`ex0501_legendtext.m`](../../example/ch05/ex0501_legendtext.m) | 5.1.3 | `legend`, `text` |
| [`ex0501_tex.m`](../../example/ch05/ex0501_tex.m) | 5.1.3 | TeX 그리스 문자·첨자·여러 줄 제목 |
| [`ex0501_ballistics.m`](../../example/ch05/ex0501_ballistics.m) | 5.1.3 | Example 5.2 탄도 |
| [`ex0502_tiledlayout.m`](../../example/ch05/ex0502_tiledlayout.m) | 5.2 | `tiledlayout(2,1)` |
| [`ex0502_title.m`](../../example/ch05/ex0502_title.m) | 5.2 | 레이아웃 전체 제목 |
| [`ex0502_flow.m`](../../example/ch05/ex0502_flow.m) | 5.2 | `tiledlayout("flow")` |
| [`ex0502_span.m`](../../example/ch05/ex0502_span.m) | 5.2 | `nexttile(3, [1,2])` 칸 합치기 |
| [`ex0503_polarplot.m`](../../example/ch05/ex0503_polarplot.m) | 5.3.1 | `polarplot` |
| [`ex0503_polarshapes.m`](../../example/ch05/ex0503_polarshapes.m) | 5.3.1 | 극좌표 곡선 모음 **[보강]** |
| [`ex0503_semilog.m`](../../example/ch05/ex0503_semilog.m) | 5.3.2 | `semilogx` / `semilogy` / `loglog` |
| [`ex0503_loglog_slope.m`](../../example/ch05/ex0503_loglog_slope.m) | 5.3.2 | loglog 기울기 = 지수 **[보강]** |
| [`ex0533_bar_pie.m`](../../example/ch05/ex0533_bar_pie.m) | 5.3.3 | `bar`/`barh`/`bar3`와 `pie`/`pie3`를 한 figure에 |
| [`ex0534_histogram.m`](../../example/ch05/ex0534_histogram.m) | 5.3.4 | 자동 bin, bin 개수 지정, edge 지정, 정규화 비교 |
| [`ex0534_histcounts.m`](../../example/ch05/ex0534_histcounts.m) | 5.3.4 | 그림 없이 도수만 얻기, 히스토그램에 주석 달기 |
| [`ex0535_yyaxis.m`](../../example/ch05/ex0535_yyaxis.m) | 5.3.5 | 크기가 다른 두 데이터: 한 축 vs `yyaxis` |
| [`ex0535_periodic.m`](../../example/ch05/ex0535_periodic.m) | 5.3.5 | Example 5.5 알칼리 금속의 녹는점과 원자 반지름 |
| [`ex0536_fplot.m`](../../example/ch05/ex0536_fplot.m) | 5.3.6 | 배열 없이 함수 자체를 그리기 |
| [`ex0541_plot3.m`](../../example/ch05/ex0541_plot3.m) | 5.4.1 | `plot3`로 (x,y,z)를 잇기 |
| [`ex0541_comet3.m`](../../example/ch05/ex0541_comet3.m) | 5.4.1 | `comet` / `comet3` — 그려지는 과정이 보인다 |
| [`ex0542_mesh_surf.m`](../../example/ch05/ex0542_mesh_surf.m) | 5.4.2 | `mesh`와 `surf`, 입력 1개와 3개, `shading` 세 가지 |
| [`ex0542_colormap.m`](../../example/ch05/ex0542_colormap.m) | 5.4.2 | `colormap` — 기본값은 parula |
| [`ex0542_meshgrid.m`](../../example/ch05/ex0542_meshgrid.m) | 5.4.2 | `meshgrid`로 독립변수 두 개를 격자로 펼치기 |
| [`ex0543_pcolor_contour.m`](../../example/ch05/ex0543_pcolor_contour.m) | 5.4.3 | `peaks`로 `pcolor` / `contour` / `contourf` 비교 |
| [`ex0543_contourf.m`](../../example/ch05/ex0543_contourf.m) | 5.4.3 | `contourf`와 `clabel`로 등고선에 값 붙이기 |
| [`ex0550_sphere.m`](../../example/ch05/ex0550_sphere.m) | 5.5 | 메뉴로 하던 편집을 코드로 남기기 (`sphere`) |
| [`ex0560_seamount.m`](../../example/ch05/ex0560_seamount.m) | 5.6 | PLOTS 탭이 만들어 주는 코드를 직접 쓰기 (`seamount`) |
| [`ex0570_saving.m`](../../example/ch05/ex0570_saving.m) | 5.7 | `.fig`(재편집용)와 그림 파일(문서 삽입용) |
| [`ex0580_other_plots.m`](../../example/ch05/ex0580_other_plots.m) | 5.8 | 그 밖의 플롯 종류 모음 |

플롯 예제는 결과를 `img/<파일 이름>.png`로 남긴다.
해답 코드 `sol0501_1.m` ~ `sol0580_2.m` (38개)는 [`solutions.md`](solutions.md)의 표에 정리되어 있다.

## 파일 이름 규칙

`exXXYY_keyword.m`에서 `XX`는 장 번호(05)이고, `YY`는 장 번호를 뗀 나머지 절 번호다.

| 절 | `YY` | 예 |
|---|---|---|
| 5.1 / 5.2 / 5.3 | `01` / `02` / `03` | `ex0501_plot.m` |
| 5.3.3 / 5.3.4 / 5.3.5 / 5.3.6 | `33` / `34` / `35` / `36` | `ex0533_bar_pie.m` |
| 5.4.1 / 5.4.2 / 5.4.3 | `41` / `42` / `43` | `ex0541_plot3.m` |
| 5.5 / 5.6 / 5.7 / 5.8 | `50` / `60` / `70` / `80` | `ex0550_sphere.m` |

> 두 자리 절(5.1, 5.5)의 처리가 두 PDF 사이에서 엇갈린다. `Chapter 05_1` 쪽은 앞을 0으로 채워 5.1 → `01`, `Chapter 05_2` 쪽은 뒤를 0으로 채워 5.5 → `50`으로 썼다. 위 표가 실제 파일 이름이다.

## 검증

`example/ch05`의 모든 `.m` 파일은 MATLAB **R2026a**에서 오류 없이 실행되며, 플롯 예제는 `img/`에 PNG를 남긴다.

```bash
"/mnt/c/Program Files/MATLAB/R2026a/bin/matlab.exe" -batch \
  "cd('C:\Users\pc\orca\MatLab\example\ch05'); run('ex0501_plot.m')"
```

슬라이드와 달라진 부분(예: `clabel(h)` → `ShowText=true`)은 해당 절에 `> **[보강]**`으로 표시했다.

> **[보강]** R2026a의 figure 기본 테마가 **어두운색**이다. 슬라이드(R2021a/R2022a) 그림과 배경이 달라 보이므로, 이 저장소의 예제는 저장 직전에 `theme(gcf, "light")`로 밝은 테마를 고정한다 ([5.7절](5.7-saving-plots.md) 참고). 코드의 다른 부분과는 무관하다.
