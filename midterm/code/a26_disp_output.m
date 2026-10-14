% 정답 26: 주어진 출력을 만드는 disp/string 명령
clear, clc
x = [4 7 9];
disp("The values are: " + num2str(x))
disp("Value " + x')
disp("Total = " + sum(x))
fprintf('%d squared is %3d\n', [x; x.^2])
disp(x')
