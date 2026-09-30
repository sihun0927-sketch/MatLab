function [] = star()
% STAR  극좌표에 5각 별을 그린다. 입력도 출력도 없다.
%   STAR 는 값을 반환하지 않고 figure 창만 연다.
%   대괄호 [] 는 "출력이 빈 배열", 빈 괄호 () 는 "입력 없음"을 뜻한다.

theta = 0 : 4*pi/5 : 4*pi;   % 144도씩 5번 건너뛰면 별이 된다
r     = ones(1, numel(theta));
polarplot(theta, r, LineWidth=2)
axis off
end
