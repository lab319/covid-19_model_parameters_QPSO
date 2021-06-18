popsize=200;
generationmax=10;
c1=0.5;
c2=0.3;
MaxW=0.95;MinW=0.4;
N=data.N;
x=data.intiad;
t=1:data.step:data.maxday;
%%
lzsize=ceil(data.maxday/data.gap)*9;
locatbounds=zeros(lzsize,2);
for i=1:lzsize
    locatbounds(i,:)=[0,1];
    vlocatbounds(i,1)=-0.5*locatbounds(i,2);
    vlocatbounds(i,2)=0.5*locatbounds(i,2);
end
%% 
locat=zeros(popsize,lzsize);
sj=rand(1,lzsize);
locat(1,:)=sj.*(locatbounds(:,2)'-locatbounds(:,1)')+locatbounds(:,1)';
V=zeros(popsize,lzsize);
V(1,:)=(vlocatbounds(:,2)'-vlocatbounds(:,1)')+vlocatbounds(:,1)';
for i=2:popsize
    sj=4*(1-sj).*sj;
    locat(i,:)=sj.*(locatbounds(:,2)'-locatbounds(:,1)')+locatbounds(:,1)';%各粒子得初始代
    V(i,:)=(vlocatbounds(:,2)'-vlocatbounds(:,1)')+vlocatbounds(:,1)';
end
fitvalue=zeros(1,popsize);
for i=1:popsize
    [fitvalue(i),~]=fitnessn(locat(i,:),data);
end
[zhi,index]=min(fitvalue);
fbestself=fitvalue;
bestself=locat;
fbestall=zhi;
bestall=locat(index,:);
fmin=zeros(1,generationmax);
fmean=zeros(1,generationmax);

%% 
for generation=1:generationmax
    w=MaxW-generation*((MaxW-MinW)/generationmax);
    for i=1:popsize
        V(i,:)=w*V(i,:)+c1*rand*(bestself(i,:)-locat(i,:))+c2*rand*(bestall-locat(i,:));
        cx=V(i,:)-(vlocatbounds(:,2)'+vlocatbounds(:,1)')/2;             
        cx=sign(cx).*min(abs(cx),(vlocatbounds(:,2)'-vlocatbounds(:,1)')/2);
        V(i,:)=cx+(vlocatbounds(:,2)'+vlocatbounds(:,1)')/2;
        locat(i,:)=locat(i,:)+V(i,:);
        zx=locat(i,:)-(locatbounds(:,2)'+locatbounds(:,1)')/2;             
        zx=sign(zx).*min(abs(zx),(locatbounds(:,2)'-locatbounds(:,1)')/2);
        locat(i,:)=zx+(locatbounds(:,2)'+locatbounds(:,1)')/2;
        %%
        [fitvalue(i),~]=fitnessn(locat(i,:),data);
    end
    %% 
    [zhi,index]=min(fitvalue);
    for i=1:popsize
        if fbestself(i)>fitvalue(i)
            bestself(i,:)=locat(i,:);
            fbestself(i)=fitvalue(i);
        end
    end
    if  fbestall>zhi 
        bestall=locat(index,:);
        fbestall=zhi;
    end
    fmin(generation)=fbestall;
    fmean(generation)=mean(fitvalue);
    generation
end
[f,~,pararout,x2]=fitnessn(bestall,data);
SEAIQRD = Simulateb(pararout,data,x2);
x1=SEAIQRD(end,:)';
SEAIQRD1=Pre(pararout,x1);
