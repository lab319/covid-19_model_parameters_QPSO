
%% 
lzsize=ceil(data.maxday/data.gap)*9;
locatbounds=zeros(lzsize,2);

for i=1:lzsize
    locatbounds(i,:)=[0,1];
end
N=data.N;
x=data.intiad;
t=1:data.step:data.maxday;
sj=ones(1,lzsize);
locat=sj.*(locatbounds(:,2)'-locatbounds(:,1)')+locatbounds(:,1)';
xdata = t;
ydata=data.China(1:data.maxday,[1 2 3]);            
 
 options=optimoptions(@lsqcurvefit,'StepTolerance',1e-16);
 options.MaxIterations=1000;
[x2,resnorm,residual,exitflag,output] = lsqcurvefit(@(x1,xdata)Simulatea(x1,x,N,t,data),...
    locat,xdata,ydata,locatbounds(:,1)',locatbounds(:,2)',options);
[SEAIQRD,pararout]= Simulateb(x2,x,N,t,data);
x1=SEAIQRD(end,:)';
SEAIQRD1=Pre(pararout,x1);
