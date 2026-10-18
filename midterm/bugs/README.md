# 🐞 오류 찾기 50선 (midterm/bugs)

Holly Moore, *MATLAB for Engineers* 6th ed. **Chapter 2~8** 강의 슬라이드 범위에서 **오류 찾기 유형만** 50문제(2026-10-18). 상위 [`midterm/`](../README.md)의 65문제 세트와 별도이며, 번호는 `B01`~`B50`으로 구분한다.

| 파일 | 내용 |
|---|---|
| [problems.md](problems.md) | 문제 50개 (해답 없음). 유형 규칙과 세미콜론 여덟 가지 구분 포함 |
| [solutions.md](solutions.md) | 해답·해설·실행 순서·고친 코드·출력 |

`.m` 파일은 만들지 않았다. 지필 시험 대비이므로 **MATLAB 실행 검증은 하지 않는 것이 원칙**이다(B41~B50만 작성 에이전트가 R2026a에서 돌려 맞췄다). 해설에서 공백·빈 줄 수처럼 확신이 덜한 자리는 `> **[확인 필요]**`로 표시해 두었다.

## 구성

| 구간 | 중심 챕터 | 세미콜론 핵심 문제 |
|---|---|---|
| B01~B10 | 2장(변수·연산·스크립트·save/load), 4장(배열·인덱싱·char/string) | B02 B03 B05 B10 |
| B11~B20 | 3장(내장 함수·삼각·데이터 분석·난수·복소수·특수 값) | B11 B15 B17 B19 |
| B21~B30 | 5장(플롯 전체) | B21 B22 B25 B27 B30 |
| B31~B40 | 6장(함수·익명 함수·function function), 7장(입출력·fprintf·table·파일) | B31 B34 B37 B40 |
| B41~B50 | 8장(논리·find·if·switch·menu) + 3개 장 이상 종합(B47~B50) | B42 B43 B44 B47 |

- 문제당 오류 3~6개, 개수는 비공개. 절반 이상에 **조용히 틀린 결과**(③)가 있다.
- 문제마다 **오류 아닌 미끼 줄**이 있다(`if x > 5;`, `fprintf(...);`, `case 'copper'` vs string, `VariableNames = [...]`, `x(end+1) = …` 확장 등).
- 세미콜론이 핵심 쟁점인 문제 **21개**(색인에 ` · ;`). 나머지에도 `fprintf(...);` 미끼나 `,` 구분자 표시가 자주 끼어 있다.
- 금지 구문(`for`, `while`, `try`, `arrayfun`, `regexp`)은 문제·해답 어디에도 없다.

## 문제 색인

| # | 주제 | 장 |
|---|---|---|
| B01 | 변수명 하이픈·대소문자, 암시적 곱셈 `2h0`, 우선순위 `-1^2`·`2^3^2`·`^1/2` | 2 |
| B02 | `;` 없는 10001개 출력, `t(n/2)` 실수 인덱스, `10:2:0` 빈 배열, `linspace` 인자 순서, 콜론 끝점, `fprintf` 뒤 `;` · ; | 2, 4 |
| B03 | `[ ]` 안 `;`·`,`·줄바꿈·`...`, `[1 - 1]`, 행+열 결합 차원 오류, 문장 구분자 `,` 표시 · ; | 4, 2 |
| B04 | `*`/`.*`, `^`/`.^`, `1000/k`, 벡터 `E/F` 최소제곱, 정사각 `G^2`, 전치 내적 | 2, 4 |
| B05 | `5%;` 주석, `balance;` 표시 억제, `%%` 공백, `clc` vs `clear`, `-ascii` `load` 변수명 · ; | 2 |
| B06 | 단일 인덱스·`S(:)` 열 우선, `end+1` 확장, 행 삭제 후 인덱스, `length` vs `size`, 범위 초과 | 4 |
| B07 | `sum(A)` 열 합, `diag(행렬)` vs `diag(벡터)`, `zeros(4)` 모양, `diag(3)` vs `eye(3)` | 4 |
| B08 | `meshgrid` 출력 순서·크기, `^`/`.^`, `sin` vs `sind`, `max(R)` vs `max(R(:))` | 4, 3 |
| B09 | `'abc'+n`, `"S"+7+1`, `['a';'bb']` 길이 불일치, `['ID: ' 7]`, `length` vs `strlength`, `[ ]` string 혼합 | 4, 7 |
| B10 | `sum`·`length`·`i` 덮어쓰기, `,` 구분자 표시, `fprintf` 뒤 `;`, `1i` · ; | 2, 3, 7 |
| B11 | `fix` vs `floor`, `round`, `sign`, `nthroot` vs `.^(1/3)`, `rem` vs `mod` 음수, `[ ]` 안 `;`/`,` · ; | 3 |
| B12 | `log` vs `log10`, `exp` vs `e`, `20e-6` 표기, 밑 변환 `log2`, `factorial(180)` → `NaN` | 3 |
| B13 | `cos` vs `cosd`, `atan2(y, x)` 순서, `asind` 치역, `sin(pi) == 0` | 3 |
| B14 | `max(T, 2)` vs `max(T, [], 2)`, `max(A, B)`/`min(A, B)`, `sum` 열 방향, `T(2)` 단일 인덱스, `cumsum(T, 2)` | 3 |
| B15 | `mean`/`mode` 열 우선, `std(S, 2)` 오류, `var(S, 1)`, 결과를 숨기는 `;` · ; | 3 |
| B16 | `sort` vs `sortrows`, `[값, 위치] = sort(..., 'descend')`, `table`, `fprintf` 열 순서 소비 | 3, 7 |
| B17 | `rand(3)` vs `rand(1,3)`, `a + (b-a)*rand`, `randn` 평균·표준편차, `randi`, `length` vs `numel`, 1000개 출력 · ; | 3 |
| B18 | `i` 덮어쓰기, `1i`, `abs`/`angle`(라디안)/`conj`/`real`, `'` vs `.'`, `sqrt(-4)` | 3 |
| B19 | `== NaN` vs `isnan`, `find`, `Inf == Inf`, `format long`/`bank` 표시만, `intmax` vs `realmax` · ; | 3, 8 |
| B20 | `help` vs `doc`, `pi`·`mean` 덮어쓰기, `disp` 인수, `fprintf` 뒤 `;` | 3, 7 |
| B21 | `plot(y)` 인덱스 축, `hold on` 누락, `xlabel` 따옴표, 1001개 표시와 결과 숨김 · ; | 5 |
| B22 | `[I, I, I]` vs `[I; I; I]`, 행렬 `plot(X, Y)` 열 단위, `axis` 순서, 외적 `R'*I.^2` · ; | 5 |
| B23 | LineSpec `'b'`/`'k'`·`'ro'`, `Name=Value` 뒤 위치 인수, `legend` 순서, `hold off` 누락 | 5 |
| B24 | `'k.-'` vs `'k-.'`, `axis square` vs `axis equal`, 대괄호 없는 `axis`, TeX `_{}` | 5 |
| B25 | `tiledlayout` 핸들 표시, `plot(t, 12)`, `title(L, ...)`, `nexttile` 초과와 `figure` · ; | 5 |
| B26 | `bar(x, y)` 순서, `pie` 합 1 미만, 그룹 `bar` 행렬, `subplot` 칸 초과, `barh` | 3, 5 |
| B27 | `histogram` edges 누락, `[5]`는 스칼라, `sprintf` `%d` 실수, `>=`, `title(t, ...)` · ; | 3, 5, 7 |
| B28 | `@(w)` 안 `^`, `semilogx`/`semilogy`, `fplot` 범위 배열, `polarplot(theta, r)`, 로그 축 0·음수 | 5 |
| B29 | `meshgrid` 후 `Y^2`, `mesh(x, y, Z)` 벡터 허용, `shading interp`, `colormap` 범위, `plot3` 길이 | 5 |
| B30 | `linspace` 점 개수, `yyaxis left/right`, `h = plot` 표시, `exportgraphics` 확장자, `clf` vs `close all`, `table` · ; | 3, 5, 7 |
| B31 | 파일 이름 ≠ 함수 이름, 함수 안 `clear`, 출력 변수 미대입, 함수 본문 `;` 누락, local 변수 참조, 정의줄 끝 `;` · ; | 6, 7 |
| B32 | `R, H = f(x)` vs `[R, H, T] = f(x)`, 출력 하나면 첫째만, 벡터 `^`, `fprintf` 배열 인수 따로 주기 | 6, 3 |
| B33 | `nargin < 3` 기본값 범위, `nargout` 로 첫 출력 미대입, 함수 안 `clc`, local 변수, `fplot(@f)` vs `fplot(f)` | 6, 5 |
| B34 | 스크립트 local function 위치, 함수에서 스크립트 변수 참조, `global` 이름 불일치 → `[]`, 표시해야 할 줄의 `;` · ; | 6 |
| B35 | 익명 함수 `.*`, 정의 시점 캡처, handle 에 `-` 연산, `fminbnd(f, a, b)`, `fzero(@(t) ..., x0)`, `integral`, `fplot` | 6, 5 |
| B36 | `input` 의 `"s"`, `"s"` 로 받은 숫자, char `==` 길이, `disp` 인수 하나, `disp(['..' 숫자])` 깨짐, `num2str` | 7, 8 |
| B37 | `fprintf(...);`·`;` 없는 대입, 열 우선 소비(`data'`), `%d` 에 실수 → `%e`, 인수 부족 시 멈춤, `%%` · ; | 7 |
| B38 | 행 벡터 `table`, `VariableNames` 개수, `disp(T);`, `title` 에 서식 → `sprintf`, `ginput(1)`, `%s` 에 숫자 | 7, 3, 5 |
| B39 | `save('f', 'T')`, `fopen` 모드 `'r'`/`'w'`, `fprintf(fid, ...)` 위치, `/n`, `fclose` 누락, `-ascii` 의 `load` 변수명 | 7, 2 |
| B40 | 함수 본문 `;` 누락, `,` 구분자 표시, `[a; b]` vs `[a, b]`, `f(x);` 결과 미표시, `disp(x);`, 정의줄 `;` · ; | 6, 7, 2 |
| B41 | `20 <= T <= 30` 연쇄 비교, `& <` 피연산자 누락, `~T <= 20` 우선순위, `!=`, `xor` 미끼 | 8 |
| B42 | `find` 인덱스를 값으로 사용, `[r, c] = find` + `fprintf` 짝, `find(…, 1)`, 빈 `find`를 `fprintf`에 · ; | 8, 7 |
| B43 | double 0/1 마스크, 지운 뒤 옛 마스크 재사용, 마스크·배열 길이 불일치, `x(find(m)) = []` 미끼 · ; | 8, 7 |
| B44 | `elseif` 순서(죽은 가지), 경계 `>` 빈틈, 배열 `if` → `any`, `error` 서식, `if …;` 미끼 · ; | 8, 7 |
| B45 | `input` `"s"` 누락, `== 'C' \| 'c'` 항상 참, `else if` `end` 누락, char `==` 길이 불일치 | 8, 7 |
| B46 | `menu` 번호 vs `case "Circle"`, `case 3, 4`, `break` 문법 오류, `otherwise` 누락, `case 2;` 미끼 | 8, 7 |
| B47 | 종합: `,` 표시, `^` vs `.^`, logical indexing 대상, `fprintf` 행렬 짝, `ylabel` 누락, `if … =` · ; | 2, 3, 5, 7, 8 |
| B48 | 종합: `=>`, 인덱스 안 `=`(Name=Value 해석), `&&` 배열, `case s >= 90`, logical `%d`, `ylabel` 누락 | 3, 4, 5, 7, 8 |
| B49 | 종합: local function `end`, string 배열 `switch`, `case "a", "b"` vs `{…}`, `otherwise` 누락, 익명 함수 `^` | 4, 5, 6, 8 |
| B50 | 종합: `any(…, 1)` vs `any(…, 2)`, 짝 없는 `end`, `<>`, `elseif` 빈틈, `fclose` 누락 | 3, 4, 7, 8 |

## R2026a에서 확인된 점 (슬라이드·통념과 다른 것)

B41~B50 작성 중 R2026a에서 실제로 확인한 동작. 시험 답안에서 틀리기 쉬운 지점이다.

| 통념 | R2026a 실제 | 문제 |
|---|---|---|
| 조건·인덱스 안의 `=`는 항상 문법 오류 | `names(scores = max(scores))`는 **Name=Value 인수**로 읽혀 문법 오류가 아니고, 실행 시 "string 값은 인덱스로 쓸 수 없음" 오류. 왼쪽이 이름 하나가 아닌 `v(end) = …`, `if x = 3`만 문법 오류 | B47, B48 |
| `switch`에 배열을 주면 오류 | **숫자** 배열은 오류("스칼라 또는 문자형 벡터"), **string 배열**은 오류 없이 어느 `case`에도 안 맞는다 | B49 |
| 숫자 `switch`에 문자열 `case`는 그냥 안 맞는다 | `case "Circle"`(string)은 **실행 오류**("string과 double 비교 불가"). char `case 'Circle'`은 오류 없이 안 맞는다 | B46 |
| `fprintf('%d', [])`는 아무것도 안 찍는다 | 서식의 글자는 찍히고 `%d` 자리만 빈다: `Over 100:  readings` | B42 |
| `case 3, 4`는 두 값을 묶는다 | `,`가 `case` 식을 끝내고 `4`는 블록의 첫 문장이 되어 `ans = 4`가 찍힌다. 묶으려면 `{3, 4}` | B46, B49 |
| `break`는 `switch`에도 쓴다 | loop 밖 `break`는 **문법 오류**라 파일 전체가 실행되지 않는다 | B46 |
| `!=`, `<>`, `=>`도 비교 연산자 | 전부 문법 오류. MATLAB은 문법 오류를 **한 번에 하나만** 알려 준다 | B41, B48, B50 |

B01~B40에서 머리로 판단한 것 중 교재와 다르게 쓴 두 곳: `histogram(x, [5])`는 `[5]`가 1×1이라 스칼라 5와 같다(B27, 교재 5.3.4 함정 문구와 다름). `bar(행렬)`은 **행 하나가 그룹 하나**다(B26, 교재 5.3.3 본문 표현과 다르고 그림과 같음).

슬라이드 밖 함수(`xticklabels`, `nthroot`, `logspace`, `rng`, `colormap(gca, …)`, `yline`)는 해설에서 대안이나 [보강] 표시와 함께 썼다. 시험에서는 슬라이드 범위 함수로 대체해도 된다.
