%%%%% Author: Anna Borsuk. %%%%%

% Number of members of population.
n=100;

% Cut it in half to make the comparison with the normal GA possible.
halfPop=n/2;

% Number of iterations.
iterations=120;

% Chromosome length - 210 for dejong4.
chromlength=210;

% Number of separate populations' island crossovers.
islandsCrossPoints=2;

% Mutation rate.
mutationrate=0.01;

% Calculate divisions regarding of number of island crossovers.
divisionPoint=islandsCrossPoints+1;
division=iterations/divisionPoint;

% Make first stop the number of division.
stop=division;

% Initialise population A
[oldchromA]=initpop(halfPop,chromlength);

% Initialise population B
[oldchromB]=initpop(halfPop,chromlength);

% Create empty arrays that will be used to store the new versions of
% populations created via island crossover.
newOldChromA=[];
newOldChromB=[];

% Start iterations.
for i=1:iterations
    
    % If the right time comes - do the island crossover.
    % if (stop~=iterations)        
        if (i==stop && stop~=120)
            fprintf('Island crossing: %d\n\n',i);
            
            % For each member of both populations:
            for j=1:halfPop   
                
                % Pick the parents from both populations (in the order of
                % existence in the populations)
                parentA=oldchromA(j,:);
                parentB=oldchromB(j,:);
                
                % Merge the parents into 1 array.    
                parentsAB=vertcat(parentA,parentB); 
                
                % Crossover the selected parents to produce children.
                childrenOfAB=crossover(parentsAB);
                
                % Mutate children.
                MutatedChildrenOfAB=mutate(childrenOfAB,mutationrate);
                
                % Separate the children to put them into different
                % populations.
                childForA=MutatedChildrenOfAB(1,:);
                childForB=MutatedChildrenOfAB(2,:);
                
                % First child goes to population A, second - to population
                % B.
                newOldChromA(j,:)=childForA;
                newOldChromB(j,:)=childForB;
            end
            
            % Put the newly created populations into the reminded number of
            % normal iterations.
            oldchromA=newOldChromA;
            oldchromB=newOldChromB;
            
            % Set the new island crossover point.
            stop=stop+division;
            
        else
        % If not the time of the island crossover - do the normal
        % populations' developement.
            fprintf('Iteration %d\n\n',i);
    
            % Calculate fitness functions for both populations (dejong function 4 used).
            fitnessvaluesA=fitnessfunction(oldchromA);
            fitnessvaluesB=fitnessfunction(oldchromB);
    
            % Use roulette wheel to choose pairs to be mixed.
            newchromA=roulette(fitnessvaluesA,oldchromA);
            newchromB=roulette(fitnessvaluesB,oldchromB);
    
            % Do the internal crossover of each population.
            newchrom1A=crossover(newchromA);
            newchrom1B=crossover(newchromB);
    
            % Mutate the children.
            newchrom2A=mutate(newchrom1A,mutationrate);
            newchrom2B=mutate(newchrom1B,mutationrate);
        
            oldchromA=newchrom2A;
            oldchromB=newchrom2B;
    
        end                
    % end
    
end

% Calculate the fitness values for both populations.
fitnessvaluesA=fitnessfunction(oldchromA);
fitnessvaluesB=fitnessfunction(oldchromB);

% Put the maximum values of each population into a new array.
maxOverallFitness=[];
maxOverallFitness(1,1)=max(fitnessvaluesA);
maxOverallFitness(1,2)=max(fitnessvaluesB);

% Display the maximum fitness value of population A and B.
fprintf('Maximum overall fitness = %5.2f\n',max(maxOverallFitness));

