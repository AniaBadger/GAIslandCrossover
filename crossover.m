function newchrom = crossover(oldchrom )
%crossover performs standard one-point crossover
%   on pairs of chromosomes in a population
[rows cols]=size(oldchrom);
if (rem(rows,2)~=0)
    fprintf('Error - odd population size\n');
else
    for i=1:2:rows
        crosspoint=randi([1,cols-1],1,1);
        % fprintf('crosspoint= %d\n',crosspoint);
        % At work this will be randi([1,cols-1],1,1);
        p1=oldchrom(i,:);
        p2=oldchrom(i+1,:);
        c1a=p1(1:crosspoint);
        c1b=p2(crosspoint+1:length(p2));
        c2a=p2(1:crosspoint);
        c2b=p1(crosspoint+1:length(p1));
        c1=[c1a c1b];
        c2=[c2a c2b];
        newchrom(i,:)=c1;
        newchrom(i+1,:)=c2;
    end
end


end

