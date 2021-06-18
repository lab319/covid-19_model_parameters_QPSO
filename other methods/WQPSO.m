
popsize=200;
generationmax=1000;

lzsize=ceil(data.maxday/data.gap)*9;
locatbounds=zeros(lzsize,2);
for i=1:lzsize
    locatbounds(i,:)=[0,1];
end
%% 
locat=zeros(popsize,lzsize);
sj=rand(1,lzsize);
locat(1,:)=sj.*(locatbounds(:,2)'-locatbounds(:,1)')+locatbounds(:,1)';
for i=2:popsize
    sj=4*(1-sj).*sj;
    locat(i,:)=sj.*(locatbounds(:,2)'-locatbounds(:,1)')+locatbounds(:,1)';
end
fitvalue=zeros(1,popsize);
for i=1:popsize
    [fitvalue(i),d(i),~]=fitnessn(locat(i,:),data);
    a(i)=1.5-(1.5-0.5)*(i/popsize);
end
[zhi,index]=min(fitvalue);
[zhi_low,index_low]=max(fitvalue);
fbestself=fitvalue;
bestself=locat;
fbestall=zhi;
bestall=locat(index,:);
fmin=zeros(1,generationmax);
f=zeros(generationmax,lzsize);
%% 
for generation=1:generationmax
    
    alpha=(1-0.5)*(generationmax-generation)/generationmax+0.5;
    X=[bestself fbestself'];
    [Y1,I]=sortrows(X,-lzsize);
    bestself1=Y1(:,1:end-1);
     mbest=((a)*bestself1)./popsize;
    for i=1:popsize
        fl=rand(2,lzsize);
        pq=fl(1,:).*bestself(i,:)+(1-fl(1,:)).*bestall;  
        b=alpha*abs(mbest-locat(i,:));
        v=log(rand(1,lzsize));
        locat(i,:)=pq+((-1).^ceil(0.5+rand(1,lzsize))).*b.*v;   
        zx=locat(i,:)-(locatbounds(:,2)'+locatbounds(:,1)')/2;            
        zx=sign(zx).*min(abs(zx),(locatbounds(:,2)'+locatbounds(:,1)')/2);
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
    f(generation,:)=bestall;
    generation
end
[f,d,SEAIQRD,pararout]=fitnessn(bestall,data);
x1=SEAIQRD(end,:)';
SEAIQRD1=Pre(pararout,x1);



