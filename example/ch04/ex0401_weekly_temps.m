% Ch4.1 - [보강] 콜론과 인덱싱을 함께 써보는 실습: 일주일 기온 데이터

temps = [23 25 26 22 21 19 20];   % 월~일 7일치 최고기온(섭씨)

weekdayTemps = temps(1:5)          % 월~금 (콜론으로 구간 추출)
weekendTemps = temps(6:end)        % 토~일 (end로 마지막까지)

avgWeekday = mean(weekdayTemps)
avgWeekend = mean(weekendTemps)

temps(3) = temps(3) - 1;            % 수요일(3번째) 기온을 인덱싱으로 1도 낮춰서 수정
temps
