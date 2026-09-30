% sol0601_2.m — 6.1 연습문제 2
% H1 line 을 포함한 도움말 블록을 갖춘 함수를 만들고 help 로 확인한다.
% help 는 "파일로 저장된 함수"만 찾으므로 kinetic_energy.m 을 별도 파일로 만들었다.

clear; clc

help kinetic_energy               % 함수 정의줄 다음의 연속된 주석이 통째로 나온다

fprintf('m=2kg, v=3m/s → %g J\n', kinetic_energy(2, 3));
fprintf('벡터 입력도 됨: %s J\n', mat2str(kinetic_energy([1 2 3], 4)));

% H1 line 은 help 결과의 첫 줄이다
h = string(help('kinetic_energy')).splitlines();
fprintf('H1 line: %s\n', strtrim(h(1)));

% 빈 줄 뒤의 주석은 help 에 나오지 않는다 — type 으로 보면 파일에는 남아 있다
fprintf('help 줄 수: %d, 파일 줄 수: %d\n', ...
    numel(h), numel(string(fileread('kinetic_energy.m')).splitlines()));
