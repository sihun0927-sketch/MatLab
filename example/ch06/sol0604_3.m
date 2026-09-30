% sol0604_3.m — 6.4 연습문제 3
% anonymous function 을 .mat 으로 저장했다가 다시 불러 쓴다.

clear; clc

matfile = fullfile(tempdir, 'sol0604_3.mat');

parabola = @(x) x.^2 - 4;
gauss    = @(x, mu, s) exp(-(x-mu).^2 ./ (2*s^2)) / (s*sqrt(2*pi));

save(matfile, 'parabola', 'gauss');
clear parabola gauss

fprintf('clear 직후: exist(''parabola'', ''var'') = %d\n', exist('parabola', 'var'));

S = load(matfile);              % 구조체로 받으면 무엇이 들어있는지 확인하기 좋다
disp('mat 파일 안의 변수:')
disp(fieldnames(S))

fprintf('parabola(3)         = %g\n',    S.parabola(3));
fprintf('gauss(0, 0, 1)      = %.6f\n',  S.gauss(0, 0, 1));
fprintf('class(S.gauss)      = %s\n',    class(S.gauss));

delete(matfile);                % [보강] 검증용 임시 파일 정리
