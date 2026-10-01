% warn_demo.m — Code Analyzer 가 경고를 붙이는 전형적인 코드 (7.5.1)
% 일부러 경고가 나도록 써 둔 파일이다. 오류는 없으므로 실행은 된다.
% checkcode('warn_demo') 로 경고 목록을 볼 수 있다.

r = 3
area = pi * r^2
total = 0;
for k = 1:5
    total = total + k;      % 미리 크기를 잡지 않고 키우는 패턴의 예
end
v = [];
for k = 1:5
    v(k) = k^2;             % v 가 반복문 안에서 자란다 (preallocation 경고)
end
unused = 42;                % 쓰지 않는 변수
if area == pi * 9           % 실수끼리 == 로 비교
    disp('같다')
end
disp(total); disp(v);
