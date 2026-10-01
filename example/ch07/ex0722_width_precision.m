% ex0722_width_precision.m — 폭(width)과 정밀도(precision) (7.2.2)
%   %[폭].[정밀도]타입     예: %8.2f
% 폭  = 그 값이 차지할 "전체" 칸 수 (소수점과 부호도 포함)
% 정밀도 = 소수점 아래 자릿수

clear; clc

v = pi * 100;    % 314.159265...

fprintf('값 = %.10f\n\n', v);
fprintf('  %%f      [%f]\n', v);
fprintf('  %%.2f    [%.2f]\n', v);
fprintf('  %%8.2f   [%8.2f]   ← 전체 8 칸, 그중 소수 2 자리\n', v);
fprintf('  %%12.2f  [%12.2f]\n', v);
fprintf('  %%-12.2f [%-12.2f]  ← 왼쪽 정렬\n', v);
fprintf('  %%+8.2f  [%+8.2f]   ← 부호 항상 표시\n', v);
fprintf('  %%08.2f  [%08.2f]   ← 빈칸을 0 으로\n', v);

fprintf('\n자주 하는 오해\n');
fprintf('  %%8.2f 는 "점 앞 8 자리, 뒤 2 자리"가 아니다. 8 은 전체 폭이다.\n');
fprintf('  그래서 %%2.3f 는 말이 안 된다. 전체 2 칸인데 소수만 3 자리이기 때문이다.\n');
fprintf('  %%2.3f  [%2.3f]   ← 폭이 모자라면 MATLAB 은 폭을 무시하고 늘린다\n', v);

fprintf('\n폭은 "최소"일 뿐이라 넘치면 잘리지 않는다\n');
fprintf('  %%4.2f 에 %.2f 를 넣으면 [%4.2f]\n', v, v);

fprintf('\n열 맞추기에 쓰는 것이 폭의 본래 용도다\n');
names = ["수소" "헬륨" "리튬"];
mass  = [1.008 4.0026 6.94];
for k = 1:3
    fprintf('  %-6s %8.4f\n', names(k), mass(k));
end
