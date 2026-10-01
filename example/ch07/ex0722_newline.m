% ex0722_newline.m — fprintf 는 줄을 자동으로 바꾸지 않는다 (7.2.2)
% \n (linefeed) 을 직접 넣어야 한다. / 가 아니라 \ 다.

clear; clc

disp('--- \n 없이 세 번 ---')
fprintf('첫째 ');
fprintf('둘째 ');
fprintf('셋째 ');
fprintf('\n(여기까지 전부 한 줄이었다)\n');

disp(' ')
disp('--- /n 으로 잘못 쓰면 ---')
fprintf('첫째/n');
fprintf('둘째/n');
fprintf('\n(/n 이 글자 그대로 찍혔다. 역슬래시여야 한다)\n');

disp(' ')
disp('--- \n 을 제대로 쓰면 ---')
fprintf('첫째\n');
fprintf('둘째\n');

disp(' ')
disp('--- 그 밖의 이스케이프 ---')
fprintf('탭\t사이\t벌리기\n');
fprintf('역슬래시 하나를 찍으려면 %s 로 두 번: C:\\temp\\data\n', '\\');
fprintf('작은따옴표는 '''' 로: it''s\n');

disp(' ')
disp('--- 작은따옴표 format 과 큰따옴표 format 의 차이 ---')
fprintf('char format 에서 \\n 은 줄바꿈으로 해석된다\n');
fprintf("string format 에서도 마찬가지다\n");
% 다만 string 리터럴 자체에서는 \n 이 이스케이프가 아니다.
s = "a\nb";
fprintf('string "a\\nb" 의 글자 수 = %d  (줄바꿈 1 글자가 아니라 \\ 와 n 두 글자)\n', strlength(s));
fprintf('그래도 fprintf 가 format 으로 해석할 때 줄을 바꾼다:\n');
fprintf(s); fprintf('\n');
