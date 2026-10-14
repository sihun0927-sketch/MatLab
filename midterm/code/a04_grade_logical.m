% 정답 04: 의사코드 → 코드. 점수를 학점으로 분류 (loop 없이 logical indexing)
clear, clc
% 1. 점수 벡터를 정의한다
scores = [95 82 67 58 74 88 91 60 79 45];
% 2. 점수와 같은 크기의 빈 string 배열을 만든다
grade = strings(size(scores));
% 3. 각 구간에 맞는 글자를 logical indexing으로 채운다
grade(scores >= 90) = "A";
grade(scores >= 80 & scores < 90) = "B";
grade(scores >= 70 & scores < 80) = "C";
grade(scores >= 60 & scores < 70) = "D";
grade(scores < 60) = "F";
% 4. 학점별 인원을 센다
counts = [sum(grade == "A"), sum(grade == "B"), sum(grade == "C"), ...
          sum(grade == "D"), sum(grade == "F")];
% 5. 표로 출력한다
disp(table(scores', grade', VariableNames = ["Score", "Grade"]))
fprintf('%s: %s\n', [["A" "B" "C" "D" "F"]; string(counts)])
