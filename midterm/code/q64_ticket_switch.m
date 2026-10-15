% 문제 64: 나이와 표 종류를 입력받아 요금을 정한다.
%          adult와 senior는 $12, child는 $7, 모르는 종류면 안내문을 내고 $0.
%          child인데 12세 이상이면 경고를 낸다.
clear, clc
age = input("Age: ");
ticket = input("Ticket type (adult/child/senior): ", "s");
if age < 0 | age > 120
    error("Age out of range: %d", age)
end
switch lower(ticket)
    case "adult", "senior"
        price = 12;
    case "child"
        price = 7;
    otherwise
        disp("Unknown ticket type")
end
if ticket == "child" && age >= 12
    warning("Child ticket but age is %d", age)
end
if price > 10 fprintf("Premium\n") end
fprintf("Price: $%d\n", price)
