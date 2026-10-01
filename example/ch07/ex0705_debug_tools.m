% ex0705_debug_tools.m — 디버깅 도구의 명령어판 (7.5.2)
% 편집창 툴바의 버튼들은 모두 대응하는 명령이 있다.
%   breakpoint 찍기   dbstop in 파일 at 행
%   breakpoint 목록   dbstatus
%   breakpoint 지우기 dbclear all
%   Continue          dbcont
%   Step              dbstep
%   Step In           dbstep in
%   Step Out          dbstep out
%   호출 경로 보기    dbstack
%   디버그 빠져나오기 dbquit
%
% dbstop 으로 실제로 멈추면 키보드 입력을 기다리므로 -batch 에서는 쓰지 않는다.
% 여기서는 멈추지 않고도 쓸 수 있는 것들만 보여 준다.

clear; clc; dbclear all

disp('=== dbtype: 행 번호를 붙여 코드 보기 (breakpoint 걸 줄 고를 때) ===')
dbtype fall_distance 1:6

disp(' ')
disp('=== dbstack: 지금 어느 호출 경로에 있는가 ===')
show_stack();

disp(' ')
disp('=== 오류가 났을 때의 호출 경로는 err.stack 에 남는다 ===')
try
    fall_distance(9.81);            % 입력을 하나만 줘서 오류를 낸다
catch err
    fprintf('오류 메시지: %s\n', err.message);
    fprintf('오류 식별자: %s\n', err.identifier);
    disp('호출 경로:')
    for k = 1:numel(err.stack)
        fprintf('  %s (%d 행)\n', err.stack(k).name, err.stack(k).line);
    end
end

disp(' ')
disp('=== dbstop / dbstatus / dbclear ===')
dbstop in fall_distance at 6
disp('dbstop in fall_distance at 6 을 건 뒤 dbstatus:')
dbstatus
dbclear all
disp('dbclear all 뒤 dbstatus 는 아무것도 출력하지 않는다:')
dbstatus
fprintf('(위에 아무것도 없으면 breakpoint 가 모두 지워진 것이다)\n');

disp(' ')
disp('=== 멈추지 않고 중간값을 보는 가장 싼 방법 ===')
g = 9.81; t = 3;
fprintf('g = %g, t = %g 일 때 d = %g\n', g, t, fall_distance(g, t));
fprintf('세미콜론을 잠깐 빼거나 fprintf 를 끼워 넣는 것만으로 충분할 때가 많다.\n');

disp(' ')
disp('=== 오류가 나면 자동으로 멈추게 하기 ===')
fprintf('dbstop if error  : 오류가 난 그 자리에서 workspace 를 들여다볼 수 있다\n');
fprintf('dbstop if naninf : NaN 이나 Inf 가 생기는 순간 멈춘다\n');
fprintf('(둘 다 대화형 세션에서만 쓸모 있다)\n');

function show_stack()
% dbstack 은 실행 중인 함수들의 호출 경로를 돌려준다
level_two();
end

function level_two()
st = dbstack;
for k = 1:numel(st)
    fprintf('  %d: %s (%d 행)\n', k, st(k).name, st(k).line);
end
end
