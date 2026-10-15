% 정답 64: 요금 switch 수정본
clear, clc
% age = input("Age: ");                                   % 원래 코드
% ticket = input("Ticket type (adult/child/senior): ", "s");
age = 70; ticket = 'Senior';                              % 검증용 고정값
if age < 0 || age > 120                   % 스칼라 if에는 || 를 쓴다
    error("Age out of range: %d", age)
end
ticket = lower(ticket);
switch ticket
    case {"adult", "senior"}              % 여러 값은 cell 배열
        price = 12;
    case "child"
        price = 7;
    otherwise
        disp("Unknown ticket type")
        price = 0;                        % 뒤에서 쓰므로 반드시 정의
end
if ticket == "child" && age >= 12
    warning("Child ticket but age is %d", age)
end
if price > 10, fprintf("Premium\n"), end  % 한 줄이면 쉼표로 구분
fprintf("Price: $%d\n", price)
