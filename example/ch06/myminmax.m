function varargout = myminmax(v)
% MYMINMAX  요청된 출력 개수만큼 최솟값, 최댓값, 범위를 순서대로 반환한다.
%   m           = MYMINMAX(v)  → 최솟값
%   [m, M]      = MYMINMAX(v)  → 최솟값, 최댓값
%   [m, M, rng] = MYMINMAX(v)  → 최솟값, 최댓값, 범위(max-min)
%
%   varargout 은 출력들을 담는 cell array 다.

if nargin == 0
    v = [4 -2 9 1];   % [보강] 인수 없이 실행해도 되도록 넣은 기본값
end

if nargout >= 1, varargout{1} = min(v); end
if nargout >= 2, varargout{2} = max(v); end
if nargout >= 3, varargout{3} = max(v) - min(v); end
end
