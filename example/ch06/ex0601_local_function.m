% ex0601_local_function.m — 스크립트 끝에 함수를 두는 방식 (6.1)
% 함수를 파일 끝에 두면 그 스크립트 안에서만 쓸 수 있다.
% 이런 함수를 local function 이라 한다. 다른 프로그램에서는 호출할 수 없다.

clear; clc

d = [0.1 0.25 0.5 1.0 2.0];    % 입자 지름 (mm)
c = grain_class(d);

for k = 1:numel(d)
    fprintf('%5.2f mm → %s\n', d(k), c(k));
end

% ---- 여기서부터 local function. 반드시 파일 끝에 두고 end 로 닫는다 ----
function label = grain_class(dia)
% GRAIN_CLASS  입자 지름(mm)을 모래/자갈 등급 문자열로 바꾼다.
label = strings(size(dia));
label(dia < 0.25)               = "fine sand";
label(dia >= 0.25 & dia < 0.5)  = "medium sand";
label(dia >= 0.5  & dia < 2.0)  = "coarse sand";
label(dia >= 2.0)               = "gravel";
end
