% 정답 42: 의사코드 → 코드. 메뉴식 단위 변환기 (menu는 GUI이므로 검증은 고정값)
clear, clc
% 1. 선택지와 변환 계수를 정의한다
options = ["km -> mi" "kg -> lb" "C -> F"];
% choice = menu("Select a conversion:", options);   % 원래 코드 (버튼 번호 반환)
choice = 3;                                         % 검증용 고정값
% value = input("Enter the value to convert: ");    % 원래 코드
value = 37;                                         % 검증용 고정값
% 2. 선택에 따라 변환
switch choice
    case 1
        result = value/1.609;   unit = "mi";
    case 2
        result = value*2.2046;  unit = "lb";
    case 3
        result = value*9/5 + 32; unit = "F";
    otherwise
        error("No conversion selected")
end
% 3. 결과 출력
fprintf('%s: %g -> %.2f %s\n', options(choice), value, result, unit)
