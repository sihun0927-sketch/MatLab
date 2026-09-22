% Ch4.4 - [보강] sprintf로 형식을 지정해 문자열 만들기 (+ 연결과 비교)

Test = 11;

viaPlus = "Trial Run " + Test          % 자동 변환, 형식 지정은 못함

viaSprintf = sprintf("Trial Run %d", Test)   % %d 자리에 정수를 넣어 형식 지정
class(viaSprintf)                              % sprintf에 string을 넣으면 string을 돌려준다

pi_text = sprintf("pi = %.2f", pi)     % 소수점 자리수(%.2f)도 지정할 수 있다
