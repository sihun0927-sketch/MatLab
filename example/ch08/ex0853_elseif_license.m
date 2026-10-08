% ex0853_elseif_license.m — if/elseif/else (8.5.3)
% 운전면허: 16 미만 / 16~17 / 18~69 / 70 이상

clear; clc

if usejava('desktop')
    age = input("Enter your age: ")
else
    age = 50                % -batch: 50 을 입력했다고 가정
end

if age < 16
    disp("Sorry - You'll have to wait")
elseif age < 18             % age >= 16 & age < 18 로 쓸 필요가 없다
    disp("You may have a youth license")
elseif age < 70
    disp("You may have a standard license")
else
    disp("Drivers over 70 require a special license")
end

%% 경계값 확인
for age = [15 16 17 18 69 70 85]    % (반복문은 9장)
    if age < 16
        msg = "Sorry - You'll have to wait";
    elseif age < 18
        msg = "You may have a youth license";
    elseif age < 70
        msg = "You may have a standard license";
    else
        msg = "Drivers over 70 require a special license";
    end
    fprintf("%3d → %s\n", age, msg);
end
