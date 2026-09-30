function A = star1()
% STAR1  별을 그리고, 출력이 요청된 경우에만 꼭짓점 좌표를 반환한다.
%   STAR1 만 쓰면 그림만 그린다.
%   A = STAR1 로 쓰면 nargout 이 1 이 되어 꼭짓점 좌표 A 를 함께 반환한다.

theta = 0 : 4*pi/5 : 4*pi;
r     = ones(1, numel(theta));
polarplot(theta, r, LineWidth=2)
axis off

if nargout == 1
    A = [theta(:), r(:)];   % 요청됐을 때만 계산한다
end
end
