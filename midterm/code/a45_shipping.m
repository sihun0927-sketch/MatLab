% 정답 45: 지역과 무게에 따른 배송비 (switch + elseif + error)
clear, clc
% region = input("Region (domestic/asia/other): ", "s");   % 원래 코드
% w = input("Weight in kg: ");                             % 원래 코드
region = 'asia'; w = 3.5;                                  % 검증용 고정값
if ~isnumeric(w) || ~isscalar(w) || w <= 0
    error("Weight must be a positive number")
end
switch region
    case "domestic"
        base = 3000;   per_kg = 500;
    case {"asia", "Asia"}
        base = 12000;  per_kg = 2500;
    case "other"
        base = 25000;  per_kg = 6000;
    otherwise
        error("Unknown region: %s", region)
end
if w <= 1
    cost = base;
elseif w <= 5
    cost = base + per_kg*(w - 1);
else
    cost = base + per_kg*4 + 1.5*per_kg*(w - 5);
end
fprintf('%s, %.1f kg -> %d KRW\n', region, w, round(cost))
