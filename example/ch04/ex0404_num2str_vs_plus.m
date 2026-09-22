% Ch4.4 - [보강] num2str와 '+' 자동 변환 비교

Test = 11;

viaPlus = "Trial Run " + Test        % string + 숫자 -> 자동으로 string 변환됨

n = num2str(Test)                     % num2str은 숫자를 char 배열로 바꿔준다
class(n)                              % 'char'
viaNum2str = ['Trial Run ', n]         % char끼리는 대괄호로 이어붙인다 (구문법)
