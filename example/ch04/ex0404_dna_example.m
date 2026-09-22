% Ch4.4 - 문자 배열이 어울리는 예: DNA 서열 (각 글자 자체에 의미가 있는 경우)

dna = 'ATCGGCTA';        % 각 글자(A,T,C,G)가 그 자체로 의미를 가진다

firstBase = dna(1)        % 'A' - 첫 번째 염기
sequenceLength = length(dna)

% > **[보강]** 염기 하나를 다른 문자로 바꾸는 것도 인덱싱으로 가능하다
dna(2) = 'G';              % 두 번째 염기를 T -> G로 치환
dna
