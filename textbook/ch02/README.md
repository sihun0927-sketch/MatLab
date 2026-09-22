# Chapter 2 — MATLAB Environment

원본: Holly Moore, *MATLAB for Engineers* 6th ed., Chapter 2 슬라이드 (91쪽).
검증 환경: MATLAB R2026a.

## 목차

| 절 | 제목 |
| --- | --- |
| [2.1](2.1-getting-started.md) | Getting Started — MATLAB 시작하기, Desktop 구성 |
| [2.2](2.2-matlab-windows.md) | MATLAB Windows — Command/History/Workspace/Current Folder/Document/Graphics/Edit |
| [2.3](2.3-variables-and-types.md) | 변수 이름 규칙(isvarname, iskeyword)과 데이터 타입 |
| [2.4](2.4-array-calculations.md) | 스칼라·배열 연산, 연산자 우선순위, 배열 생성(콜론, linspace, logspace), 전치, 표시 형식 |
| [2.5](2.5-saving-and-scripts.md) | 변수 저장·불러오기(.mat/.dat), 스크립트, Live Script, Section 모드 |
| [solutions.md](solutions.md) | 절별 연습문제 해답 |

## 학습 목표 (Learning Objectives)

원서 슬라이드가 제시하는 이 챕터의 학습 목표다. 시험 범위를 가늠하는 용도로 남겨 둔다.

1. Command Window에서 MATLAB을 시작하고 간단한 문제를 풀 수 있다.
2. 여러 MATLAB 창을 구분하고 사용할 수 있다.
3. MATLAB이 사용하는 기본 데이터 타입을 구분할 수 있다.
4. 간단한 배열을 정의하고 사용할 수 있다.
5. 변수 이름을 짓고 사용할 수 있다.
6. 올바른 연산자 우선순위 규칙으로 문제를 풀 수 있다.
7. 스칼라, 배열, 행렬 계산의 차이를 구분할 수 있다.
8. 숫자를 부동소수점 또는 과학적 표기법으로 표현할 수 있다.
9. Command Window에 표시되는 숫자 형식을 조정할 수 있다.
10. MATLAB 세션에서 사용한 변수 값을 저장할 수 있다.
11. 일련의 명령을 스크립트(M-file) 또는 Live Script(MLX-file)로 저장할 수 있다.
12. Section 모드를 사용할 수 있다.

## 챕터 요약 (Summary)

> 원서 슬라이드 마지막 Summary(1~4)를 옮긴 내용이다.

- MATLAB 환경은 여러 창으로 구성된다. 기본 화면에 열리는 것은 Command Window, Workspace
  Window, Current Folder Window 세 가지이며, Command History Window, Document Window,
  Graphics Window, Edit Window는 필요할 때 열린다.
- 변수 이름은 공통적인 명명 규칙을 따른다: 문자로 시작해야 하고, 문자·숫자·밑줄만 허용되며,
  대소문자를 구분하고, 길이는 제한이 없지만 처음 63자만 사용된다. 일부 예약어는 변수 이름으로
  쓸 수 없으며, 함수 이름을 변수 이름으로 재사용할 수는 있지만 권장되지 않는다.
- MATLAB의 기본 연산 단위는 배열이다. 배열은 스칼라(1×1), 벡터(1×n 또는 n×1, 행 또는 열),
  2차원 배열(m×n 또는 n×m), 다차원 배열로 나뉜다. 배열은 대부분 숫자를 저장하지만 다른 종류의
  정보도 저장할 수 있다. MATLAB은 표준 대수 연산자 우선순위를 따르며, 표준(십진) 표기법과
  과학적 표기법을 모두 지원한다. 변수는 `.mat` 또는 `.dat` 파일로 저장·불러오기할 수 있다.
- 일련의 MATLAB 명령은 스크립트(M-file) 또는 Live Script(MLX-file) 프로그램 파일로 저장할 수
  있다. 이는 문제를 푸는 데 사용한 명령 목록을 저장해 나중에 재사용하는 가장 좋은 방법이다.
  Section 모드를 사용하면 코드를 여러 섹션으로 나눠 섹션 단위로 실행할 수 있다.

## 함수 색인

| 함수/명령 | 한 줄 설명 | 절 |
| --- | --- | --- |
| `isvarname` | 문자열이 유효한 변수 이름 형식인지 검사 | [2.3](2.3-variables-and-types.md) |
| `iskeyword` | MATLAB 예약어 목록을 반환 | [2.3](2.3-variables-and-types.md) |
| `clear` | Workspace에서 변수를 삭제 | [2.2](2.2-matlab-windows.md) |
| `clc` | Command Window 화면을 지움(변수는 유지) | [2.2](2.2-matlab-windows.md) |
| `class` | 값의 데이터 타입(class)을 반환 | [2.3](2.3-variables-and-types.md) |
| `table` | 여러 타입을 섞어 저장하는 표 형태 배열 생성 | [2.3](2.3-variables-and-types.md) |
| `linspace` | 시작·끝·개수를 지정해 균일 간격 배열 생성 | [2.4](2.4-array-calculations.md) |
| `logspace` | 10의 거듭제곱 지수 범위로 로그 간격 배열 생성 | [2.4](2.4-array-calculations.md) |
| `plot` | x-y 그래프를 그림 | [2.2](2.2-matlab-windows.md) |
| `title` / `xlabel` / `ylabel` | 그래프 제목/축 라벨 추가 | [2.2](2.2-matlab-windows.md) |
| `format` | 숫자 표시 형식(short/long 등) 변경 | [2.4](2.4-array-calculations.md) |
| `save` | Workspace(또는 지정 변수)를 파일로 저장(.mat/.ascii) | [2.5](2.5-saving-and-scripts.md) |
| `load` | 저장된 변수를 Workspace로 불러오기 | [2.5](2.5-saving-and-scripts.md) |

## example/ch02 실행 검증

```bash
"/mnt/c/Program Files/MATLAB/R2026a/bin/matlab.exe" -batch "cd('C:\Users\pc\orca\MatLab\example\ch02'); run('ex0202_vars_and_plot.m')"
```

모든 `.m` 파일은 R2026a에서 오류 없이 실행됨을 확인했다(`ex0202`~`ex0205`, `sol0202`~`sol0205`).
