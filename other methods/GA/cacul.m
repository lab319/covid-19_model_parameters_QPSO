function [fnow,fbest,fmean,resultall,index,aa]=cacul(popsize,population,data,fsolver,Encode)

%%
fnow=zeros(1,popsize);
resultall=cell(1,popsize);
for i=1:popsize
    [fnow(i),resultall{i}]=fsolver.fitness(population(i,:),data,Encode);
end
fnow=fnow*fsolver.minmax;
[fbest,index]=max(fnow);
fmean=mean(fnow);
end
