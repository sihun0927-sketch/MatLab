# exam/ch03 — Built-In MATLAB Functions

원본: `Chapter 03.pdf` (81쪽). 참고: [`textbook/ch03/`](../../textbook/ch03/README.md).

- [문제지](questions.md) — 45문항, 해답 없음
- [해답](answers.md) — Command Window 출력, 해설, textbook 근거

## 출제 범위

슬라이드 절 번호를 그대로 따른다. 슬라이드에 3.2절은 없다.

| 절 | 내용 | 문제 수 | 문제 |
| --- | --- | --- | --- |
| 3.1 | 함수의 3요소, 다중 입력·출력, `help`/`doc`, 스크린 팁 | 6 | Q03-01 ~ Q03-06 |
| 3.3 | `abs`/`sqrt`/`nthroot`/`log`/`exp`, 반올림 4종, 이산수학, `factorial`의 한계, `nchoosek` | 10 | Q03-07 ~ Q03-16 |
| 3.4 | 라디안·도, `sin(pi)`, `asin` | 4 | Q03-17 ~ Q03-20 |
| 3.5 | `max`/`min`, 평균, 합·곱·누적, `sort`/`sortrows`, 배열 크기, `std`/`var` | 12 | Q03-21 ~ Q03-32 |
| 3.6 | `rand`/`randn`/`randi`, 범위 변환 | 4 | Q03-33 ~ Q03-36 |
| 3.7 | 복소수 입력, `real`/`imag`/`isreal`, `abs`/`angle`/`conj`, `'`와 `.'` | 3 | Q03-37 ~ Q03-39 |
| 3.8 | 오버플로·언더플로, `realmax`/`realmin`/`intmax`/`intmin` | 3 | Q03-40 ~ Q03-42 |
| 3.9 | `pi()`, `Inf`/`NaN`/`eps`, 함수명 덮어쓰기 | 3 | Q03-43 ~ Q03-45 |
| 합계 | | 45 | |

유형별: `[출력]` 28, `[코드]` 7, `[오류]` 5, `[변형]` 2, `[빈칸]` 1, `[단답]` 2. `[출력]`+`[코드]` = 35/45.

## 원본 예제 색인

슬라이드에 코드나 함수 호출 예가 나온 쪽을 모두 적었다. 개념 설명만 있는 쪽(p.1–4, 6, 12, 18–19, 23, 27, 31, 38, 42, 46, 51, 53–55, 58–59, 62, 67, 79–81)은 뺐다.

| 슬라이드 쪽 | 원본 코드 요지 | 절 | 변형 문제 |
| --- | --- | --- | --- |
| p.5 | `a = 5`, `b = [1 2 3]`, `sin(a)`, `sin(b)` | 3.1 | Q03-01 |
| p.7 | `rem(10,3)` | 3.1 | Q03-02, Q03-05 |
| p.8 | `d=[1,2,3;4,5,6]; f=size(d)` | 3.1 | Q03-03 |
| p.9 | `[rows,cols]=size(d)` | 3.1 | Q03-03, Q03-04 |
| p.10 | `g = sqrt(sin(` 입력 중 스크린 팁 | 3.1 | Q03-06 |
| p.11 | `help tan`, `doc tan` | 3.1 | Q03-06 |
| p.13 | Table 3.1 `abs(-3)`, `sqrt(85)`, `nthroot(-2,3)`, `(-2)^(1/3)`, `sign(-8)`, `rem(25,4)`, `exp(10)`, `log(10)`, `log10(10)` | 3.3 | Q03-07, Q03-08, Q03-09 |
| p.14 | HINT `log`는 자연로그, `log10`, `log2` | 3.3 | Q03-09 |
| p.15 | HINT `exp(3)`, `5e3` | 3.3 | Q03-09 |
| p.16 | 사과 $5.00 / $0.52 = 9.6154, `fix` | 3.3 | Q03-11 |
| p.17 | Table 3.2 `round(8.6)`, `round(8.6436,3)`, `fix(8.6)`, `fix(-8.6)`, `floor(-8.6)`, `ceil(-8.6)` | 3.3 | Q03-10 |
| p.20 | `factorial(5)`, `5*4*3*2*1` | 3.3 | Q03-13 |
| p.21 | `factorial(170)` → `7.2574e+306` | 3.3 | Q03-13 |
| p.22 | `factorial(171)` → `Inf` | 3.3 | Q03-13 |
| p.24 | `nchoosek(200,2)`, `factorial(200)/(factorial(198)*factorial(2))` → `NaN` | 3.3 | Q03-14, Q03-15 |
| p.25 | HINT `!`는 연산자가 아니다 | 3.3 | Q03-16 |
| p.26 | Table 3.3 `factor(12)`, `gcd(10,15)`, `lcm(2,5)`, `rats(1.5)`, `factorial(6)`, `nchoosek(10,3)`, `primes(10)`, `isprime(7)` | 3.3 | Q03-12 |
| p.28 | `sin(pi)` → `1.2246e-016` | 3.4 | Q03-18 |
| p.29 | HINT `a = sin^-1(x)` → `a = asin(x)` | 3.4 | Q03-19 |
| p.30 | Table 3.4 `deg2rad(90)`, `rad2deg(pi)`, `sin(0)`, `cos(pi)`, `tan(pi)`, `asin(-1)`, `sinh(pi)`, `asinh(1)`, `sind(90)`, `asind(1)` | 3.4 | Q03-17, Q03-20 |
| p.32 | `x = [1 5 3; 2 4 6]; max(x)` | 3.5 | Q03-21 |
| p.33 | `max(x')` | 3.5 | Q03-21 |
| p.34 | `max(x,[],2)` | 3.5 | Q03-22 |
| p.35 | `[a,b]=max(x)` | 3.5 | Q03-23 |
| p.36 | HINT `max = max(x)` | 3.5 | Q03-24 |
| p.37 | Table 3.5 `max(x)`, `[a,b] = max(x)`, `max(x,y)`, `min(x)` | 3.5 | Q03-22, Q03-23 |
| p.39 | `mean(x)`, `mean(x,2)` | 3.5 | Q03-25 |
| p.40 | Table 3.6 `mean`, `median`, `mode` | 3.5 | Q03-25 |
| p.41 | `a = sum(x)` | 3.5 | Q03-26 |
| p.43 | `k=1:5; sequence = 1./k`, `format rat`, `format short`, `series = cumsum(sequence)` | 3.5 | Q03-27 |
| p.44 | Table 3.7 `sum(x)`, `prod(x)` | 3.5 | Q03-26 |
| p.45 | Table 3.7 `cumsum(x)`, `cumprod(x)` | 3.5 | Q03-26 |
| p.47 | `x = [1 3; 10 2; 3 1; 82 4; 5 5]`, `sort(x)`, `sort(x,"descend")` | 3.5 | Q03-28, Q03-29 |
| p.48 | `sortrows(x,1)`, `sortrows(x,2)` | 3.5 | Q03-30 |
| p.49 | Table 3.8 `sort(x)`, `sort(x,"descend")` | 3.5 | Q03-29 |
| p.50 | Table 3.8 `sortrows(x)`, `sortrows(x,2)`, 음수 n은 내림차순 | 3.5 | Q03-30 |
| p.52 | Table 3.10 `size(x)`, `[a,b] = size(x)`, `height`, `width`, `length`, `numel` | 3.5 | Q03-31 |
| p.56 | `std(scores1)`, `std(scores2)`, `var(scores1)`, `var(scores2)` | 3.5 | Q03-32 |
| p.57 | Table 3.12 `std([1 5 3])`, `std([1 5 3;2 4 6])`, `var(x)` | 3.5 | Q03-32 |
| p.60 | `x_max = 10; x_min = 5; x = rand(100,1); x = (x_max-x_min)*x + x_min;`, `mean`, `max`, `min` | 3.6 | Q03-33 |
| p.61 | 같은 코드를 `rand(10000,1)`로 | 3.6 | Q03-33 |
| p.63 | `x = standard_deviation * random_data_set + mean` | 3.6 | Q03-34 |
| p.64 | `sigma = 2.5; average = 3; x = randn(1,500); std(x); x = sigma*x+average;`, `std`, `mean` | 3.6 | Q03-34 |
| p.65 | 같은 코드를 `randn(1,50000)`로 | 3.6 | Q03-34 |
| p.66 | Table 3.13 `rand(2)`, `rand(3,2)`, `randn(2)`, `randn(3,2)`, `sz = [2,3]; randi(10,sz)` | 3.6 | Q03-35 |
| p.68 | `A = 5 + 3i`, `A = 5 + 3*i`, `A = 5 + 3*j`, `A = complex(5,3)` | 3.7 | Q03-39 |
| p.69 | `x = 1:3; y = [-1,5,12]; complex(x,y)` | 3.7 | Q03-39 |
| p.70 | `A = 5+3i`, `real(A)`, `imag(A)`, `isreal(A)` | 3.7 | Q03-37 |
| p.71 | `A = 5+3i`, `A'` | 3.7 | Q03-38 |
| p.72 | Table 3.14 `abs`, `angle`, `complex`, `real`, `imag`, `isreal`, `conj` (x = 3 + 4i) | 3.7 | Q03-38 |
| p.73 | `x = 2.5e200; y = 1.0e200; z = x*y` → `Inf`, `realmax` | 3.8 | Q03-40 |
| p.74 | `x = 25e-200; y = 1.0e200; z = x/y` → `0`, `realmin` | 3.8 | Q03-41 |
| p.75 | Table 3.15 `realmax`, `realmin`, `intmax`, `intmin` | 3.8 | Q03-42 |
| p.76 | `pi()` | 3.9 | Q03-45 |
| p.77 | `sin = 10; sin(5)` → 인덱스 오류 | 3.9 | Q03-43 |
| p.78 | Table 3.16 `pi`, `i`, `j`, `5/0`, `0/0`, `inf/inf`, `clock`, `date`, `eps` | 3.9 | Q03-44, Q03-45 |

## 슬라이드와 R2026a의 차이 (해답에 반영)

- p.28, p.30, p.78: 지수 표기 `1.2246e-016`, `2.2204e-016`은 구버전 형식이다. R2026a는 `e-16`으로 찍는다.
- p.78: `5/0`, `0/0`의 `Warning: Divide by zero.`는 현재 나오지 않는다.
- p.59: 균등 난수를 "also called normal random numbers"라고 한 것은 슬라이드의 오기다(Q03-36).

`answers.md`에서 `[확인 필요]`로 표시한 7곳은 MATLAB에서 표시 형식을 확인할 목록이다.
