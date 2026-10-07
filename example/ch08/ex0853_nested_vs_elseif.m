% ex0853_nested_vs_elseif.m — 중첩 if/else 와 elseif 는 같은 일을 한다 (8.5.3)

clear; clc

age = 17;

%% 중첩: end 가 셋, 들여쓰기가 계속 깊어진다
if age < 16
    a = "wait";
else
    if age < 18
        a = "youth";
    else
        if age < 70
            a = "standard";
        else
            a = "special";
        end
    end
end

%% elseif: end 하나, 한 층
if age < 16
    b = "wait";
elseif age < 18
    b = "youth";
elseif age < 70
    b = "standard";
else
    b = "special";
end

fprintf("중첩: %s, elseif: %s, 같은가? %d\n", a, b, a == b);

%% 순서가 틀리면 앞 조건이 뒤를 가린다
if age < 70
    c = "standard";         % 17 도 여기서 걸린다
elseif age < 18
    c = "youth";            % 영원히 도달하지 못한다
else
    c = "special";
end
fprintf("순서를 뒤집으면: %s  ← 틀렸다\n", c);
