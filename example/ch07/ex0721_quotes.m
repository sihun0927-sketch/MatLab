% ex0721_quotes.m — 따옴표와 아포스트로피를 글자로 넣기 (7.2.1)
% char 배열('...') 안에 ' 를 넣으려면 '' 처럼 두 번,
% string("...") 안에 " 를 넣으려면 "" 처럼 두 번 친다.

clear; clc

% char 배열 안의 아포스트로피
disp('The moon''s gravity is 1/6th that of the earth')

% string 안의 큰따옴표
disp("Mark Twain once said ""Age is an issue of mind over matter.""")
disp("""If you don't mind, it doesn't matter.""")

% string 안에서는 ' 가 평범한 글자라 한 번만 쳐도 된다
disp("The moon's gravity is 1/6th that of the earth")

% char 배열 안에서는 " 가 평범한 글자다
disp('He said "hello" and left')

fprintf('\n정리\n');
fprintf('  char   ''...''  안의 ''  → ''''  로 두 번,  "  는 그대로\n');
fprintf('  string "..."  안의 "   → ""   로 두 번,  ''  는 그대로\n');

% fprintf 의 format string 에서도 같은 규칙이 적용된다
fprintf('\nfprintf 에서: %s\n', 'it''s fine');
