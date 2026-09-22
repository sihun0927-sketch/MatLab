%% 변수 저장/불러오기 - .mat 파일
% MATLAB 임시 폴더에 저장해 저장소를 더럽히지 않는다.
matFile = fullfile(tempdir, "my_example_file.mat");

my_scalar = 42;
my_vector = 1:5;
my_text = "hello matlab";

save(matFile, "my_scalar", "my_vector", "my_text")

clear my_scalar my_vector my_text
load(matFile)
disp(my_scalar)
disp(my_vector)
disp(my_text)

%% 변수 저장/불러오기 - ASCII(.dat) 파일
datFile = fullfile(tempdir, "my_example_data.dat");
tableData = [1 2 3; 4 5 6; 7 8 9];
save(datFile, "tableData", "-ascii")

clear tableData
loaded = load(datFile);   % ASCII 파일은 파일 이름과 같은 단일 변수로 불러와진다
disp(loaded)

delete(matFile)
delete(datFile)

%% Section Mode 예시
% 아래처럼 "%% 이름" 으로 섹션을 나누면 섹션 단위로 실행할 수 있다.

%% Section A: 데이터 준비
temperatures_c = [0 20 37 100];

%% Section B: 단위 변환
temperatures_f = temperatures_c * 9/5 + 32;
disp(temperatures_f)
