% sol0701_2.m — 7.1 연습문제 2
% "s" 옵션이 있을 때와 없을 때 무엇이 달라지는지 비교한다.

clear; clc

% 사용자가 Hong 이라고 쳤다고 하자.
% "s" 없이  : 따옴표를 같이 쳐야 하고, 'Hong' 이면 char, "Hong" 이면 string
% "s" 있으면: 따옴표 없이 치고, 결과는 언제나 char

a = 'Hong';     % input("이름? ")       에 'Hong' 을 친 결과
b = "Hong";     % input("이름? ")       에 "Hong" 을 친 결과
c = 'Hong';     % input("이름? ", "s")  에 Hong   을 친 결과

names = {'a (작은따옴표 입력)', 'b (큰따옴표 입력)', 'c ("s" 옵션)'};
vals  = {a, b, c};

fprintf('%-22s %-8s %-8s %s\n', '변수', '클래스', '크기', '길이');
for k = 1:3
    v = vals{k};
    if isstring(v)
        len = strlength(v);
    else
        len = numel(v);
    end
    fprintf('%-22s %-8s %-8s %d\n', names{k}, class(v), mat2str(size(v)), len);
end

fprintf('\n결론\n');
fprintf('  "s" 는 이름과 달리 string 이 아니라 char 를 돌려준다.\n');
fprintf('  char 는 글자 수만큼 1xN, string 은 몇 글자든 1x1 이다.\n');
fprintf('  isequal(a, c) = %d  (둘 다 char ''Hong'')\n', isequal(a, c));
fprintf('  isequal(a, b) = %d  (isequal 은 내용만 보므로 char 와 string 도 같다고 한다)\n', isequal(a, b));
fprintf('  a == b       = %s  (내용 비교는 통한다)\n', mat2str(a == b));
fprintf('  하지만 class 와 size 는 다르다: %s %s vs %s %s\n', ...
    class(a), mat2str(size(a)), class(b), mat2str(size(b)));
fprintf('  자료형까지 따지려면 strcmp 가 아니라 class 를 직접 봐야 한다.\n');
