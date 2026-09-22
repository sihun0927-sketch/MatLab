% ex0301_help.m
% 3.1 도움말: help / doc / which
clear; clc

% 명령창에서 간단히 보는 도움말
help nthroot

% 함수가 어느 파일에서 오는지 확인 (이름이 가려졌는지 진단할 때 유용)
which nthroot

% 동일 이름이 여러 개 있으면 which -all 로 모두 나열할 수 있다
%   which -all rem

% doc nthroot 는 HTML 문서 창을 연다 (batch 모드에서는 생략)
