% ex0604_save_load.m — anonymous function 을 .mat 으로 저장하고 다시 불러오기 (6.4)
% anonymous function 은 변수이므로 clear 하면 사라진다. save/load 로 남길 수 있다.

clear; clc

matfile = fullfile(tempdir, 'ch06_handles.mat');

drag = @(v, k) k * v.^2;
ln   = @(x) log(x);

save(matfile, 'drag', 'ln');
fprintf('저장: %s\n', matfile);

clear drag ln
fprintf('clear 후 exist(''drag'', ''var'') = %d\n', exist('drag', 'var'));

load(matfile);
fprintf('load 후  exist(''drag'', ''var'') = %d\n', exist('drag', 'var'));
fprintf('drag(10, 0.5) = %g\n', drag(10, 0.5));
fprintf('ln(exp(3))    = %g\n', ln(exp(3)));

delete(matfile);            % [보강] 검증용 임시 파일 정리
