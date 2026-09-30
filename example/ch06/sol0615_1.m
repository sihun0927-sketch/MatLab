% sol0615_1.m — 6.1.5 연습문제 1
% nargin 으로 생략된 입력에 기본값을 채우는 함수.

clear; clc

fprintf('cyl_volume(2)        = %.4f  (h 기본값 1)\n',  cyl_volume(2));
fprintf('cyl_volume(2, 5)     = %.4f\n',                cyl_volume(2, 5));
fprintf('cyl_volume(2, 5, 1)  = %.4f  (속이 빈 관)\n',  cyl_volume(2, 5, 1));

% 입력이 너무 많으면 MATLAB 이 막는다
try
    cyl_volume(1, 2, 3, 4);
catch err
    fprintf('예상된 오류: %s\n', err.message);
end

function V = cyl_volume(r, h, r_inner)
% CYL_VOLUME  원기둥(또는 속이 빈 관)의 부피.
%   V = CYL_VOLUME(r)            높이 1 로 가정
%   V = CYL_VOLUME(r, h)         꽉 찬 원기둥
%   V = CYL_VOLUME(r, h, r_in)   안쪽 반지름 r_in 을 파낸 관
if nargin < 2
    h = 1;
end
if nargin < 3
    r_inner = 0;
end
V = pi * (r.^2 - r_inner.^2) .* h;
end
