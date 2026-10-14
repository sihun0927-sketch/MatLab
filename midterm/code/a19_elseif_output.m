% 정답 19: 입력값에 따라 메시지를 내는 if/elseif. 문제에서는 input으로 세 번 실행.
clear, clc
% score = input("Enter the score (0-100): ");   % 원래 코드
for_test = [83 100 -5];                          % 검증용: 세 번의 입력값
fprintf('Enter the score (0-100): %g\n', for_test(1)); classify(for_test(1));
fprintf('Enter the score (0-100): %g\n', for_test(2)); classify(for_test(2));
fprintf('Enter the score (0-100): %g\n', for_test(3)); classify(for_test(3));

function classify(score)
if score < 0 || score > 100
    disp("Invalid score")
elseif score >= 90
    fprintf('Grade A (%.0f points above B)\n', score - 80)
elseif score >= 80
    fprintf('Grade B (%.0f points to A)\n', 90 - score)
else
    disp("Grade C or below")
end
end
