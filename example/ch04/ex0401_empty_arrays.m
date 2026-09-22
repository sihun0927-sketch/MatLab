% Ch4.1 - 빈 배열(empty array)

a = []                        % 내용이 전혀 없는 배열도 유효하다 (0x0)

b = 4:-1:5                    % start(4)에서 step(-1)으로 end(5)에 도달할 수 없으면
                               % 에러가 아니라 "빈 배열"이 만들어진다 (1x0)

isEmptyA = isempty(a)
isEmptyB = isempty(b)
