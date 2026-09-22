%% 2.3 연습문제 2: iskeyword vs isvarname
name = "for";

isReserved = any(strcmp(iskeyword, name));   % 예약어 목록에 있는지 확인
isValidForm = isvarname(name);               % 이름 형식만 유효한지 확인

disp(isReserved)    % 1 (true)  - "for"는 예약어다
disp(isValidForm)   % 0 (false) - isvarname은 예약어도 걸러낸다

% 차이: isvarname은 "이름 형식"과 "예약어 여부"를 모두 검사해 최종 사용 가능 여부를 알려주고,
% iskeyword는 MATLAB이 미리 정해둔 예약어 목록 자체를 보여줄 뿐이다.
