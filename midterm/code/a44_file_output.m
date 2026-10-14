% 정답 44: 파일 출력. 주어진 파일 내용과 바이트 수를 만드는 코드
clear, clc
t = 0:0.5:2;
v = 9.8*t;
fid = fopen("../out/speed_log.txt", "wt");
fprintf(fid, 'Free-fall speed log\n');
fprintf(fid, 't = %4.1f s  v = %6.2f m/s\n', [t; v]);
count = fprintf(fid, 'END (%d samples)\n', numel(t))
fclose(fid);
type ../out/speed_log.txt
