% ex0603_search_path.m — 나만의 toolbox 와 search path (6.3)
% MATLAB 이 함수를 찾는 순서: ① 현재 파일 안의 local function
%                            ② 현재 폴더 ③ search path 를 앞에서부터

clear; clc

tbox = fullfile(pwd, 'mytoolbox');

% addpath 전에는 찾지 못한다
fprintf('addpath 전 exist(''c2f'') = %d  (0 = 못 찾음)\n', exist('c2f', 'file'));

oldPath = path;                 % 원래 path 를 저장해 두고
addpath(tbox);                  % 내 toolbox 폴더를 추가한다

fprintf('addpath 후 exist(''c2f'') = %d  (2 = .m 파일 발견)\n', exist('c2f', 'file'));
fprintf('which c2f → %s\n', which('c2f'));

fprintf('0, 25, 100 °C = %s °F\n', mat2str(c2f([0 25 100])));
fprintf('212 °F = %g °C\n', f2c(212));
fprintf('300 K  = %g °C\n', k2c(300));

% path 의 맨 앞 세 항목만 확인
p = string(path).split(pathsep);
disp('search path 앞 3개:')
disp(p(1:3))

path(oldPath);                  % [보강] 검증 후 원래 path 로 되돌린다
fprintf('복구 후 exist(''c2f'') = %d\n', exist('c2f', 'file'));
