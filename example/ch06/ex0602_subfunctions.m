% ex0602_subfunctions.m — primary function 과 subfunction (6.2)
% 이 파일은 스크립트이고, 아래 세 함수는 이 파일 안에서만 쓸 수 있는 local function 이다.
% 함수 파일이라면 맨 위 함수가 primary function, 그 뒤가 subfunction 이 된다.
% 파일 이름은 primary function 이름과 같아야 한다.

clear; clc

r = [1 2 3];
h = [10 5 2];

for k = 1:numel(r)
    fprintf('r=%g h=%g → 겉넓이 %8.3f, 부피 %8.3f\n', ...
        r(k), h(k), cyl_area(r(k), h(k)), cyl_volume(r(k), h(k)));
end

% subfunction 끼리는 서로 호출할 수 있다
fprintf('가장 부피가 큰 원기둥의 부피: %.3f\n', max(cyl_volume(r, h)));

% ---- primary 역할: 위의 스크립트 본문 / 아래는 subfunction ----
function A = cyl_area(r, h)
% CYL_AREA  원기둥의 전체 겉넓이
A = 2*base_area(r) + 2*pi*r.*h;
end

function V = cyl_volume(r, h)
% CYL_VOLUME  원기둥의 부피
V = base_area(r) .* h;
end

function A = base_area(r)
% BASE_AREA  밑면(원)의 넓이 — 위 두 subfunction 이 공유한다
A = pi * r.^2;
end
