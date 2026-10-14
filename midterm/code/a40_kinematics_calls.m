% 정답 40: 문제에 제시된 호출 결과를 재현한다 (함수 본문은 kinematics.m)
clear, clc
[d, v, a] = kinematics(4)
kinematics(2)
nargin("kinematics")
nargout("kinematics")
help kinematics
x = kinematics([2 4 6])
