% sol0705_2.m — 7.5 연습문제 2
% 오류를 잡아 어디서 났는지 보고하는 함수를 만든다.
% try/catch + err.stack 은 breakpoint 를 걸 수 없는 상황(배치 실행, 자동 채점)에서
% 디버깅 정보를 남기는 표준적인 방법이다.

clear; clc

cases = { {9.81, 3},  'g 와 t 를 제대로 준 경우'
          {9.81},     't 를 빠뜨린 경우'
          {'ten', 3}, 'g 에 글자를 준 경우 (오류가 안 난다!)'
          {9.81, 3, 1}, '인수를 너무 많이 준 경우' };

for k = 1:size(cases, 1)
    fprintf('--- %s ---\n', cases{k,2});
    report_call(@fall_distance, cases{k,1});
    fprintf('\n');
end

disp('=== 정리 ===')
fprintf('err.identifier : 오류의 종류를 코드로 알려 준다 (MATLAB:minrhs 등)\n');
fprintf('err.message    : 사람이 읽는 메시지\n');
fprintf('err.stack      : 어느 함수의 몇 행에서 났는지, 호출 경로까지\n');
fprintf('대화형 세션이라면 dbstop if error 로 그 자리에서 멈춰 workspace 를 볼 수 있다.\n');
fprintf('\n다만 try/catch 가 잡아 주는 것은 "터지는" 오류뿐이다.\n');
fprintf('char 를 숫자로 써 버린 세 번째 경우처럼 조용히 틀리는 logic error 는\n');
fprintf('결과의 크기와 값을 직접 확인해야 잡힌다.\n');

function report_call(fh, args)
% 함수를 호출해 보고, 오류가 나면 어디서 났는지 보고한다
try
    out = fh(args{:});
    fprintf('  오류 없음: 결과 = %s\n', mat2str(out, 5));
    if ~isscalar(out)
        fprintf('  (!) 스칼라를 기대했는데 %s 짜리가 돌아왔다. 오류 없이 틀린 답이 나오는 쪽이\n', mat2str(size(out)));
        fprintf('      오류가 나는 쪽보다 훨씬 찾기 어렵다. 이것이 logic error 다.\n');
    end
catch err
    fprintf('  오류: %s\n', err.message);
    fprintf('  식별자: %s\n', err.identifier);
    for k = 1:numel(err.stack)
        fprintf('    %s (%d 행)\n', err.stack(k).name, err.stack(k).line);
    end
end
end
