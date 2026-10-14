function run_all()
% RUN_ALL midterm/code 안의 정답 스크립트(a*.m)를 전부 실행해 오류 없이 끝나는지 검증한다.
%   q*.m(오류 문제 원본)은 실행하지 않는다. 실행하면 오류가 나는 것이 정상이다.
%   사용: MATLAB에서 midterm/code 로 cd 한 뒤 run_all
%   출력까지 파일로 남기려면 capture_outputs 를 쓴다 (../out/*.txt).
here = fileparts(mfilename('fullpath'));
cd(here);
files = dir(fullfile(here, 'a*.m'));
names = {files.name};
nFail = 0;
for k = 1:numel(names)
    name = names{k}(1:end-2);
    fprintf('\n===== %s =====\n', name);
    if ~runone(name)
        nFail = nFail + 1;
    end
    close all force
end
fprintf('\n정답 스크립트 %d개 중 실패 %d개\n', numel(names), nFail);
end

function ok = runone(name)
% 스크립트 안의 clear가 호출자 변수를 지우므로 별도 함수 작업공간에서 실행한다
try
    run(name);
    ok = true;
catch err
    fprintf(2, '!! 실패: %s\n', err.message);
    ok = false;
end
end
