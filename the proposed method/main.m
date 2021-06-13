
%% 
clc 
clear
close all 
run datain.m

popsize=200;
generationmax=1000;

lzsize=ceil(data.maxday/data.gap)*9;
locatbounds=zeros(lzsize,2);
for i=1:lzsize
    locatbounds(i,:)=[0,1];
end

locat=zeros(popsize,lzsize);

sj=rand(1,lzsize);
locat(1,:)=sj.*(locatbounds(:,2)'-locatbounds(:,1)')+locatbounds(:,1)';
for i=2:popsize
    sj=4*(1-sj).*sj;
    locat(i,:)=sj.*(locatbounds(:,2)'-locatbounds(:,1)')+locatbounds(:,1)';
end
fitvalue=zeros(1,popsize);
for i=1:popsize
    [fitvalue(i),~]=fitnessn(locat(i,:),data);
end
[zhi,index]=min(fitvalue);
[zhi_low,index_low]=max(fitvalue);
fbestself=fitvalue;
bestself=locat;
fbestall=zhi;
bestall=locat(index,:);
fmin=zeros(1,generationmax);
f=zeros(generationmax,lzsize);

for generation=1:generationmax
  
    mbest=((1./fbestself.*mean(fbestself))*bestself)./popsize;
  
    for i=1:popsize
      
        alpha=(1-0.5)*(generationmax-generation)/generationmax+0.5;
        fl=rand(2,lzsize);
        pq=fl(1,:).*bestself(i,:)+(1-fl(1,:)).*bestall;  
        b=alpha.*abs(mbest-locat(i,:));
        v=log(rand(1,lzsize));
        locat(i,:)=pq+((-1).^ceil(0.5+rand(1,lzsize))).*b.*v;   
        zx=locat(i,:)-(locatbounds(:,2)'+locatbounds(:,1)')/2;             
        zx=sign(zx).*min(abs(zx),(locatbounds(:,2)'-locatbounds(:,1)')/2);
        locat(i,:)=zx+(locatbounds(:,2)'+locatbounds(:,1)')/2;
       
        [fitvalue(i),~]=fitnessn(locat(i,:),data);
    
          if rand<exp(1*(fbestall-mean(fitvalue))/generation)
              az=randperm(lzsize,1);
              newlocat=locat(i,:);
              newlocat(1,:)=rand*(locatbounds(az(1),2)-locatbounds(az(1),1))+locatbounds(az(1),1);
              %newlocat(2,:)=rand*(locatbounds(az(2),2)-locatbounds(az(2),1))+locatbounds(az(1),1);
              [newf1,~]=fitnessn(newlocat(1,:),data);
              %[newf2,~]=fitnessn(newlocat(2,:),data);
              if newf1<fitvalue(i)
                  locat(i,:)=newlocat(1,:);
                 fitvalue(i)=newf1;
              end
             %if newf2<fitvalue(i)
                  %locat(i,:)=newlocat(2,:);
                  %fitvalue(i)=newf2;
              %end
          end
      %end
   end
   
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
[f,~,pararout]=fitnessn(bestall,data);
SEAIQRD=Simulateb(pararout,data);
x1=SEAIQRD(end,:)';
SEAIQRD1=Pre(pararout,x1);

figure(1)
hand1=plot(fmin,'k'); 
set(hand1,'color','k','linestyle','-','linewidth',1,'marker','*','markersize',2)
xlabel('generation','fontsize',12);ylabel('fitnessn','fontsize',12);
legend('Fitness');
set(gcf,'color','w')
box off;hold off;
Y=data.China(1:data.endday,:);
T=1:data.endday;
t=1:data.step:data.maxday;
t1=data.maxday+1:data.step:data.endday;
figure(2)
subplot(1,3,1)
stem(T,Y(1:data.endday,2))
hold on
plot(t,SEAIQRD(:,8)','r')
hold on 
plot(t1,(SEAIQRD1(:,8)'),'b')
legend('Observed','Fitted','predicted')
title('Recovered')
ylabel('cases')
set(gca,'xtick',[1,11,25,40,54,60,80],'xticklabel',{'Jan 22 2020','Feb 1 2020','Feb 15 2020','Mar 1 2020 ','Mar 15 2020','Mar 21 2020','Apr 10 2020 '});
subplot(1,3,2)
stem(T,Y(1:data.endday,3))
hold on
plot(t,SEAIQRD(:,7)','r')
hold on
plot(t1,(SEAIQRD1(:,7)'),'b')
title('Dead')
ylabel('cases')
set(gca,'xtick',[1,11,25,40,54,60,80],'xticklabel',{'Jan 22 2020','Feb 1 2020','Feb 15 2020','Mar 1 2020 ','Mar 15 2020','Mar 21 2020','Apr 10 2020 '});
subplot(1,3,3)
stem(T,Y(1:data.endday,1))
hold on
plot(t,(SEAIQRD(:,5)'),'r')
hold on
plot(t1,(SEAIQRD1(:,5)'),'b')
title('Active Infected')
ylabel('cases')
set(gca,'xtick',[1,11,25,40,54,60,80],'xticklabel',{'Jan 22 2020','Feb 1 2020','Feb 15 2020','Mar 1 2020 ','Mar 15 2020','Mar 21 2020','Apr 10 2020 '});

%%
y_dat=(Y(1:60,[1,2,3]));y_dat=y_dat(:);
x_dat=(SEAIQRD(:,[5,8,7]));x_dat=x_dat(:);
y_dat1=(Y(61:end,[1,2,3]));y_dat1=y_dat1(:);
x_dat1=(SEAIQRD1(:,[5,8,7]));x_dat1=x_dat1(:);

[rmse,rmspe,nrmse]=rmsee(y_dat,x_dat);

[MAE_total,MAPE_total,SMAPE_total]=MAE(y_dat,x_dat);


[rmse_pre,rmspe_pre,nrmse_pre]=rmsee(y_dat1,x_dat1);

[MAE_pre,MAPE_pre,SMAPE_pre]=MAE(y_dat1,x_dat1);

total=[MAE_total;MAE_pre;MAPE_total;MAPE_pre;SMAPE_total;SMAPE_pre;rmse;rmse_pre;rmspe;rmspe_pre;nrmse;nrmse_pre];
