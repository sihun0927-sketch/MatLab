% ex0704_audio_import.m — 소리 파일 읽고 쓰기 (7.4)
%   [data, fs] = audioread("이름.wav")   data = 표본, fs = 표본율(Hz)
%   sound(data, fs)                      스피커로 재생
%   audiowrite("이름.wav", data, fs)     파일로 저장
%
% sound 는 소리 장치가 필요해 -batch 에서는 쓰지 않는다.
% MATLAB 이 기본 제공하는 .wav 가 없으므로 여기서는 직접 만들어 읽는다.

clear; clc; close all

fs = 8000;                        % 표본율 8 kHz
t  = 0:1/fs:0.5;                  % 0.5 초
y  = 0.6*sin(2*pi*440*t) + 0.3*sin(2*pi*554.37*t);   % A4 + C#5

wavfile = fullfile(tempdir, 'chord.wav');
audiowrite(wavfile, y, fs);
fprintf('만든 파일: %s (%d 바이트)\n', wavfile, dir(wavfile).bytes);

% --- 읽기 ---
[data, fs2] = audioread(wavfile);
fprintf('audioread 결과: size(data) = %s, fs = %d Hz\n', mat2str(size(data)), fs2);
fprintf('표본 수 %d / 표본율 %d = %.3f 초\n', size(data,1), fs2, size(data,1)/fs2);

% 파일 정보만 보려면 audioinfo
info = audioinfo(wavfile);
fprintf('audioinfo: %d 채널, %d bit, %.3f 초\n', ...
    info.NumChannels, info.BitsPerSample, info.Duration);

% --- 재생 ---
if usejava('desktop')
    sound(data, fs2);             % 소리 장치가 있을 때만
else
    disp('(-batch 모드라 sound 는 건너뛴다. 데스크톱에서는 sound(data, fs))')
end

% --- 읽은 자료를 그대로 분석 ---
figure
tiledlayout(2, 1)

nexttile
plot((0:200-1)/fs2, data(1:200), LineWidth=1.2)
grid on
xlabel('시간 (s)'); ylabel('진폭')
title('앞 200 표본')

nexttile
Y = abs(fft(data));
f = (0:numel(Y)-1) * fs2 / numel(Y);
plot(f(1:floor(end/2)), Y(1:floor(end/2)), LineWidth=1.2)
grid on
xlim([0 1000])
xlabel('주파수 (Hz)'); ylabel('|FFT|')
title(sprintf('주파수 성분 (표본율 %d Hz)', fs2))

theme(gcf, "light")        % R2026a 기본 테마는 dark 라 밝게 바꿔 저장한다
exportgraphics(gcf, '../../textbook/ch07/img/ex0704_audio_import.png')

delete(wavfile);
