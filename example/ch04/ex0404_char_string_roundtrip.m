% Ch4.4 - [보강] string <-> char 상호 변환, 타입 확인 함수

s = "Holly Moore";
c = char(s)                    % string -> char 로도 변환 가능 (일부 옛 함수는 char를 요구)

isStringType = isstring(s)
isCharType = ischar(c)
