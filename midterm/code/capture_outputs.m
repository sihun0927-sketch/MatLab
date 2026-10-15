function capture_outputs(varargin)
% capture_outputs: a*.m 와 q*.m 를 전부 실행해 출력/오류를 ../out/<name>.txt 에 UTF-8로 저장
%   capture_outputs("a5*", "q5*") 처럼 패턴을 주면 그 파일들만 실행한다.
cd('C:\Users\sihun\orca\MatLab\midterm\code');
if nargin == 0
    patterns = {'a*.m', 'q*.m'};
else
    patterns = cellfun(@(p) [char(p) '.m'], varargin, 'UniformOutput', false);
end
files = [];
for k = 1:numel(patterns)
    files = [files; dir(patterns{k})]; %#ok<AGROW>
end
names = {files.name};
for k = 1:numel(names)
    name = names{k}(1:end-2);
    [out, errtxt] = runone(name);
    close all force
    fid = fopen(fullfile('..', 'out', [name '.txt']), 'w', 'n', 'UTF-8');
    fprintf(fid, '%s%s', out, errtxt);
    fclose(fid);
    fprintf('%s done (%d chars)%s\n', name, numel(out), errtxt);
end
end

function [out, errtxt] = runone(name)
cmd = sprintf(['try, run(''%s''), catch zz_err, ' ...
    'fprintf(''\\n[ERROR] %%s\\n%%s\\n'', zz_err.identifier, zz_err.message), end'], name);
out = evalc(cmd);
errtxt = '';
end
