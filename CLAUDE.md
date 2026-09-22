# MatLab — 공학SW 개인 시험 대비 노트

원본: Holly Moore, *MATLAB for Engineers* 6th ed. 출판사 강의 슬라이드(영어 PDF).
PDF는 `C:\Users\pc\Desktop\공학sw\`에 있고, 비주기적으로 추가·갱신된다. 원서 본문은 없다.
독자는 저장소 주인 한 명. 목적은 시험 전 복습.

## 챕터 작업 흐름

챕터 생성·갱신은 이슈 단위다. 이슈 하나 = PDF 하나. 이슈 본문에 PDF 경로가 있다.

1. 브랜치 `textbook/chXX` 생성.
2. PDF를 끝까지 읽는다. 슬라이드 전부가 시험 범위이므로 절 하나도 빠뜨리지 않는다.
3. `textbook/chXX/`와 `example/chXX/`를 아래 레이아웃대로 작성한다.
4. `example/chXX/*.m` 전부를 실행해 검증한다(아래 "검증").
5. PR 생성, 본문에 `Closes #N`. 머지는 사용자가 한다.

완료 기준: 슬라이드의 모든 절이 md에 있고, 모든 `.m`이 오류 없이 실행되며, 플롯 예제마다 PNG가 있다.

## 레이아웃

```
textbook/chXX/
  README.md          목차 + 함수 색인표 (함수명 | 한 줄 설명 | 절)
  X.Y-keyword.md     절별 본문 (예: 5.1-2d-plots.md)
  solutions.md       연습문제 해답
  img/*.png          플롯 예제 실행 결과
example/chXX/
  exXXYY_keyword.m   본문 예제 (XX=장, YY=절, 예: ex0201_linspace.m)
  solXXYY_N.m        연습문제 해답 코드 (예: sol0201_1.m)
```

Chapter 5는 PDF가 `05_1`, `05_2` 둘이지만 결과물은 하나의 `ch05/`로 합친다.
`.m` 파일명은 영문자로 시작하고 언더스코어만 쓴다. MATLAB이 하이픈을 허용하지 않는다.

## 본문 규칙

- 한국어 본문. 코드, 함수명, 전문 용어는 영어 그대로.
- MATLAB R2026a 최신 문법(`Name=Value`, `tiledlayout`, `string`)을 본문에. 구문법(`subplot`, `'Name','Value'`)은 각주 한 줄.
- 분량은 챕터당 800~1200줄. 슬라이드 내용 전부 + 보강.
- 슬라이드 밖에서 추가한 설명, 예제, 연습문제는 전부 `> **[보강]** …` 인용 블록으로 표기한다. 나중에 grep으로 원본과 분리할 수 있어야 한다.
- 절마다 `⚠️ 함정` 콜아웃을 둔다(예: `*` vs `.*`, `sin(pi) ~= 0`, 함수명을 변수로 덮어쓰기).
- 절마다 연습문제 2~3개. 문제는 절 md 끝에, 해답은 `solutions.md`에, 해답 코드는 `solXXYY_N.m`에.
- 코드는 md에 인라인으로 싣고, 같은 코드를 `example/chXX/*.m`으로 저장한 뒤 상대 링크로 연결한다.
- 슬라이드의 코드 스크린샷은 옮겨 적지 않고, 같은 개념을 보여주는 코드를 새로 쓴다.
- MATLAB 데스크톱 창 캡처(Command Window, Workspace 등)는 재현하지 않고 텍스트로 설명한다.

## 검증

MATLAB R2026a: `C:\Program Files\MATLAB\R2026a\bin\matlab.exe`. WSL에서 실행:

```bash
"/mnt/c/Program Files/MATLAB/R2026a/bin/matlab.exe" -batch "cd('C:\Users\pc\orca\MatLab\example\ch05'); run('ex0501_plot.m')"
```

- 플롯 예제는 `exportgraphics(gcf, '../../textbook/chXX/img/exXXYY_keyword.png')`로 PNG를 저장한다.
- R2026a에서 오류나 경고가 나서 슬라이드와 다르게 고친 코드는, 해당 md에 `> **[보강]** R2026a에서 … 로 변경` 표기를 남긴다. 그 차이 자체가 시험 포인트다.

## 커밋

Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>
