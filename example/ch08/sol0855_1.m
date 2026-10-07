% sol0855_1.m — 8.5.5 연습문제 1: menu 로 도형 고르고 넓이 계산

clear; clc

shapes = ["Circle", "Square", "Triangle"];
if usejava('desktop')
    choice = menu("도형을 고르시오", shapes);
else
    choice = 1;                 % -batch: Circle 을 눌렀다고 가정
end

a = 2;                          % 반지름 / 한 변 / 정삼각형 한 변
switch choice
    case 1
        A = pi * a^2;
    case 2
        A = a^2;
    case 3
        A = sqrt(3)/4 * a^2;
end
fprintf("%s, a = %g → 넓이 %.4f\n", shapes(choice), a, A);
