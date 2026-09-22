# Chapter 5 — Plotting

원본: Holly Moore, *MATLAB for Engineers* 6th ed., 출판사 강의 슬라이드 `Chapter 05_1.pdf` (73쪽), `Chapter 05_2.pdf`.
검증 환경: MATLAB **R2026a**.

## 학습 목표 (슬라이드 Learning Objectives)

| | 내용 | 문서 |
|---|---|---|
| 5.1 | 2차원 그래프를 그리고 이름을 붙인다 | [5.1](5.1-2d-plots.md) |
| 5.2 | 그래프의 겉모습을 조절한다 | [5.1](5.1-2d-plots.md) (5.1.2, 5.1.3) |
| 5.3 | 창을 tiled chart layout으로 나눠 여러 그래프를 배치한다 | [5.2](5.2-tiled-layout.md) |
| 5.4 | 3차원 그래프를 그린다 | Chapter 05_2 |
| 5.5 | 대화형 plotting 도구를 쓴다 | Chapter 05_2 |

> 슬라이드의 목표 번호와 본문 절 번호가 어긋난다. 본문 절 번호(5.1 Two-Dimensional Plots, 5.2 Subplots, 5.3 Other Types of Two-Dimensional Plots)를 기준으로 삼는다.

## 목차

| 절 | 문서 | 다루는 것 |
|---|---|---|
| 5.1 | [2차원 그래프](5.1-2d-plots.md) | 5.1.1 `plot`·`area`·figure 창·`hold on`·다중 선·column dominant / 5.1.2 LineSpec·`Name=Value` / 5.1.3 `axis`·`legend`·`text`·TeX·Example 5.2 탄도 |
| 5.2 | [Tiled Chart Layouts](5.2-tiled-layout.md) | `tiledlayout`, `nexttile`, `"flow"`, 칸 합치기 |
| 5.3 | [다른 종류의 2차원 그래프](5.3-other-2d-plots.md) | 5.3.1 `polarplot` / 5.3.2 `semilogx`·`semilogy`·`loglog` |
| — | [연습문제 해답](solutions.md) | 위 여섯 절의 문제 16개 |

`5.3-other-2d-plots.md` 는 Chapter 05_2 이슈와 함께 쓰는 파일이다. 5.3.3 이후(막대그래프, 원그래프, 히스토그램, 두 개의 y축, 함수 그래프)와 5.4~5.5(3차원 그래프, 대화형 도구)는 `Chapter 05_2.pdf` 쪽 문서가 다룬다.

## 함수 색인

| 함수 | 한 줄 설명 | 절 |
|---|---|---|
| `plot` | x–y 2차원 선 그래프 | 5.1.1 |
| `area` | `plot`과 같되 선 아래를 채운다 | 5.1.1 |
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
| `exportgraphics` | 그림을 파일로 저장 | 검증용 |
| `theme` | figure 테마 지정 (R2025a 이후) | 검증용 |

## 예제 코드

| 파일 | 내용 |
|---|---|
| [`ex0501_plot.m`](../../example/ch05/ex0501_plot.m) | 기본 `plot` + 제목·축 이름·격자 |
| [`ex0501_area.m`](../../example/ch05/ex0501_area.m) | `area` |
| [`ex0501_figure.m`](../../example/ch05/ex0501_figure.m) | `figure`, `clf`, `close all` |
| [`ex0501_hold.m`](../../example/ch05/ex0501_hold.m) | `hold on` / `hold off` |
| [`ex0501_multiline.m`](../../example/ch05/ex0501_multiline.m) | 한 `plot`으로 여러 선 |
| [`ex0501_column.m`](../../example/ch05/ex0501_column.m) | column dominant 함정과 전치 |
| [`ex0501_singleinput.m`](../../example/ch05/ex0501_singleinput.m) | 입력이 하나일 때 x축은 인덱스 |
| [`ex0501_linespec.m`](../../example/ch05/ex0501_linespec.m) | LineSpec 문자열 |
| [`ex0501_multistyle.m`](../../example/ch05/ex0501_multistyle.m) | 선마다 다른 LineSpec |
| [`ex0501_namevalue.m`](../../example/ch05/ex0501_namevalue.m) | `Name=Value` 속성 |
| [`ex0501_holdstyle.m`](../../example/ch05/ex0501_holdstyle.m) | 선마다 다른 속성 |
| [`ex0501_axis.m`](../../example/ch05/ex0501_axis.m) | `axis` |
| [`ex0501_legendtext.m`](../../example/ch05/ex0501_legendtext.m) | `legend`, `text` |
| [`ex0501_tex.m`](../../example/ch05/ex0501_tex.m) | TeX 그리스 문자·첨자·여러 줄 제목 |
| [`ex0501_ballistics.m`](../../example/ch05/ex0501_ballistics.m) | Example 5.2 탄도 |
| [`ex0502_tiledlayout.m`](../../example/ch05/ex0502_tiledlayout.m) | `tiledlayout(2,1)` |
| [`ex0502_title.m`](../../example/ch05/ex0502_title.m) | 레이아웃 전체 제목 |
| [`ex0502_flow.m`](../../example/ch05/ex0502_flow.m) | `tiledlayout("flow")` |
| [`ex0502_span.m`](../../example/ch05/ex0502_span.m) | `nexttile(3, [1,2])` 칸 합치기 |
| [`ex0503_polarplot.m`](../../example/ch05/ex0503_polarplot.m) | `polarplot` |
| [`ex0503_polarshapes.m`](../../example/ch05/ex0503_polarshapes.m) | 극좌표 곡선 모음 **[보강]** |
| [`ex0503_semilog.m`](../../example/ch05/ex0503_semilog.m) | `semilogx` / `semilogy` / `loglog` |
| [`ex0503_loglog_slope.m`](../../example/ch05/ex0503_loglog_slope.m) | loglog 기울기 = 지수 **[보강]** |

해답 코드 `sol0501_1.m` ~ `sol0503_4.m`는 [`solutions.md`](solutions.md)의 표에 정리되어 있다.

## 검증 방법

`example/ch05`의 모든 `.m` 파일은 R2026a에서 오류 없이 실행되며, 플롯 예제는 `img/`에 PNG를 남긴다.

```bash
"/mnt/c/Program Files/MATLAB/R2026a/bin/matlab.exe" -batch \
  "cd('C:\Users\pc\orca\MatLab\example\ch05'); run('ex0501_plot.m')"
```

> **[보강]** R2026a의 figure 기본 테마가 **어두운색**이다. 슬라이드(R2021a/R2022a) 그림과 배경이 달라 보이므로, 이 저장소의 예제는 저장 직전에 `theme(gcf, "light")`로 밝은 테마를 고정한다. 코드의 다른 부분과는 무관하다.
