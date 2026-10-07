% ex0855_menu_city.m — menu 와 switch/case (8.5.5)
% menu 는 버튼이 달린 창을 띄우고, 누른 버튼의 "번호"를 돌려준다.
%
% 주의: menu, listdlg 는 창을 띄우고 기다리므로 -batch 에서 쓰면 끝나지 않는다.

clear; clc

prompt = "Select a city from the menu:";
list = ["Boston", "Denver", "Honolulu"];

if usejava('desktop')
    city = menu(prompt, list)
else
    city = 2                % -batch: Denver 버튼을 눌렀다고 가정
end

switch city                 % 이제 city 는 문자가 아니라 숫자
    case 1
        disp("$345")
    case 2
        disp("$150")
    case 3
        disp("Stay home and study")
end
% otherwise 가 필요 없다: 버튼 밖의 값을 고를 수 없다
% (단, 창을 X 로 닫으면 0 이 돌아온다 — 아무 case 에도 걸리지 않는다)

%% listdlg: 목록에서 고르고 OK/Cancel. 여러 개 고르기도 된다
if usejava('desktop')
    [idx, tf] = listdlg(PromptString=prompt, ListString=list, ...
                        SelectionMode="single")
else
    idx = 3; tf = 1         % -batch: Honolulu 를 고르고 OK 를 눌렀다고 가정
end

if tf
    fprintf("고른 도시: %s\n", list(idx));
else
    disp("Cancel 을 눌렀다")
end
