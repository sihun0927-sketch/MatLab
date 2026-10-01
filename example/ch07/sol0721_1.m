% sol0721_1.m — 7.2.1 연습문제 1
% 이름과 점수를 disp 한 줄로 내보낸다.

clear; clc

name  = "김공학";
score = 93.5;

disp('--- disp 를 두 번 쓰면 두 줄이 된다 ---')
disp(name)
disp(score)

disp(' ')
disp('--- string 을 + 로 이어 한 줄로 ---')
disp(name + " 의 점수는 " + score + " 점이다")

disp(' ')
disp('--- 자릿수를 다듬고 싶으면 숫자를 먼저 글자로 ---')
disp(name + " 의 점수는 " + num2str(score, '%.1f') + " 점이다")

disp(' ')
disp('--- char 배열로 같은 일을 하면 대괄호로 잇는다 ---')
cname = '김공학';
disp([cname ' 의 점수는 ' num2str(score, '%.1f') ' 점이다'])

disp(' ')
disp('--- 참고: fprintf 를 쓰면 더 짧다 ---')
fprintf('%s 의 점수는 %.1f 점이다\n', name, score);
