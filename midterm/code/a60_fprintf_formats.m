% 정답 60: fprintf 변환 문자 출력 재현
clear, clc
x = 12345.678;
fprintf('%f|%e|%g\n', x, x, x)
fprintf('%g|%g\n', 0.00001234, 1e6)
fprintf('%d|%d\n', 7, 2.5)
fprintf('%s|%s\n', "abc", 'abc')
fprintf('%d ', 'abc'); fprintf('\n')
fprintf('%s is %d\n', "Tom", 25, "Ann", 31)
fprintf('[%-6s][%6s]\n', "ab", "cd")
fprintf('%5.1f%%\n', 45.678)
fprintf('%c%c%c\n', 72, 105, 33)
