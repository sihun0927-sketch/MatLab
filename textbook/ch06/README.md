# Chapter 6 — User-Defined Functions

원서: Holly Moore, *MATLAB for Engineers* 6th ed., Chapter 6 (`Chapter 06.pdf`, 72쪽).

## 목차

| 절 | 제목 | 내용 |
|---|---|---|
| [6.1](6.1-function-files.md) | 함수 파일 작성 | 함수 정의줄, 파일 이름 규칙, local function, 주석과 H1 line |
| [6.1.3–6.1.4](6.1.3-multiple-io.md) | 다중 입출력 / 입출력 없는 함수 | 여러 입력, 여러 출력, `~`로 건너뛰기, `star` |
| [6.1.5](6.1.5-nargin-nargout.md) | 입력·출력 개수 다루기 | `nargin`, `nargout`, `varargin`, `varargout` |
| [6.1.6–6.1.8](6.1.6-local-global.md) | local·global 변수, 코드 열람 | 변수 격리, `global`, `type`, `which` |
| [6.2](6.2-subfunctions.md) | Subfunction | primary function, subfunction(local function), 통용 범위 |
| [6.3](6.3-toolbox-search-path.md) | 나만의 toolbox와 search path | 함수 탐색 순서, `addpath`, `pathtool`, `which -all` |
| [6.4](6.4-anonymous-functions.md) | Anonymous function과 function handle | `@`, 값 박제, `func2str`, `.mat` 저장 |
| [6.5](6.5-function-functions.md) | Function function | `fplot`, `fzero`, `fminbnd`, `integral`, `arrayfun` |
| [solutions.md](solutions.md) | 연습문제 해답 | 각 절 연습문제 해설 |

## 함수/키워드 색인

| 이름 | 한 줄 설명 | 절 |
|---|---|---|
| `function` | 함수 정의줄을 여는 키워드 | 6.1 |
| `end` | 함수의 끝. 한 파일에 함수가 둘 이상이면 필수 | 6.1, 6.2 |
| `help` | 함수 정의줄 다음의 주석 블록을 출력 | 6.1.2 |
| H1 line | 주석 블록의 첫 줄. 한 줄 요약으로 쓰임 | 6.1.2 |
| `lookfor` | H1 line에서 키워드를 검색 | 6.1.2 |
| `~` (출력 자리) | 그 자리의 출력을 버린다 | 6.1.3 |
| `nargin` | (바깥) 받을 수 있는 입력 개수 / (안) 실제로 들어온 개수 | 6.1.5 |
| `nargout` | (바깥) 낼 수 있는 출력 개수 / (안) 실제로 요청된 개수 | 6.1.5 |
| `varargin` | 개수가 정해지지 않은 입력을 담는 cell array | 6.1.5 |
| `varargout` | 개수가 정해지지 않은 출력을 담는 cell array | 6.1.5 |
| `arguments` | 기본값·타입 검증을 선언하는 블록 (R2019b~) | 6.1.5 |
| `who`, `whos` | workspace 변수 목록 / 상세 목록 | 6.1.6 |
| `exist` | 이름의 존재 여부와 종류 (1=변수, 2=파일, 5=built-in, 7=폴더) | 6.1.6, 6.1.8 |
| `global` | 전역 변수 선언. 양쪽 모두에서 선언해야 공유됨 | 6.1.7 |
| `clear global` | 전역 변수 삭제 (`clear`만으로는 안 됨) | 6.1.7 |
| `type` | 함수의 소스 코드 출력 (built-in은 불가) | 6.1.8 |
| `which`, `which -all` | 그 이름이 어느 파일에서 오는지 / 전부 보기 | 6.1.8, 6.3 |
| primary function | 함수 파일의 첫 함수. 파일 이름과 같아야 함 | 6.2 |
| subfunction | primary 뒤의 함수들. 그 파일 안에서만 보임 | 6.2 |
| `path`, `pathtool` | search path 확인 / 대화상자로 편집 | 6.3 |
| `addpath`, `rmpath` | path에 폴더 추가 / 제거 | 6.3 |
| `genpath` | 하위 폴더까지 포함한 path 문자열 생성 | 6.3 |
| `savepath` | 현재 path를 영구 저장 (공용 PC에서는 금지) | 6.3 |
| `@` | function handle 또는 anonymous function 생성 | 6.4 |
| `function_handle` | handle의 클래스 이름 | 6.4 |
| `func2str`, `str2func` | handle ↔ 문자열 변환 | 6.4, 6.2 |
| `functions` | handle이 붙잡고 있는 정보 조회 | 6.4 |
| `save`, `load` | handle을 포함한 변수를 `.mat`에 저장·복원 | 6.4 |
| `fplot` | 함수(handle)와 구간을 받아 그린다 | 6.5 |
| `fzero` | 함숫값이 0이 되는 `x`를 찾는다 | 6.5 |
| `fminbnd` | 구간 안의 최솟값을 찾는다 | 6.5 |
| `integral` | 정적분을 수치적으로 계산한다 | 6.5 |
| `arrayfun`, `cellfun` | 배열/cell의 각 원소에 함수를 적용 | 6.5 |

## 챕터 요약 (시험 직전 체크리스트)

- **함수 정의줄**: `function [출력들] = 이름(입력들)`. 네 요소는 `function` 키워드, 출력 변수, 함수 이름, 입력 변수다. 출력·입력 변수 이름은 자유롭게 정한다.
- **파일 이름 = 함수 이름**. 별도 파일로 저장할 때는 반드시 일치시킨다. 다르면 파일 이름 쪽이 이긴다.
- **함수를 두는 세 곳**: ① 현재 폴더의 별도 파일 ② search path 위의 별도 파일 ③ 호출하는 파일의 맨 끝(local function). ③은 그 파일 안에서만 쓸 수 있다.
- **주석과 help**: 함수 정의줄 **바로 다음**에 이어지는 주석 블록이 `help`로 출력된다. 그 첫 줄이 H1 line이다. 중간에 빈 줄이 끼면 거기서 끊긴다. `help`는 **파일로 저장된 함수만** 찾는다.
- **다중 입출력**: 출력은 대괄호로 묶어 나열한다. **정의된 순서대로 앞에서부터** 채워지므로, 출력을 적게 받으면 앞의 것만 온다. `~`로 자리를 지키며 건너뛴다. 적게 받는 건 되지만 많이 받으면 오류다.
- **입출력 없는 함수**: `function [] = star()`. 대괄호는 출력 없음, 빈 괄호는 입력 없음. 그림만 그리는 함수가 대표적이다.
- **`nargin`/`nargout`은 위치에 따라 의미가 다르다.** 함수 바깥에서 이름을 주면 "정의상 개수"(가변이면 음수), 함수 안에서 인수 없이 쓰면 "이번 호출의 실제 개수". 생략된 입력 채우기와 요청된 출력만 계산하기에 쓴다.
- **`varargin`/`varargout`은 cell array**이고 인수 목록의 **마지막**에만 올 수 있다. 꺼낼 때는 중괄호 `{}`.
- **local variable**: 함수 안의 변수는 workspace에 남지 않고, 함수도 workspace 변수를 볼 수 없다. 통로는 입력 인수와 반환값뿐이다. 함수는 자기완결적이어야 한다.
- **global variable**: 호출하는 쪽과 함수 **양쪽 모두**에서 `global`로 선언해야 공유된다. 관례상 대문자. 추적이 어려워 일반적으로 쓰지 않는 것이 좋다. 삭제는 `clear global`.
- **함수 코드 열람**: built-in(`sin`)은 소스가 없고, toolbox의 `.m` 파일(`sphere`)은 `type`으로 볼 수 있다. 어디서 오는지는 `which`, 충돌 여부는 `which -all`.
- **subfunction**: 한 파일의 첫 함수가 primary function(파일 이름과 같아야 함), 나머지가 subfunction이다. subfunction끼리는 서로 호출할 수 있지만 **다른 파일에서는 보이지 않는다**. 그래서 local function이라고도 한다.
- **함수 탐색 순서**: ① 현재 파일의 local function ② 현재 폴더 ③ search path(앞에서부터). 먼저 찾은 쪽이 이긴다.
- **toolbox 만들기**: 내 함수들을 한 폴더에 모으고 `addpath`(세션 한정) 또는 `pathtool` → Add Folder → Save(영구). **공용 PC에서는 영구 변경 금지.** 하위 폴더는 자동 포함되지 않으므로 `genpath`가 필요하다.
- **anonymous function**: `이름 = @(입력) 식`. 본체는 **식 하나**만. workspace에 `function_handle` 클래스 변수로 올라가고 `clear`하면 사라진다. `.mat`으로 저장 가능.
- **값 박제**: anonymous function은 만들어질 때 바깥 변수의 **그 순간 값**을 복사해 보관한다. 나중에 바깥을 바꿔도 반영되지 않는다. `functions(f)`로 확인.
- **function handle**: `@함수이름`(괄호 없음)으로 기존 함수에 별명을 붙인다. 입력이 많은 함수의 일부를 고정해 입력 하나짜리 함수를 만들 때도 쓴다.
- **function function**: 다른 함수를 입력으로 받는 함수. `fplot`(그리기), `fzero`(근), `fminbnd`(최솟값), `integral`(정적분), `arrayfun`(원소별 적용). 직접 만들 때도 특별한 문법은 필요 없고, 받은 handle을 그냥 호출하면 된다.

## ⚠️ 함정 모음 (빠른 복습용)

| 함정 | 절 |
|---|---|
| 파일 이름과 함수 이름이 다르면 **파일 이름**이 이긴다 | 6.1 |
| 내 함수 이름이 내장 함수를 가린다(shadowing). `which -all`로 확인 | 6.1, 6.1.8 |
| 스크립트에서 함수 정의를 앞에 두면 함수 파일로 해석되어 본문이 실행되지 않는다 | 6.1, 6.2 |
| 한 파일에 함수가 둘 이상이면 **모두** `end`로 닫아야 한다 | 6.1, 6.2 |
| `help`는 파일로 저장된 함수만 찾는다. 스크립트의 local function은 조회 불가 | 6.1.2 |
| 주석 블록 중간에 빈 줄이 끼면 `help`가 거기서 끊긴다 | 6.1.2 |
| 출력을 적게 받으면 **오류 없이** 앞의 것만 온다 | 6.1.3 |
| 출력 대응은 변수 이름이 아니라 **위치**로 결정된다 | 6.1.3 |
| `nargin('sin')`(정의상 개수)과 함수 안의 `nargin`(실제 개수)은 다르다 | 6.1.5 |
| `nargin`이 음수면 오류가 아니라 가변 인수 함수라는 뜻 | 6.1.5 |
| `varargin(1)`(cell 한 칸) vs `varargin{1}`(안의 값) | 6.1.5 |
| 함수는 workspace 변수를 볼 수 없다. 필요한 값은 전부 입력으로 | 6.1.6 |
| `global`을 한쪽만 선언하면 빈 배열이 되어 **조용히** 틀린다 | 6.1.7 |
| `clear 이름` ≠ `clear global 이름` | 6.1.7 |
| `exist` 반환값: 1=변수, 2=파일, 5=built-in, 7=폴더 | 6.1.8 |
| `type`은 built-in에 통하지 않는다 | 6.1.8 |
| subfunction은 다른 파일에서 보이지 않는다. handle로는 넘길 수 있다 | 6.2 |
| `str2func`은 "그 코드가 놓인 파일에서 보이는 것"만 찾는다 | 6.2, 6.3 |
| `addpath`는 기본으로 path **맨 앞**에 넣어 내장 함수를 가릴 수 있다 | 6.3 |
| 하위 폴더는 자동 포함되지 않는다 (`genpath` 필요) | 6.3 |
| anonymous function의 본체에는 **식 하나만** 쓸 수 있다 | 6.4 |
| anonymous function은 만들 때의 변수 값을 박제한다 | 6.4 |
| `@mypoly`(handle) vs `mypoly(2)`(호출 결과) | 6.4, 6.5 |
| 원소별 연산 점 누락: `@(x) x^2`에 벡터를 넣으면 오류 | 6.4 |
| `fzero`에 구간을 줄 때는 양 끝의 부호가 달라야 한다 | 6.5 |
| `fminbnd`는 최솟값만 찾는다. 최댓값은 `-f`로 | 6.5 |
| 수치 미분에서 `h`를 너무 작게 잡으면 오차가 다시 커진다 | 6.5 |

## 예제 코드

`example/ch06/` 아래에 있다. 독립 함수 파일(`mypoly.m`, `motion.m` 등)에는 인수 없이 실행해도 오류가 나지 않도록 `if nargin == 0` 기본값 블록을 넣었다(교재 원본에는 없는 `[보강]`). 플롯 예제는 `theme(gcf, "light")`로 밝은 테마를 적용한 뒤 `img/`에 PNG를 저장한다.

| 분류 | 파일 |
|---|---|
| 독립 함수 파일 | `mypoly.m`, `elemprod.m`, `motion.m`, `star.m`, `star1.m`, `sumall.m`, `minmax.m`, `gravity_force.m`, `kinetic_energy.m`, `call_by_name.m` |
| 나만의 toolbox | `mytoolbox/c2f.m`, `mytoolbox/f2c.m`, `mytoolbox/k2c.m` |
| 본문 예제 | `ex06*.m` |
| 연습문제 해답 | `sol06*.m` |
