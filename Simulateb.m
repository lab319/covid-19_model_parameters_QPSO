function SEAIQRD = Simulateb(pararout,data)

N=data.N;
x=data.intiad;
t=1:data.step:data.maxday;
step=1;
SEAIQRD=zeros(size(t,2),9); %
SEAIQRD(1,:)=x';
n=1;

for i=1+step:step:data.maxday
    
    n=n+1;
    
    changeall=[(-pararout(i-1,4)*x(3)-pararout(i-1,5)*x(4))/N*x(1);
        (pararout(i-1,4)*x(3)+pararout(i-1,5)*x(4))/N*x(1)-1/pararout(i-1,3)*x(2);
        pararout(i-1,2)*x(2)/pararout(i-1,3)-pararout(i-1,8)*x(3)-pararout(i-1,1)*x(3);
        (1-pararout(i-1,2))*x(2)/pararout(i-1,3)-(pararout(i-1,1)+pararout(i-1,9))*x(4);
        pararout(i-1,8)*x(3)+pararout(i-1,9)*x(4)-(pararout(i-1,6)+pararout(i-1,7))*x(5);
        pararout(i-1,1)*x(3)+pararout(i-1,1)*x(4)+pararout(i-1,6)*x(5);
        pararout(i-1,7)*x(5);
        pararout(i-1,6)*x(5);
        pararout(i-1,8)*x(3)+pararout(i-1,9)*x(4)];
    x=x+changeall*step; 
 SEAIQRD(n,:)=x';
 
end
end

