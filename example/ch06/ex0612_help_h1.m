% ex0612_help_h1.m — 함수 주석과 help / H1 line (6.1.2)
% 함수 정의줄 바로 다음에 이어지는 주석 블록이 help 에 출력된다.
% 그중 첫 줄을 H1 line 이라 하고, lookfor 와 폴더 목록에서 요약으로 쓰인다.

clear; clc

disp('--- help mypoly ---')
help mypoly

disp('--- H1 line 만 뽑기 ---')
h1 = string(help('mypoly')).splitlines();
disp(h1(1))

% 주석 블록 중간에 빈 줄이 아닌 "주석이 아닌 줄"이 들어가면 거기서 help 가 끊긴다.
disp('--- help motion ---')
help motion
