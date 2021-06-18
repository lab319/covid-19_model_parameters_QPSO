function [results,paintd]=GAsolver(para,Encode,fsolver,data)

%%
fnow=zeros(1,para.popsize);
fmean=zeros(1,para.Generationnmax);
fbest=zeros(1,para.Generationnmax);
aaa=zeros(1,para.Generationnmax);
fbestsofar=-inf;
amin=inf;
solbestsofar=[];
%% 
population=rand_generate(para.popsize,Encode);
[fit,fitbest,~,~,index]=cacul(para.popsize,population,data,fsolver,Encode);
fnow=fit;
if fbestsofar<fitbest
    fbestsofar=fitbest;
    solbestsofar=population(index,:);
end 
%% 
tic
Generation=0; 
for Generation=1:para.Generationnmax
    %% 
    [fnow,population]=selection(fnow,population,para.sel,para.popsize,para.popsize);
    [fit,fitbest,~,~,index]=cacul(para.popsize,population,data,fsolver,Encode);
    %% 
    [fnow,population,aa]=crossover_GA(fnow,population,para,data,Encode,fsolver);
    [gbest,num]=min(fnow);
    if fbestsofar<gbest
        fbestsofar=gbest;
        solbestsofar=population(num,:);
    end
    %%
    [fnow,population,aa]=mution_GA(fnow,population,para,data,Encode,fsolver);
    [gbest,num]=min(fnow);
    [abest,~]=min(aa);
    if fbestsofar<gbest
        fbestsofar=gbest;
        solbestsofar=population(num,:);
    end
    fbest(Generation)=fbestsofar;
    fmean(Generation)=mean(fnow); 
    Generation
end
fbest=fbest(1:Generation);
fmean=fmean(1:Generation);
[~,results]=fsolver.fitness(solbestsofar,data,Encode);

paintd.f_best=fbest.*fsolver.minmax;
paintd.f_mean=fmean.*fsolver.minmax;
paintd.f_fitness=fbest;
end

function  [fnownew,popnew,aa]=crossover_GA(fnownew,popnew,para,data,Encode,fsolver)
for i=1:2:para.popsize 
    seln=popnew(i:i+1,:);
    if rand<=para.pcrossover 
        bufn=randperm(Encode.degree,1);
        bufn=randperm(Encode.degree,bufn);
        for j=bufn  
            selncut=seln(:,sum(Encode.dnum(1:j-1))+1:sum(Encode.dnum(1:j)));
          
            if Encode.dnum(j)==1
                style2=1;
            else
                [~,style2]=selection(para.pcr(:,2)',para.pcr(:,1),1,size(para.pcr,1),1);
            end
            selncut=crossd(selncut,Encode.dnum(j),Encode.style(j),style2);
            seln(:,sum(Encode.dnum(1:j-1))+1:sum(Encode.dnum(1:j)))=selncut;
        end
        popnew(i:i+1,:)=seln;
        [fnownew(i:i+1),~,aa(i:i+1)]=cacul(2,popnew(i:i+1,:),data,fsolver,Encode);
    end
end
end

function [fnownew,popnew,aa]=mution_GA(fnownew,popnew,para,data,Encode,fsolver)
for i=1:para.popsize 
    seln=popnew(i,:);
    if rand<=para.pmutation
        bufn=randperm(Encode.degree,1);
        bufn=randperm(Encode.degree,bufn);
        for j=bufn  
            selncut=seln(sum(Encode.dnum(1:j-1))+1:sum(Encode.dnum(1:j)));
            if Encode.style(j)==0 ||  Encode.style(j)==1 
                [~,style2]=selection(para.pmtnum(:,2)',para.pmtnum(:,1),1,size(para.pmtnum,1),1);
                [~,range]=selection(para.step(:,2)',para.step(:,1),1,size(para.step,1),1);
                selncut=neihood(selncut,Encode.dnum(j),Encode.style(j),style2,Encode.bounds{j},range);
            else
                [~,style2]=selection(para.pmtseq(:,2)',para.pmtseq(:,1),1,size(para.pmtseq,1),1);
                selncut=neihood(selncut,Encode.dnum(j),Encode.style(j),style2,[],[]);
            end
            seln(sum(Encode.dnum(1:j-1))+1:sum(Encode.dnum(1:j)))=selncut;
        end
        popnew(i,:)=seln;
        [fnownew(i),~,aa]=cacul(1,popnew(i,:),data,fsolver,Encode);
    end
end
end
