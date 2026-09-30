% sol0603_2.m — 6.3 연습문제 2
% 같은 이름이 여러 곳에 있을 때 MATLAB 이 고르는 순서를 확인한다.
%   ① 현재 파일 안의 local function  ② 현재 폴더  ③ search path

clear; clc

tbox    = fullfile(pwd, 'mytoolbox');
oldPath = path;
addpath(tbox);

% c2f 는 mytoolbox(path)에 있고, 이 파일 끝에도 같은 이름의 local function 이 있다
fprintf('which c2f  → %s\n', which('c2f'));
fprintf('c2f(100)   = %g   ← 같은 파일의 local function 이 이긴다\n', c2f(100));

% 다른 파일에서 부르면 그 파일에는 local function 이 없으므로 path 쪽이 쓰인다
fprintf('call_by_name(''c2f'', 100) = %g   ← mytoolbox 쪽 c2f\n', ...
    call_by_name('c2f', 100));

% which -all 로 같은 이름이 몇 군데 있는지 한눈에 본다
disp('which -all c2f:')
disp(string(which('c2f', '-all')))

path(oldPath);                  % [보강] 검증 후 원래 path 로 되돌린다

function F = c2f(~)
% C2F  일부러 mytoolbox 의 c2f 와 이름을 겹치게 만든 local function.
F = -999;                       % 누가 이겼는지 바로 알아보려고 티나는 값을 쓴다
end
