% ex0618_type.m — 함수 코드 열람 (6.1.8)
% built-in 함수(sin, cos)는 코드를 볼 수 없고,
% toolbox 에 .m 파일로 들어있는 함수는 type 으로 볼 수 있다.

clear; clc

% which 로 그 함수가 어디서 오는지 먼저 확인한다
disp('--- which sin ---');    disp(which('sin'))
disp('--- which sphere ---'); disp(which('sphere'))
disp('--- which mypoly ---'); disp(which('mypoly'))

% built-in 은 소스가 없다
disp('--- exist / built-in 여부 ---')
fprintf('exist(''sin'')    = %d  (5 = built-in)\n',    exist('sin'));
fprintf('exist(''sphere'') = %d  (2 = .m 파일)\n',      exist('sphere'));

% .m 파일로 된 함수는 코드를 통째로 볼 수 있다 (여기서는 앞 15줄만)
disp('--- type sphere (앞부분) ---')
src = string(fileread(which('sphere'))).splitlines();
disp(src(1:min(15, numel(src))))

% 사용자 함수도 마찬가지
disp('--- type mypoly ---')
type mypoly
