# Chapter 12 — Symbolic Mathematics

원서: Holly Moore, *MATLAB for Engineers* 6th ed., Chapter 12 (`Chapter 12_1.pdf` 52쪽 + `Chapter 12_2.pdf` 57쪽).

> 슬라이드 본문의 절 번호(12.1~12.7)를 따랐다. 12_1은 Introduction과 12.1~12.3, 12_2는 12.4~12.7을 다룬다. 슬라이드 화면은 **R2022a**다.

> **[보강]** **이 장을 읽기 전에.** 이 PC의 MATLAB R2026a에는 **Symbolic Math Toolbox가 설치되어 있지 않다**(`syms` → `정의되지 않았습니다` 오류). 그래서 이 장의 symbolic 출력은 **슬라이드 화면을 그대로 옮긴 것**이고 R2026a에서 다시 실행하지 못했다. 자세한 내용은 맨 아래 [실행 환경 메모](#실행-환경-메모)에 있다.

## 이 장이 다루는 것

MATLAB의 **symbolic toolbox**로 **symbolic array**를 만들 수 있다. symbolic array는 다음에 쓴다.

- symbolic expression을 **다루고 단순화**한다(manipulate and simplify).
- 그것을 **기호로 푼다**(solve symbolically).
- 그것을 **수치로 계산**한다(evaluate numerically).

또 다음을 할 수 있다.

- **미분**(take derivatives)
- **적분**(integrate)
- **선형대수 조작**(linear algebraic manipulations)

더 고급 기능으로는 다음이 있다.

- **Laplace 변환**(슬라이드 표기: LaPlace transforms)
- **Fourier 변환**
- **가변 정밀도 연산**(variable-precision arithmetic)

### The Symbolic Toolbox is an Add-on

- Symbolic Toolbox는 MATLAB **professional 버전에서는 선택 사항(optional)** 이다.
- **student 버전에는 기본 포함**(comes standard)이다.

### 숫자 계산과 기호 계산

> **[보강]** 앞 장까지는 변수에 **숫자**를 넣고 계산했다. 이 장은 변수에 값을 넣지 않고 **식 자체**를 다룬다.
>
> | | 숫자 계산 (Chapter 2~11) | 기호 계산 (Chapter 12) |
> |---|---|---|
> | 변수 | 값이 있다 (`x = 3`) | 값이 없다 (`syms x`) |
> | 결과 | 근삿값 (`0.7266`) | 정확한 식 (`(2*11^(1/2))/5 - 3/5`) |
> | 화면 표시 | 들여쓴다 | 들여쓰지 않는다 |
> | Class | `double` | `sym`, `symfun` |
> | 방정식 풀기 | `roots`, `A\B` | `solve` |
> | 미분·적분 | 숫자 `diff`(차이), `integral` | symbolic `diff`, `int` |
> | 미분방정식 | 수치 해법(뒤 장) | `dsolve` |
> | 그래프 | `plot(x,y)` | `fplot(식)` |
> | 서로 바꾸기 | `sym(값)` | `double`, `matlabFunction` |

## 목차

| 절 | 제목 | 내용 |
|---|---|---|
| [12.1](12.1-symbolic-algebra.md) | Symbolic Algebra, 12.1.1 Creating Symbolic Objects | 단순화와 정보 손실, 식 재배열, `sym` vs `syms`, expression·function·equation, `=` vs `==` |
| [12.1.2](12.1.2-manipulating-expressions.md) | Manipulating Symbolic Expressions and Equations | 자동 정리, `simplify`, `expand`, `factor`, `collect`, `combine`, `numden` |
| [12.2.1](12.2.1-solve.md) | The `solve` Function | expression = 0, 기본 변수 x, 둘째 입력, equation 두 전략, `double` |
| [12.2.2](12.2.2-systems-of-equations.md) | Solving Systems of Equations | structure 결과, `answer.x`, `[X,Y,Z] = solve(...)` 알파벳 순, 행렬 vs `solve` |
| [12.2.3](12.2.3-substitution-and-symfun.md) | Substitution and Symbolic Functions | `subs` 3입력, 원본 불변, 배열 대입, `symfun` |
| [12.3](12.3-symbolic-plotting.md) | Symbolic Plotting | `fplot` 기본 −5~5, 범위·주석, `fimplicit`, 매개변수 그래프, 숫자↔symbolic 대응표 |
| [12.4](12.4-units-of-measurement.md) | Units of Measurement | `symunit`, `u.m`, tab expansion, `simplify`, `unitConvert`, `separateUnits`, 온도 Absolute |
| [12.5.1](12.5.1-differentiation.md) | Differentiation | `diff` overloaded, 기본 변수 x, 변수 지정, 고차 도함수 |
| [12.5.2](12.5.2-integration.md) | Integration | P-V work, `int` 부정적분, 기본 변수, 정적분, 기호 구간 |
| [12.6.1](12.6.1-first-order-ode.md) | Differential Equations, First-Order | 종속·독립 변수, `syms y(t)`, `dsolve`, `C1`, 경계 조건 |
| [12.6.2](12.6.2-higher-order-ode.md) | Higher-Order Differential Equations | 2차 ODE, `Dx = diff(x)`, 초기값·경계값 문제, 연립 ODE, 풀 수 없는 경우 |
| [12.7](12.7-matlabfunction.md) | Converting Symbolic Expressions to Anonymous Functions | `matlabFunction`, `dy(5)` vs `g(5)` |
| [solutions.md](solutions.md) | 연습문제 해답 | 각 절 연습문제 해설 |

## 함수/연산자 색인

> 절 칸에 `[보강]`이 붙은 행은 슬라이드에 없고 본문의 `[보강]` 블록에서만 다룬 것이다.

| 이름 | 한 줄 설명 | 절 |
|---|---|---|
| `sym` | 문자 `'x'`에 symbolic 타입을 준다. `x = sym('x')` | 12.1 |
| `syms` | symbolic variable(여러 개 가능)·function을 한 문장으로 만든다 | 12.1 |
| `syms fun(x,z)` | symbolic function `fun`과 변수 `x`, `z`를 만든다 | 12.1 |
| `f(x) = …` | x가 이미 symbolic이면 함수를 한 단계로 정의 | 12.1 |
| `==` | symbolic **equation**의 등호 (`=`는 대입) | 12.1 |
| `simplify` | 내장 규칙으로 단순화. expression·function·equation 모두. 단위 정리에도 쓴다 | 12.1.2, 12.4 |
| `expand` | 모든 부분을 곱해서 전개 | 12.1.2 |
| `factor` | 인수분해 (숫자 입력이면 소인수분해) | 12.1.2 |
| `collect` | 동류항 모으기 | 12.1.2 |
| `combine` | 거듭제곱의 곱을 하나의 거듭제곱으로 | 12.1.2 |
| `numden` | 분자와 분모. **equation에는 불가** | 12.1.2 |
| `solve` | expression = 0 의 근, equation의 해, 연립방정식 | 12.2.1, 12.2.2 |
| `solve(식, 변수)` | 지정한 변수에 대해 푼다 | 12.2.1 |
| `double` | symbolic 결과 → double 숫자 | 12.2.1, 12.4, 12.7 |
| `roots` | 다항식 계수 → 근(숫자). `solve` 검산용 | 12.2.1 [보강] |
| `answer.x` | `solve` 결과 structure에서 답 꺼내기 | 12.2.2 |
| `[X,Y,Z] = solve(…)` | 답을 변수 각각에 (알파벳 순) | 12.2.2 |
| `A\B` | 선형 연립방정식의 행렬 풀이(Chapter 10) | 12.2.2 [보강] |
| `subs(식, 옛, 새)` | 대입. 원본은 바뀌지 않는다. 배열도 가능 | 12.2.3 |
| `symfun(식, [변수])` | 기존 expression → symbolic function | 12.2.3 |
| `fplot` | symbolic expression/function 그리기. 기본 범위 −5~5 | 12.3 |
| `fplot(x식, y식, [t범위])` | 매개변수 그래프 | 12.3 |
| `fimplicit` | x, y의 음함수 그리기 (`==`) | 12.3 |
| `title`, `xlabel`, `ylabel`, `axis`, `figure` | 주석과 축은 평소 방식대로 | 12.3 |
| `fplot3`, `fmesh`, `fsurf`, `fimplicit3`, `fcontour`, `ezpolar` | `plot3`, `mesh`, `surf`, (없음), `contour`, `polarplot`의 symbolic 짝 | 12.3 |
| `symunit` | 단위 모음을 Workspace에 추가 (`u = symunit`) | 12.4 |
| `u.m`, `u.ft`, `u.sec`, `u.K`, `u.Celsius` | dot 표기로 단위 지정 | 12.4 |
| `unitConvert(식, 단위)` | 원하는 단위로 변환. 온도는 `"Temperature","Absolute"` | 12.4 |
| `separateUnits` | 값과 단위를 분리 (출력 2개) | 12.4 |
| `diff(y)`, `diff(y,v)`, `diff(y,n)`, `diff(y,v,n)` | 도함수. 기본 변수 x, 변수 지정, 차수 지정 | 12.5.1 |
| 숫자 `diff` | 인접 원소의 차 (overloaded) | 12.5.1 [보강] |
| `int(y)`, `int(y,v)` | 부정적분 | 12.5.2 |
| `int(y,a,b)`, `int(y,v,a,b)` | 정적분. 구간은 숫자 또는 기호 | 12.5.2 |
| `integral` | function handle의 수치 적분. `int` 검산용 | 12.5.2 [보강] |
| `syms y(t)` | 종속 변수를 t의 함수로 선언 | 12.6.1 |
| `dsolve(eqn)` | 미분방정식의 일반해 (`C1`, `C2` …) | 12.6.1, 12.6.2 |
| `dsolve(eqn, cond, …)` | 경계 조건을 주어 푼다 | 12.6.1, 12.6.2 |
| `Dx = diff(x)` | 도함수 조건 `Dx(0)==1`을 쓰기 위한 symbolic function | 12.6.2 |
| `dsolve(eq1, eq2)` | 연립 미분방정식 → structure | 12.6.2 |
| `matlabFunction` | symbolic expression/function → anonymous function | 12.7 |

## 챕터 요약 (시험 직전 체크리스트)

### Symbolic 객체

- symbolic toolbox는 **add-on**: professional은 선택, **student는 기본 포함**.
- `x = sym('x')`(두 단계) vs **`syms x`**(한 문장, **기본으로 쓴다**). `syms a b`처럼 공백으로 여러 개.
- 객체 4종: **simple variable**, **expression**, **function**(expression의 한 종류), **equation**.
- expression: `k = k0*exp(-Q/(R*T))`. function: `syms fun(x,z)` → `fun(x,z) = 2*x^2+4*z`. equation: `ideal_gas_law = P*V == R*Temp*n`.
- **`=`는 대입, `==`는 방정식의 등호.**
- symbolic expression에는 **array 연산자가 필요 없다.**
- symbolic 결과는 **들여쓰지 않는다.** 식이 들어 있어도 Workspace에는 **1×1 sym**.
- `fun(3,4)` → `34`. **숫자처럼 보여도 언제나 symbolic.**
- x가 이미 symbolic이면 `f(x) = x^2 + 2`로 **한 단계**에 함수 정의.
- 단순화하면 **정보를 잃을 수 있다**: `2(x+3)²/(x²+6x+9) = 2`는 x = −3에서 정의되지 않는다.

### 단순화

- MATLAB은 식을 만들 때 **자동으로 항을 합친다**(`a + (a - 3)^2 - a^2 - 1`). 완전히 단순화하지는 않는다.
- **`simplify`**: 가장 일반적. expression, function, equation 모두. `simplify(z)` → `8 - 5*a`, `simplify(f2(x))` → `x^2 - 4`, `simplify(w)` → `x^3 + 8 == x^2`.
- `expand`(전개), `factor`(인수분해), `collect`(동류항), `combine`(거듭제곱 합치기), **`numden`(분자·분모, equation 불가)**.

### `solve`

- expression을 넣으면 **= 0** 으로 놓고 근을 구한다. `solve(x^2-9)` → `-3`, `3` (**2×1 sym**).
- **x를 우선**해서 푼다. x가 없으면 알파벳상 **x에 가장 가까운 변수**. 다른 변수는 **둘째 입력**: `solve(a*x^2+b*x+c, a)` → `-(c + b*x)/x^2`.
- equation 풀기 두 전략: 우변을 빼서 expression으로(`solve(5*x^2+6*x-7)`), 또는 `==`로 그대로(`solve(e2)`).
- 결과는 **분수로 가능한 한 단순하게**: `(2*11^(1/2))/5 - 3/5`. 숫자는 **`double`** → `-1.9266`, `0.7266`.
- 연립방정식: 기본 결과는 **structure** → `answer.x`. `[X,Y,Z] = solve(...)`는 **알파벳 순**(tricky).
- 행렬 풀이는 **빠르지만 1차 다항식만**. `solve`는 느릴 수 있지만 **비선형·기호 변수** 가능.

### 대입

- **`subs(식, 바꿀 변수, 새 값)`**: 입력 3개. **원본은 바뀌지 않는다**(결과는 `ans` 또는 지정한 이름).
- 여러 개: `subs(e4,[a,b,c],[1,2,3])`. 배열: `subs(e6,x,1:5)` → `[6, 11, 18, 27, 38]`.
- 한 번이면 `subs`, **반복이면 symbolic function**. **`symfun(식,[변수들])`** 로 기존 expression을 함수로.

### 그래프

- `fplot`은 **overloaded**. 기본 x 범위 **−5 ~ 5**, 범위는 둘째 입력 `[-10,10]`. x 값은 MATLAB이 자동 선택. 주석은 평소대로.
- **`fimplicit(x^2 + y^2 == 1,[-1.5,1.5])`**: 음함수. **`fplot(sin(t),cos(t),[0,2*pi])`**: 매개변수.
- 대응: `plot`↔`fplot`, `plot3`↔`fplot3`, `mesh`↔`fmesh`, `surf`↔`fsurf`, `contour`↔`fcontour`, `polarplot`↔**`ezpolar`**. `fimplicit`, `fimplicit3`는 숫자 짝이 없다.

### 단위

- **`u = symunit`**(이름 `u`는 임의). 7개 SI 기본 단위: A, K, kg, m, mol, s, cd.
- `distance1 = 5*u.m` → `5*[m]`. `u.feet`은 오류 → **`u.ft`**. 이름은 **Tab**으로 고른다.
- 단위는 **자동으로 단순화되지 않는다**: `(1/2)*([m]/[ft])` → `simplify` → `625/381` → `double` → `1.6404`.
- `10*[ft] + 170*[m]` → `simplify` → `(216310/381)*[ft]`(단위는 MATLAB이 선택) → **`unitConvert(total,u.m)`** → `(21631/125)*[m]`.
- **`[값, 단위] = separateUnits(total)`** → `double(값)` → `173.0480`.
- 온도: 기본은 **온도 차**(`5*[K]`). 실제 온도는 **`"Temperature","Absolute"`** → `(5563/20)*[K]` = 278.15 K.

### 미적분

- **`diff`**(overloaded): `diff(y)`는 기본 변수 **x**(변수가 하나면 그 변수). 둘째 입력은 **변수 또는 차수**, 셋째 입력은 차수. `diff(dist,2)`, `diff(y,z,2)` → `-18*z`.
- 속도 = 거리의 1차 도함수, 가속도 = 속도의 도함수 = 거리의 2차 도함수.
- **`int`**: `int(y)` 부정적분(**`+ C` 없음**), `int(y,t)` 변수 지정, `int(y,2,3)` → `19/3`, `int(y,z,2,3)`, 구간은 기호도 가능(`int(y,z,b,c)`).
- 기본 적분 변수는 **x 또는 x에 가장 가까운 글자**. 다른 변수는 상수 취급.
- 일 $W = \int P\,dV$: dV = 0이면 W = 0, P 일정이면 W = PΔV, P-V 곡선 아래 넓이.

### 미분방정식

- 미분방정식 = 종속 변수 + 그 도함수. ODE의 **기본 독립 변수는 t**.
- 해가 여러 개(함수 족 $y = C_1e^t$). **초기 조건**으로 하나를 정한다.
- **`syms y(t)`** → `eqn = diff(y,t)==2*y/t` → **`dsolve(eqn)`** → `C1*t^2`. `y(t)`로 쓰든 `y`로 쓰든 결과가 같다.
- 경계 조건은 **둘째 입력**: `dsolve(eqn,y(-1)==1)` → `t^2`. 이름을 붙여도 된다(`cond`).
- **차수만큼** 조건이 필요. 2차는 `C1`, `C2`. 도함수 조건은 **`Dx = diff(x)`** → `Dx(0)==1`.
- 초기값 문제(`x(0)==1,Dx(0)==1`)와 경계값 문제(`x(0)==1,x(10)==10`) 모두 가능. 모든 조건이 해를 주지는 않는다.
- 연립: `syms x(t) y(t)`, `a = dsolve(diff(x)==y, diff(y)==x)` → **structure**(`a.x`, `a.y`). 변수마다 조건 하나.
- 기호로 **못 푸는 미분방정식**이 많다 → 수치 기법(뒤 장).

### 숫자 함수로 변환

- **`matlabFunction`**: symbolic expression/function → **anonymous function**. `f = matlabFunction(dy)` → `@(x)-sin(x)`.
- `dy(5)` → `1/25 - (6*exp(-5))/25` (**symbolic**), `g(5)` → `0.0384` (**double**).

## 슬라이드에서 주의할 점과 R2026a 확인 사항

> **[보강]** 슬라이드 화면은 R2022a다. symbolic 부분은 R2026a에서 다시 실행하지 못했으므로 아래는 **확인할 수 있었던 것만** 적었다. 시험 답안에는 슬라이드 설명을 쓴다.
>
> | 슬라이드 | 확인한 내용 | 절 |
> |---|---|---|
> | 표의 `fimplict3` | **오타.** 함수 이름은 `fimplicit3`(R2026a에 존재) | 12.3 |
> | "Symbolic Toolbox includes … plotting functions" | `fplot`, `fplot3`, `fmesh`, `fsurf`, `fimplicit`, `fimplicit3`, `fcontour`, `ezpolar`는 **기본 MATLAB에 있다**. function handle 입력은 toolbox 없이 동작. symbolic 입력을 받는 것이 toolbox 몫(overloaded) | 12.3 |
> | `function_handle with value:` | 한국어 로케일에서는 `다음 값을 갖는 function_handle:` | 12.7 |
> | `diff(y,t)==2*y/t`를 "function handle"로 부름 | `@` function handle이 아니라 **`(t)`를 뗀 함수 이름 `y`** 를 뜻한다 | 12.6.1 |
> | `dsolve(eqn,x(0)==1,Dx(0)==1)`과 `x(10)==10`의 출력 | 화면 오른쪽이 **잘려 있다**. 잘린 부분은 수학적으로 완성해 적었다 | 12.6.2 |
> | `factor` | toolbox가 없으면 숫자 `factor`(소인수분해)만 있다. `factor(12)` → `2 2 3` | 12.1.2 |
> | `LaPlace`, `System Internationale` | 슬라이드 표기. 보통 Laplace, Système International로 쓴다 | 도입, 12.4 |
>
> 오류 메시지는 한국어 로케일에서 한국어로 나온다. `=`를 잘못 쓴 경우의 메시지는 12.1과 12.2.1에 적었다.

## 실행 환경 메모

> **[보강]** 사용자 요청에 따라 이 장은 `textbook/`만 만들었다. `example/ch12/*.m` 파일은 없고 코드는 md에 인라인으로만 있다.
>
> **Symbolic Math Toolbox가 없다.** 이 PC의 R2026a에서 `syms`, `sym`, `solve`, `dsolve`, `subs`, `int`, `symunit`, `matlabFunction` 등은 모두 존재하지 않는다(`exist` = 0). 그래서:
>
> - **슬라이드의 symbolic 코드와 출력**: 슬라이드(R2022a) 화면을 **그대로** 옮겼다. CLAUDE.md는 슬라이드 코드를 옮겨 적지 말고 새 코드를 쓰라고 하지만, 실행할 수 없는 새 코드의 출력은 확인할 길이 없어서 화면에 찍힌 출력이 있는 슬라이드 예제를 그대로 썼다.
> - **슬라이드 결과의 수학적 검산**: 슬라이드 결과(단순화, 근, 연립방정식, 대입, 도함수, 적분, 미분방정식의 해, 단위 변환 분수)를 SymPy와 손계산으로 다시 계산해 일치를 확인했다.
> - **`[보강]` 예제와 연습문제의 symbolic 답**: SymPy로 수학적으로만 검증했다. **MATLAB이 실제로 표시하는 형태(항의 순서, 묶는 방식)는 다를 수 있다.**
> - **R2026a에서 실제로 실행한 것**: `roots([5 6 -7])`, `A\B`, 숫자 `diff`, `integral`, 슬라이드에 찍힌 anonymous function(`@(x)-sin(x)`, `g(5)`, `g([1 2 3])`, `g(0)`), `=` 오류 메시지, 함수 존재 여부(`exist`, `which`).
> - **그림(`img/` 7개)**: 같은 식을 **function handle로 바꿔** R2026a에서 그렸다(`theme(gcf,"light")` 후 `exportgraphics`). `fplot` 계열은 function handle 입력도 받으므로 symbolic 입력과 같은 그림이다.
>
> toolbox를 설치하면 본문 코드를 그대로 실행해 출력 형태를 확인할 수 있다.
