# 🐞 오류 찾기 50선 (midterm/bugs)

Holly Moore, *MATLAB for Engineers* 6th ed. Chapter 2~8 전 범위에서 **오류 찾기 유형만** 50문제를 모았다. 번호는 `B01`~`B50`이고, 챕터 순서대로 묶되(2·4장 → 3장 → 5장 → 6·7장 → 8장·종합) 문제 안에서는 여러 장이 섞인다. 난이도는 "어려움" 기준. 해답은 [solutions.md](solutions.md)에 있다.

## 규칙

- **오류 개수는 알려 주지 않는다.** "오류를 모두 찾아라"가 전부다. 줄, 원인, 현상, 고친 코드를 쓴다.
- 오류 유형 네 가지를 구분한다.
  - ① **문법 오류**: 파일 전체가 실행되지 않는다. MATLAB은 문법 오류를 한 번에 **하나만** 알려 준다.
  - ② **실행 시 오류**: 그 줄 **직전까지** 실행되고 멈춘다. 그 전에 찍힌 출력은 남는다.
  - ③ **조용히 틀린 결과**: 오류 메시지 없이 끝까지 돌지만 값·모양·그림이 의도와 다르다.
  - ④ **누락**: 슬라이드가 "반드시 하라"고 한 것을 빠뜨림(`hold off`, 축 이름, `fclose`, `otherwise` 등).
- 문제마다 **오류처럼 보이지만 정상인 줄**(미끼)이 섞여 있다. 왜 괜찮은지도 답에 쓴다.
- **세미콜론 `;`** 은 이 문제집의 핵심 쟁점이다. 아래 여덟 가지를 구분해야 한다.
  - (a) 문장 끝 `;` → 결과 표시 억제. 없으면 1000개 배열이 화면을 덮는다.
  - (b) **보여 줘야 하는** 줄에 `;` → 아무것도 안 나온다. "오류 없이 조용히" 요구 위반.
  - (c) `[ ]` 안 `;` → 행 구분. `,`/공백은 열 구분. 열 수가 다르면 차원 오류, 같으면 의도와 다른 모양.
  - (d) 같은 줄 문장 구분자: `;`는 숨기고 `,`는 **표시한다**.
  - (e) `fprintf`/`disp`/`plot`/`title` 등 **출력·그래프 함수 뒤 `;`는 아무 효과도 없다.** 출력을 막으려고 붙여도 그대로 찍힌다.
  - (f) `if cond;`, `case 2;`, `function y = f(x);`의 `;`는 **허용**된다(미끼).
  - (g) 함수 **안**에서도 `;` 없는 줄은 호출마다 표시된다.
  - (h) `f(x);`는 반환값을 `ans`에 넣되 표시하지 않는다. `f(x)`는 `ans = …`를 표시한다.

> B01~B40은 MATLAB을 돌리지 않고 머리로 실행한 결과다. 해설에서 공백 수·빈 줄 수처럼 확신이 덜한 자리는 `> **[확인 필요]**`로 표시했다. B41~B50은 R2026a에서 원본·수정본을 실행해 맞춘 결과다.

---

## 문제 B01 🐞 오류 찾기 (2장)

높이 `h0 = 80` m에서 정지 상태로 떨어뜨린 물체(질량 2 kg)에 대해 다음을 **화면에 표시**하려는 스크립트다.

- `drop_dist`: `t = 2` s 동안 떨어진 거리 ½gt²
- `hLeft`: 남은 높이
- `KE`: t초 때의 운동에너지 ½m(gt)²
- `pct`: 남은 높이에 대한 낙하 거리의 백분율
- `tImpact`: 바닥 도달 시간 √(2h0/g)
- `s`: (−1)² = 1, `scale`: 2^(3²) = 512 (검산용 상수)

오류를 모두 찾아라. 파일을 실행하면 **어디까지 돌고 어떤 현상이 나는지**도 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc
g = 9.81;  h0 = 80;  t = 2;  m = 2;
drop-dist = 1/2*g*t^2            % t초 동안 떨어진 거리 (m)
hLeft = h0 - drop_dist           % 남은 높이 (m)
KE = 1/2*m*(g*t)^2               % 운동에너지 (J)
pct = drop_dist/hleft*100        % 남은 높이 대비 낙하 거리 (%)
tImpact = (2h0/g)^1/2            % 바닥 도달 시간 (s)
s = -1^2                         % (-1)^2 = 1
scale = 2^3^2                    % 2^(3^2) = 512
```

---

## 문제 B02 🐞 오류 찾기 (2장, 4장)

온도 센서의 샘플 시각과 눈금을 만드는 스크립트다. 의도는 다음과 같다.

- `t`: 0~10 s를 0.001 s 간격으로 나눈 시각 벡터. 원소가 많으므로 **화면에 표시하지 않는다.**
- `tMid`: `t`의 정가운데 원소(5 s)를 표시한다.
- `countdown`: `10 8 6 4 2 0`을 표시한다.
- `ticks`: 0부터 50까지 같은 간격의 눈금 **6개**를 표시한다.
- `duty`: 0에서 1까지 같은 간격의 값 **4개**(끝점 1 포함)를 표시한다.
- 샘플 수를 `samples: 10001` 한 줄로 출력하고, 눈금 개수 `nTicks`를 **표시**한다.

오류를 모두 찾아라. 각 오류가 화면에 **무엇이 나오게 / 안 나오게** 하는지 구체적으로 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc
t = 0:0.001:10                   % 0~10 s, 0.001 s 간격
n = numel(t);
tMid = t(n/2)                    % 가운데 시각 (5 s)
countdown = 10:2:0               % 10, 8, ..., 0
ticks = linspace(0, 6, 50)       % 0부터 50까지 눈금 6개
duty = 0:0.3:1                   % 0~1 같은 간격 4개 (1 포함)
fprintf('samples: %d\n', n);
nTicks = length(ticks);          % 눈금 개수 표시
```

---

## 문제 B03 🐞 오류 찾기 (4장, 2장)

저항 3개(Ω)와 각 저항에 흐르는 전류(A)로 전압·전력을 정리하는 스크립트다. 의도는 다음과 같다.

- 2행: `R`(1×3 행)과 `I`(3×1 열)를 정의만 하고 **둘 다 표시하지 않는다.**
- `V`: 각 저항의 전압 V = RI (1×3)를 표시한다.
- `sgn`: 허용오차 부호 `+1`, `−1` 두 원소. `band`: 1번 저항의 상한·하한 `[105 95]`를 표시한다.
- `data`: 1행이 `R`, 2행이 `V`인 **2×3** 표를 표시한다.
- `P`: 전력 VI 세 개를 담은 1×3. 식이 길어서 두 줄로 나눠 썼다.
- `M`: 1행이 `R`, 2행이 `I`인 2×3 행렬. `sz`로 그 크기 `[2 3]`을 표시한다.

오류를 모두 찾아라. 실행하면 **어느 줄까지 무엇이 화면에 나오고 어디서 멈추는지** 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc
R = [100 220 470], I = [0.02; 0.01; 0.004;];
V = R.*I'
sgn = [1 - 1];
band = R(1)*(1 + 0.05*sgn)
data = [R, V]
P = [V(1)*I(1) V(2)*I(2)
     V(3)*I(3)]
M = [R; I];
sz = size(M)
```

---

## 문제 B04 🐞 오류 찾기 (2장, 4장)

스프링 4개의 상수 `k`(N/m)와 변위 `x`(m)로 다음을 계산해 표시하려는 스크립트다.

- `F`: 각 스프링의 힘 kx (1×4)
- `E`: 각 스프링의 탄성 에너지 ½kx² (1×4)
- `Etot`: 네 스프링 에너지의 합 (스칼라)
- `c`: 각 스프링의 컴플라이언스 1000/k (mm/N, 1×4)
- `r`: 검산용으로 각 스프링의 E/F (= x/2가 나와야 함, 1×4)
- `G2`: 2×2 행렬 `G`의 **각 원소를 제곱**한 행렬

오류를 모두 찾아라. 각 오류가 **오류 메시지**를 내는지, **조용히 틀린 값**을 내는지 구분하고, 조용히 틀린 줄은 실제로 나오는 값을 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc
k = [200 350 500 800];           % 스프링 상수 (N/m)
x = [0.10 0.20 0.05 0.15];       % 변위 (m)
F = k*x                          % 각 스프링의 힘
E = 1/2*k.*x^2                   % 각 스프링의 에너지
Etot = 1/2*k*(x.^2)'             % 에너지 합계
c = 1000/k                       % 컴플라이언스 (mm/N)
r = E/F                          % 각 스프링의 E/F
G = [1 2; 3 4];
G2 = G^2                         % G의 각 원소 제곱
```

---

## 문제 B05 🐞 오류 찾기 (2장)

연 이율 5 %로 1000원을 0~5년 예치했을 때의 원리합계를 계산하고, ASCII 파일로 저장한 뒤 **작업공간을 비우고 파일에서만** 다시 불러와 확인하려는 스크립트다. 의도는 다음과 같다.

- Section 1 끝에서 원리합계 표 `balance`를 화면에 표시한다. 그 밖의 계산 줄은 표시하지 않는다.
- Section 2는 따로 **Run Section** 으로 실행할 수 있는 별도 섹션이어야 한다.
- 저장 후 변수를 모두 지우고, 불러온 데이터에서 마지막 해 원리합계 `final`과 불러온 배열의 크기 `saved`를 표시한다.

오류를 모두 찾아라. 이 스크립트는 **오류 메시지 없이 끝까지 실행된다.** 실제 화면 출력이 의도와 어떻게 다른지 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

```matlab
%% Section 1: 원리합계 계산
clear, clc
P0 = 1000;                       % 원금 (원)
rate = 5%;                       % 연 이율 5 %
years = 0:5;
balance = P0*(1 + rate).^years;
balance;                         % 원리합계 표시
%%Section 2: ASCII 저장 후 다시 불러오기
save growth.dat years balance -ascii
clc                              % 작업공간 변수 삭제
load growth.dat
final = balance(end)             % 파일에서 읽은 마지막 해 원리합계
saved = size(growth)
```

---

## 문제 B06 🐞 오류 찾기 (4장)

학생 3명(행)의 시험 4회(열) 점수 행렬 `S`를 다루는 스크립트다. 각 줄의 주석이 의도다. 오류를 모두 찾아라. 각 줄이 **오류를 내는지, 조용히 엉뚱한 값을 내는지, 정상인지** 판정하고, 엉뚱한 값을 내는 줄은 실제 값을 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc
S = [78 85 92 64
     88 73 95 81
     69 90 77 85];               % 행: 학생 1~3, 열: 시험 1~4
b = S(5)                         % 학생 1의 시험 2 점수
flat = S(:)'                     % 학생 1, 2, 3의 행을 순서대로 이어 붙인 1×12
S(end+1, :) = [70 80 90 100];    % 학생 4 추가
S(2, :) = [];                    % 학생 2 자퇴 → 행 삭제
n = length(S)                    % 남은 학생 수
x = S(3, 4)                      % 원래 학생 3의 시험 4 점수
y = S(4, 1)                      % 마지막 학생의 시험 1 점수
```

---

## 문제 B07 🐞 오류 찾기 (4장)

4×4 마방진 `A`로 특수 행렬 함수를 연습하는 스크립트다. 각 줄의 주석이 의도다. 오류를 모두 찾아라. 이 스크립트는 **오류 메시지 없이 끝까지 실행된다.** 의도와 다른 결과를 내는 줄마다 실제로 무엇이 나오는지(크기와 값) 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc
A = magic(4);
total = sum(A)                   % A의 전체 원소 합 (스칼라)
rowSum = sum(A, 2)               % 각 행의 합 (4×1)
dg = diag(A)'                    % 주대각선 원소 (1×4 행)
D = diag(dg)                     % dg를 대각선에 놓은 4×4 행렬
offDiag = A - diag(A)            % A에서 대각선 원소만 0으로 바꾼 행렬
Z = zeros(4)                     % 0 네 개짜리 행 벡터 (1×4)
I3 = diag(3)                     % 3×3 단위행렬
[r, c] = size(Z)                 % 기대: r = 1, c = 4
```

---

## 문제 B08 🐞 오류 찾기 (4장, 3장)

발사 속도 `v`와 발사각 `theta`(도)의 모든 조합에 대해 사거리 R = v² sin(2θ) / g 를 표로 만든다. 표 `R`은 **행이 속도, 열이 각도**인 3×5여야 한다. 의도는 다음과 같다.

- `nr`, `nc`: `R`의 크기 3, 5를 표시
- `best`: 표 **전체**에서 가장 긴 사거리(스칼라)
- `R30_45`: v = 30 m/s, θ = 45°의 사거리

오류를 모두 찾아라. 실행하면 어디서 멈추는지, 그 오류를 고치면 다음에 무엇이 드러나는지 차례로 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc
g = 9.81;
v = [10 20 30];                  % 발사 속도 (m/s)
theta = 15:15:75;                % 발사각 (도)
[V, TH] = meshgrid(theta, v);    % 행: 속도, 열: 각도인 3×5 격자
R = V^2*sin(2*TH)/g;             % 사거리 (m)
[nr, nc] = size(R)               % 기대: 3, 5
best = max(R)                    % 표 전체의 최대 사거리
R30_45 = R(3, 3)                 % v = 30, θ = 45°
```

---

## 문제 B09 🐞 오류 찾기 (4장, 7장)

센서 이름과 라벨을 만드는 스크립트다. 각 줄의 주석이 기대 결과다. 오류를 모두 찾아라. **실행은 되지만 값이 다른 줄**이 여럿이다. 각 줄이 실제로 무엇을 내놓는지 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc
id = 7;  tempC = 23.5;
names = ['Temp'; 'Humid'; 'CO2'];   % 센서 이름 3개 (3×1)
label = 'Sensor-' + id              % "Sensor-7"
nextId = "S" + id + 1               % 다음 번호 "S8"
msg = ['Reading: ' num2str(tempC) ' C'];
disp(msg);                          % Reading: 23.5 C
disp(['ID: ' id])                   % ID: 7
nLetters = length("Humidity")       % 글자 수 8
tags = ["T" 'H' "C"]                % 1×3 string 배열
```

---

## 문제 B10 🐞 오류 찾기 (2장, 3장, 7장)

측정 전력의 평균과 복소 임피던스의 크기·위상각을 구하는 스크립트다. 의도는 다음과 같다.

- `pick`: 2번째 측정값을 표시한다.
- 5행: 합계와 개수를 구하되 **둘 다 표시하지 않는다.**
- 평균 전력을 `Average power: 131.2 W` 한 줄로 출력한다.
- `avgQ`: 무효전력 `Q`의 평균을 표시한다.
- `Z`: 복소 임피던스 8 + 6j (Ω). `mag`, `ang`: 크기(Ω)와 위상각(도)을 **둘 다 표시**한다.

오류를 모두 찾아라. 실행하면 화면에 무엇이 어떤 순서로 나오고 어디서 멈추는지 써라. 멈춘 줄을 고친 뒤에야 드러나는 **조용한 오류**도 찾아라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc
P = [120 135 128 142 131];           % 측정 전력 (W)
i = 2;                                % 확인할 측정 번호
pick = P(i)                           % 2번째 측정값
sum = sum(P), length = length(P);     % 합계와 개수 (표시하지 않음)
avg = sum/length;
fprintf('Average power: %.1f W\n', avg);
Q = [30 25 40];                       % 무효전력 (var)
avgQ = sum(Q)/length(Q)               % 무효전력 평균
R = 8;  X = 6;
Z = R + i*X                           % 복소 임피던스 8 + 6j
mag = abs(Z), ang = angle(Z)*180/pi   % 크기와 위상각 (둘 다 표시)
```

---
## 문제 B11 🐞 오류 찾기 (3장)

변위 센서 값 `dx`(mm, 음수는 반대 방향)를 정수로 다듬어 기록하는 스크립트다. 의도는 다음과 같다.

- `cut`: 소수부를 **버린** 값 (0 쪽으로 자름, -7.5 → -7)
- `near`: 가장 가까운 정수 (.5 는 0에서 먼 쪽)
- `s`: 방향 (-1, 0, +1)
- `cube`: 각 값의 **실수** 세제곱근 (-8 이면 -2)
- `phase`: 반올림한 값을 4칸짜리 순환 버퍼의 위치 **0~3** 으로 바꾼 것
- `mag`: 3×4 요약표. 1행 크기(절댓값), 2행 방향, 3행 반올림 값

오류를 모두 찾아라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라. 원본을 실행하면 어디까지 돌고 화면에 무엇이 나온 뒤 멈추는지도 써라.

```matlab
clear, clc
dx = [-7.5 -2.4 3.6 8.5];          % mm
cut = floor(dx)                    % 소수부 버림 (0 쪽으로)
near = round(dx)                   % 가장 가까운 정수
s = sign(dx);                      % 방향
cube = dx.^(1/3)                   % 실수 세제곱근
phase = rem(near, 4)               % 버퍼 위치 0~3
mag = [abs(dx); s, near]           % 1행 크기, 2행 방향, 3행 반올림
```

---

## 문제 B12 🐞 오류 찾기 (3장)

소음·방사성 붕괴·저장 용량·조 편성 계산을 한 스크립트에 모았다. 의도는 다음과 같다.

- 음압 레벨 L = 20 log₁₀(p/p₀) dB (p₀ = 20 μPa). p = 0.2 Pa 이면 80 dB.
- 붕괴 상수 λ 의 반감기 t½ = ln 2 / λ, 10%로 줄어드는 시간 t₉₀ = −ln(0.1)/λ.
- 반감기 뒤에 500 에서 남은 양 N = 500 e^(−λ t½) (250 이어야 한다).
- 1000 가지 값을 구별하는 데 필요한 비트 수 = ⌈log₂ 1000⌉.
- 180명 중 3명을 뽑는 경우의 수 C(180, 3).

오류를 모두 찾아라. 의심스럽지만 정상인 줄이 있으면 왜 괜찮은지도 써라. 원본을 실행했을 때 화면에 어떤 값이 나오고 어느 줄에서 멈추는지 써라.

```matlab
clear, clc
p = 0.2;  p0 = 20e-6;                    % Pa
L = 20*log(p/p0)                         % 음압 레벨 (dB)
lambda = 0.05;                           % 1/h
thalf = log(2)/lambda                    % 반감기 (h)
t90 = -log10(0.1)/lambda                 % 10%가 되는 시간 (h)
N = 500*e^(-lambda*thalf)                % 반감기 뒤 남은 양
bits = ceil(log10(1000)/log10(2))        % 필요한 비트 수
teams = factorial(180)/(factorial(177)*factorial(3))   % C(180,3)
```

---

## 문제 B13 🐞 오류 찾기 (3장)

초속 20 m/s, 발사각 30°로 던진 공의 속도 성분과 사거리를 구하고, 각을 거꾸로 되찾아 검산하는 스크립트다. 각도는 전부 **도(degree)** 로 다루려 한다. 주석에 적힌 값이 기대값이다.

이 스크립트는 **오류 메시지 없이 끝까지 실행된다.** 그런데도 틀린 줄을 모두 찾고, 각 줄이 실제로 어떤 값을 내는지 써라. 의심스럽지만 정상인 줄은 왜 괜찮은지도 써라.

```matlab
clear, clc
v = 20;  g = 9.81;
theta = 30;                          % 발사각 (도)
vx = v*cos(theta)                    % 17.3205 이어야 한다
vy = v*sind(theta)                   % 10 이어야 한다
R = v^2*sind(2*theta)/g              % 35.3119 이어야 한다
ang = atan2(vx, vy)*180/pi           % 성분에서 되찾은 발사각: 30
beta = 150;                          % 경사면 각 (도)
beta2 = asind(sind(beta))            % 사인 값에서 되찾은 경사면 각: 150
flat = v^2*sin(pi)/g == 0            % 각이 90도면 사거리 0 인가? 참(1)이어야 한다
```

---

## 문제 B14 🐞 오류 찾기 (3장)

3일 동안 센서 4개로 잰 온도 행렬 `T` 를 분석한다. **행은 날짜(1~3일), 열은 센서(1~4번)** 다. 의도는 주석과 같다. 오류를 모두 찾고, 각 줄이 실제로 내는 값(또는 모양)을 써라. 의심스럽지만 정상인 줄은 왜 괜찮은지도 써라.

```matlab
clear, clc
T = [21 25 19 30
     23 22 27 26
     20 28 24 29];                % 행: 날짜, 열: 센서
[hot, where] = max(T)             % 센서마다 최고 온도와 그날의 날짜 번호
dayMax = max(T, 2)                % 날짜마다 최고 온도 (3×1)
low = min(T, 22)                  % 22도 미만은 22로 끌어올린 보정 행렬
total = sum(T)                    % 날짜마다 온도 합계 (3×1)
cold = min(T(2))                  % 센서 2번의 최저 온도
acc = cumsum(T, 2)                % 날짜마다 센서 1번부터 누적한 합
allMax = max(max(T))              % 전체 최고 온도
```

---

## 문제 B15 🐞 오류 찾기 (3장)

학생 4명의 퀴즈 3회 점수 `S` 로 통계를 낸다. **행은 학생, 열은 퀴즈** 다. 요구 사항은 아래 여섯 값을 **모두 화면에 보이는 것**이다.

- `avgStu` 학생별 평균 (4×1)
- `medQuiz` 퀴즈별 중앙값 (1×3)
- `top` 전체 점수 12개 중 가장 많이 나온 점수 (스칼라)
- `sdStu` 학생별 표준편차 (4×1, 표본 기준 N−1)
- `varQuiz` 퀴즈별 분산 (1×3, **모집단 기준 N** 으로 나눔)
- `spread` 퀴즈별 최고점 − 최저점

오류를 모두 찾아라. 의심스럽지만 정상인 줄은 왜 괜찮은지도 써라. 원본을 실행하면 **화면에 무엇이 나오고 무엇이 안 나오는지**, 어디서 멈추는지 순서대로 써라.

```matlab
clear, clc
S = [80 72 90;
     65 72 70;
     90 85 72;
     72 60 88];               % 행: 학생 1~4, 열: 퀴즈 1~3
avgStu = mean(S);
medQuiz = median(S)
top = mode(S)
sdStu = std(S, 2);
varQuiz = var(S, 1)
spread = max(S) - min(S)
```

---

## 문제 B16 🐞 오류 찾기 (3장, 7장)

부품 번호와 저항값(kΩ)이 한 행씩 짝지어진 `parts` 를 정리한다. 의도는 다음과 같다.

1. `ranked`: 저항이 **큰 순서**로 정렬하되 각 부품의 번호와 저항은 **같은 행에 그대로** 붙어 있어야 한다.
2. `top3`: 저항이 가장 큰 부품 3개의 번호 (1×3)
3. `T`: 저항 오름차순 표 (열 이름 `ID`, `kOhm`)
4. 마지막 줄: 저항이 큰 순서로 `102: 10.0 kOhm` 형식, 부품마다 한 줄씩

오류를 모두 찾아라. 의심스럽지만 정상인 줄은 왜 괜찮은지도 써라. 원본을 실행하면 어느 줄에서 멈추는지, 그 줄을 고쳐도 남는 문제가 무엇인지 써라.

```matlab
clear, clc
parts = [101 4.7; 102 10.0; 103 2.2; 104 6.8; 105 1.5];   % [번호, kΩ]
ranked = sort(parts, 'descend');
[idx, ohm] = sort(parts(:,2), 'descend');
top3 = parts(idx(1:3), 1)'
low = sortrows(parts, 2);
T = table(low(:,1), low(:,2), VariableNames = ["ID" "kOhm"])
fprintf('%d: %.1f kOhm\n', ranked(:,1), ranked(:,2));
```

---

## 문제 B17 🐞 오류 찾기 (3장)

부품 생산 공정을 난수로 흉내 내는 스크립트다. 의도는 다음과 같다.

- `len`: 평균 50 mm, 표준편차 0.2 mm 인 정규 분포 길이 1000개 (열 벡터). 화면에 찍을 필요는 없다.
- `temp`: 15~25 °C 균등 분포 온도 **3개** (1×3)
- `die`: 1~6 주사위 10번
- `gap`: 평균 0.05 mm, 표준편차 0.01 mm 인 정규 분포 간격 500개
- `n`: 생산 개수(1000), `count`: 온도 측정 개수, `avgLen`: 평균 길이

이 스크립트는 **오류 메시지 없이 끝까지 실행된다.** 그래도 틀린 곳을 모두 찾고, 화면에 실제로 무엇이 나오는지 써라. 의심스럽지만 정상인 줄은 왜 괜찮은지도 써라. 특히 `count` 줄이 원본에서 무엇을 내는지, 그것이 왜 위험한지 설명하라.

```matlab
clear, clc
rng(0)
len = 50 + 0.2*randn(1000, 1)
temp = 15 + 25*rand(3)
die = randi(6, 1, 10);
gap = randn(1, 500)*0.05 + 0.01;
[n, m] = size(len);
count = length(temp)
avgLen = mean(len)
```

---

## 문제 B18 🐞 오류 찾기 (3장)

교류 회로에서 전류 2 A 가 임피던스 Z = 3 + 4i Ω 에 흐른다. 의도는 주석에 적힌 값을 얻는 것이다. 위상각은 **도** 로 원한다. `Zs` 는 임피던스 세 개를 **값을 바꾸지 않고** 열 벡터로 세운 것이다.

오류를 모두 찾아라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라. 원본을 실행하면 `Z`, `mag`, `phase`, `P`, `V` 가 각각 무엇으로 찍히는지 써라.

```matlab
clear, clc
i = 2;                              % 전류 (A)
R = 3;  X = 4;                      % 저항, 리액턴스 (Ω)
Z = R + X*i                         % 3 + 4i
mag = abs(Z)                        % 5
phase = angle(Z)                    % 53.1301 (도)
Zc = conj(Z);
P = real(Z*Zc)                      % |Z|^2 = 25
Zs = [Z, 1+2j, 2-1j]';              % 열 벡터: 3+4i; 1+2i; 2-1i
root = sqrt(-4)                     % 판별식 -4 의 제곱근: 2i
V = i*Z                             % 전압 = 전류 × 임피던스 = 6 + 8i
```

---

## 문제 B19 🐞 오류 찾기 (3장, 8장)

전압·전류 측정값으로 저항 `R` 을 구한다. 전류가 0인 측정은 `NaN`(0/0) 이나 `Inf`(양수/0) 가 된다. 의도는 다음과 같다.

- `miss`: `NaN` 인 위치 (2 가 나와야 한다), `cut`: `Inf` 인 위치 (4)
- `good`: 정상값만 모은 벡터, `avgR`: 그 평균을 **15자리로 화면에** 보인다
- `cost`: 평균에 단가 1.234 를 곱한 비용을 **소수 둘째 자리로 반올림해 저장**한다
- `total`: 반올림된 비용의 100배 (452.00 이어야 한다)
- `top`: double 이 담을 수 있는 가장 큰 수

이 스크립트는 **오류 메시지 없이 끝까지 실행된다.** 틀린 곳을 모두 찾고, 화면에 실제로 무엇이 나오는지(나오지 않는 것 포함) 써라. 의심스럽지만 정상인 줄은 왜 괜찮은지도 써라.

```matlab
clear, clc
volt = [2.5 0 1.5 4 0.75];            % V
amp  = [0.5 0 0.5 0 0.25];            % A
R = volt ./ amp
miss = find(R == NaN)
cut = find(R == Inf)
good = R(~isnan(R) & R ~= Inf);
format long
avgR = mean(good);
format bank
cost = avgR*1.234
total = cost*100
format short
top = intmax
```

---

## 문제 B20 🐞 오류 찾기 (3장, 7장)

원기둥 탱크 3개(높이 2 m)의 부피를 구해 평균, 평균보다 큰 부피, 최대 부피를 출력한다. 첫 줄은 `sqrt` 의 **HTML 문서 창(예제·그림 포함)** 을 띄워 참고하려는 것이다. 기대 출력의 마지막 두 줄은 다음과 같다.

```
Mean volume: 4.880 m^3
Largest: 9.048 m^3
```

오류를 모두 찾아라. 의심스럽지만 정상인 줄은 왜 괜찮은지도 써라. 원본을 실행하면 화면에 무엇이 나온 뒤 어느 줄에서 멈추는지, 그 오류 메시지가 **진짜 원인**을 말해 주는지 써라.

```matlab
clear, clc
help sqrt                              % HTML 문서 창을 연다
r = [0.5 0.8 1.2];                     % 반지름 (m)
h = 2;                                 % 높이 (m)
pi = 3.14;                             % 계산을 간단히
V = pi*r.^2*h;                         % 부피 (m^3)
mean = mean(V);                        % 평균 부피
fprintf('Mean volume: %.3f m^3\n', mean);
big = V(V > mean(V))                   % 평균보다 큰 부피
disp('Largest: %.3f m^3', max(V))
```

---
## 문제 B21 🐞 오류 찾기 (5장)

자유 낙하하는 물체의 거리 `d`(m)와 속도 `v`(m/s)를 t = 0~10 s(0.01 s 간격)에서 계산해 **한 축에** 두 곡선을 겹쳐 그리려 한다(거리는 기본 실선, 속도는 빨간 파선). 가로축은 **시간**이어야 하고, 제목·축 이름·범례·격자를 붙인다. Command Window에는 **최대 거리 `dmax` 하나만** 표시되어야 한다.

오류를 모두 찾아라. 각 오류가 화면(Command Window)이나 그림에 어떤 현상을 일으키는지, 그리고 실행하면 **어느 줄까지 돌고 멈추는지**도 써라. 오류가 아닌데 의심스러워 보이는 줄이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc, close all
g = 9.81;                         % m/s^2
t = 0:0.01:10                     % s
d = 0.5*g*t.^2;                   % m
v = g*t;                          % m/s
plot(d);
plot(t, v, 'r--');
title("Free fall");
xlabel(Time, s)
ylabel("d (m), v (m/s)");
legend("distance", "velocity")
grid on;
dmax = max(d);
```

---

## 문제 B22 🐞 오류 찾기 (5장)

저항 10 Ω, 20 Ω, 50 Ω에 전류 I = 0~5 A를 흘릴 때의 전력 P = R·I²를 **저항마다 곡선 하나씩, 모두 3개**의 곡선으로 그리려 한다. `P`의 크기는 한 번 확인 출력한다. 범례는 왼쪽 위, 축 범위는 x 0~5 A, y 0~1300 W.

오류를 모두 찾아라. 첫 번째 오류를 고친 뒤에도 그림이 의도와 다르다면 **어떤 모양이 그려지는지**(선이 몇 개, 각 선이 점 몇 개) 구체적으로 써라. 오류가 아닌데 의심스러워 보이는 줄이 있으면 왜 괜찮은지도 써라.

```matlab
clear; clc; close all
I = 0:0.5:5;                         % A, 1x11
R = [10 20 50];                      % ohm
P = R' * I.^2;                       % W, 3x11 (행 하나 = 저항 하나)
size(P)
Imat = [I, I, I];                    % 의도: P와 같은 3x11
plot(Imat, P, LineWidth = 1.5)
legend("10 \Omega", "20 \Omega", "50 \Omega", Location = "northwest")
axis([0 1300 0 5])
xlabel("Current I (A)"), ylabel("Power P (W)")
title("P = I^2R")
grid on
```

---

## 문제 B23 🐞 오류 찾기 (5장)

두 온도 센서 A, B의 하루(0~24 h, 2 h 간격) 기록을 그린다. 의도는 다음과 같다.

1. A: **검은** 점선 + 별 마커
2. B: 초록 일점쇄선 + 사각 마커, 선 굵기 2
3. 두 센서의 평균: 빨간 **실선** + 원 마커
4. 범례는 그린 순서대로 "A", "B", "mean", 왼쪽 아래
5. 그림을 `sensors.png`로 저장한 뒤, **같은 창에서 기존 선을 모두 지우고** A − B 차이를 검은 실선 + 다이아몬드 마커(크기 8)로 새로 그린다.

오류를 모두 찾아라. 파일을 실행하면 무엇이 먼저 보이는지, 그것을 고치면 그림이 의도와 어떻게 다른지 단계별로 써라. 오류가 아닌데 의심스러워 보이는 줄이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc, close all
hr = 0:2:24;                                  % h
TA = 20 + 5*sind(15*hr);                      % degC
TB = 18 + 3*cosd(15*hr);                      % degC
plot(hr, TA, 'b:*')
hold on
plot(hr, TB, LineWidth = 2, 'g-.s')
plot(hr, (TA + TB)/2, 'ro')
legend("B", "A", "mean", "Location", "southwest")
xlabel("Time (h)"), ylabel("T (^oC)")
title("Sensor temperatures")
exportgraphics(gcf, "sensors.png")
plot(hr, TA - TB, 'k', MarkerSize = 8)
title("A - B"), xlabel("Time (h)"), ylabel("\DeltaT (^oC)")
```

---

## 문제 B24 🐞 오류 찾기 (5장)

반지름 1인 원(파란 실선)과 반축 a = 3, b = 1.5인 타원(**검은 일점쇄선**)을 한 축에 그린다. 원이 찌그러지지 않고 **원으로** 보여야 하고(가로·세로 데이터 간격이 같아야 함), 축 범위는 x −3.5~3.5, y −2~2. 원 위 (1, 0)에 "r = 1", 타원 꼭대기 (0, b)에 화살표와 "b = 1.5"를 붙이고, 제목에 위 첨자로 식을 쓰고, 두 축 이름에서 `pos` 세 글자가 **모두** 아래 첨자가 되게 한다.

오류를 모두 찾아라. 실행하면 **어느 줄에서 멈추는지** 쓰고, 그 줄을 고친 뒤 끝까지 실행된 그림이 의도와 어떻게 다른지(오류 메시지 없이 틀리는 곳) 써라. 오류가 아닌데 의심스러워 보이는 줄이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc, close all
th = linspace(0, 2*pi, 200);
a = 3; b = 1.5;
plot(cos(th), sin(th), 'b-', a*cos(th), b*sin(th), 'k.-')
axis square
axis(-3.5, 3.5, -2, 2)
grid on
legend("circle", "ellipse")
text(1, 0, " r = 1")
text(0, b, "\leftarrow b = 1.5")
title("x^2/a^2 + y^2/b^2 = 1")
xlabel("x_{pos} (m)"), ylabel("y_pos (m)")
```

---

## 문제 B25 🐞 오류 찾기 (5장)

입자의 위치 x(t) = 2t³ − 6t², 속도 v, 가속도 a, 저크 j = 12 m/s³(일정)를 2×3 타일에 그린다.

- 위 줄 세 칸 전체를 x(t) 하나가 차지한다.
- 아래 줄에 v, a, j를 차례로. j는 높이 12인 **수평선**으로 보여야 한다.
- 레이아웃 **전체** 제목 "Motion of a particle"과 공통 x축 이름 "Time (s)".
- 그다음 **새 figure 창**에 v–a 위상도(가로 v, 세로 a)를 그린다.
- Command Window에는 **아무것도** 출력되지 않아야 한다.

오류를 모두 찾아라. 실행하면 Command Window에 무엇이 나오는지, 어느 줄에서 멈추는지, 멈추기 전까지 그려진 타일들이 의도와 어떻게 다른지도 써라. 오류가 아닌데 의심스러워 보이는 줄이 있으면 왜 괜찮은지도 써라.

```matlab
clear; clc; close all
t = 0:0.05:4;                         % s
x = 2*t.^3 - 6*t.^2;                  % m
v = 6*t.^2 - 12*t;                    % m/s
a = 12*t - 12;                        % m/s^2
L = tiledlayout(2, 3)
nexttile([1 3])
plot(t, x), ylabel("x (m)"), grid on
nexttile
plot(t, v), ylabel("v (m/s)")
nexttile
plot(t, a), ylabel("a (m/s^2)")
nexttile
plot(t, 12), ylabel("j (m/s^3)")
title("Motion of a particle")
xlabel(L, "Time (s)")
nexttile
plot(v, a), xlabel("v (m/s)"), ylabel("a (m/s^2)")
```

---

## 문제 B26 🐞 오류 찾기 (종합: 3·5장)

1~6월 전력 사용량(kWh)으로 다음을 하려 한다.

- 2024년 평균 `avg`와, 평균보다 많이 쓴 달 번호 `above`를 Command Window에 표시
- 한 창에 그림 **다섯 개**: (1) 세로 막대, 가로축 = 월, 막대 높이 = 2024 사용량 (2) 같은 데이터의 가로 막대 (3) 월별 **비율** 원그래프(만 kWh 단위로 바꾼 값을 넘김) (4) **월마다** 2023·2024 막대 두 개가 나란히 묶인 그룹 막대 + 범례 (5) 전년 대비 증감 막대

오류를 모두 찾아라. 실행 오류가 나는 줄과, 그 전에 이미 그려진 그림이 각각 의도와 어떻게 다른지 써라. 오류가 아닌데 의심스러워 보이는 줄이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc, close all
month = 1:6;
use23 = [320 290 310 280 350 400];         % kWh
use24 = [300 310 295 260 330 420];         % kWh
avg = mean(use24)
above = month(use24 > avg)
subplot(2, 2, 1)
bar(use24, month), xlabel("Month"), ylabel("kWh")
subplot(2, 2, 2)
barh(month, use24), xlabel("kWh"), ylabel("Month")
subplot(2, 2, 3)
pie(use24/10000)
subplot(2, 2, 4)
bar([use23, use24]), legend("2023", "2024")
subplot(2, 2, 5)
bar(month, use24 - use23), title("Change")
```

---

## 문제 B27 🐞 오류 찾기 (종합: 3·5·7장)

시험 점수 12개의 분포를 1×2 타일로 그린다. 의도:

- Command Window에 `mean = 79.0, std = 13.2` 한 줄 출력
- 왼쪽: 구간 5개로 자동 분할한 히스토그램
- 오른쪽: 학점 경계 F(0~60), D(60~70), C(70~80), B(80~90), A(90~100) **다섯 구간**의 히스토그램
- **두 칸 모두** x축 "Score", y축 "Students"
- 레이아웃 전체 제목 `Exam: mean 79.0, std 13.2`
- 90점 **이상**(A) 인원 `nA`를 Command Window에 `nA = ...` 형태로 표시하고, A 막대 위에 `A: 3` 텍스트

오류를 모두 찾아라. 각 오류의 실제 출력(화면 글자, 제목 글자, 막대 개수 등)을 구체적으로 써라. 오류가 아닌데 의심스러워 보이는 줄이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc, close all
score = [88 72 95 61 79 84 58 90 67 100 73 81];
m = mean(score); s = std(score);
fprintf("mean = %.1f, std = %.1f\n", m, s);
t = tiledlayout(1, 2);
nexttile
histogram(score, [5])
nexttile
edges = [60 70 80 90 100];
histogram(score, edges)
xlabel("Score"), ylabel("Students")
title(t, sprintf("Exam: mean %d, std %d", m, s))
nA = sum(score > 90);
text(92, nA + 0.3, "A: " + nA)
```

---

## 문제 B28 🐞 오류 찾기 (5장)

2×2 타일에 네 그림을 그린다. 의도:

1. 1차 저역통과 필터 이득 G(ω) = 1/√(1+ω²)을 ω = 0.01~100 rad/s에서, **가로축(주파수)만 로그** 눈금으로
2. 같은 함수를 `fplot`으로 같은 구간에(이 칸은 선형 축이어도 된다)
3. 안테나 방사 패턴 r = |cos θ|를 θ = 0°~360°에서 극좌표로
4. 감소하는 직선 y = 5 − t를 t = 0~10 s **전 구간**에 걸쳐 **y축 로그 눈금**으로

오류를 모두 찾아라. 실행 시 오류가 나는 줄은 어떤 오류인지, 오류 없이 그려지는 칸은 그림이 어떻게 나오는지 써라. 요구 자체에 무리가 있는 칸이 있다면 그 이유와 대안도 써라. 오류가 아닌데 의심스러워 보이는 줄이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc, close all
G = @(w) 1 ./ sqrt(1 + w^2);
w = logspace(-2, 2, 200);                 % rad/s
tiledlayout(2, 2)
nexttile
semilogy(w, G(w)), title("Gain (data)")
nexttile
fplot(G, 0.01, 100), title("Gain (fplot)")
nexttile
deg = 0:5:360;
r = abs(cos(deg*pi/180));
polarplot(r, deg*pi/180), title("Antenna pattern")
nexttile
tt = 0:0.5:10;
y = 5 - tt;
semilogy(tt, y), title("y = 5 - t")
```

---

## 문제 B29 🐞 오류 찾기 (5장)

안장면 z = x² − y²를 x = −2~2, y = −1~1(간격 0.1)에서 2×2 타일로 그린다. 의도:

1. `mesh` 격자선 곡면
2. `surf` 곡면, **면 색 + 검은 격자선이 보이는 기본 음영** 그대로. 이 칸**만** `hot` 색 배합, 나머지 칸은 기본 `parula`
3. `surfc` (곡면 + 등고선)
4. y = 0 단면 곡선 z = x²를 3차원 굵은 선으로, 격자와 세 축 이름

`Z`의 크기는 한 번 확인 출력한다. 오류를 모두 찾아라. 실행하면 어디서 멈추는지, 고친 뒤에도 남는 오류는 무엇인지 차례로 써라. 오류가 아닌데 의심스러워 보이는 줄이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc, close all
x = -2:0.1:2;                        % 1x41
y = -1:0.1:1;                        % 1x21
[X, Y] = meshgrid(x, y);
Z = X.^2 - Y^2;
size(Z)
tiledlayout(2, 2)
nexttile
mesh(x, y, Z), title("mesh")
nexttile
surf(X, Y, Z), shading interp, title("surf")
colormap("hot")
nexttile
surfc(X, Y, Z), title("surfc")
nexttile
plot3(x, zeros(size(y)), x.^2, LineWidth = 2)
grid on, title("y = 0 section")
xlabel("x"), ylabel("y"), zlabel("z")
```

---

## 문제 B30 🐞 오류 찾기 (종합: 3·5·7장)

배터리 방전 시험: 0~60분, **10분 간격으로 7회** 측정한 전압 `V`와 온도 `T`를 두 y축 그래프로 그린다. 의도:

- 전압은 **왼쪽** y축, 온도는 **오른쪽** y축
- 전압 선의 핸들을 `h`에 저장하되 Command Window에는 아무것도 표시하지 않는다
- 범례 "V", "T", 제목 `Battery test: 60 min, drop 0.60 V`
- 그림을 `battery.png`로 저장
- 시간·전압·온도 표 `report`를 Command Window에 표시
- 마지막에 그림 **창을 모두 닫는다**

오류를 모두 찾아라. 실행하면 어느 줄에서 처음 멈추는지, 그것을 고치면 다음에 무엇이 보이는지 차례로 써라. 오류가 아닌데 의심스러워 보이는 줄이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc, close all
tmin = linspace(0, 60, 10);                    % min
V = [4.20 4.05 3.95 3.88 3.80 3.71 3.60];      % V
T = [25 27 30 32 33 35 38];                    % degC
yyaxis right
h = plot(tmin, V, "-o")
ylabel("Voltage (V)")
yyaxis left
plot(tmin, T, "-s")
ylabel("Temperature (^oC)")
xlabel("Time (min)")
legend("V", "T")
title(sprintf("Battery test: %d min, drop %.2f V", tmin(end), V(1) - V(end)))
exportgraphics(gcf, "battery")
report = table(tmin', V', T', VariableNames = ["t_min" "V" "T"])
clf
```

---
## 문제 B31 🐞 오류 찾기 (6장, 7장)

하중 `F`(N)와 단면적 `A`(m²)로 보의 응력을 **MPa 단위로** 돌려주는 함수를 파일 **`beam_stress.m`** 에 저장하고, 스크립트에서 하중 세 개에 대해 한 줄씩 출력한 뒤 최대 응력을 출력하려 한다. 함수를 호출할 때 **함수 안의 중간값은 화면에 나오면 안 된다.**

파일 `beam_stress.m`:

```matlab
function sigma = beam_sigma(F, A);
% BEAM_SIGMA  하중 F(N)와 단면적 A(m^2)로 응력(MPa)을 계산한다
clear
s = F ./ A
sigma_MPa = s / 1e6;
end
```

스크립트:

```matlab
clear, clc
F = [1000 2000 4000];       % N
A = 2e-4;                   % m^2
sig = beam_sigma(F, A);
fprintf('%4d N -> %6.2f MPa\n', [F; sig])
fprintf('Peak: %.2f MPa\n', max(sigma_MPa))
```

오류를 모두 찾아라. 오류를 하나씩 고쳐 가며 실행할 때 **어느 줄에서 무엇이 먼저 보이는지** 차례대로 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

---

## 문제 B32 🐞 오류 찾기 (6장, 3장)

초속 `v0 = 30` m/s로 30°, 45°, 60°로 던진 물체의 사거리 `R`, 최고 높이 `H`, 비행 시간 `T`를 **스크립트 끝의 local function 하나**로 한꺼번에 구하고, 각도마다 한 줄씩 출력하려 한다.

기대 출력:

```
30 deg: R =  79.5 m, H = 11.5 m, T = 3.06 s
45 deg: R =  91.7 m, H = 22.9 m, T = 4.32 s
60 deg: R =  79.5 m, H = 34.4 m, T = 5.30 s
```

```matlab
clear, clc
v0 = 30;                     % m/s
th = [30 45 60];             % deg
R, H = trajectory(v0, th);
T = trajectory(v0, th);
fprintf('%2d deg: R = %5.1f m, H = %4.1f m, T = %4.2f s\n', th, R, H, T)

function [R, H, T] = trajectory(v0, deg)
g = 9.81;
R = v0^2*sind(2*deg)/g;
H = (v0*sind(deg))^2/(2*g);
T = 2*v0*sind(deg)/g;
end
```

오류를 모두 찾아라. 각 오류가 문법 오류인지, 실행 오류(그 줄에서 멈춤)인지, 조용히 틀린 값인지 구분하라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

---

## 문제 B33 🐞 오류 찾기 (6장, 5장)

관 지름 `d`(m), 유속 `v`(m/s), 관 개수 `n` 으로 총 유량 `Q = n·v·πd²/4` (m³/s)와 관 하나의 단면적 `A` 를 돌려주는 함수를 파일 `pipe_flow.m` 에 만들었다. `v` 를 생략하면 2, `n` 을 생략하면 1을 쓴다. 출력을 하나만 받으면 `Q` 만 돌려주면 된다. 테스트 스크립트 `test_pipe.m` 은 세 호출의 결과를 **모두 화면에 남기고**, 지름 0.2 m 관의 단면적을 출력한 뒤, 지름 0.05~0.3 m 에서 `Q` 그래프를 그리려 한다.

파일 `pipe_flow.m`:

```matlab
function [Q, A] = pipe_flow(d, v, n)
% PIPE_FLOW  지름 d(m), 유속 v(m/s, 기본 2), 관 개수 n(기본 1)의 총 유량 Q와 단면적 A
clc
if nargin < 3
    v = 2;
    n = 1;
end
A = pi*d.^2/4;
if nargout == 2
    Q = n * v * A;
end
end
```

스크립트 `test_pipe.m`:

```matlab
clear, clc
Q1 = pipe_flow(0.1)
Q2 = pipe_flow(0.1, 3)
Q3 = pipe_flow(0.1, 3, 4)
[Q4, A4] = pipe_flow(0.2);
fprintf('Area of 0.2 m pipe: %.4f m^2\n', A)
fplot(pipe_flow, [0.05 0.3])
```

오류를 모두 찾아라. 오류 메시지 없이 **틀린 값**이 나오는 곳과 **화면에서 출력이 사라지는** 곳도 찾아 이유를 설명하라.

---

## 문제 B34 🐞 오류 찾기 (6장)

벽의 열관류율 `K`(W/m²·K)를 **전역 변수**로 두고, 벽 넓이 25 m², 실내외 온도차 15 K 일 때 열손실 `P = K·A·ΔT` (W)를 스크립트 끝의 local function 으로 구해 **화면에 표시**하려 한다. 기대값은 `P = 300` 이다.

```matlab
clear, clc
function P = heat_loss(dT)
global K_WALL
P = K_WALL * AREA * dT;
end

global K_wall
K_wall = 0.8;          % W/(m^2*K)
AREA = 25;             % m^2
P = heat_loss(15);
```

오류를 모두 찾아라. 실행하면 어디까지 돌고 어떤 현상이 나는지 쓰고, 오류를 하나 고칠 때마다 다음에 무엇이 보이는지도 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

---

## 문제 B35 🐞 오류 찾기 (6장, 5장)

물체의 속도가 `v(t) = c·t·e^(−t/2)` (m/s)일 때, 계수는 **최종값 `c = 25`** 를 쓴다(첫 줄의 20 은 지난 실험값이다). 0~10 s 에서 그래프를 그리고, `fminbnd` 로 최대 속도와 그 시각을, `integral` 로 0~10 s 이동 거리를, `fzero` 로 속도가 처음 5 m/s 가 되는 시각(0.3 s 근처)을 구하려 한다.

```matlab
clear, clc
c = 20;
v = @(t) c*t*exp(-t/2);                 % m/s
c = 25;
fplot(v, [0 10])
neg = -v;
[tmax, vneg] = fminbnd(neg, [0 10]);
dist = integral(v, 0, 10)
t5 = fzero(v(t) - 5, 0.3)
fprintf('Max %.2f m/s at t = %.2f s\n', -vneg, tmax)
```

오류를 모두 찾아라. 오류 메시지 없이 **틀린 값**을 내는 원인도 찾아라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

---

## 문제 B36 🐞 오류 찾기 (7장, 8장)

고객 이름과 전기 사용량을 입력받아 요금(120 원/kWh)을 계산하고, 고객이 `Park` 이면 10 % 할인한 뒤 두 줄로 출력하려 한다. 사용자는 이름에 **`Kim`** (따옴표 없이), 사용량에 **`350`** 을 입력한다.

기대 출력(입력 줄 제외):

```
Customer: Kim
Bill: 42000 won
```

```matlab
clear, clc
name = input('Customer name: ');            % 사용자는 Kim 을 입력
kwh  = input('Usage (kWh): ', "s");         % 사용자는 350 을 입력
rate = 120;                                 % 원/kWh
bill = kwh * rate;
if name == 'Park'
    bill = bill * 0.9;                      % Park 고객 10% 할인
end
disp('Customer:', name)
disp(['Bill: ' bill ' won'])
```

오류를 모두 찾아라. 각 오류가 **실제로 어떤 현상**(오류 메시지 / 잘못된 값 / 깨진 글자)을 일으키는지 써라.

---

## 문제 B37 🐞 오류 찾기 (7장)

센서 세 개의 번호·온도·습도를 한 줄씩 출력하고, 평균 온도와 최대 습도를 출력하려 한다. 화면에는 **아래 네 줄만** 나와야 한다. 디버그 줄은 화면에 나오면 안 된다.

```
Sensor 101: 21.5 C, 45%
Sensor 102: 23.0 C, 52%
Sensor 103: 19.8 C, 38%
Average temp: 21.4 C, max hum: 52%
```

```matlab
clear, clc
id   = [101 102 103];
temp = [21.5 23.0 19.8];                       % degC
hum  = [45 52 38];                             % 상대습도(%)
data = [id' temp' hum']                        % 3x3 자료 행렬
fprintf('debug: %d values\n', numel(data));    % 디버그용. ; 를 붙였으니 안 보이겠지?
fprintf('Sensor %d: %d C, %d%%\n', data)
fprintf('Average temp: %.1f C, max hum: %d%%\n', mean(temp))
```

오류를 모두 찾아라. 이 스크립트는 **오류 메시지 없이 끝까지 실행된다.** 실제 화면 출력을 그대로 적고, 기대 출력과 다른 부분마다 원인이 되는 줄을 짚어라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

---

## 문제 B38 🐞 오류 찾기 (7장, 3장, 5장)

학생 네 명의 점수로 이름·점수 **4행 2열** 표를 만들어 `ans =` 줄 없이 보여 주고, 막대그래프 제목에 평균(소수 첫째 자리)을 넣고 막대 위에 점수를 적는다. 그다음 사용자가 그래프에서 **막대 하나만** 클릭하면 그 높이를 출력하고, 마지막으로 최고점 학생을 `Top: Ben (92 points)` 형식으로 출력하려 한다.

```matlab
clear, clc, close all
name  = ["Ann" "Ben" "Cho" "Dan"];
score = [78 92 85 63];
avg = mean(score);
T = table(name, score, VariableNames = ["Name" "Score" "Grade"]);
disp(T);
bar(score)
title("Class average = %.1f", avg)
text(1:4, score + 2, "" + score)
ylabel("Score")
[px, py] = ginput;                    % 막대 하나를 클릭해 높이를 읽는다
fprintf('Clicked: %.1f\n', py)
fprintf('Top: %s\n', max(score))
```

오류를 모두 찾아라. 고친 뒤 **`T` 가 몇 행 몇 열 표가 되는지**, 그림의 제목이 실제로 어떻게 보이는지도 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

---

## 문제 B39 🐞 오류 찾기 (7장, 2장)

세 시간 간격 기온을 (1) `temps.mat` 에 변수 `T` 로 저장하고, (2) 텍스트 파일 `logT.txt` 에도 저장하고, (3) 실행할 때마다 **새로 만들어지는** 보고서 파일 `report.txt` 에 ` 0:00  17.9 C` 형식으로 한 줄씩 쓴 뒤(화면에는 쓰지 않는다), (4) `T` 를 지우고 `logT.txt` 를 다시 읽어 평균을 표시하려 한다. `report.txt` 는 아직 없는 파일이다.

```matlab
clear, clc
hour = 0:3:12;
T = [17.9 18.4 21.0 24.6 25.3];               % degC
save('temps', T)                              % temps.mat 에 T 를 저장
save logT.txt T -ascii                        % 같은 자료를 텍스트로도 저장
fid = fopen('report.txt', 'r');               % 보고서 파일을 새로 만든다
fprintf('%2d:00 %5.1f C/n', [hour; T], fid);
clear T
load logT.txt
avg = mean(T)
```

오류를 모두 찾아라. 슬라이드가 "반드시 하라"고 한 것을 빠뜨린 곳도 오류로 친다. 앞의 오류를 고친 뒤 **화면에 무엇이 찍히는지**(파일이 아니라 화면으로 나가는 글자)도 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

---

## 문제 B40 🐞 오류 찾기 (6장, 7장, 2장)

복리 원리금 `A = P(1 + r/100)ⁿ` 을 계산하는 함수를 파일 `compound.m` 에 만들고, 원금 1000, 연이율 5 % 로 1·5·10년 뒤 원리금을 **1열 기간, 2열 원리금인 3×2 행렬**로 보여 준 뒤 20년 뒤 원리금을 표시하려 한다. 화면에는 **그 3×2 행렬과 20년 뒤 값만** 나와야 한다.

파일 `compound.m`:

```matlab
function A = compound(P, r, n);
% COMPOUND  원금 P, 연이율 r(%), n년 뒤 원리금 A (복리)
rate = r/100
A = P*(1 + rate).^n
end
```

스크립트:

```matlab
clear, clc
P = 1000, r = 5;                   % 원금(원), 연이율(%)
years = [1; 5; 10]                 % 기간(년)
A = compound(P, r, years);
result = [years; A];               % 1열: 기간, 2열: 원리금
disp(result);
compound(P, r, 20);                % 20년 뒤 원리금을 화면에 보여 준다
```

오류를 모두 찾아라. 이 코드는 **오류 메시지 없이 끝까지 실행된다.** 화면에 **어떤 이름의 출력이 어떤 순서로** 나오는지 쓰고, 목적과 다른 출력마다 원인이 되는 줄을 짚어라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

---
## 문제 B41 🐞 오류 찾기 (8장)

온도 센서 7개의 값 `T`(°C)에서 다음을 구하려는 스크립트다.

- `inRange`: 20 이상 30 이하인 자리(logical, 화면에 표시)
- `hot`: 30 초과 45 미만인 자리(표시)
- `warm`: "20 이하가 **아닌**" 자리(표시)
- `out`: 20 미만이거나 30 초과인 자리(표시)
- `moved`: 22가 아닌 자리(표시하지 않음)
- 마지막 줄: `3 of 7 readings in range`

오류를 모두 찾아라. 실행하면 어디까지 돌고 어떤 현상이 나는지도 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc
T = [18 25 31 22 40 15 28];          % °C
inRange = 20 <= T <= 30
hot = T > 30 & < 45
warm = ~T <= 20
out = xor(T < 20, T > 30)
moved = T != 22;
fprintf('%d of %d readings in range\n', sum(inRange), numel(T))
```

---

## 문제 B42 🐞 오류 찾기 (8장, 7장)

전력 측정 행렬 `P`(kW)에서

1. 40 kW 초과인 원소의 **선형 인덱스** `idx`를 화면에 보이고,
2. 그 원소들의 **값의 평균** `avgHigh`를 표시하고,
3. 40 초과인 원소마다 `row r, col c`를 **한 줄에 한 원소씩** 출력하고,
4. 처음으로 60 kW를 넘는 원소의 **값** `first`를 표시하고,
5. 100 kW 초과인 원소의 **개수**를 `Over 100: N readings`로 출력한다(없으면 N = 0).

오류를 모두 찾아라. 이 스크립트는 오류 메시지 없이 끝까지 실행된다. 각 줄이 실제로 무엇을 화면에 내놓는지 써라.

```matlab
clear, clc
P = [12 45 33; 50 8 47; 61 29 15];     % kW
idx = find(P > 40);
avgHigh = mean(idx)
[r, c] = find(P > 40);
fprintf('row %d, col %d\n', r, c)
first = find(P > 60, 1)
over = find(P > 100);
fprintf('Over 100: %d readings\n', over)
```

---

## 문제 B43 🐞 오류 찾기 (8장, 7장)

볼트 6개의 길이 `len`(mm)을 검사한다. 의도는 다음과 같다.

- `good`: 검사원이 손으로 적은 합격 표시(1번, 2번, 5번 합격)로 고른 길이(표시)
- `bad`: 51 mm 초과 또는 49.5 mm 미만인 불량 마스크(**화면에 표시하지 않음**)
- `avgBad`: 불량 볼트 길이의 평균(표시)
- 불량 볼트의 이름(`A`~`F`)을 `Rejected: C`처럼 한 줄에 하나씩 출력
- 불량을 지운 뒤 남은 개수 `nGood`(표시)

오류를 모두 찾아라. 각 오류가 실행 중 어느 줄에서 어떤 현상을 일으키는지 순서대로 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc
len = [50.2 49.7 51.3 48.9 50.0 52.1];     % mm
keep = [1 1 0 0 1 0];
good = len(keep)
bad = len > 51 | len < 49.5
len(find(bad)) = [];
nGood = numel(len)
avgBad = mean(len(bad))
labels = ["A" "B" "C" "D" "E"];
fprintf('Rejected: %s\n', labels(bad))
```

---

## 문제 B44 🐞 오류 찾기 (8장, 7장)

풍속 `v`(m/s)로 등급을 매긴다. 음수면 `error`로 멈추면서 값을 알려 주고, 0 이상 5 미만 `"calm"`, 5 이상 15 미만 `"breeze"`, 15 이상 25 미만 `"gale"`, 25 이상 `"storm"`이다. 이어서 돌풍 기록 `gust` 중 **하나라도** 25 이상이면 경고를 출력한다. `v = 9`일 때 기대 출력은 다음과 같다.

```
v = 9.0 m/s: breeze
Storm gust detected
```

오류를 모두 찾아라. `v = 25`로 바꾸면 무슨 일이 생기는지도 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc
v = 9;                             % m/s
gust = [12 18 27 9];               % m/s
if v < 0
    error('Speed must be nonnegative, got' v)
elseif v < 5
    level = "calm";
elseif v < 25
    level = "gale";
elseif v < 15
    level = "breeze";
elseif v > 25
    level = "storm";
end
fprintf('v = %.1f m/s: %s\n', v, level);
if gust >= 25; disp('Storm gust detected'), end
```

---

## 문제 B45 🐞 오류 찾기 (8장, 7장)

단위 한 글자(`C`/`c` 또는 `F`/`f`)를 **따옴표 없이** 입력받고 온도를 입력받아 다른 단위로 바꿔 출력한다. 다른 글자면 `Unknown unit`. 끝으로 `yes`/`no`를 따옴표 없이 입력받아 `yes`면 안내를 출력한다. 사용자가 `F`, `212`, `no`를 입력했을 때 기대 화면은 다음과 같다.

```
Unit (C/F): F
Temperature: 212
212.0 F = 100.0 C
Convert another? (yes/no): no
```

오류를 모두 찾아라. 각 오류가 **언제**(실행 전 / 입력 단계 / 특정 입력에서만) 드러나는지 구분해서 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc
unit = input('Unit (C/F): ');
t = input('Temperature: ');
if unit == 'C' | 'c'
    f = t*9/5 + 32;
    fprintf('%.1f C = %.1f F\n', t, f)
else if unit == 'F' | unit == 'f'
    c = (t - 32)*5/9;
    fprintf('%.1f F = %.1f C\n', t, c)
else
    disp('Unknown unit')
end
again = input('Convert another? (yes/no): ', 's');
if again == 'yes'
    disp('Run the script again')
end
```

---

## 문제 B46 🐞 오류 찾기 (8장, 7장)

`menu`로 도형 네 개 중 하나를 고르게 하고, 크기 `a = 2` m일 때 넓이를 출력한다. 원은 πa², 정사각형은 a², 정삼각형은 (√3/4)a², 정육각형은 (3√3/2)a²이다. 사용자가 창을 닫아 버리면 `error`로 "No shape selected"를 알리고 멈춰야 한다. Triangle을 누르면 `Triangle: 1.732 m^2`가 나와야 한다.

오류를 모두 찾아라. 실행하면 메뉴 창이 뜨기는 하는지, 버튼별로 어떤 현상이 나는지 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc
shapes = ["Circle", "Square", "Triangle", "Hexagon"];
pick = menu("Choose a shape", shapes);
a = 2;                                   % m
switch pick
    case "Circle"
        A = pi*a^2;
    case 2;
        A = a^2;
    case 3, 4
        A = sqrt(3)/4*a^2;
        break
end
fprintf('%s: %.3f m^2\n', shapes(pick), A)
```

---

## 문제 B47 🐞 오류 찾기 (종합: 2·3·5·7·8장)

공을 높이 `h` = 5, 10, …, 30 m에서 떨어뜨린다. 낙하 시간 t = √(2h/g), 충돌 속도 v = g t, 질량 0.2 kg인 공의 충돌 운동에너지 KE = ½ m v²을 구한다. 의도는 다음과 같다.

- `g`와 `h`는 화면에 표시하지 않는다.
- `Max KE 58.9 J`를 출력한다.
- 낙하 시간이 1 s 이상 2 s 이하인 **높이**를 `mid`로, 그 개수를 `n`으로 표시한다.
- 충돌 속도가 처음으로 20 m/s를 넘는 높이를 `first`로 표시한다.
- 높이마다 `h =  5 m, t = 1.01 s` 꼴로 한 줄씩 출력한다.
- v–h 그래프를 그린다(슬라이드 규칙대로 축 이름과 단위, 제목).
- 마지막 높이의 속도가 최댓값이면 `Speed increases with height`를 출력한다.

오류를 모두 찾아라. 문법 오류, 실행 시 오류, **조용히 틀린 결과**, 슬라이드가 "반드시 하라"고 한 것을 빠뜨린 줄을 구분하고, 고쳐 가며 실행할 때 화면에 무엇이 차례로 나타나는지 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc
g = 9.81, h = 5:5:30;                    % m/s^2, m
t = sqrt(2*h/g);                         % s
v = g*t;                                 % m/s
KE = 0.5*0.2*v^2;                        % J
fprintf('Max KE %.1f J\n', max(KE))
mid = t(t >= 1 & t <= 2)
n = length(mid)
first = h(find(v > 20, 1))
fprintf('h = %2d m, t = %.2f s\n', h, t)
plot(h, v, 'bo-')
xlabel('Drop height, m')
title('Impact speed vs height')
if v(end) = max(v)
    disp('Speed increases with height')
end
```

---

## 문제 B48 🐞 오류 찾기 (종합: 3·4·5·7·8장)

학생 6명의 점수에서

1. 최고점 학생 이름 `top`을 표시하고,
2. 최고점이 Jung이고 **모든** 점수가 60 초과이면 `Jung leads, and everyone is above 60`을 출력하고,
3. Park(3번)의 점수에 A(90 이상)/B(80 이상)/C(그 외)를 매겨 `Park scored 85: B`를 출력하고,
4. 70점 이상 합격 마스크 `pass`(표시하지 않음)로 `5 of 6 passed`를 출력하고,
5. 막대그래프에 이름 눈금, 제목, 축 이름을 단다.

오류를 모두 찾아라. 문법 오류, 실행 시 오류, 조용히 틀린 결과, 빠뜨린 것을 구분하고, 오류를 하나씩 고쳐 가며 실행할 때마다 **어느 줄에서 무엇이** 나오는지 써라.

```matlab
clear, clc
scores = [92 78 85 64 99 71];
names = ["Kim" "Lee" "Park" "Choi" "Jung" "Han"];
top = names(scores = max(scores))
if top == "Jung" && scores > 60, disp("Jung leads, and everyone is above 60"), end
s = scores(3);
switch s
    case s >= 90, grade = "A";
    case s >= 80, grade = "B";
    otherwise,    grade = "C";
end
fprintf('%s scored %d: %s\n', names(3), s, grade)
pass = scores => 70;
fprintf('%d of %d passed\n', pass, numel(scores))
bar(scores), xticklabels(names), title('Midterm scores')
```

---

## 문제 B49 🐞 오류 찾기 (종합: 4·5·6·8장)

파일명 `cube_mass.m`. 스크립트 끝의 local function `density`가 재료 이름(대소문자 무관, `"alu"`는 `"aluminum"`의 줄임말로 인정)을 받아 밀도(kg/m³)를 돌려주고, 모르는 재료면 `error`로 재료 이름을 알린다. 스크립트는 **steel**의 밀도 `rho`를 표시한 뒤, 한 변 L(m)인 정육면체의 질량을 익명 함수 `m`으로 만들어 L = 0.05~0.2 m에서 그래프를 그리고, 질량이 처음으로 5 kg을 넘는 L을 `big`으로 표시한다.

오류를 모두 찾아라. 문법 오류, 실행 시 오류, 조용히 틀린 결과, 빠뜨린 것을 구분하라. 특히 `density(mats)` 호출에서 MATLAB이 **어떤 오류 메시지를 왜** 내는지 설명하라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc
mats = ["steel" "aluminum" "copper"];
rho = density(mats)
m = @(L) rho*L^3;                        % kg, L in m
L = linspace(0.05, 0.2, 4);
plot(L, m(L)), xlabel('Side, m'), ylabel('Mass, kg')
big = L(find(m(L) > 5, 1))

function r = density(mat)
switch lower(mat)
    case "steel",              r = 7850;
    case "aluminum", "alu",    r = 2700;
    case 'copper',             r = 8960;
end
```

---

## 문제 B50 🐞 오류 찾기 (종합: 3·4·7·8장)

`use`는 가구 3곳(열 A, B, C)의 4개월(행 1~4월) 전력 사용량(kWh)이다. 의도는 다음과 같다.

- `hh`: **가구마다** 400 kWh를 넘은 달이 하나라도 있는지(1×3, 표시)
- `mon`: **달마다** 400 kWh를 넘은 가구가 하나라도 있는지(4×1, 표시)
- 가구 C의 4개월 합계 `tot`에 요율을 매긴다: 600 이하 0.10, 1200 이하 0.15, 그보다 많으면 0.20 $/kWh.
- `bill.txt`에 `Household C: 1420 kWh, $284.00`을 쓰고(파일이 열렸을 때만), 화면에 `Bill saved to bill.txt`를 출력한다.

오류를 모두 찾아라. MATLAB은 문법 오류를 한 번에 몇 개 알려 주는지, 고쳐 가며 실행할 때 각 단계에서 무엇이 보이는지, 실행이 중간에 멈추면 `bill.txt`는 어떤 상태로 남는지 써라. **오류가 아닌데 의심스러워 보이는 줄**이 있으면 왜 괜찮은지도 써라.

```matlab
clear, clc
use = [180 220 410; 350 90 510; 260 300 120; 150 470 380];   % kWh
hh = any(use > 400)
mon = any(use > 400, 1)
tot = sum(use(:, 3));
if tot <= 600
    rate = 0.10;
elseif tot <= 1200
    rate = 0.15;
elseif tot > 1500
    rate = 0.20;
end
end
fid = fopen('bill.txt', 'wt');
if fid <> -1, fprintf(fid, 'Household C: %d kWh, $%.2f\n', tot, tot*rate); end
disp('Bill saved to bill.txt')
```

---
