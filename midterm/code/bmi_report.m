function [bmi, category] = bmi_report(weight, height, units)
% BMI_REPORT  체질량지수와 분류
%   [bmi, category] = bmi_report(weight, height) : kg, m
%   [bmi, category] = bmi_report(weight, height, "imperial") : lb, in
%   weight와 height는 같은 크기의 벡터. 양수가 아니면 오류.
if nargin < 3
    units = "metric";
end
if numel(weight) ~= numel(height)
    error("weight and height must have the same number of elements")
end
if any(weight <= 0) || any(height <= 0)
    error("weight and height must be positive")
end
if units == "imperial"
    weight = weight*0.4536;       % lb -> kg
    height = height*0.0254;       % in -> m
end
bmi = weight ./ height.^2;
category = strings(size(bmi));
category(bmi < 18.5) = "under";
category(bmi >= 18.5 & bmi < 25) = "normal";
category(bmi >= 25 & bmi < 30) = "over";
category(bmi >= 30) = "obese";
end
