% 정답 54: 월 이름 → 계절·일수 (switch cell case, lower, string 비교)
clear, clc
% m = input("Month name: ", "s");       % 원래 코드
m = 'FEB';                              % 검증용 고정값 (char)
m = lower(string(m));                   % string으로 바꾸고 소문자 통일
names = ["jan" "feb" "mar" "apr" "may" "jun" ...
         "jul" "aug" "sep" "oct" "nov" "dec"];
days  = [31 28 31 30 31 30 31 31 30 31 30 31];
idx = find(names == m);                 % 비어 있으면 모르는 이름
if isempty(idx)
    error("Unknown month: %s", m)
end
switch m
    case {"dec", "jan", "feb"}
        season = "winter";
    case {"mar", "apr", "may"}
        season = "spring";
    case {"jun", "jul", "aug"}
        season = "summer";
    otherwise
        season = "fall";
end
fprintf("%s: month %d, %d days, %s\n", upper(m), idx, days(idx), season)
