% 정답 34: 스크립트 끝의 local function 두 개로 재료 시험 데이터 처리
clear, clc
d0 = [10.0 12.5 8.0];        % 초기 지름 mm
d1 = [8.5 11.0 6.0];         % 최종 지름 mm
F  = [12000 15000 9000];     % 하중 N
cw = cold_work(d0, d1);
[sigma, best] = stress(F, d1);
fprintf('Sample %d: cold work %5.1f%%, stress %7.1f MPa\n', [1:3; cw*100; sigma])
fprintf('Highest stress: sample %d\n', best)

function cw = cold_work(d_initial, d_final)
% COLD_WORK 단면적 감소율 (r_i^2 - r_f^2)/r_i^2
cw = (d_initial.^2 - d_final.^2) ./ d_initial.^2;
end

function [s, idx] = stress(force, d)
% STRESS 응력 = 힘 / 단면적 (N/mm^2 = MPa), 최대 응력 위치도 반환
area = pi*(d/2).^2;
s = force ./ area;
[~, idx] = max(s);
end
