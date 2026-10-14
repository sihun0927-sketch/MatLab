% 문제 14: 피트→인치 변환표와 이자율을 출력한다. 기대 출력:
%    1 feet =  12.00 inches
%    2 feet =  24.00 inches
%    3 feet =  36.00 inches
% Conversion done for 3 rows
% Count: 3
% Rate: 5.00 %
clear, clc
feet = 1:3;
inches = feet*12;
fprintf('%4.0f feet = %6.2 inches /n', feet, inches)
disp('Conversion done for', numel(feet), 'rows')
disp(['Count: ' 3])
rate = 5;
fprintf('Rate: %5.2f %\n', rate)
