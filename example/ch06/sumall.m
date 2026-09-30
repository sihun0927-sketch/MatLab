function total = sumall(varargin)
% SUMALL  개수가 정해지지 않은 입력들을 모두 더한다.
%   total = SUMALL(a, b, c, ...) 는 모든 입력의 합을 반환한다.
%   varargin 은 입력들을 모아 담는 cell array 다.

total = 0;
for k = 1:nargin
    total = total + sum(varargin{k}, 'all');
end
end
