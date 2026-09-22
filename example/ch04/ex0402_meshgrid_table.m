% Ch4.2 - [보강] meshgrid로 단가x수량 조합 계산표 만들기 (공학 외 실용 예시)

unitPrice = [1000 1500 2000 2500];   % 1x4 - 품목별 단가
quantity  = [1 2 3];                  % 1x3 - 구매 수량 (unitPrice와 크기가 다름)

[Price, Qty] = meshgrid(unitPrice, quantity);  % Price, Qty 모두 3x4
totalCost = Price .* Qty                        % 모든 (단가, 수량) 조합의 총액

sizeTotalCost = size(totalCost)                 % [3 4] - quantity 길이 x unitPrice 길이
