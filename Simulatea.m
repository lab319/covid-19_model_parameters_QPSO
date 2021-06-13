function [SEAIQRD,pararout]= Simulatea(ParSwarm,step,x,N,t,data)
SEAIQRD=zeros(size(t,2),9); 
SEAIQRD(1,:)=x';
pararout=zeros(size(t,2)-1,9);
mn=3*ceil(data.maxday/data.gap);
n=1;
for i=1+step:step:data.maxday
    k=ceil(i/data.gap);
    crdenow=ParSwarm((k-1)*3+1:k*3);
    crdenow=data.crde(:,1)'+crdenow.*(data.crde(:,2)'-data.crde(:,1)');
    n=n+1;
    buf=find((data.timert(:,2)'-i)>=0);
    buf=buf(1);
    limita=data.abdfgk(:,(buf-1)*2+1:buf*2);
    
    abdfgk=ParSwarm(mn+(k-1)*6+1:mn+k*6);
    abdfgk=limita(:,1)'+abdfgk.*(limita(:,2)'-limita(:,1)');
    changeall=[(-abdfgk(1)*x(3)-abdfgk(2)*x(4))/N*x(1);
        (abdfgk(1)*x(3)+abdfgk(2)*x(4))/N*x(1)-1/crdenow(3)*x(2);
        crdenow(2)*x(2)/crdenow(3)-abdfgk(5)*x(3)-crdenow(1)*x(3);
        (1-crdenow(2))*x(2)/crdenow(3)-(crdenow(1)+abdfgk(6))*x(4);
        abdfgk(5)*x(3)+abdfgk(6)*x(4)-(abdfgk(3)+abdfgk(4))*x(5);
        crdenow(1)*x(3)+crdenow(1)*x(4)+abdfgk(3)*x(5);
        abdfgk(4)*x(5);
        abdfgk(3)*x(5);
        abdfgk(5)*x(3)+abdfgk(6)*x(4)];
    x=x+changeall*step; 
 SEAIQRD(n,:)=x';
 pararout(i-1,1:3)=crdenow;
 pararout(i-1,4:9)=abdfgk;
end
