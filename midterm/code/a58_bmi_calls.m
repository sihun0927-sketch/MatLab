% 정답 58: bmi_report 함수 파일 호출 + assert / try-catch 검사
clear, clc
help bmi_report
[b, c] = bmi_report([70 55 95], [1.75 1.80 1.70])
[b2, c2] = bmi_report(154, 69, "imperial")
assert(abs(b2 - 154*0.4536/(69*0.0254)^2) < 1e-10, "imperial conversion mismatch")
try
    assert(all(c == "normal"), "Not everyone is normal: %s", strjoin(c, ", "))
catch err
    fprintf("Caught: %s\n", err.message)
end
try
    bmi_report([70 80], 1.75)
catch err
    fprintf("Caught: %s\n", err.message)
end
try
    bmi_report(-70, 1.75)
catch err
    fprintf("Caught: %s\n", err.message)
end
T = table(b', c', VariableNames = ["BMI" "Category"])
