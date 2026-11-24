# 기말 대비 객관식 80문제 (final)

Holly Moore, *MATLAB for Engineers* 6th ed. 강의 슬라이드 Chapter 9~12에서 장마다 20문제씩 만든 객관식 문제집이다.

- 전부 **단일 정답** 객관식이고 보기는 5개(일부 6개)다. 난이도는 중.
- 장 안에서는 슬라이드 절 순서대로 배치했다. 문제 제목에 절 번호와 유형이 있다.
- 출제 근거는 슬라이드에 나온 내용뿐이다. 노트의 `[보강]` 내용은 문제에 쓰지 않았다.
- **MATLAB으로 실행해 검증하지 않았다.** 코드는 손으로 추적했고, 작성 후 다른 검토자가 답을 보지 않고 다시 풀어 대조했다. 확신이 덜한 출력은 해답에 `> **[확인 필요]**`로 표시했다.
- 12장은 이 PC에 Symbolic Math Toolbox가 없어 슬라이드 화면의 출력을 표시 형태의 근거로 삼았다.
- 정답은 문제 파일에 없다. `solutions.md`에 정답표, 풀이, 오답 보기별 해설이 있다.

| 장 | 주제 | 문제 | 해답 |
|---|---|---|---|
| 9 | Repetition Structures | [ch09/problems.md](ch09/problems.md) | [ch09/solutions.md](ch09/solutions.md) |
| 10 | Matrix Algebra | [ch10/problems.md](ch10/problems.md) | [ch10/solutions.md](ch10/solutions.md) |
| 11 | Other Kinds of Arrays | [ch11/problems.md](ch11/problems.md) | [ch11/solutions.md](ch11/solutions.md) |
| 12 | Symbolic Mathematics | [ch12/problems.md](ch12/problems.md) | [ch12/solutions.md](ch12/solutions.md) |

## 전체 색인

정답은 싣지 않는다.

| 문제 | 절 | 유형 | 주제 |
|---|---|---|---|
| [09-01](ch09/problems.md) | 도입 | 옳은 설명 고르기 | loop 다섯 부분, loop 종류 선택 |
| [09-02](ch09/problems.md) | 도입 | 같은 결과를 내는 코드 고르기 | loop 대신 logical indexing |
| [09-03](ch09/problems.md) | 9.1 | 출력 고르기 | 벡터 리터럴 index array, index 최종값 |
| [09-04](ch09/problems.md) | 9.1 | 오류가 나는 줄·원인 고르기 | `p = …`는 스칼라 덮어쓰기 |
| [09-05](ch09/problems.md) | 9.1 | 같은 결과를 내는 코드 고르기 | vectorize, `^` vs `.^` |
| [09-06](ch09/problems.md) | 9.1 | 빈칸에 들어갈 코드 고르기 | `1:length(x)` index array |
| [09-07](ch09/problems.md) | 9.1 | 출력 고르기 | running total 초기화 위치 |
| [09-08](ch09/problems.md) | 9.1 | 출력 고르기 | 2차원 index array는 열 단위 |
| [09-09](ch09/problems.md) | 9.1 | 틀린 설명 고르기 | `for` loop 규칙 |
| [09-10](ch09/problems.md) | 9.1 | 출력 고르기 | `start:inc:final`, string 이어 붙이기 |
| [09-11](ch09/problems.md) | 9.2 | 출력 고르기 | index 아닌 기준, 마지막 값이 기준 초과 |
| [09-12](ch09/problems.md) | 9.2 | 같은 결과를 내는 코드 고르기 | while 초기화·증가 순서 |
| [09-13](ch09/problems.md) | 9.2 | 옳은 설명 고르기 | `input` 오류 검사, `<` vs `<=` |
| [09-14](ch09/problems.md) | 9.3 | 출력 고르기 | `break` 후 loop 뒤로 |
| [09-15](ch09/problems.md) | 9.3 | 빈칸에 들어갈 코드 고르기 | `continue` vs `break` |
| [09-16](ch09/problems.md) | 9.4 | 출력 고르기 | `while (1)` + `break` |
| [09-17](ch09/problems.md) | 9.4 | 옳은 설명 고르기 | 0이 아니면 참, midpoint break |
| [09-18](ch09/problems.md) | 9.5 | 출력 고르기 | 중첩 loop로 열별 최솟값 |
| [09-19](ch09/problems.md) | 9.6 | 옳은 설명 고르기 | 경과 시간, `timeit`, 메모리 재할당 |
| [09-20](ch09/problems.md) | 9.6 | 빈칸에 들어갈 코드 고르기 | 사전할당 `B = A` |
| [10-01](ch10/problems.md) | 10.1.1 | 출력 고르기 | transpose 후 행 인덱싱 |
| [10-02](ch10/problems.md) | 10.1.1 | 출력 고르기 | 복소수 transpose는 켤레 |
| [10-03](ch10/problems.md) | 10.1.2 | 같은 결과 고르기 | `dot` = `sum(.*)`, 순서·행열 무관 |
| [10-04](ch10/problems.md) | 10.1.2 | 오류 고르기 | `dot`은 원소 수가 같아야 한다 |
| [10-05](ch10/problems.md) | 10.1.3 | 출력 고르기 | 행렬 곱 원소 = 행·열 dot product |
| [10-06](ch10/problems.md) | 10.1.3 | 옳은 설명 고르기 | (m×n)(n×p) → m×p |
| [10-07](ch10/problems.md) | 10.1.3 | 출력 고르기 | 정사각 행렬도 AB ≠ BA |
| [10-08](ch10/problems.md) | 10.1.4 | 같은 결과 고르기 | `M^2` = `M*M` vs `M.^2` |
| [10-09](ch10/problems.md) | 10.1.5 | 옳은 설명 고르기 | `inv(A)` = `A^-1`, round-off, 자연로그 |
| [10-10](ch10/problems.md) | 10.1.5 | 같은 결과 고르기 | A·A⁻¹ = A⁻¹·A = I |
| [10-11](ch10/problems.md) | 10.1.6 | 오류 고르기 | singular 행렬의 `inv`는 경고 + Inf |
| [10-12](ch10/problems.md) | 10.1.6 | 옳은 설명 고르기 | close to singular / badly scaled |
| [10-13](ch10/problems.md) | 10.1.7 | 출력 고르기 | `cross(B,A) = -cross(A,B)` |
| [10-14](ch10/problems.md) | 10.1.8 | 빈칸 고르기 | `eye(n)` 단위 행렬 |
| [10-15](ch10/problems.md) | 10.2.1 | 빈칸 고르기 | 계수 행렬 구성과 `X = A^-1*B` 순서 |
| [10-16](ch10/problems.md) | 10.2.2 | 옳은 설명 고르기 | over-defined, least squares |
| [10-17](ch10/problems.md) | 10.2.2 | 출력 고르기 | consistent over-defined 시스템의 `\` |
| [10-18](ch10/problems.md) | 10.2.2 | 옳은 설명 고르기 | under-defined는 정확, inconsistent는 잔차 |
| [10-19](ch10/problems.md) | 10.2.3 | 빈칸 고르기 | `rref([A, B])`, 해는 마지막 열 |
| [10-20](ch10/problems.md) | 10.3 | 틀린 설명 고르기 | `pascal`, `magic`, `rosser`, `gallery` |
| [11-01](ch11/problems.md) | 11.1 | 옳은 설명 고르기 | realmax/realmin, Inf·0, single 범위 |
| [11-02](ch11/problems.md) | 11.1 | 옳은 설명 고르기 | double·single·integer 바이트 수 |
| [11-03](ch11/problems.md) | 11.1 | 출력 고르기 | cumsum 부분합 |
| [11-04](ch11/problems.md) | 11.2 | 빈칸에 들어갈 코드 고르기 | char 함수의 padding |
| [11-05](ch11/problems.md) | 11.2 | 출력 고르기 | 'B'+2 vs "B"+2 vs ['B',67] |
| [11-06](ch11/problems.md) | 11.2 | 같은 결과를 내는 코드 고르기 | 문자·숫자 혼합 배열은 char |
| [11-07](ch11/problems.md) | 11.3 | 옳은 설명 고르기 | symbolic array, syms |
| [11-08](ch11/problems.md) | 11.4 | 출력 고르기 | logical indexing |
| [11-09](ch11/problems.md) | 11.4 | 같은 결과를 내는 코드 고르기 | find(z)와 find(x>y) |
| [11-10](ch11/problems.md) | 11.5 | 옳은 설명 고르기 | sparse 저장 방식 |
| [11-11](ch11/problems.md) | 11.6 | 출력 고르기 | categories 정렬, find(G=='low') |
| [11-12](ch11/problems.md) | 11.7 | 출력 고르기 | datetime 차이는 duration, 윤년 |
| [11-13](ch11/problems.md) | 11.7 | 옳은 설명 고르기 | double 날짜 vs ConvertFrom 그래프 |
| [11-14](ch11/problems.md) | 11.8 | 출력 고르기 | cat(3,…)과 squeeze |
| [11-15](ch11/problems.md) | 11.9 | 출력 고르기 | c{k}(i,j) 인덱싱 |
| [11-16](ch11/problems.md) | 11.9 | 오류가 나는 줄·원인 고르기 | ( )는 cell, { }는 내용물 |
| [11-17](ch11/problems.md) | 11.10 | 옳은 설명 고르기 | struct 확장과 빈 field |
| [11-18](ch11/problems.md) | 11.11 | 빈칸에 들어갈 코드 고르기 | 'VariableNames' 작은따옴표 |
| [11-19](ch11/problems.md) | 11.11 | 옳은 설명 고르기 | RowNames 인덱싱, T(r,c)는 table, uiimport |
| [11-20](ch11/problems.md) | 11.12 | 출력 고르기 | synchronize 결과 크기와 NaN |
| [12-01](ch12/problems.md) | 12.1 | 옳은 설명 고르기 | symbolic 결과는 들여쓰지 않음, 단순화의 정보 손실, `==` |
| [12-02](ch12/problems.md) | 12.1 | 같은 결과를 내는 코드 고르기 | x가 symbolic이면 함수를 한 단계로 정의 |
| [12-03](ch12/problems.md) | 12.1.2 | 출력 고르기 | 자동 항 정리와 `simplify` |
| [12-04](ch12/problems.md) | 12.2.1 | 옳은 설명 고르기 | `solve`의 기본 변수(x에 가장 가까운 글자), 2×1 sym |
| [12-05](ch12/problems.md) | 12.2.1 | 빈칸에 들어갈 코드 고르기 | expression = 0 전략, `=` 금지 |
| [12-06](ch12/problems.md) | 12.2.2 | 출력 고르기 | `[P,Q,R] = solve(...)`는 알파벳 순 |
| [12-07](ch12/problems.md) | 12.2.2 | 빈칸에 들어갈 코드 고르기 | 연립 `solve` 결과 structure, dot 문법 |
| [12-08](ch12/problems.md) | 12.2.3 | 출력 고르기 | `subs` 여러 변수·배열 대입, 원본 불변 |
| [12-09](ch12/problems.md) | 12.2.3 | 같은 결과를 내는 코드 고르기 | `symfun` 호출과 `subs` |
| [12-10](ch12/problems.md) | 12.3 | 옳은 설명 고르기 | `fplot` 기본 범위 −5~5, `figure`, 대응표 |
| [12-11](ch12/problems.md) | 12.4 | 출력 고르기 | 단위 비 `simplify` → `double` |
| [12-12](ch12/problems.md) | 12.4 | 오류가 나는 줄·원인 고르기 | `u.feet` 미정의, `u.ft` |
| [12-13](ch12/problems.md) | 12.4 | 출력 고르기 | 온도 차 vs `"Temperature","Absolute"`, `separateUnits` |
| [12-14](ch12/problems.md) | 12.5.1 | 출력 고르기 | `diff` 기본 변수 x, 차수, 변수+차수 |
| [12-15](ch12/problems.md) | 12.5.1 | 같은 결과를 내는 코드 고르기 | 가속도 = `diff(h,2)` |
| [12-16](ch12/problems.md) | 12.5.2 | 출력 고르기 | `int` 기본 변수 x, 다른 변수는 상수 |
| [12-17](ch12/problems.md) | 12.5.2 | 출력 고르기 | 정적분 `int(y,a,b)`, `int(y,z,a,b)` |
| [12-18](ch12/problems.md) | 12.6.1 | 빈칸에 들어갈 코드 고르기 | `dsolve` 경계 조건(이름 붙인 조건) |
| [12-19](ch12/problems.md) | 12.6.2 | 틀린 설명 고르기 | 2차 ODE, `Dx = diff(x)`, 초기값·경계값, 못 푸는 ODE |
| [12-20](ch12/problems.md) | 12.7 | 옳은 설명 고르기 | `matlabFunction`, symfun 결과 sym vs handle 결과 double |
