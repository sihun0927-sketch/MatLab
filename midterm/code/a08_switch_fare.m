% 정답 08: switch/case 수정본
clear, clc
% city = input("Enter a city: ", "s");    % 원래 코드
city = 'Denver';                          % 검증용 고정값 (char)
switch city
    case {"Boston", "Denver"}             % 여러 값은 cell 배열로
        fare = 150;
    case "Honolulu"                       % 따옴표 필수
        fare = 500;
    otherwise
        fare = 0;
        disp("Not on file")
end
if fare == 0                              % = → ==
    disp("No fare")
elseif fare > 100 && fare < 400
    disp("Discount fare: $" + fare)
else
    disp("Full fare: $" + fare)
end
