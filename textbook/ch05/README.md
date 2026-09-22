# Chapter 5 — Plotting (2/2)

Holly Moore, *MATLAB for Engineers* 6th ed. · 출판사 강의 슬라이드 `Chapter 05_2.pdf` (69쪽) 정리.

이 문서는 **이슈 #5 (5.3.3 ~ 5.8)** 범위다.
5.1 ~ 5.3.2(2차원 plot, 선 스타일, tiledlayout, polar plot, 로그 축)는 이슈 #4에서 같은 폴더에 정리된다.

## 목차

| 절 | 내용 |
|---|---|
| [5.3.3 막대 그래프와 파이 차트](5.3.3-bar-pie.md) | `bar`, `barh`, `bar3`, `pie`, `pie3` |
| [5.3.4 히스토그램](5.3.4-histogram.md) | `histogram`, bin과 edge, 정규화, `histcounts` |
| [5.3.5 y축이 두 개인 그래프](5.3.5-yyaxis.md) | `yyaxis`, Example 5.5 |
| [5.3.6 함수 플롯](5.3.6-fplot.md) | `fplot`, 익명 함수, 함수 핸들 |
| [5.4.1 3차원 선 그래프](5.4.1-plot3.md) | `plot3`, `comet3`, `view` |
| [5.4.2 곡면 그래프](5.4.2-mesh-surf.md) | `mesh`, `surf`, `shading`, `colormap`, `meshgrid` |
| [5.4.3 등고선과 의사 색상](5.4.3-contour-pcolor.md) | `contour`, `contourf`, `surfc`, `pcolor`, `peaks` |
| [5.5 플롯 편집](5.5-editing-plots.md) | figure 메뉴, Property Inspector, `sphere`, `axis equal` |
| [5.6 Workspace에서 플롯 만들기](5.6-workspace-plots.md) | PLOTS 탭, `seamount` |
| [5.7 플롯 저장하기](5.7-saving-plots.md) | `.fig`, `savefig`, `openfig`, `exportgraphics` |
| [5.8 그 밖의 플롯들](5.8-other-plots.md) | 플롯 종류 표, 챕터 요약 |
| [연습문제 해답](solutions.md) | 22문항 |

## 함수 색인

| 함수 | 한 줄 설명 | 절 |
|---|---|---|
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
| `exportgraphics` | 그림 파일로 내보내기 (`Resolution=300`) | 5.7 |
| `gcf` / `gca` | 현재 figure / 현재 axes 핸들 | 5.7 |
| `area` / `stairs` / `stem` | 채운 곡선 / 계단 / 이산 막대 | 5.8 |
| `errorbar` | 오차 막대 | 5.8 |
| `bubblechart` | 세 번째 변수를 버블 크기로 | 5.8 |
| `image` / `imagesc` | 행렬을 이미지로 (`imagesc`는 값 범위를 늘림) | 5.8 |

## 예제 코드

| 파일 | 절 | 결과 이미지 |
|---|---|---|
| [`ex0533_bar_pie.m`](../../example/ch05/ex0533_bar_pie.m) | 5.3.3 | `img/ex0533_bar_pie.png` |
| [`ex0534_histogram.m`](../../example/ch05/ex0534_histogram.m) | 5.3.4 | `img/ex0534_histogram.png` |
| [`ex0534_histcounts.m`](../../example/ch05/ex0534_histcounts.m) | 5.3.4 | `img/ex0534_histcounts.png` |
| [`ex0535_yyaxis.m`](../../example/ch05/ex0535_yyaxis.m) | 5.3.5 | `img/ex0535_yyaxis.png` |
| [`ex0535_periodic.m`](../../example/ch05/ex0535_periodic.m) | 5.3.5 | `img/ex0535_periodic.png` |
| [`ex0536_fplot.m`](../../example/ch05/ex0536_fplot.m) | 5.3.6 | `img/ex0536_fplot.png` |
| [`ex0541_plot3.m`](../../example/ch05/ex0541_plot3.m) | 5.4.1 | `img/ex0541_plot3.png` |
| [`ex0541_comet3.m`](../../example/ch05/ex0541_comet3.m) | 5.4.1 | `img/ex0541_comet3.png` |
| [`ex0542_mesh_surf.m`](../../example/ch05/ex0542_mesh_surf.m) | 5.4.2 | `img/ex0542_mesh_surf.png` |
| [`ex0542_colormap.m`](../../example/ch05/ex0542_colormap.m) | 5.4.2 | `img/ex0542_colormap.png` |
| [`ex0542_meshgrid.m`](../../example/ch05/ex0542_meshgrid.m) | 5.4.2 | `img/ex0542_meshgrid.png` |
| [`ex0543_pcolor_contour.m`](../../example/ch05/ex0543_pcolor_contour.m) | 5.4.3 | `img/ex0543_pcolor_contour.png` |
| [`ex0543_contourf.m`](../../example/ch05/ex0543_contourf.m) | 5.4.3 | `img/ex0543_contourf.png` |
| [`ex0550_sphere.m`](../../example/ch05/ex0550_sphere.m) | 5.5 | `img/ex0550_sphere.png` |
| [`ex0560_seamount.m`](../../example/ch05/ex0560_seamount.m) | 5.6 | `img/ex0560_seamount.png` |
| [`ex0570_saving.m`](../../example/ch05/ex0570_saving.m) | 5.7 | `img/ex0570_saving.png` |
| [`ex0580_other_plots.m`](../../example/ch05/ex0580_other_plots.m) | 5.8 | `img/ex0580_other_plots.png` |

해답 코드는 같은 폴더의 `sol0533_1.m` ~ `sol0580_2.m` (22개).

## 파일 이름 규칙

`exXXYY_keyword.m`에서 `XX`는 장 번호(05)이고, `YY`는 장 번호를 뗀 나머지 절 번호에서
점을 빼고 **두 자리로 맞춘** 것이다. 두 자리가 안 되면 뒤를 0으로 채운다.
5.3.3 → `33`, 5.4.1 → `41`, 5.5 → `50`, 5.8 → `80`.

## 검증

모든 `.m` 파일은 MATLAB **R2026a**에서 오류·경고 없이 실행된다.

```bash
"/mnt/c/Program Files/MATLAB/R2026a/bin/matlab.exe" -batch \
  "cd('C:\Users\pc\orca\MatLab\example\ch05'); run('ex0533_bar_pie.m')"
```

슬라이드와 달라진 부분(예: `clabel(h)` → `ShowText=true`)은 해당 절에 `> **[보강]**`으로 표시했다.

플롯 예제는 저장 직전에 `theme(gcf, "light")`를 호출한다. R2026a의 기본 figure 테마가 dark라
그대로 내보내면 배경이 검은 그림이 되기 때문이다 ([5.7절](5.7-saving-plots.md) 참고).
