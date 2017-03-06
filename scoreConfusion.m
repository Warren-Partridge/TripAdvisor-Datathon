function out = scoreConfusion(guess, target)
out = zeros(2);
guess1 = guess == 1;
target1 = target == 1;
guess0 = ~guess1;
target0 = ~target1;

out(1,1) = sum(guess0 & target0);
out(2,1) = sum(guess1 & target0);
out(1,2) = sum(guess0 & target1);
out(2,2) = sum(guess1 & target1);
end