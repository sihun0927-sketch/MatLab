% ex0851_simple_if.m — simple if (8.5.1)
% 조건이 참이면 if 와 end 사이를 실행하고, 거짓이면 end 다음으로 건너뛴다.

clear; clc

if usejava('desktop')
    G = input("Enter a value for G ");
else
    G = 5;      % -batch 에서는 input 을 쓸 수 없다. 5 를 입력했다고 가정
    fprintf("Enter a value for G %s\n", mat2str(G));
end

if G < 50
    disp("G is a small value equal to:")
    disp(G);
end

%% 같은 if 에 다른 입력 세 가지를 넣어 본다
for G = {5, 70, [5 25 75]}          % (반복문은 9장. 여기선 입력 바꿔 보기용)
    g = G{1};
    fprintf("\nG = %-10s → ", mat2str(g));
    if g < 50
        fprintf("if 안을 실행했다");
    else
        fprintf("건너뛰었다");
    end
end
fprintf("\n");

%% 배열 조건은 "모든 원소가 참"일 때만 참이다
G = [5 25 75];
G < 50                  % 1 1 0
all(G < 50)             % 0 → if 는 이 값을 본다
any(G < 50)             % 1 → 하나라도 작으면 실행하고 싶다면 any 를 써야 한다
