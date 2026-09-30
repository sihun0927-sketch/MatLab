% sol0603_1.m — 6.3 연습문제 1
% mytoolbox 폴더를 search path 에 추가해 내 함수들을 어디서나 쓰게 만든다.

clear; clc

tbox    = fullfile(pwd, 'mytoolbox');
oldPath = path;

fprintf('추가 전: exist(''k2c'') = %d, which = "%s"\n', exist('k2c', 'file'), which('k2c'));

addpath(tbox);
fprintf('추가 후: exist(''k2c'') = %d\n', exist('k2c', 'file'));
fprintf('which k2c → %s\n', which('k2c'));

K = [200 273.15 300 400];
fprintf('%6.2f K = %7.2f °C = %7.2f °F\n', [K; k2c(K); c2f(k2c(K))]);

% 내 toolbox 에 무엇이 들어있는지 한눈에 — 각 함수의 H1 line
d = dir(fullfile(tbox, '*.m'));
disp('mytoolbox 목차:')
for k = 1:numel(d)
    [~, fname] = fileparts(d(k).name);
    h1 = string(help(fname)).splitlines();
    fprintf('  %-6s %s\n', fname, strtrim(h1(1)));
end

path(oldPath);                  % [보강] 검증 후 원래 path 로 되돌린다
