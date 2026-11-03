# Chapter 10 — Matrix Algebra

원서: Holly Moore, *MATLAB for Engineers* 6th ed., Chapter 10 (`Chapter 10.pdf`, 62쪽).

> 슬라이드 본문의 절 번호(10.1.1~10.1.8, 10.2.1~10.2.3, 10.3)를 따랐다. 학습목표(p.2)는 10.1~10.6으로 번호를 매기지만(10.1 기본 연산, 10.2 array vs matrix 연산, 10.3 dot product 활용, 10.4 행렬 곱 활용, 10.5 연립방정식, 10.6 special matrices), 본문 번호와 맞지 않는다. 시험에서 절 번호를 물으면 **본문 쪽**이 기준이다.

## 이 장이 다루는 것

**array**는 정보를 순서 있게 모아 둔 것이다. 숫자뿐 아니라 문자, 기호(symbolic) 데이터 등도 담을 수 있다. **matrix**는 그중 **선형대수(linear algebra)에 쓰는 2차원 숫자 array**다.

- 모든 matrix는 array지만, 모든 array가 matrix는 아니다.
- 엄밀히는 **선형 변환(linear transformation)을 할 생각인 것만** matrix라고 부른다.
- 이 장에서는 정의하는 숫자 array를 모두 선형대수 계산에 쓴다고 보고 matrix라고 부른다.

행렬대수는 공학 곳곳에 쓰인다. 대학 대수에서 처음 배우고 선형대수, 미분방정식 과목에서 확장된다. 공대생은 정역학(statics)과 동역학(dynamics)에서 본격적으로 쓰기 시작하고, 전기공학과 공정공학(process engineering)에서도 널리 쓴다.

5장까지는 **array 연산**(원소별, `.*` `./` `.^`)을 주로 썼다. 이 장은 **matrix 연산**(`*` `^` `'` `\`)과 행렬 전용 함수(`dot`, `cross`, `inv`, `det`, `eye`, `rref`)를 다룬다. 두 연산의 차이가 이 장 전체의 시험 포인트다.

## 목차

| 절 | 제목 | 내용 |
|---|---|---|
| [10.1.1](10.1.1-transpose.md) | Transpose | `'`, 행↔열, 행 벡터 → 열 벡터, 복소수는 켤레(conjugate) |
| [10.1.2](10.1.2-dot-product.md) | Dot product | `sum(A.*B)` = `dot(A,B)`, 순서 무관, 같은 원소 수 |
| [10.1.3](10.1.3-matrix-multiplication.md) | Matrix multiplication | `*`, 원소 = 행·열의 dot product, m×n · n×p, 비가환 |
| [10.1.4](10.1.4-matrix-powers.md) | Matrix powers | `A^2 = A*A`, 정사각 행렬만, 비정수 지수 |
| [10.1.5](10.1.5-matrix-inverse.md) | Matrix inverse | 함수의 역 vs 곱셈의 역, `inv(A)` = `A^-1`, `AA⁻¹ = A⁻¹A = I`, −0.0000 |
| [10.1.6](10.1.6-determinants.md) | Determinants | `det`, singular, 경고 메시지, close to singular |
| [10.1.7](10.1.7-cross-product.md) | Cross product | 벡터곱, `cross`, 3원소, 직교성, 순서 바꾸면 부호 반대 |
| [10.1.8](10.1.8-identity-matrix.md) | Identity matrix | `eye(n)`, `eye(m,n)` |
| [10.2.1](10.2.1-inverse-solution.md) | 역행렬로 연립방정식 풀기 | `AX = B` → `X = inv(A)*B`, 순서 주의, 비효율 |
| [10.2.2](10.2.2-left-division.md) | Left division | `X = A\B`(Gaussian elimination), over-defined, least squares, under-defined |
| [10.2.3](10.2.3-rref.md) | Reduced row echelon | `rref([A, B])`, Gauss-Jordan, 해는 **마지막 열** |
| [10.3](10.3-special-matrices.md) | Special matrices | `pascal`, `magic`, `rosser`, `gallery` |
| [solutions.md](solutions.md) | 연습문제 해답 | 각 절 연습문제 해설 |

## 함수/연산자 색인

> 절 칸에 `[보강]`이 붙은 행은 슬라이드에 없고 본문의 `[보강]` 블록에서만 다룬 것이다.

| 이름 | 한 줄 설명 | 절 |
|---|---|---|
| `A'` | transpose. 복소수면 **켤레** transpose | 10.1.1 |
| `A.'` | 켤레를 취하지 않는 transpose | 10.1.1 [보강] |
| `dot(A, B)` | dot product(scalar product). `sum(A.*B)`와 같다 | 10.1.2 |
| `sum` | 원소 합. `sum(A.*B)`로 dot product 직접 계산 | 10.1.2 |
| `norm(v)` | 벡터 크기. 사잇각 계산에 | 10.1.2 [보강] |
| `A*B` | 행렬 곱. 결과 원소 = A의 행 · B의 열 dot product | 10.1.3 |
| `A(i,:)`, `B(:,j)` | 행 하나, 열 하나 꺼내기 | 10.1.3 |
| `A^n` | 행렬 거듭제곱 `A*A*…*A`. 정사각 행렬만 | 10.1.4 |
| `A.^n` | 원소별 거듭제곱(비교용) | 10.1.4 |
| `asin`, `log`, `exp` | 함수와 역함수 예 | 10.1.5 |
| `inv(A)`, `A^-1` | 역행렬 | 10.1.5 |
| `det(A)` | 행렬식. 0이면 singular(역행렬 없음) | 10.1.6 |
| `rcond`, `cond`, `rank` | 특이성 판단의 더 나은 척도 | 10.1.6 [보강] |
| `cross(A, B)` | cross product(vector product). 3원소 벡터 | 10.1.7 |
| `eye(n)`, `eye(m,n)` | 단위 행렬 | 10.1.8 |
| `diag` | 대각 행렬 만들기 / 대각선 꺼내기 | 10.1.8 [보강] |
| `inv(A)*B` | 역행렬로 `AX = B` 풀기. 비권장 | 10.2.1 |
| `A\B` | left division. Gaussian elimination으로 `AX = B` 풀기 | 10.2.2 |
| `B/A` | right division. `XA = B` 풀기 | 10.2.2 [보강] |
| `pinv`, `lsqminnorm` | 최소 노름 해 | 10.2.2 [보강] |
| `rref(C)` | reduced row echelon form. Gauss-Jordan | 10.2.3 |
| `pascal(n)` | Pascal 삼각형으로 만든 행렬 | 10.3 |
| `magic(n)` | 행·열·대각선 합이 모두 같은 행렬 | 10.3 |
| `rosser` | 고유값 테스트용 8×8 Rosser 행렬 | 10.3 |
| `gallery` | 50개가 넘는 테스트 행렬 모음 | 10.3 |
| `hilb(n)` | Hilbert 행렬(악조건 예) | 10.3 [보강] |

## 챕터 요약 (시험 직전 체크리스트)

### 기본 연산

- **transpose는 `'`.** 행 → 열, 열 → 행. 수학책 표기는 $A^T$. **복소수면 켤레가 된다**(`.'`는 켤레 없음).
- **dot product** = 같은 원소 수의 두 벡터를 원소별로 곱해 더한 것. 결과는 **스칼라**. `dot(A,B)` = `sum(A.*B)`. 행/열 상관없고 **순서도 상관없다**.
- **행렬 곱** `C = A*B`: $C_{i,j} = \sum_k A_{i,k}B_{k,j}$. 결과의 각 원소가 dot product.
- **m×n · n×p → m×p.** 안쪽 두 숫자가 같아야 한다.
- **행렬 곱은 일반적으로 비가환**: $AB \ne BA$. 정사각 행렬은 양쪽 다 계산되지만 **답이 다르다**.
- **`A^3 = A*A*A`**, 정사각 행렬만. **비정수 거듭제곱**은 복소수가 될 수 있다.

### 역행렬, 행렬식, cross

- $AA^{-1} = A^{-1}A = I$. 역행렬은 **`inv(A)`** 또는 **`A^-1`**.
- 결과에 **`-0.0000`** 이 보이면 반올림 오차(round-off error).
- **`det(A) == 0`** 이면 singular, 역행렬 없음. 0에 **가까우면** close to singular / badly scaled, 결과 부정확.
- **cross product**는 결과가 **벡터**(dot product는 스칼라). 두 입력 벡터에 **수직**(orthogonality). 벡터는 **3원소**, 없는 성분은 0.
- **`cross(A,B) = -cross(B,A)`**.
- **`eye(n)`** = n×n 단위 행렬.

### 연립방정식 `AX = B`

- **역행렬**: `X = inv(A)*B`. 순서 주의(`B*inv(A)` 아님). 이해하기 쉽지만 **비효율 + 반올림 오차** → 피할 것.
- **left division**: `X = A\B`. Gaussian elimination. **권장.**
- left division은 **over-defined**(식이 더 많음)도 푼다. 일관되면 같은 답, 비일관이면 **least squares**.
- **under-defined**(미지수가 더 많음)는 일부 변수를 0으로 두고 푼다.
- **`rref([A, B])`**: Gauss-Jordan. 해는 결과의 **마지막 열**.
- **special matrices**: `pascal`, `magic`(흥미로움), `rosser`(고유값 테스트), `gallery`(50개 넘는 테스트 행렬).

## 슬라이드와 R2026a가 다른 점

> **[보강]** 슬라이드 그림은 R2022a다. R2026a에서 다시 실행해 보니 다음이 달랐다. 시험 답안에는 슬라이드 설명을 쓰되, 차이를 알아 두자.
>
> | 슬라이드 | R2026a 실제 | 절 |
> |---|---|---|
> | p.54 "X values are in the final **row**" | 해는 `rref` 결과의 마지막 **열**이다. 그림에서 동그라미 친 것도 열이다 | 10.2.3 |
> | p.51 "첫 번째 변수를 0으로 둔다" | 그 예제는 맞지만 일반 규칙이 아니다. `[1 2 3; 4 5 6]\[6; 15]`은 **둘째** 변수를 0으로 둔다 | 10.2.2 |
> | p.28 `det([1 2 3; 4 5 6; 7 8 9])` = `-9.5162e-16`, `RCOND = 2.202823e-18` | `6.6613e-16`, `RCOND = 1.541976e-18`. 0이 아닌 쓰레기 값이라는 점은 같고, 값 자체는 버전·CPU마다 다르다 | 10.1.6 |
> | p.52 rref는 "해가 수렴할 때까지 반복하는(iterating) 방법" | Gauss-Jordan 소거는 **정해진 횟수의 행 연산으로 끝나는 직접법**이다. 반복 수렴법이 아니다 | 10.2.3 |
> | p.58 "비정수 거듭제곱의 결과는 복소수 행렬" | `[1 2; 3 4]^0.5`는 복소수지만 `[4 0; 0 9]^0.5`, `[2 1; 1 2]^0.5`는 실수다. 음의 고유값이 있을 때 복소수가 된다 | 10.1.4 |
>
> 오류·경고 메시지는 한국어 로케일에서 한국어로 나온다. 영어 원문은 각 절에 함께 적었다.

## 실행 환경 메모

> **[보강]** 이 장의 코드는 모두 MATLAB R2026a `-batch`에서 실행해 출력을 확인했다. 사용자 요청에 따라 `example/ch10/*.m` 파일은 만들지 않았고, 코드는 md 본문에만 있다. 이 장에는 플롯이 없어 `img/`도 없다. 출력은 기본 `format short` 기준이다.
