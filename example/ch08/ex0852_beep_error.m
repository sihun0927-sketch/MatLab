% ex0852_beep_error.m — beep 과 error 의 차이 (8.5.2 HINT)

clear; clc

x = -3;

%% beep + disp: 소리 내고 메시지 출력, 프로그램은 계속 간다
if x > 0
    y = log(x);
else
    beep
    disp("The input to the log function must be positive")
end
disp("beep 다음 줄도 실행된다")

%% error: 메시지를 내고 프로그램을 멈춘다 (여기서는 try 로 잡아서 확인)
try
    if x > 0
        y = log(x);
    else
        error("The input to the log function must be positive")
    end
    disp("이 줄은 실행되지 않는다")
catch err
    fprintf("error 로 멈춤: %s\n", err.message);
end

%% 검사하지 않으면? log 는 음수에도 오류 없이 복소수를 준다
log(x)                      % 1.0986 + 3.1416i
