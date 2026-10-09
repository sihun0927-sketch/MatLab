# Chapter 7 — User-Controlled Input and Output · 해답

문제: [questions.md](questions.md). 출력은 R2026a 기본 상태(`format short`, `format loose`)를 [exam/README.md](../README.md)의 "Command Window 출력 규칙"대로 재현했다. MATLAB으로 실행하지 않았으므로 표시 형식이 확실하지 않은 곳은 `> **[확인 필요]**`로 남겼다.

---

## 7.1 사용자 입력 — `input`

### Q07-01 [출력] ★

원본: p.6–8 `z = input("Enter a value ")`, `x = input("Enter an array in brackets ")` → 변형: 입력값을 식(`2*4`)과 2×2 배열로, 둘째 줄에 `;`를 붙이고 이름만 다시 쳐서 보이기

```
Enter a value 2*4
z =

     8

Enter an array in brackets [1, 2; 3, 4]
x =

     1     2
     3     4

```

- `input`은 친 글자를 **MATLAB 식으로 계산**해서 돌려준다. `2*4`는 글자가 아니라 `8`이다.
- 둘째 줄은 `;` 때문에 바로 보이지 않고, 셋째 줄 `x`가 이름을 불러 보여 준다. 프롬프트 줄은 `;`와 상관없이 항상 찍힌다.
- 근거: [7.1](../../textbook/ch07/7.1-user-input.md) "`input`의 기본형"

### Q07-02 [출력] ★★

원본: p.9–11 `y = input("Enter your name in double quotes ")`, `w = input(... single quotes ...)` → 변형: `w` 줄에 `;`, `numel`로 크기 비교

```
Enter your name in double quotes "Holly"
y = 

    "Holly"

Enter your name in single quotes 'Maria'
n1 =

     1

n2 =

     5

```

- string은 `y = ` 뒤에 공백이 하나 붙고 값은 큰따옴표로 보인다.
- `"Holly"`는 string 하나라 `1×1` → `numel`은 1. `'Maria'`는 글자 다섯 개짜리 char라 `1×5` → 5. 슬라이드 p.11의 Workspace(`w 1x5 char`, `y 1x1 string`)가 이 차이다.
- `,`로 이은 두 명령은 둘 다 결과를 보인다.
- 근거: [7.1](../../textbook/ch07/7.1-user-input.md) "char 배열과 string은 크기가 다르다", ⚠️ 함정

### Q07-03 [오류] ★

원본: p.12–13 `p = input("Enter your name - no need to include quotes ",'s')` → 변형: `'s'`를 뺐다

```
Enter your name - no need to include quotes Lin
Error using input
Unrecognized function or variable 'Lin'.

Enter your name - no need to include quotes 
```

1. `'s'`가 없으면 `input`은 `Lin`을 식으로 해석한다. `Lin`이라는 변수나 함수가 없으니 `Unrecognized function or variable 'Lin'.`
2. `input`은 식이 잘못되면 오류 메시지를 보여 주고 **같은 프롬프트를 다시 띄운다**. 스크립트가 끝나지 않고 다시 입력을 기다린다.
3. `p = input("Enter your name - no need to include quotes ", "s")` (또는 `'s'`). 결과는 char `'Lin'`.

> **[확인 필요]** 첫 줄이 `Error using input`인지, 그리고 다시 뜨는 프롬프트 앞의 빈 줄 개수.

- 근거: [7.1](../../textbook/ch07/7.1-user-input.md) "`input(prompt, "s")`"

### Q07-04 [출력] ★★

원본: p.13 `input(..., 's')` → 변형: 숫자를 `'s'`로 받고 `+ 1`

```
Enter your age - no need to include quotes 42
p =

    '42'

q =

    53    51

```

- `'s'`로 받은 `42`는 숫자가 아니라 **char** `'42'`(`1×2`)다. char 표시는 작은따옴표.
- char에 `+ 1`을 하면 문자 코드에 더한다. `'4'`=52, `'2'`=50 → `[53 51]`. 숫자로 쓰려면 `str2double(p) + 1`.
- 근거: [7.1](../../textbook/ch07/7.1-user-input.md) "`input(prompt, "s")`" [보강]

### Q07-05 [코드] ★★

원본: p.6–13 `z = input("Enter a value ")`, `x = input("Enter an array in brackets ")`, `p = input("...",'s')` → B형: 배열 입력, `'s'` 입력, 숫자 입력을 섞고 세미콜론 배치를 묻는다

```matlab
s = input("Enter the side lengths ")
name = input("Enter your name ", "s");
age = input("Enter your age ");
```

- 세미콜론: `s` 줄만 없다(`s =`가 보인다). `name`, `age` 줄은 있다(값이 안 보인다).
- `Kim`을 따옴표 없이 쳤으므로 `name` 줄은 반드시 `"s"`가 있어야 한다. 없으면 Q07-03처럼 오류가 난다.
- 근거: [7.1](../../textbook/ch07/7.1-user-input.md)

### Q07-06 [단답] ★

원본: p.11–12 `w = input(...)` → `'Maria'` 1x5 char, `y` 1x1 string, `x = input('Enter your name', 's')` → 변형: 크기·class와 `'s'`의 이름 유래를 묻는다

1. `w`: `char`, `1×5` / `y`: `string`, `1×1`.
2. `char`.
3. `'s'`는 string 자료형이 생기기 전에 만들어진 옵션이라, 글자의 나열(character array)을 "string"이라 부르던 시절의 이름이 그대로 남았다.

- 근거: [7.1](../../textbook/ch07/7.1-user-input.md) ⚠️ 함정 "`'s'` 옵션은 string이 아니라 char를 준다"

---

## 7.2.1 출력 (1) — `disp`

### Q07-07 [출력] ★

원본: p.15–16 `x = 1:5`, `x`, `disp(x)` → 변형: 간격 2, `x;` 추가

```
x =

     2     4     6     8    10

x =

     2     4     6     8    10

     2     4     6     8    10
```

- `x;`는 아무것도 찍지 않는다. 이름만 친 `x`는 정의할 때와 같은 모양(`x =` + 빈 줄 + 값 + 빈 줄).
- `disp(x)`는 이름도 빈 줄도 없이 값 한 줄만.
- 근거: [7.2.1](../../textbook/ch07/7.2.1-disp.md) "배열 내용을 보는 네 가지 방법"

### Q07-08 [출력] ★★

원본: p.20–21 `disp_example.m` → 변형: `x = 1:4`, `y = 2.5`, 마지막에 `y` 추가

```
The values in the x array are:
     1     2     3     4
The value in the y array is : 2.5
y =

    2.5000

```

- 처음부터 끝까지 Run 하면 `%%`는 그냥 주석이다. 섹션 하나씩 돌리는 것은 Run Section.
- string `+` 숫자는 숫자를 글자로 바꿔 이어 붙인다. 이때 `2.5`는 `"2.5"`로 바뀐다(`format`의 `2.5000`이 아니다). 반면 이름으로 부른 `y`는 `format short`라 `2.5000`.
- 근거: [7.2.1](../../textbook/ch07/7.2.1-disp.md) "합치는 법 (1) — string과 `+`"

### Q07-09 [변형] ★★

원본: p.22–23 `disp("The value in the x array is : " + x')`, `disp("The values in the x array are: " + num2str(x))` → 변형: 전치 유무를 바꿨다

(a)
```
    "x = 1"
    "x = 2"
    "x = 3"
```

(b)
```
    "x = 1"    "x = 2"    "x = 3"
```

(c)
```
x = 1  2  3
```

- (a) `x'`는 `3×1`이라 결과도 `3×1` string 배열. 원소마다 한 줄, 큰따옴표가 붙어서 보인다(슬라이드 p.22).
- (b) `x`는 `1×3`이라 결과는 `1×3` string 배열. 한 줄에 셋이 따옴표째 나온다.
- (c) `num2str(x)`는 `'1  2  3'`이라는 `1×7` **char** 하나(숫자 사이 공백 두 칸). string `+` char는 `1×1` string 하나가 되어 따옴표 없이 한 줄로 나온다.
- 근거: [7.2.1](../../textbook/ch07/7.2.1-disp.md) "합치는 법 (2)", ⚠️ 함정

### Q07-10 [오류] ★

원본: p.19 "The disp function accepts a single array as the input" → 변형: 인수 두 개

```
Error using disp
Too many input arguments.
```

- `disp`는 배열 **하나**만 받는다. 두 번 쓰거나 하나로 합쳐야 한다.
- 고친 코드: `disp("The answer is " + 5)` 또는 `disp(['The answer is ' num2str(5)])`.
- 근거: [7.2.1](../../textbook/ch07/7.2.1-disp.md) "`disp`는 입력을 하나만 받는다"

### Q07-11 [출력] ★★

원본: p.24 `disp('The moon''s gravity ...')`, `disp("Mark Twain once said ""Age ...""")` → 변형: 문장을 바꾸고 char 안에 `"`와 `''`를 함께, 마지막에 변수 표시

```
The moon's gravity is 1/6th that of the earth
She said "Hi" to me.
He said "it's fine"
c =

    'It's'

```

- char(`'...'`) 안의 `'`는 `''`로 두 번, string(`"..."`) 안의 `"`는 `""`로 두 번 쳐야 한 글자가 된다.
- char 안의 `"`, string 안의 `'`는 평범한 글자라 한 번만 친다(셋째 줄).

> **[확인 필요]** `c = 'It''s'`의 표시가 `'It's'`인지 `'It''s'`인지.

- 근거: [7.2.1](../../textbook/ch07/7.2.1-disp.md) "따옴표와 아포스트로피를 글자로 넣기"

### Q07-12 [출력] ★★★

원본: p.25–26 `conversation.m` → 변형: 입력값(`Kim`, `20`, `Yes`)과 실행 연도(2026)

```
Hi There
Who are you? Kim
HiKim
How old are you?20
20that's not very old
I'm 90 years old
Don't you just love computers? Yes
Yes?
Goodbye
```

- `"Hi" + name`: `name`은 char `'Kim'`이지만 한쪽이 string이라 이어 붙이기가 된다. 사이에 공백이 없어서 `HiKim`(슬라이드 p.26의 `HiHolly`).
- `"How old are you?"` 끝에 공백이 없어 `20`이 물음표에 붙는다.
- `age + "that's ..."`도 공백 없이 `20that's`.
- `today(1)`은 연도 2026 → `2026 - 1936 = 90`.
- 모든 출력이 `disp`이거나 `;`가 붙은 대입이라 변수 표시(`x =`)는 하나도 없다.
- 근거: [7.2.1](../../textbook/ch07/7.2.1-disp.md) "`input` + `disp` + `pause`로 대화 만들기"

### Q07-13 [코드] ★★

원본: p.20–21 `disp("The values in the x array are:"); disp(x)`, `disp("The value in the y array is : " + y)` → B형: 점수 배열과 `mean`

```matlab
s = [70 80 90];
disp("Scores:")
disp(s)
disp("The average is " + mean(s))
```

- 세미콜론: `s` 줄에 있어야 한다(`s =`가 안 보인다). `disp` 줄은 `;`가 있든 없든 출력이 같다.
- 마지막 줄은 `disp("The average is " + num2str(mean(s)))`나 `disp(['The average is ' num2str(mean(s))])`도 된다.
- 근거: [7.2.1](../../textbook/ch07/7.2.1-disp.md)

---

## 7.2.2 출력 (2) — `fprintf`

### Q07-14 [출력] ★

원본: p.28–30 `fprintf("There are %f cows in the pasture", cows)`, Table 7.1 → 변형: 값 12, 형식 `%e %g %d`, `%d`에 소수

```
There are 12.000000 cows
There are 1.200000e+01 cows
There are 12 cows
There are 12 cows
There are 1.250000e+01 cows
```

- `%f`는 소수점 아래 기본 6자리, `%e`는 지수 표기(가수도 6자리), `%g`는 둘 중 짧은 쪽.
- `%d`에 정수가 아닌 값(`12.5`)을 주면 반올림하지 않고 **`%e`로 바뀐다**.
- `fprintf`를 `;` 없이 화면으로 쓰면 `ans =`가 생기지 않는다(슬라이드 p.28).
- 근거: [7.2.2](../../textbook/ch07/7.2.2-fprintf.md) "형식(type field) 목록", ⚠️ 함정

### Q07-15 [출력] ★★

원본: p.31–32 New Lines → 변형: `%f`를 `%d`로

```
>> cows = 5;
>> fprintf("There are %d cows in the pasture", cows)
There are 5 cows in the pasture>> cows = 6
cows =

     6

>> 
```

- `fprintf`는 줄을 바꾸지 않는다. 그래서 다음 프롬프트 `>>`가 출력 바로 뒤에 붙고, 거기서 친 `cows = 6`도 같은 줄에 보인다(슬라이드 p.32의 빨간 동그라미).

> **[확인 필요]** 슬라이드는 R2022a 화면이다. R2026a 데스크톱 Command Window도 프롬프트를 같은 줄에 붙이는지.
- 근거: [7.2.2](../../textbook/ch07/7.2.2-fprintf.md) "줄바꿈은 자동이 아니다"

### Q07-16 [출력] ★★

원본: p.33–34 `fprintf_example.m` (`\n`과 `/n`) → 변형: 둘째 형식만 `\n`, 마지막에 `"Done"`과 `"\n"` 따로

```
There are 5.000000 cows /nThere are 6 cows
Done
```

- `/n`은 이스케이프가 아니라 글자 `/`와 `n`이다. 오류 없이 그대로 찍히고 줄도 안 바뀐다.
- `%.0f`는 소수 0자리 → `6`.
- `fprintf("Done")` 뒤에 `fprintf("\n")`이 줄을 바꿔 준다.
- 근거: [7.2.2](../../textbook/ch07/7.2.2-fprintf.md) ⚠️ 함정 "`/n`은 오류 없이 글자 `/n`을 찍는다"

### Q07-17 [출력] ★★

원본: p.35–36 `%8.2f`, `%2.3f` → 변형: 값 `pi*100`, 대괄호로 폭을 보이게

```
[  314.16]
[314.159]
[314.2]
[   3.142e+02]
[314.159]
```

- `%8.2f`: 전체 8칸, 소수 2자리. `314.16`이 6칸이라 앞에 공백 2칸.
- `%2.3f`: 2칸으로는 모자라니 폭을 무시하고 `314.159`(7칸). **폭은 최소일 뿐 값이 잘리지 않는다.**
- `%12.3e`: `3.142e+02`가 9칸 → 앞에 공백 3칸.
- `%g`: 유효숫자 6개 → `314.159`.
- 근거: [7.2.2](../../textbook/ch07/7.2.2-fprintf.md) "폭(width)과 정밀도(precision)"

### Q07-18 [단답] ★

원본: p.35–36 `%8.2f`, HINT `%2.3f`, p.49 HINT(type 누락, `%%`) → 변형: 개념을 단답으로

1. `8`은 **전체 폭**(소수점·부호 포함 최소 글자 수), `2`는 소수점 아래 자릿수. "앞 8자리, 뒤 2자리"가 아니다.
2. 전체를 2칸으로 잡아 놓고 소수만 3자리를 달라는 것이라 앞뒤가 맞지 않는다(폭이 소수 자릿수보다 작다).
3. 오류 메시지 없이 제대로 찍히지 않는다. 출력이 사라졌는데 오류가 없으면 `%` 뒤를 먼저 본다.
4. `%%`.

> **[확인 필요]** 3에서 `%` 앞의 글자까지는 찍히는지, 아무것도 안 찍히는지.

- 근거: [7.2.2](../../textbook/ch07/7.2.2-fprintf.md) "흔한 오해", ⚠️ 함정

### Q07-19 [출력] ★★★

원본: p.38–42 `conversions_example.m` (`feet = 1:3; inches = feet.*12; conversions = [feet;inches]; fprintf("%4.0f feet equals %7.2f inches \n",conversions)`) → 변형: 야드→피트, 폭·정밀도, `conversions`를 보이게

```
conversions =

     1     2     3
     3     6     9

  1 yards =   3.0 feet
  2 yards =   6.0 feet
  3 yards =   9.0 feet
```

- `fprintf`는 2차원 배열을 **열 우선**으로 쓴다: `1, 3, 2, 6, 3, 9`. 형식에 자리가 둘이니 한 줄에 한 열씩 → `(1,3)`, `(2,6)`, `(3,9)`.
- `%3.0f` → `  1`, `%5.1f` → `  3.0`.
- 근거: [7.2.2](../../textbook/ch07/7.2.2-fprintf.md) "배열을 주면 형식이 반복된다 — 열 우선"

### Q07-20 [변형] ★★★

원본: p.43 `fprintf("%4.0f feet equals %7.2f inches \n",feet,inches)` → 변형: 인수 두 개(a), 열로 쌓은 행렬(b)

(a)와 (b)의 출력이 같다.

```
  1 yards =   2.0 feet
  3 yards =   3.0 feet
  6 yards =   9.0 feet
```

- (a) 배열 인수가 여럿이면 **첫 배열을 다 쓰고** 다음으로 넘어간다: `1, 2, 3, 3, 6, 9`.
- (b) `[yards', feet']`는 `3×2`. 열 우선이면 1열(`1 2 3`) 다음 2열(`3 6 9`) → 역시 `1, 2, 3, 3, 6, 9`.
- Q07-19(`[yards; feet]`, `2×3`)만 `1, 3, 2, 6, 3, 9`로 짝이 맞는다. 외울 문장: **한 줄에 들어갈 값들이 한 열에 모이도록 쌓는다.**
- 근거: [7.2.2](../../textbook/ch07/7.2.2-fprintf.md) "배열 인수를 여러 개 주면"

### Q07-21 [출력] ★★

원본: p.44–48 `formatted_output_example.m` (`file_id = fopen("my_output_file.txt", "wt"); ... fprintf(file_id, 'Some example output is %4.2f \n', x)` → `ans = 29000`) → 변형: 값 세 개, 형식 짧게

1. Command Window:

```
ans =

    48

```

2. `my_output_file.txt`:

```
Value is 1.50 
Value is 10.25 
Value is 100.00 
```

3. 원본 계산: `'Some example output is '` 23글자 + 숫자 4글자(`1.00` ~ `0.00`, `10*sin(pi)`는 0에 가까운 아주 작은 수라 값이 전부 0과 1 사이) + 공백 1 + `\n` 1 = 29글자. 1000개이므로 `29 × 1000 = 29000`.

- 이 문제 계산: 한 줄 = `'Value is '` 9 + 숫자 + 공백 1 + `\n` 1. `1.50`(4) → 15, `10.25`(5) → 16, `100.00`(6) → 17. 합 48.
- `%4.2f`의 폭 4는 최소라 `10.25`, `100.00`은 잘리지 않고 늘어난다.
- 파일로 쓰는 `fprintf`를 `;` 없이 쓰면 보낸 글자 수가 `ans`로 보인다(슬라이드 p.47). 화면으로 쓴 Q07-14에서는 `ans`가 생기지 않았던 것과 대비된다.
- `fclose(file_id);`는 `;`가 있어 아무것도 안 보인다.

> **[보강]** 반환값은 형식을 펼친 **글자 수**다. `"wt"`(텍스트 모드)로 연 파일은 윈도우에서 `\n`이 CR+LF 2바이트로 저장되어 실제 파일 크기는 줄 수만큼(여기서는 3바이트) 더 크다.

- 근거: [7.2.2](../../textbook/ch07/7.2.2-fprintf.md) "파일로 내보내기"

### Q07-22 [출력] ★★

원본: p.49 HINT `fprintf('The interest rate is %5.2f %% \n', 5)` → 변형: 값 3.5, `%%`를 숫자 바로 뒤에, 배열 반복

```
The interest rate is  3.50 % 
50%
 12.3%|
  5.0%|
```

- `%5.2f`에 `3.50`(4칸) → 앞에 공백 1칸. 형식 문자열의 공백까지 합쳐 `is`와 `3.50` 사이가 두 칸이다. 줄 끝 `% ` 뒤에도 공백이 하나 있다.
- `%%`는 `%` 한 글자.
- 배열 `[12.34 5]`를 주면 형식이 두 번 반복된다. `%5.1f` → ` 12.3`, `  5.0`.
- 근거: [7.2.2](../../textbook/ch07/7.2.2-fprintf.md) "그 밖의 이스케이프"

### Q07-23 [코드] ★★

원본: p.38–42 `conversions = [feet;inches]; fprintf("%4.0f feet equals %7.2f inches \n",conversions)` → B형: 섭씨→화씨, 폭 지정

```matlab
C = 0:50:100;
F = C*9/5 + 32;
fprintf("%3.0f C = %5.1f F\n", [C; F])
```

- 세미콜론: `C`, `F` 줄 모두 있어야 한다(`C =`, `F =`가 안 보인다). `fprintf` 줄은 상관없다.
- 행으로 쌓은 `[C; F]`라야 열 우선 순서가 `(0, 32)`, `(50, 122)`, `(100, 212)`가 된다. `[C, F]`나 `C, F`를 따로 주면 어긋난다(Q07-20).
- 폭: `100`이 3칸 → `%3.0f`, `122.0`이 5칸 → `%5.1f`.
- 근거: [7.2.2](../../textbook/ch07/7.2.2-fprintf.md)

---

## 7.2.3 출력 (3) — `sprintf`

### Q07-24 [출력] ★

원본: p.50 `a = sprintf("Some example output is %4.2f \n", pi*1000)` → 변형: 형식을 작은따옴표로, 값 `pi*10`, `\n` 제거

```
a =

    'Some example output is 31.42'

b =

    '   3.142'

```

- 형식을 char로 주면 결과도 char → 작은따옴표로 표시된다.
- `sprintf`는 화면에 찍지 않고 값을 돌려준다. `b`는 `;` 때문에 안 보이다가 이름을 부를 때 보인다. `%8.3f` → `3.142`(5칸) 앞에 공백 3칸까지 문자열에 들어 있다.
- 근거: [7.2.3](../../textbook/ch07/7.2.3-sprintf.md) "`fprintf`와 무엇이 다른가"

### Q07-25 [변형] ★★

원본: p.50 → 변형: 형식의 따옴표 종류

```
s1 = 

    "3 apples"

s2 =

    '3 apples'

ans = 

    "3 apples!"

ans =

    84    65   130   145   145   141   134   148

```

- 형식 문자열의 자료형이 결과의 자료형을 정한다. `"..."` → string, `'...'` → char.
- (c) string끼리 `+`는 이어 붙이기.
- (d) class `double`, size `1×8`. char끼리 `+`는 이어 붙이기가 아니라 **문자 코드 덧셈**이다. `'3 apples'`(`1×8`)의 각 글자에 33을 더한 `1×8` double이 된다: 51+33, 32+33, 97+33, 112+33, 112+33, 108+33, 101+33, 115+33.
- 근거: [7.2.3](../../textbook/ch07/7.2.3-sprintf.md) [보강], ⚠️ 함정 "형식을 작은따옴표로 주면 char가 돌아온다"

### Q07-26 [출력] ★★

원본: p.85 Example 7.3 (`t = "The maximum range was "; text_input=sprintf("%s %4.0f meters \n", t, maximum)`) → 변형: `maximum`을 보이게, `\n` 제거

```
maximum =

   1.2222e+03

text_input = 

    "The maximum range was  1222 meters"

```

- `sind(90)`은 정확히 1 → `maximum = 110^2/9.9 = 1222.2222…`.
- `format short`는 1000 이상의 정수가 아닌 값을 **지수 형식**으로 보인다(`1.2222e+03`). `1222.2`로 쓰면 틀린다.
- `t` 끝의 공백 + 형식의 `%s` 뒤 공백 → `was`와 `1222` 사이가 **두 칸**. `%4.0f`는 `1222`.
- 형식이 string이라 결과도 string(`text_input = ` 뒤 공백, 큰따옴표).
- 근거: [7.2.3](../../textbook/ch07/7.2.3-sprintf.md) "가장 흔한 쓰임 — 그래프 제목과 주석"

### Q07-27 [코드] ★★

원본: p.50, p.85 → B형

```matlab
label = sprintf('theta = %d deg, range = %4.0f m', 45, maximum)
```

- 세미콜론이 없어야 `label =`이 보인다.
- 결과가 char(작은따옴표 표시)여야 하므로 형식을 **작은따옴표**로 쓴다. 큰따옴표면 `label = ` + `"..."`로 보인다.
- `45`는 `%d`, `1222.22…`는 `%4.0f`(또는 `%.0f`) → `1222`. 이렇게 만든 `label`을 `title(label)`에 넘긴다.
- 근거: [7.2.3](../../textbook/ch07/7.2.3-sprintf.md)

---

## 7.2.4 출력 (4) — `table`

### Q07-28 [출력] ★★

원본: p.52 `g = [9.8; 1.6]`, `d = 0.5 * g * 100^2`, `p = ["Earth";"Moon"]` → 변형: 화성 3.7, 10초, `d`에 `;`

```
g =

    9.8000
    3.7000

p = 

  2×1 string array

    "Earth"
    "Mars"

d =

  490.0000
  185.0000

```

- **함정:** `d`는 `[490; 185]`처럼 보이지만 `0.5*9.8`= `4.9`를 double로 100배 하면 `490.00000000000006`이 된다(부동소수점 오차). 정수가 아닌 원소가 하나라도 있으면 배열 전체가 소수 형식으로 찍힌다. 슬라이드의 `0.5*9.8*100^2`는 정확히 `49000`이라 정수로 보였다(p.52).
- `490`, `185`로 쓰면 틀린다. `d(1) == 490`도 `false`다.
- string **배열**은 `p = ` 뒤 공백, 그 다음 `2×1 string array` 줄이 먼저 나온다.
- 근거: [7.2.4](../../textbook/ch07/7.2.4-table.md) "만들기"

### Q07-29 [빈칸] ★

원본: p.54–57 `disp(table(p,g,d,'VariableNames',ColNames))` → 변형: `disp`와 `'VariableNames'`를 빈칸으로, `Name=Value` 형식으로 다시 쓰기

1. `disp`
2. `'VariableNames'` (작은따옴표)
3. `disp(table(p, g, d, VariableNames=ColNames))`

- `disp`로 감싸면 `ans =`와 `2×3 table` 줄이 사라진다.
- 옛 형식에서는 옵션 이름이 **작은따옴표**여야 한다(Q07-30). `Name=Value` 형식은 따옴표 문제가 없다.
- 근거: [7.2.4](../../textbook/ch07/7.2.4-table.md) "열 이름 지정", "`ans =` 줄 없애기"

### Q07-30 [오류] ★★

원본: p.55 "'VariableNames' is specified with single quotes" → 변형: 큰따옴표

```
Error using table
All table variables must have the same number of rows.
```

1. 위 메시지(행 수가 맞지 않는다는 오류).
2. 옛 형식의 옵션 이름 자리는 char만 옵션으로 알아본다. string `"VariableNames"`는 옵션이 아니라 **데이터 변수**로 들어가고, 이어지는 `["Planet","g","Distance"]`도 데이터가 된다. 둘 다 1행인데 `p`, `g`, `d`는 2행이라 행 수 오류가 난다. 슬라이드는 "적절한 알림과 함께 오류가 난다"고 했지만 R2026a 메시지는 `VariableNames`를 말하지 않는다.
3. `'VariableNames'`(작은따옴표)로 고치거나, `VariableNames=["Planet", "g", "Distance"]`로 쓴다.

> **[확인 필요]** 영문 메시지의 정확한 문구. textbook은 R2026a 한국어 메시지 `모든 테이블 변수는 행 수가 동일해야 합니다.`를 확인했다.

- 근거: [7.2.4](../../textbook/ch07/7.2.4-table.md) "큰따옴표를 쓰면 왜 깨지는가"

### Q07-31 [출력] ★★

원본: p.53 `table(p,g,d)`, p.58 `my_earth_moon_data = table(...)` → 변형: 표를 변수에 담고 크기와 열 이름 보기

```
ans =

     2     3

ans =

  1×3 cell array

    {'p'}    {'g'}    {'d'}

```

- `VariableNames`를 안 주면 **입력 변수 이름이 그대로 열 이름**이 된다(슬라이드 p.53).
- `size`는 `[행 수, 변수 수]`. `ans`는 두 번째 결과로 덮어써진다.
- 근거: [7.2.4](../../textbook/ch07/7.2.4-table.md) "표를 변수에 담아 쓰기"

### Q07-32 [변형] ★★

원본: p.53 "all the input vectors need to be columns" → 변형: 행 벡터 입력

```
ans =

     1     3

```

- 오류는 **나지 않는다**. 대신 행이 1개이고, 각 변수가 `1×2`짜리 한 칸인 표가 된다. 행성 둘이 두 행으로 나뉘지 않는다.
- 그래서 `size(T)`로 행 수를 확인해야 한다. 고치려면 `p'`, `g'`, `d'`처럼 전치해서 열 벡터로 넣는다.
- 근거: [7.2.4](../../textbook/ch07/7.2.4-table.md) ⚠️ 함정 "입력은 열 벡터여야 한다"

### Q07-33 [코드] ★★

원본: p.56 `disp(table(p,g,d,'VariableNames',["Planet","g","Distance"]))` → B형

```matlab
disp(table(p, g, d, VariableNames=["Planet", "g", "Distance"]))
```

- `table(...)`만 쓰면 `ans =`와 `2×3 table`이 붙는다. `disp`로 감싸야 사라진다.
- 구문법: `disp(table(p, g, d, 'VariableNames', ["Planet", "g", "Distance"]))`.
- 이 한 줄은 `;`가 있어도 출력이 같다(`disp`가 찍는다).

> **[확인 필요]** 문제에 준 표의 열 간격과 밑줄 길이는 R2026a 화면과 다를 수 있다. 채점 포인트는 코드다.

- 근거: [7.2.4](../../textbook/ch07/7.2.4-table.md) "`ans =` 줄 없애기 — `disp`로 감싸기"

---

## 7.3 그래프로 입력받기 — `ginput`

### Q07-34 [출력] ★★

원본: p.62 `x = 5:30; y = x.^2 - 40.*x + 400;` → 변형: 그래프 대신 값을 계산해 보기

```
ans =

   225

ymin =

     0

k =

    16

ans =

    20

```

- `y(1)`: `x = 5` → `25 - 200 + 400 = 225`.
- `y = (x - 20)^2`이라 최솟값은 `x = 20`에서 0. `x = 5:30`에서 20은 16번째 원소 → `k = 16`.
- 슬라이드 그래프(p.62)에서 곡선이 `x = 20`에서 축에 닿는 이유가 이것이다.
- 근거: [7.3](../../textbook/ch07/7.3-ginput.md)

### Q07-35 [출력] ★★

원본: p.62–63 `[a,b] = ginput` → 변형: 찍은 좌표 값

```
a =

   10.5000
   20.0000
   29.2500

b =

  110.2500
   -0.5000
   85.0625

```

- `ginput`은 개수를 안 주면 Enter까지 받는다. 세 점 → `a`, `b` 모두 `3×1` **열** 벡터.
- 정수가 아닌 값이 섞였으니 전부 소수 4자리로 찍힌다. 슬라이드 p.63도 같은 모양(`20.0463`, `-1.3930`, `148.6070`).
- 근거: [7.3](../../textbook/ch07/7.3-ginput.md) "쓰는 법"

### Q07-36 [단답] ★

원본: p.61–63 `[x,y] = ginput(n)`, `[x,y] = ginput`, `[a,b] = ginput` → 변형: 개수 인수·좌표 종류·size를 묻는다

1. `ginput(4)`는 정확히 4점을 받고 끝난다. `ginput`은 개수 제한 없이 Return(Enter) 키를 칠 때까지 받는다.
2. 그래프(축) 좌표. 축 범위를 바꾸면 같은 자리를 찍어도 다른 값이 나온다.
3. `3×1`.

- 근거: [7.3](../../textbook/ch07/7.3-ginput.md) ⚠️ 함정

---

## 7.4 파일 읽고 쓰기

### Q07-37 [단답] ★

원본: p.66–69 Table 7.3, `uiimport`, `[data,fs] = audioread("dave.wav")`, `sound(data,fs)` → 변형: 코드와 개념을 단답으로

1. `[data, fs] = audioread("dave.wav")`, `sound(data, fs)`.
2. `uiimport`.
3. (1) Import Wizard의 **Generate MATLAB code**로 같은 작업을 하는 코드를 만들어 둔다. (2) 형식별 전용 함수(`audioread`, `readtable` 등)를 쓴다.
4. `.mat`: MATLAB workspace / `.csv`: comma-separated values(ASCII 텍스트) / `.xlsx`: Excel spreadsheet.

- 근거: [7.4](../../textbook/ch07/7.4-file-io.md) "Import Wizard", "소리 파일"

### Q07-38 [출력] ★★

원본: p.71–74 `T = readtable("patients.dat");` → 변형: 크기와 첫 열 이름을 출력

```
r =

   100

c =

    10

ans =

    'LastName'

```

- `T`는 `100×10 table`(슬라이드 p.72 Workspace). 첫 줄은 `;`라 아무것도 안 보인다.
- `[r, c] = size(T)`는 출력이 둘이라 둘 다 보인다.
- `VariableNames`는 cell 배열이고 `{1}`로 꺼내면 char `'LastName'`. 열 이름은 파일의 첫 줄에서 온다.
- 근거: [7.4](../../textbook/ch07/7.4-file-io.md) "표 형식 자료 — `readtable`"

### Q07-39 [빈칸] ★★

원본: p.70 Table 7.4, p.71 `T = readtable("patients.dat");`, p.75 `writetable(T,"filename")` → 변형: 함수 이름과 확장자를 빈칸으로

1. `readtable`
2. `writetable`
3. `xlsx` (또는 `xls`)
4. `.txt .dat .csv` → delimited text files(구분자 텍스트 파일), `.xls .xlsx …` → spreadsheet files.

- **확장자가 형식을 정한다.** `writetable(T, "patients.csv")`면 CSV, 확장자를 빼면 `.txt`.
- 근거: [7.4](../../textbook/ch07/7.4-file-io.md) "`readtable`이 읽는 형식", "내보내기 — `writetable`"

### Q07-40 [코드] ★★

원본: p.71 `T = readtable("patients.dat");`, p.75 `writetable(T,"filename")` → B형: 읽고 저장한 뒤 행 수를 `fprintf`로

```matlab
T = readtable("patients.dat");
writetable(T, "patients.xlsx");
fprintf("Saved %d rows to patients.xlsx\n", size(T, 1))
```

- 세미콜론: `T` 줄은 반드시 있어야 한다(없으면 100행짜리 표가 통째로 찍힌다). `writetable`은 돌려주는 값이 없어 `;`와 무관.
- `size(T, 1)`은 행 수 100. `%d`로 찍는다.
- 근거: [7.4](../../textbook/ch07/7.4-file-io.md)

---

## 7.5 디버깅

### Q07-41 [출력] ★★★

원본: p.78–80 Example 7.1 Freefall → 변형: 입력값(10, 0, 4, 2), 그래프 대신 `time`과 결과를 보이게

1.

```
What is the value of acceleration due to gravity? 10
g =

    10

What starting time would you like? 0
What ending time would you like? 4
What time increments would you like calculated? 2
time =

     0     2     4

final_distance =

    80

```

2. `;`가 없는 2번(`g = ...`), 6번(`time = ...`), 8번(`final_distance = ...`) 줄. 메시지: `Add a semicolon after the statement to hide the output (in a script).`

- `distance = 0.5*10*[0 4 16] = [0 20 80]` → 최댓값 80.
- 슬라이드 p.80처럼 이 경고는 "진짜 문제"가 아닐 수 있다. 값을 보려고 일부러 `;`를 뺐다면 무시해도 된다.
- 근거: [7.5](../../textbook/ch07/7.5-debugging.md) "7.5.1 Code Analyzer"

### Q07-42 [오류] ★★

원본: p.81–82 `loglog(time,distance` (닫는 괄호 누락) → 변형: `.m` 스크립트로

1. 빨간 표시(fatal error). 메시지: `Line 9: A '(' might be missing a closing ')', causing invalid syntax at end of line.`
2. 뜨지 않는다. `.m` 파일은 실행 전에 파일 전체를 먼저 해석하므로 문법 오류가 하나라도 있으면 **첫 줄부터 아무것도 실행되지 않고** 오류만 난다. 주황 경고는 실행을 막지 않지만 빨강은 막는다.
3. `loglog(time,distance)`.

> **[확인 필요]** Run 했을 때 Command Window 오류의 첫 줄(`Error: File: freefall.m Line: 9 Column: …` 다음 문구).

- 근거: [7.5](../../textbook/ch07/7.5-debugging.md) "7.5.1 Code Analyzer"

### Q07-43 [단답] ★

원본: p.78–84 Code Analyzer(주황 경고, 빨강 fatal error), p.85 breakpoint → 변형: 색·breakpoint 조건을 단답으로

1. 주황: warning(실행은 된다). 빨강: error(실행이 멈춘다).
2. 줄 번호를 더블클릭(또는 클릭)하면 빨간 표시가 생긴다. 회색이면 문법 오류가 남았거나 최신 코드를 저장하지 않은 것이다.
3. 없다. 문법 오류를 모두 고쳐야 breakpoint를 쓸 수 있다.
4. R2021b(디버깅 기능이 바뀌어 R2021a 그림과 다를 수 있다).

- 근거: [7.5](../../textbook/ch07/7.5-debugging.md) ⚠️ 함정

### Q07-44 [단답] ★★

원본: p.85–88 Example 7.3 (`range = velocity^2/g*sind(2*theta);`의 7번 줄 breakpoint, Continue, Step) → 변형: 멈춘 순간의 workspace와 프롬프트를 묻는다

1. `K>>`.
2. `g`, `velocity`, `theta`. 7번 줄은 **아직 실행되기 전**이라 `range`는 없다(슬라이드 p.86의 Workspace도 `g`, `theta`, `velocity` 셋뿐이고, 7번 줄에 초록 화살표가 있다).
3. `range`.
4. 다음 breakpoint까지(없으면 끝까지) 계속 실행한다.

- 근거: [7.5](../../textbook/ch07/7.5-debugging.md) "7.5.2 디버깅 툴바"

### Q07-45 [출력] ★★

원본: p.89–90 Example 6.1 (`degrees = 0:15:180; radians = DR(degrees); degrees_radians =[degrees;radians]'`) → 변형: 간격 90, `radians`를 보이게

1.

```
radians =

         0    1.5708    3.1416

degrees_radians =

         0         0
   90.0000    1.5708
  180.0000    3.1416

```

2. **Step In**으로 `DR` 안에 들어가고, **Step Out**으로 호출한 줄로 돌아온다.

- 정수가 아닌 값이 섞이면 전부 소수 4자리. 정확히 0인 원소는 `0`으로만 찍힌다.
- `[degrees; radians]`는 `2×3`, 전치 `'`로 `3×2`.
- 근거: [7.5](../../textbook/ch07/7.5-debugging.md) "멈춘 다음"
