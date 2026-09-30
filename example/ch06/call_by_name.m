function y = call_by_name(fname, x)
% CALL_BY_NAME  이름(문자열)으로 함수를 찾아 호출한다.
%   str2func 은 "이 파일에서 보이는 것"만 찾는다. 따라서 다른 파일의
%   local function 은 여기서 보이지 않아 오류가 난다.

if nargin == 0
    fname = 'mypoly';
    x     = 2;       % [보강] 인수 없이 실행해도 되도록 넣은 기본값
end

f = str2func(fname);
y = f(x);
end
