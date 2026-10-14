% 문제 08: 도시 이름을 입력받아 항공료를 출력한다.
%          Boston과 Denver는 할인 요금 $150, Honolulu는 $500,
%          그 밖의 도시는 요금 0으로 두고 "Not on file"을 출력한다.
%          요금이 0이면 "No fare", 100~400 사이면 "Discount fare: $요금",
%          아니면 "Full fare: $요금"을 출력한다.
clear, clc
city = input("Enter a city: ", "s");
switch city
    case "Boston" | "Denver"
        fare = 150;
    case Honolulu
        fare = 500;
    otherwise
        fare = 0;
        disp("Not on file")
end
if fare = 0
    disp("No fare")
elseif fare > 100 && fare < 400
    disp("Discount fare: $" + fare)
else disp("Full fare: $" + fare)
end
