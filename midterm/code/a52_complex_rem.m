% 정답 52: 복소수와 rem/mod 출력 재현
clear, clc
z = [3+4i, -2i]
r = abs(z)
theta = rad2deg(angle(z))
zc = conj(z)
zt = z'
zd = z.'
rm = [rem(-7, 3) mod(-7, 3) rem(7, -3) mod(7, -3)]
