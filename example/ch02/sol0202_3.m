%% 2.2 연습문제 3: 라벨이 있는 그래프
x = 0:1:10;
y = x.^2;

figure
plot(x, y, "-o")
title("y = x^2")
xlabel("x")
ylabel("y")
grid on
