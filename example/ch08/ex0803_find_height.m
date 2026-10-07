% ex0803_find_height.m — find 는 조건을 만족하는 원소의 "인덱스"를 돌려준다 (8.3.1)
% 해군사관학교 지원자 키(인치). 66 인치 이상이어야 한다.

clear; clc

height = [63, 67, 65, 72, 69, 78, 75];

accept = find(height >= 66)     % 인덱스: 2 4 5 6 7
height(accept)                  % 실제 키: 67 72 69 78 75

% 조건만 쓰면 logical 배열, find 를 씌우면 인덱스
height >= 66                    % 0 1 0 1 1 1 1

% 몇 명인가?
fprintf('합격 %d 명 / 지원 %d 명\n', numel(accept), numel(height));

% 아무도 만족하지 않으면 빈 배열
find(height > 100)              % 1x0 empty
isempty(find(height > 100))     % 1
