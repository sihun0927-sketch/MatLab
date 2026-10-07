% sol0855_2.m — 8.5.5 연습문제 2: menu 창을 닫으면 0 이 돌아온다

clear; clc

list = ["Boston", "Denver", "Honolulu"];
if usejava('desktop')
    city = menu("Select a city", list);
else
    city = 0;                   % -batch: 창을 X 로 닫았다고 가정
end

switch city
    case 1
        disp("$345")
    case 2
        disp("$150")
    case 3
        disp("Stay home and study")
    otherwise
        disp("선택하지 않았다 (menu 가 0 을 돌려줬다)")
end

% otherwise 없이 쓰면 0 일 때 아무것도 출력되지 않는다.
% 게다가 list(city) 처럼 인덱스로 쓰면 0 은 오류다.
try
    list(city)
catch err
    fprintf("list(0): %s\n", err.message);
end
