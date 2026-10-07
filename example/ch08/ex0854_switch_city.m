% ex0854_switch_city.m — switch/case (8.5.4)

clear; clc

%% string 으로 입력받는 경우
if usejava('desktop')
    city = input("Enter the name of a city in double quotes: ")
else
    city = "Honolulu"       % -batch: "Honolulu" 를 입력했다고 가정
end

switch city
    case "Boston"
        disp("$345")
    case "Denver"
        disp("$150")
    case "Honolulu"
        disp("Stay home and study")
    otherwise
        disp("Not on file")
end

%% input(..., "s") 는 char 를 준다 → 슬라이드는 case 도 char 로 쓰라고 한다
if usejava('desktop')
    city = input("Enter the name of a city: ", "s")
else
    city = 'Denver'         % -batch: Denver 를 입력했다고 가정 (char)
end

switch city
    case 'Boston'
        disp('$345')
    case 'Denver'
        disp('$150')
    case 'Honolulu'
        disp('Stay home and study')
    otherwise
        disp('Not on file')
end

%% R2026a: char 와 string 을 섞어도 맞는다
switch 'Denver'             % char
    case "Denver"           % string
        disp("char 'Denver' 가 string case ""Denver"" 에 맞았다")
end

%% 대소문자와 철자는 정확히 같아야 한다
switch "denver"
    case "Denver"
        disp("맞음")
    otherwise
        disp("""denver"" 는 ""Denver"" 와 다르다 → otherwise")
end

%% 숫자 switch, 여러 값을 한 case 에: { } 로 묶는다
day = 6;
switch day
    case {1, 7}
        disp("주말")
    case {2, 3, 4, 5, 6}
        disp("평일")
    otherwise
        disp("1~7 이 아니다")
end
