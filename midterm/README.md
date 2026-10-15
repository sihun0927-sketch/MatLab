# 중간고사 대비 문제집 (midterm)

Holly Moore, *MATLAB for Engineers* 6th ed. **Chapter 2~8** 강의 슬라이드 전 범위에서 뽑은 65문제(처음 50문제 + 2026-10-15 추가 15문제). 챕터별이 아니라 **전부 섞어서** 배치했고, 난이도는 "어려움"에 맞췄다.

| 파일 | 내용 |
|---|---|
| [problems.md](problems.md) | 문제 65개 (해답 없음) |
| [solutions.md](solutions.md) | 해답·해설·실제 오류 메시지·출력 |
| [`code/qNN_*.m`](code/) | 오류 찾기 문제의 **원본(버그 포함)** 코드. 실행하면 오류가 나거나 틀린 결과가 나오는 것이 정상 |
| [`code/aNN_*.m`](code/) | 정답 코드. 전부 R2026a에서 실행 검증 |
| [`code/kinematics.m`](code/kinematics.m), [`code/bmi_report.m`](code/bmi_report.m) | 문제 40, 58의 정답 함수 파일 |
| [`img/`](img/) | 문제 23의 그림, 플롯 문제의 정답 그림, 문제 55의 오류 상태 그림 |
| `code/run_all.m` | 정답 스크립트 전부 실행 (검증용) |
| `code/capture_outputs.m` | a·q 스크립트 전부 실행해 출력/오류를 `out/*.txt`에 저장 (해설 작성용). `capture_outputs("a5*")`처럼 패턴 지정 가능 |

## 문제 유형

| 유형 | 개수 | 번호 |
|---|---|---|
| 🐞 오류 찾기 (개수 비공개) | 20 | 01 05 08 11 14 18 22 25 29 32 36 39 43 46 50 51 55 59 64 65 |
| 📤 결과 → 코드 | 18 | 02 06 09 12 16 19 23 26 30 33 37 40 44 47 52 56 60 63 |
| 🎯 목적 → 코드 | 17 | 03 07 13 17 20 24 27 31 34 38 41 45 48 53 57 61 62 |
| 📝 의사코드 | 10 | 04 10 15 21 28 35 42 49 54 58 |

## 문제 색인

| # | 유형 | 주제 | 장 |
|---|---|---|---|
| 01 | 🐞 | `^` vs `.^`, `/` vs `./`, fprintf 인수 순서 | 2, 7 |
| 02 | 📤 | `max(x,[],2)`, `sort` vs `sortrows`, `mean(x,2)` | 3 |
| 03 | 🎯 | `[r,c] = find`, `sub2ind`, NaN 치환 | 8, 7 |
| 04 | 📝 | logical indexing 학점 분류, `strings`, `table` | 8, 4, 7 |
| 05 | 🐞 | 스크립트 local function의 `end`, local variable, 다중 출력 받기 | 6, 7 |
| 06 | 📤 | fprintf 열 너비·정밀도, 행렬 열 순서 소비 | 7, 2 |
| 07 | 🎯 | `tiledlayout`, `nexttile(n,[r c])`, `semilogy`, layout 제목 | 5 |
| 08 | 🐞 | `switch` cell case, `=` vs `==`, string/char 일치 | 8, 7 |
| 09 | 📤 | `end`, single index, `M(:)`, 행 삭제, 0 채움 | 4 |
| 10 | 📝 | `readtable`, 표 행 선택, 열 추가, `sortrows`, `writetable` | 7, 8 |
| 11 | 🐞 | Name=Value 문법, `axis` 순서, `text` 인수, `hold off` | 5 |
| 12 | 📤 | 관계·논리 연산, `find`, `xor`, `rem` | 8 |
| 13 | 🎯 | `nargin` 기본값, 익명 함수 핸들, `fplot` | 6, 5, 7 |
| 14 | 🐞 | type 없는 `%6.2`, `/n`, `disp` 인수, `['..' 3]`, `%%` | 7 |
| 15 | 📝 | `find` 복합 조건, flowchart 기호, 요약 통계 | 8, 3, 7 |
| 16 | 📤 | `linspace`, `logspace`, 감소 콜론, `format`, 외적 | 2, 3 |
| 17 | 🎯 | `meshgrid` 복리표, `sum(A < 2P)` | 4, 7, 8 |
| 18 | 🐞 | `max` 변수 덮어쓰기, `mean` dim, `max(x,2)`, `sort` vs `sortrows` | 3, 7 |
| 19 | 📤 | `if/elseif` 조건 순서, 유효성 검사 | 8, 7 |
| 20 | 🎯 | `input` 검사, `error` 서식, `beep` | 7, 8, 3 |
| 21 | 📝 | `histcounts`, `histogram(x, edges)`, `bar` | 5, 3, 7 |
| 22 | 🐞 | char 행렬 결합, `length` vs `strlength`, `[]`에 string 섞기 | 4 |
| 23 | 📤 | 그림 → 코드: 선 스타일, TeX, `legend`, `text` | 5 |
| 24 | 🎯 | `rand` 구간 변환, `randn` 평균·표준편차, 1σ·2σ 비율 | 3, 5, 8 |
| 25 | 🐞 | `@(x)`, `fplot(f)`, 함수 작업공간, `.*` | 6, 5 |
| 26 | 📤 | `num2str`, string + 배열, `fprintf` 반복 | 7 |
| 27 | 🎯 | 3단계 logical 분류, `table`, `max` 위치, `strjoin` | 8, 7, 3 |
| 28 | 📝 | `save -ascii`, `load` 확장자, 변수 이름 | 7, 2 |
| 29 | 🐞 | 변수명, `%%` 공백, 암시적 곱셈, `- ascii`, `load` | 2 |
| 30 | 📤 | `zeros`, `ones`, `diag` 두 역할, `magic`, `fliplr` | 4 |
| 31 | 🎯 | `meshgrid(v)`, `mesh`/`surf`/`contour`/`surfc`, `shading`, `colormap` | 5, 4, 8 |
| 32 | 🐞 | `&&` 배열 오류, 실수 인덱스, `<missing>`, 배열 `if` | 8 |
| 33 | 📤 | `fix`/`floor`/`ceil`/`round`, `rem`, `nthroot`, `sin(pi)` | 3 |
| 34 | 🎯 | local function 둘, `[~, idx]`, `help` 주석 | 6, 7 |
| 35 | 📝 | `sind`, `max` 두 출력, `sprintf` → `text` | 3, 5, 7 |
| 36 | 🐞 | 행 벡터 `table`, `ylabel` 따옴표, `writetable` 순서 | 7, 5 |
| 37 | 📤 | `find`, 짝지은 fprintf, `zeros` + logical 대입 | 8, 7 |
| 38 | 🎯 | `strlength`, `sort` 두 번째 출력으로 재배열, string 결합 | 4, 3, 7 |
| 39 | 🐞 | 타일 격자 크기, `polarplot(theta, r)`, `title(t, ...)` | 5 |
| 40 | 📤 | 함수 파일, 출력 순서, `nargin`/`nargout`, `help` | 6 |
| 41 | 🎯 | 변환표, `save -ascii`, `load`, `size` 두 출력 | 2, 7 |
| 42 | 📝 | `menu` 반환형, `switch` 숫자 case, `otherwise` | 8, 7 |
| 43 | 🐞 | `x(0)`, `x(2.5)`, 범위 초과, 열 삭제 후 인덱스 | 4 |
| 44 | 📤 | `fopen`/`fprintf(fid, ...)`/`fclose`, 바이트 수 | 7 |
| 45 | 🎯 | `input(.., "s")`, `switch` cell, `elseif` 요금 계산 | 8, 7 |
| 46 | 🐞 | `else if` 중첩, 벡터 `if`의 함정 | 8, 6 |
| 47 | 📤 | `meshgrid` 모양, `max(Z,[],2)`, logical 결과 순서 | 4, 3 |
| 48 | 🎯 | `yyaxis`, `fplot`, `sprintf` + `text` | 5, 6, 7 |
| 49 | 📝 | 결측·이상치 `find`, logical 변수 재사용 | 8, 3, 7 |
| 50 | 🐞 | 종합: `sind`, `%%`, `text` 순서, 행 벡터 `table`, `hold off` | 3, 5, 7, 8 |
| 51 | 🐞 | `== NaN` vs `isnan`, 인덱스 안 `=`, fprintf 인수 부족 | 3, 8, 7 |
| 52 | 📤 | `abs`/`angle`/`conj`, `'` vs `.'`, `rem` vs `mod` 부호 | 3 |
| 53 | 🎯 | 익명 함수, `fzero`, `fminbnd`, `integral`, `arrayfun`, `fplot` | 6, 5, 7 |
| 54 | 📝 | `lower`, string 배열 `==` + `find`, `case {…}`, `otherwise`, `error` | 8, 4, 7 |
| 55 | 🐞 | `cos` vs `cosd`, `polarplot(theta, r)` 순서·라디안, `tiledlayout` 핸들 | 5, 3 |
| 56 | 📤 | char 산술 vs string `+`, `char` 패딩, `strlength` vs `length` | 4 |
| 57 | 🎯 | `all(…,2)`, `any`, `find(cond, n)`, `"last"`, `ind2sub`, string 열 `table` | 8, 3, 7 |
| 58 | 📝 | 함수 파일 `help` 주석, `nargin` 기본값, `error`, `assert`, `try`/`catch` | 6, 7, 8 |
| 59 | 🐞 | 익명 함수의 변수 캡처, 함수 작업공간, `.^`, `@local` handle | 6, 7 |
| 60 | 📤 | `%f`/`%e`/`%g`, `%d`에 실수, `%s`·`%c`, `%-6s`, `%%`, 서식 재사용 | 7 |
| 61 | 🎯 | `plot3`/`view`, `bar(행렬)` 그룹, `stem`/`yline`, `errorbar`, `std(x,0,2)` | 5, 3 |
| 62 | 🎯 | `rng`/`rand`, logical `sum`/`cumsum`, `find(…,1)`, `scatter`, `semilogx` | 3, 8, 5 |
| 63 | 📤 | 빈 배열, `[1 -1]` vs `[1 - 1]`, `end+1` 대입, `Inf`/`NaN`, `int8` 포화 | 4, 3 |
| 64 | 🐞 | 한 줄 `if`의 쉼표, `case a, b` 함정, `otherwise`의 변수 정의, `lower` 일관성 | 8, 7 |
| 65 | 🐞 | 종합: 배열 `if`, `length` vs `sum`, `title`에 서식 문자열, 조용한 오류 | 3, 5, 7, 8 |

## 검증

```bash
"/mnt/c/Program Files/MATLAB/R2026a/bin/matlab.exe" -batch "cd('C:\Users\sihun\orca\MatLab\midterm\code'); run_all"
```

결과: 정답 스크립트 64개 중 실패 0개 (문제 10은 문제 28과 같은 `a28_file_io.m`을 쓴다. 문제 40은 `kinematics.m` + `a40_kinematics_calls.m`, 문제 58은 `bmi_report.m` + `a58_bmi_calls.m`).

- `input`/`menu`가 들어가는 정답은 `-batch`에서 실행할 수 없으므로 원래 줄을 주석으로 남기고 **검증용 고정값**을 넣었다. 해당 줄에 `% 검증용 고정값` 표시가 있다.
- 플롯 정답은 `theme(gcf, "light")` 후 `exportgraphics`로 `img/`에 저장한다.
- 오류 문제(`q*.m`)의 실제 메시지는 `capture_outputs`로 얻었고 `solutions.md`에 R2026a 한국어 메시지 그대로 실었다.

## R2026a에서 슬라이드와 다른 점 ([보강])

| 슬라이드 | R2026a 실제 | 문제 |
|---|---|---|
| `input(..,'s')`는 char이므로 `case 'Boston'`(char)이어야 한다 | `switch` 문자열 비교는 `strcmp`라서 char `'Boston'`과 `case "Boston"`(string)이 **일치**한다 | 08 |
| `'VariableNames'`는 작은따옴표로 써야 한다 | `VariableNames = [...]` Name=Value 문법도 된다 | 36 |
| — | `"a" \| "b"`는 string 논리합이 아니라 **pattern** 객체가 된다 | 08 |
| `char`는 string 배열을 행마다 패딩해 묶는다 | 행 string 배열 `char(s)`는 **1×n×3 3차원** char가 된다. `char(s')`나 `char("a","b")`로 써야 3×n | 56 |
| — | `title(txt, k)`의 숫자 둘째 인수는 오류 없이 **부제목**이 된다. 서식 문자열은 그대로 찍힌다 | 65 |

슬라이드 밖에서 쓴 함수(`strjoin`, `xticklabels`, `xticks`, `rng`, `sub2ind`, `ind2sub`, `colormap(gca, ...)`, `%c`로 ° 출력)는 해설에 **[보강]** 으로 표시했다. 시험에서는 슬라이드 범위 함수로 대체해도 된다.
