% ex0721_conversation.m — input + disp + pause 로 대화 흉내내기 (7.2.1)
% pause(n) 은 n 초 멈춘다. 인수 없이 pause 만 쓰면 아무 키나 누를 때까지 기다린다.

clear; clc

interactive = usejava('desktop');

disp('Hi there!')
pause(1)
disp('I''d like to ask you a few questions.')
pause(1)

if interactive
    name = input('What is your name?  ', 's');
else
    name = 'Holly';
    fprintf('What is your name?  %s\n', name);
end
pause(1)

disp("Nice to meet you, " + name + "!")
pause(1)

if interactive
    age = input('How old are you?  ');
else
    age = 25;
    fprintf('How old are you?  %d\n', age);
end
pause(1)

if age < 30
    disp('You''re practically a baby.')
else
    disp('A fine age to be.')
end
pause(1)
disp("Goodbye, " + name + ".")

% -batch 에서는 pause 가 그대로 멈추므로 1 초씩만 줬다.
% 인수 없는 pause 는 데스크톱에서만 쓸 것. pause('off') 로 전부 끌 수도 있다.
