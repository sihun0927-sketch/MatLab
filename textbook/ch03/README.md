# Chapter 3 — Built-In MATLAB Functions (내장 함수)

Holly Moore, *MATLAB for Engineers* 6th ed. Chapter 3 강의 슬라이드(81쪽) 기준.

공학 계산에 필요한 수학 연산은 대부분 이미 MATLAB 안에 함수로 들어 있다.
이 장은 그 함수들을 묶음별로 훑고, 각 묶음에서 실제로 틀리기 쉬운 지점을 짚는다.

## 목차

| 절 | 제목 | 내용 |
|----|------|------|
| [3.1](3.1-builtin-functions-help.md) | 내장 함수 사용과 도움말 | 함수의 3요소, 다중 입력·출력, `help`/`doc`/`which` |
| [3.3](3.3-elementary-math.md) | 기초 수학 함수 | 로그·지수, 반올림 4종, 이산수학, `factorial`의 한계 |
| [3.4](3.4-trigonometry.md) | 삼각함수 | 라디안이 기본, `sind` 계열, `pi`는 근삿값 |
| [3.5](3.5-data-analysis.md) | 자료 분석 함수 | 열 우선 원칙, max/mean/sum/sort/size/std |
| [3.6](3.6-random-numbers.md) | 난수 | `rand` 균등, `randn` 정규, 구간 변환 공식 |
| [3.7](3.7-complex-numbers.md) | 복소수 | 입력 방법, `real`/`imag`/`conj`, `'`와 `.'` |
| [3.8](3.8-computational-limits.md) | 계산 한계 | `realmax`/`realmin`, 오버플로·언더플로, `eps` |
| [3.9](3.9-special-values.md) | 특수값과 기타 함수 | `pi`/`Inf`/`NaN`, 함수명 덮어쓰기(shadowing) |
| [해답](solutions.md) | 연습문제 해답 | 24문항 |

> 슬라이드에 3.2절은 없다. 학습 목표 번호와 본문 절 번호가 어긋나 있으며, 본문은 3.1 다음에
> 바로 3.3으로 넘어간다. 이 노트는 슬라이드의 절 번호를 그대로 따랐다.

## 이 장의 큰 줄기

1. **함수는 이름·입력·출력이다.** 입력이 스칼라면 스칼라가, 배열이면 배열이 나온다.
   출력이 여러 개인 함수는 좌변을 대괄호로 묶어 받는다.
2. **자료 분석 함수는 열 우선이다.** 행 방향이 필요하면 전치하거나 차원 2를 지정한다.
3. **부동소수점에는 한계가 있다.** `sin(pi)`는 0이 아니고, `factorial(171)`은 `Inf`이며,
   `0.1+0.2`는 `0.3`이 아니다. `==` 대신 허용 오차로 비교한다.
4. **함수 이름을 변수로 쓰지 마라.** 오류 없이 조용히 틀린 값이 나오는 가장 흔한 사고다.

## 함수 색인

### 일반 수학 · 반올림

| 함수 | 한 줄 설명 | 절 |
|------|-----------|-----|
| `abs(x)` | 절댓값. 복소수면 크기 | [3.3](3.3-elementary-math.md), [3.7](3.7-complex-numbers.md) |
| `sqrt(x)` | 제곱근. 음수를 넣으면 복소수를 준다 | [3.3](3.3-elementary-math.md) |
| `nthroot(x,n)` | 실수 n제곱근. `^(1/n)`과 결과가 다르다 | [3.3](3.3-elementary-math.md) |
| `sign(x)` | 부호 −1 / 0 / 1 | [3.3](3.3-elementary-math.md) |
| `rem(x,y)` | 나머지. 부호는 피제수를 따른다 | [3.1](3.1-builtin-functions-help.md), [3.3](3.3-elementary-math.md) |
| `mod(x,y)` | 나머지. 부호는 제수를 따른다 | [3.3](3.3-elementary-math.md) |
| `exp(x)` | eˣ | [3.3](3.3-elementary-math.md) |
| `log(x)` | **자연로그** ln(x) | [3.3](3.3-elementary-math.md) |
| `log10(x)` | 상용로그 | [3.3](3.3-elementary-math.md) |
| `log2(x)` | 밑이 2인 로그 | [3.3](3.3-elementary-math.md) |
| `round(x[,N])` | 가장 가까운 정수, N자리 반올림 | [3.3](3.3-elementary-math.md) |
| `fix(x)` | 0 방향 버림 | [3.3](3.3-elementary-math.md) |
| `floor(x)` | −∞ 방향 버림 | [3.3](3.3-elementary-math.md) |
| `ceil(x)` | +∞ 방향 올림 | [3.3](3.3-elementary-math.md) |

### 이산수학

| 함수 | 한 줄 설명 | 절 |
|------|-----------|-----|
| `factor(x)` | 소인수분해 | [3.3](3.3-elementary-math.md) |
| `gcd(x,y)` | 최대공약수 | [3.3](3.3-elementary-math.md) |
| `lcm(x,y)` | 최소공배수 | [3.3](3.3-elementary-math.md) |
| `rats(x)` | 실수를 분수 문자열로 | [3.3](3.3-elementary-math.md) |
| `factorial(x)` | 계승. 170!이 한계, 171!은 `Inf` | [3.3](3.3-elementary-math.md) |
| `nchoosek(n,k)` | 조합 수. 팩토리얼을 거치지 않아 큰 n도 계산된다 | [3.3](3.3-elementary-math.md) |
| `primes(x)` | x 이하의 소수 전부 | [3.3](3.3-elementary-math.md) |
| `isprime(x)` | 소수 여부 판정 | [3.3](3.3-elementary-math.md) |

### 삼각함수

| 함수 | 한 줄 설명 | 절 |
|------|-----------|-----|
| `sin` `cos` `tan` | 입력이 **라디안** | [3.4](3.4-trigonometry.md) |
| `sind` `cosd` `tand` | 입력이 **도(degree)** | [3.4](3.4-trigonometry.md) |
| `asin` `acos` `atan` | 역삼각함수, 결과는 라디안 | [3.4](3.4-trigonometry.md) |
| `asind` `acosd` `atand` | 역삼각함수, 결과는 도 | [3.4](3.4-trigonometry.md) |
| `atan2(y,x)` | 사분면을 구분하는 아크탄젠트 | [3.4](3.4-trigonometry.md) |
| `sinh` `cosh` `tanh` | 쌍곡선 함수 | [3.4](3.4-trigonometry.md) |
| `asinh` `acosh` `atanh` | 역쌍곡선 함수 | [3.4](3.4-trigonometry.md) |
| `deg2rad(x)` / `rad2deg(x)` | 각도 단위 변환 | [3.4](3.4-trigonometry.md) |
| `hypot(a,b)` | 빗변 √(a²+b²). 오버플로에 안전 | [해답 3.4-2](solutions.md#34-삼각함수) |

### 자료 분석

| 함수 | 한 줄 설명 | 절 |
|------|-----------|-----|
| `max(x)` / `min(x)` | 열마다 최대·최소. `[a,b]=max(x)`면 값과 위치 | [3.5](3.5-data-analysis.md) |
| `mean(x)` | 산술평균. `mean(x,2)`는 행 평균 | [3.5](3.5-data-analysis.md) |
| `median(x)` | 중앙값. 이상치에 둔감 | [3.5](3.5-data-analysis.md) |
| `mode(x)` | 최빈값 | [3.5](3.5-data-analysis.md) |
| `sum(x)` / `prod(x)` | 합 / 곱 | [3.5](3.5-data-analysis.md) |
| `cumsum(x)` / `cumprod(x)` | 누적합 / 누적곱. 크기가 그대로다 | [3.5](3.5-data-analysis.md) |
| `sort(x)` | 열마다 독립 정렬. 행 짝이 깨진다 | [3.5](3.5-data-analysis.md) |
| `sortrows(x,n)` | n열 기준으로 행을 통째로 정렬 | [3.5](3.5-data-analysis.md) |
| `size(x)` | `[행 열]` | [3.1](3.1-builtin-functions-help.md), [3.5](3.5-data-analysis.md) |
| `height(x)` / `width(x)` | 행 개수 / 열 개수 (R2020b 이후) | [3.5](3.5-data-analysis.md) |
| `length(x)` | **가장 큰 차원**. 원소 개수가 아니다 | [3.5](3.5-data-analysis.md) |
| `numel(x)` | 전체 원소 개수 | [3.5](3.5-data-analysis.md) |
| `std(x)` / `var(x)` | 표준편차 / 분산. 기본은 N−1로 나눈다 | [3.5](3.5-data-analysis.md) |
| `format rat` | 결과를 분수로 표시 (값은 그대로 double) | [3.5](3.5-data-analysis.md) |

### 난수

| 함수 | 한 줄 설명 | 절 |
|------|-----------|-----|
| `rand(m,n)` | 0~1 균등 난수 | [3.6](3.6-random-numbers.md) |
| `randn(m,n)` | 평균 0·분산 1 정규 난수 | [3.6](3.6-random-numbers.md) |
| `randi(imax,sz)` | 1~imax 정수 난수 | [3.6](3.6-random-numbers.md) |
| `rng(seed)` | 난수 시드 고정. 재현에 필수 | [3.6](3.6-random-numbers.md) |

### 복소수

| 함수 | 한 줄 설명 | 절 |
|------|-----------|-----|
| `complex(x,y)` | 실수부 x, 허수부 y로 복소수 생성 | [3.7](3.7-complex-numbers.md) |
| `real(x)` / `imag(x)` | 실수부 / 허수부 | [3.7](3.7-complex-numbers.md) |
| `isreal(x)` | 저장 형식이 실수면 1 | [3.7](3.7-complex-numbers.md) |
| `conj(x)` | 켤레복소수 | [3.7](3.7-complex-numbers.md) |
| `angle(x)` | 편각(라디안) | [3.7](3.7-complex-numbers.md) |
| `'` / `.'` | 켤레 전치 / 단순 전치 | [3.7](3.7-complex-numbers.md) |
| `roots(p)` | 다항식의 근 | [해답 3.7-2](solutions.md#37-복소수) |

### 한계값 · 특수값 · 도움말

| 함수 | 한 줄 설명 | 절 |
|------|-----------|-----|
| `realmax` / `realmin` | 표현 가능한 최대·최소 부동소수점 수 | [3.8](3.8-computational-limits.md) |
| `intmax` / `intmin` | 표현 가능한 최대·최소 정수 (기본 int32) | [3.8](3.8-computational-limits.md) |
| `eps` | 1과 그 다음 double 사이의 간격 | [3.8](3.8-computational-limits.md), [3.9](3.9-special-values.md) |
| `pi` | 원주율. 상수가 아니라 입력 없는 함수 | [3.9](3.9-special-values.md) |
| `i` / `j` | 허수 단위 | [3.9](3.9-special-values.md) |
| `Inf` | 무한대. 오버플로나 0으로 나눌 때 | [3.8](3.8-computational-limits.md), [3.9](3.9-special-values.md) |
| `NaN` | 정의되지 않은 값. 자기 자신과도 같지 않다 | [3.9](3.9-special-values.md) |
| `isnan(x)` | NaN 판정. `== NaN`은 절대 안 된다 | [3.9](3.9-special-values.md) |
| `clock` / `date` | 현재 시각 / 날짜 | [3.9](3.9-special-values.md) |
| `datetime("now")` | 현재 시각의 최신 방식 | [3.9](3.9-special-values.md) |
| `help` / `doc` | 명령창 도움말 / HTML 문서 | [3.1](3.1-builtin-functions-help.md) |
| `which` | 이름이 어느 파일에서 오는지 확인 | [3.1](3.1-builtin-functions-help.md), [3.9](3.9-special-values.md) |
| `clear 이름` | 변수를 지워 가려진 함수를 되살린다 | [3.9](3.9-special-values.md) |

## 예제 코드

| 파일 | 다루는 내용 |
|------|------------|
| [`ex0301_function_io.m`](../../example/ch03/ex0301_function_io.m) | 스칼라·배열 입력, 다중 입력, 다중 출력, `ans` |
| [`ex0301_help.m`](../../example/ch03/ex0301_help.m) | `help`, `which` |
| [`ex0303_common_math.m`](../../example/ch03/ex0303_common_math.m) | 로그·지수, `nthroot`, `rem` vs `mod` |
| [`ex0303_rounding.m`](../../example/ch03/ex0303_rounding.m) | 반올림 4종 비교 |
| [`ex0303_discrete.m`](../../example/ch03/ex0303_discrete.m) | 이산수학 함수 전반 |
| [`ex0303_factorial_limit.m`](../../example/ch03/ex0303_factorial_limit.m) | 170!/171!, `nchoosek` vs 정의식 |
| [`ex0304_trig_basics.m`](../../example/ch03/ex0304_trig_basics.m) | 라디안/도, 역삼각, `atan2` |
| [`ex0304_trig_plot.m`](../../example/ch03/ex0304_trig_plot.m) | 각도 단위 착각의 시각화 (PNG) |
| [`ex0305_maxmin.m`](../../example/ch03/ex0305_maxmin.m) | `max` 4가지 호출 형태 |
| [`ex0305_average.m`](../../example/ch03/ex0305_average.m) | mean/median/mode, 차원 지정 |
| [`ex0305_sumprod.m`](../../example/ch03/ex0305_sumprod.m) | 조화급수와 `cumsum`, `format rat` |
| [`ex0305_sorting.m`](../../example/ch03/ex0305_sorting.m) | `sort` vs `sortrows` |
| [`ex0305_arraysize.m`](../../example/ch03/ex0305_arraysize.m) | size/height/width/length/numel |
| [`ex0305_variance.m`](../../example/ch03/ex0305_variance.m) | 표준편차 비교 (PNG) |
| [`ex0306_rand_uniform.m`](../../example/ch03/ex0306_rand_uniform.m) | 구간 변환, 표본 크기 효과 |
| [`ex0306_randn_gaussian.m`](../../example/ch03/ex0306_randn_gaussian.m) | `sigma*randn+mu`, 68-95-99.7 |
| [`ex0306_random_hist.m`](../../example/ch03/ex0306_random_hist.m) | 두 분포의 모양 비교 (PNG) |
| [`ex0307_complex_basics.m`](../../example/ch03/ex0307_complex_basics.m) | 복소수 입력·분해·켤레 |
| [`ex0307_complex_plane.m`](../../example/ch03/ex0307_complex_plane.m) | 복소평면 (PNG) |
| [`ex0308_limits.m`](../../example/ch03/ex0308_limits.m) | 오버플로·언더플로, `eps` |
| [`ex0309_special_values.m`](../../example/ch03/ex0309_special_values.m) | `Inf`, `NaN`, `isnan`, 시간 함수 |
| [`ex0309_shadowing.m`](../../example/ch03/ex0309_shadowing.m) | 함수명 덮어쓰기와 복구 |

모든 `.m` 파일은 R2026a에서 오류 없이 실행되는 것을 확인했다.
