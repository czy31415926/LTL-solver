function Alph_s = alphabet_set(alphabet)
%construct set with possible combination between atomic propositions
%Alph_s=power_set(alphabet(1:N_p)) - {empty_set} + {alphabet(N_p+1)}
%fisrt N_p props from alphabet are in the LTL formula, last one is for representing the left-over space

N_p=length(alphabet)-1; %number of atomic props in formula
Alph_s=cell(1,2^N_p);

for i=1:(2^N_p-1)   %find all possible combinations of atomic props in formula (without last prop - for left-over space)
    s=double(dec2bin(i,N_p))-double('0');    %we don't need the empty combination
	% AU: Indexing in the natural order
    s=fliplr(s);
    Alph_s{i}=[alphabet{find(s)}];  %add in Alph_s strings representing possible combinations of props from formula
end

Alph_s{end}=alphabet{end};  %proposition for left-over space at the end

