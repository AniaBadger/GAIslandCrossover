function chromout = mutate(inchrom,mutationrate )
%mutate apply standard GA mutation according to mutation rate
[rows cols]=size(inchrom);
randrange=fix(1/mutationrate);
for i=1:rows
    for j=1:cols
        num=randi(randrange,1,1);
        if num==1
            if inchrom(i,j)==0
                inchrom(i,j)=1;
            else
                inchrom(i,j)=0;
            end
        end
    end
end
chromout=inchrom;
        
        


end

