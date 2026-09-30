% ex0615_nargin_nargout.m — 함수 바깥에서 nargin / nargout 조회하기 (6.1.5)
% 함수 이름을 문자열이나 function handle 로 넘기면
% 그 함수가 받을 수 있는 입력/출력 개수를 알려준다.

clear; clc

fprintf('nargin(''sin'')   = %d   (입력 1개)\n',        nargin('sin'));
fprintf('nargin(''rem'')   = %d   (입력 2개)\n',        nargin('rem'));
fprintf('nargin(''surf'')  = %d  (음수 = 가변 입력)\n', nargin('surf'));

fprintf('nargout(''sin'')  = %d   (출력 1개)\n',        nargout('sin'));
fprintf('nargout(''max'')  = %d   (출력 2개)\n',        nargout('max'));
fprintf('nargout(''size'') = %d  (음수 = 가변 출력)\n', nargout('size'));

% function handle 로 넘겨도 된다
fprintf('nargin(@rem)     = %d\n', nargin(@rem));

% 사용자 정의 함수도 똑같이 조회된다
fprintf('nargin(''motion'')  = %d\n', nargin('motion'));
fprintf('nargout(''motion'') = %d\n', nargout('motion'));
