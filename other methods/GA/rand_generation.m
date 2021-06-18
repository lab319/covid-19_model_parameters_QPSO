function population=rand_generate(popsize,Encode)
%%  
population=zeros(popsize,sum(Encode.dnum));
for j=1:Encode.degree    
    buf = rand(popsize,Encode.dnum(j)); 
    range=sum(Encode.dnum(1:j-1))+1:sum(Encode.dnum(1:j));
    if Encode.style(j)==0  
        population(:,range)=round(buf.*(ones(popsize,1)*(Encode.bounds{j}(2,:)-Encode.bounds{j}(1,:)))+ones(popsize,1)*Encode.bounds{j}(1,:));
    elseif Encode.style(j)==1 
        population(:,range)=buf.*(ones(popsize,1)*(Encode.bounds{j}(2,:)-Encode.bounds{j}(1,:)))+ones(popsize,1)*Encode.bounds{j}(1,:);
    elseif Encode.style(j)==2 
        [~,index]=sort(buf,2);
        population(:,range)=Encode.bounds{j}(index);
    end
end
end
