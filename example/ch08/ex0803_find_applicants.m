% ex0803_find_applicants.m — 여러 조건을 & 로 묶어 find (8.3.1)
% 조건: 키 66 인치 이상, 나이 18 세 이상 35 세 미만

clear; clc

% 1열 = 키(인치), 2열 = 나이(세)
applicants = [63, 18;
              67, 19;
              65, 18;
              72, 20;
              69, 36;
              78, 34;
              75, 12];

qualify = find(applicants(:,1) >= 66 & ...
               applicants(:,2) >= 18 & applicants(:,2) < 35)    % 2 4 6

% fprintf 는 열 순서로 값을 소비하므로 [번호 키 나이] 를 행으로 쌓아 넘긴다
results = [qualify, applicants(qualify,1), applicants(qualify,2)]';
fprintf("Applicant #%d is %2.0f inches tall and %2.0f years old\n", results)
