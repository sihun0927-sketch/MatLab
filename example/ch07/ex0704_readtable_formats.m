% ex0704_readtable_formats.m — readtable 은 확장자로 파일 종류를 정한다 (7.4, 원서 Table 7.4)
%   .txt .dat .csv                        → 구분자 텍스트
%   .xls .xlsb .xlsm .xlsx .xltm .xltx .ods → 스프레드시트
%   .xml                                  → XML

clear; clc

T = table(["Earth"; "Moon"], [9.81; 1.62], VariableNames=["Planet", "Gravity"]);

% 같은 표를 확장자만 바꿔 쓰고 되읽는다
exts = [".csv", ".xlsx", ".xml"];
for e = exts
    f = fullfile(tempdir, "planets" + e);
    writetable(T, f);
    R = readtable(f, TextType="string");
    fprintf('%-5s → size [%d %d], Gravity 보존 = %d\n', e, size(R), isequal(R.Gravity, T.Gravity));
end

% Table 7.4 에 없는 확장자
logfile = fullfile(tempdir, "planets.log");
writetable(T, logfile, FileType="text");          % 쓸 때는 종류를 지정해야 한다
R = readtable(logfile, TextType="string");        % 읽을 때는 텍스트로 간주된다
fprintf('.log  → size [%d %d] (FileType 없이 텍스트로 읽힘)\n', size(R));
