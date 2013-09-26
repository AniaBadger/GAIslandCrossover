%%%%% Author: Anna Borsuk. %%%%%

function fitnessval = dejongf4(chrom )

% Extract all 30 variables from chromosome of length 210.
k=1;
sum=0;

for n=1:30
    
    % Chop chromosome into chuncks of length 7: chrom(1:7), chrom(8:14) etc.
    xchrom=chrom(k:7*n);
    
    % fprintf('7 bits chrom: %5.2f\n',xchrom);
    
    % Convert the number from binary to decimal.
    xbase=1;
    count=7;
    
    for i=1:7
        xnext=xchrom(count)*pow2(i);
        x=xbase+xnext;
        xbase=x;
        count=count-1;
    end
    
    % Increse k for chromosome chopping.
    k=k+7;
    
    % fprintf('x before division: %5.2f\n',x);
    
    % Make the variables fall into (-0.01,0.01) range.
    x=x/100;
    
    % fprintf('x: %5.2f\n',x);  
    
    % Calculate x to the power of 4.
    xpower4=x^4;    
    % fprintf('xpower4: %5.2f\n',xpower4);
    
    % fprintf('sum before calculation: %5.2f\n',sum);
    % fprintf('n: %5.2f\n',n);
    
    % Produce a Gaussian random number Gauss(0,1).
    random=(rand(1,1)).*1;
    % fprintf('random: %5.2f\n',random);
    
    % Calculate the actual fitness function.
    sum=sum+(n * xpower4 + random);
    
    % fprintf('sum after: %5.2f\n',sum);
    
end

fitnessval=sum;

end

