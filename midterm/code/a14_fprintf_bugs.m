% 정답 14: fprintf/disp 수정본
clear, clc
feet = 1:3;
inches = feet*12;
fprintf('%4.0f feet = %6.2f inches \n', [feet; inches])   % %6.2f, \n, 행렬로 전달
disp("Conversion done for " + numel(feet) + " rows")       % disp는 인수 하나
disp(['Count: ' num2str(3)])                               % 숫자는 num2str
rate = 5;
fprintf('Rate: %5.2f %%\n', rate)                          % %는 %%
