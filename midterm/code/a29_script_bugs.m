% 정답 29: 2장 스크립트 수정본
%% Define data                       (%% 뒤에 공백이 있어야 section)
clear, clc
run2 = 5;                            % 변수명은 글자로 시작
radius = [1 2 3];
height = 4;
volume = pi*radius.^2*height         % ^ → .^
area = 2*pi*radius.*(radius + height) % 괄호 앞 곱셈은 명시
%% Save and reload
save ../out/results.dat volume area -ascii    % -ascii 사이에 공백 없음
load ../out/results.dat                        % .dat는 확장자를 써야 찾는다
results                                        % 파일 이름이 변수명이 된다
