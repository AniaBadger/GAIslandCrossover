function fitnessvalues = fitnessfunction(oldchrom )
%fitnessfunction Computes the fitness of a population
%   Returns the fitness in a vector
% Requires a user-supplied fitness
[rows cols]=size(oldchrom);
fitnessvalues=[];
for i=1: rows
    fitnessvalues(i)=dejongf4(oldchrom(i,:));
    % This is where the user defined fitness function goes
end

mean(fitnessvalues);
max(fitnessvalues);
min(fitnessvalues);
% fprintf('------------------------------------- %5.2f\n',0);

% fitnessvalues

% Fitness statistics to be added


end

