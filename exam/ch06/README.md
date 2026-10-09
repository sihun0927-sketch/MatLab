# exam/ch06 — User-Defined Functions

원본: `Chapter 06.pdf` (72쪽). 참고: [textbook/ch06](../../textbook/ch06/README.md).
문제지 [questions.md](questions.md), 해답 [answers.md](answers.md).

## 출제 범위

사용자 정의 함수 전반. 함수 정의줄과 파일 이름 규칙, 스크립트 끝의 local function, `help`와 H1 line,
다중 입출력과 `~`, 입출력 없는 함수(`star`), `nargin`/`nargout`/`varargout`, local·global 변수,
`type`, subfunction과 nested function, 함수 탐색 순서와 search path, anonymous function과 function handle
(값 박제, `save`/`load`), function function(`fplot`).

슬라이드의 수치 예제는 대부분 정수가 되도록 값을 바꿔 출제했다. `distance(10)`이 `490.0000`으로 찍히는 것처럼
슬라이드가 이미 보여준 부동소수점 표시는 그대로 문제로 썼다.

## 절별 문제 수

| 절 | textbook | 문제 | 수 | [출력]+[코드] |
| --- | --- | --- | --- | --- |
| 6.1 함수 파일 (6.1.1–6.1.2) | [6.1](../../textbook/ch06/6.1-function-files.md) | Q06-01 ~ Q06-08 | 8 | 4 |
| 6.1.3–6.1.4 다중 입출력, 입출력 없는 함수 | [6.1.3](../../textbook/ch06/6.1.3-multiple-io.md) | Q06-09 ~ Q06-15 | 7 | 5 |
| 6.1.5 nargin, nargout | [6.1.5](../../textbook/ch06/6.1.5-nargin-nargout.md) | Q06-16 ~ Q06-21 | 6 | 5 |
| 6.1.6–6.1.8 local, global, 함수 코드 | [6.1.6](../../textbook/ch06/6.1.6-local-global.md) | Q06-22 ~ Q06-28 | 7 | 6 |
| 6.2 Subfunction | [6.2](../../textbook/ch06/6.2-subfunctions.md) | Q06-29 ~ Q06-33 | 5 | 3 |
| 6.3 나만의 toolbox | [6.3](../../textbook/ch06/6.3-toolbox-search-path.md) | Q06-34 ~ Q06-36 | 3 | 1 |
| 6.4 Anonymous function, handle | [6.4](../../textbook/ch06/6.4-anonymous-functions.md) | Q06-37 ~ Q06-42 | 6 | 5 |
| 6.5 Function function | [6.5](../../textbook/ch06/6.5-function-functions.md) | Q06-43 ~ Q06-45 | 3 | 1 |
| 합계 | | | 45 | 30 |

유형별: [출력] 25, [코드] 5, [변형] 4, [오류] 5, [빈칸] 2, [단답] 4.

## 원본 예제 색인

| 슬라이드 쪽 | 원본 코드 요지 | 절 | 변형 문제 |
| --- | --- | --- | --- |
| p.7 | `function result = calculation(a)` (정의줄 네 요소) | 6.1.1 | Q06-01 |
| p.9–10 | `poly.m`: `output = 3*x.^3 + 5*x.^2 - 2*x +1;`, 파일 이름 = 함수 이름 | 6.1.1 | Q06-02, Q06-03, Q06-04 |
| p.11 | `clf`, `poly(5)` → `ans = 491` | 6.1.1 | Q06-02, Q06-04, Q06-35 |
| p.13–14 | 스크립트 끝 `square`: `x = [2,5,6]; y1_scalar = square(3)`, `y1_array = square(x)` | 6.1.1 | Q06-05, Q06-07 |
| p.15 | `N = 1:100; n = grain_size(N); plot(N,n)` + local `grain_size` | 6.1.1 | Q06-06 |
| p.17–19 | `g.m`: `a = x.*y;`, `x=1:5; y=5:9; z=g(x,y)` → `5 12 21 32 45` | 6.1.3 | Q06-09, Q06-10, Q06-11 |
| p.21–22 | `motion.m`, `[distance, velocity, acceleration] = motion(10)` | 6.1.3 | Q06-08, Q06-12 |
| p.23 | `motion(10)` → `ans = 83.3333` (첫 출력만) | 6.1.3 | Q06-13, Q06-14 |
| p.24–26 | `function [] = star( )`, `polarplot(theta,r)`, `axis off` | 6.1.4 | Q06-15 |
| p.27–28 | `A = star` → `Too many output arguments.` | 6.1.4 | Q06-15 |
| p.31 | `nargin("sin")`, `nargin("rem")`, `nargin("surf")` → 1, 2, −1 | 6.1.5 | Q06-16, Q06-17, Q06-21 |
| p.33 | `nargout("sin")`, `nargout("max")`, `nargout("size")` → 1, 2, −1 | 6.1.5 | Q06-16, Q06-17, Q06-21 |
| p.34 | `mySize` (`varargout`), `fun = 'mySize'; nargout(fun)` → −2 | 6.1.5 | Q06-18 |
| p.35–38 | `star1`: `if nargout==1, A = "Twinkle twinkle little star"`, `x = star1` | 6.1.5 | Q06-19, Q06-20 |
| p.39–41 | `g(10,20)` → `ans = 200`, workspace에는 `ans`만 | 6.1.6 | Q06-22 |
| p.42 | `a` → `Unrecognized function or variable 'a'.` | 6.1.6 | Q06-22 |
| p.44 | `distance.m` (`result = 1/2*g*t.^2;`), `g = 9.8`, `distance(10)` → 오류 | 6.1.6 | Q06-24 |
| p.45 | 함수 안에 `g = 9.8;`, `distance(10)` → `490.0000` | 6.1.6 | Q06-23, Q06-39 |
| p.48 | `global G` (함수·Command Window 양쪽), `G = 9.8;`, `distance(10)` | 6.1.7 | Q06-25, Q06-26, Q06-27 |
| p.51–53 | `type sphere` → `function [xx,yy,zz] = sphere(varargin)` | 6.1.8 | Q06-28 |
| p.55 | `sample_homework.mlx`: `square`, `cold_work`, `potential_energy` | 6.2 | Q06-31, Q06-32 |
| p.57–58 | `subfunction_demo.m`: `add`, `subtract` subfunction | 6.2.1 | Q06-29, Q06-30, Q06-33 |
| p.59–61 | Set Path / `pathtool`, Add Folder | 6.3 | Q06-34, Q06-35, Q06-36 |
| p.62–63 | `ln = @(x) log(x)`, `y = ln(10)` → `2.3026` | 6.4 | Q06-37, Q06-42 |
| p.64–65 | `save my_ln_function ln`, `clear`, `load my_ln_function` | 6.4 | Q06-38 |
| p.66 | `distance_handle = @(t) distance(t)` | 6.4 | Q06-39 |
| p.67 | `a = 5; b = 10; c= 15; d=20;`, `new_fun = @(x) complicated_function(a, b, c, d, x)` | 6.4 | Q06-40 |
| p.69 | `fplot(ln, [0.1, 10])`, `title`, `xlabel`, `ylabel` | 6.5 | Q06-43, Q06-44 |

슬라이드 밖에서 만든 문제(`원본: [보강]`): Q06-41(`@(x) x^2` 벡터 오류), Q06-45(직접 만드는 function function, `arrayfun`).

## 확인 필요 목록

MATLAB에서 확인할 표시 형식은 [answers.md](answers.md)에 `[확인 필요]`로 남겼다.

- Q06-20: 출력 인수 미할당 오류 앞에 `Error using star1` 줄이 찍히는지
- Q06-28: `type sin`의 정확한 출력
- Q06-44: `clear` 뒤 `fplot(ln(x), …)`의 오류가 `'x'`를 가리키는지 `'ln'`을 가리키는지
