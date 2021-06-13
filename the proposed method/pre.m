function SEAIQRD1=Pre(pararout,x1)
n=1;N=1392730000;

SEAIQRD1=zeros(20,9);
SEAIQRD1(1,:)=x1';

for i=2:20
    n=n+1;
changeall=[(-pararout(end,4)*x1(3)-pararout(end,5)*x1(4))/N*x1(1);
        (pararout(end,4)*x1(3)+pararout(end,5)*x1(4))/N*x1(1)-1/pararout(end,3)*x1(2);
        pararout(end,2)*x1(2)/pararout(end,3)-pararout(end,8)*x1(3)-pararout(end,1)*x1(3);
        (1-pararout(end,2))*x1(2)/pararout(end,3)-(pararout(end,1)+pararout(end,9))*x1(4);
        pararout(end,8)*x1(3)+pararout(end,9)*x1(4)-(pararout(end,6)+pararout(end,7))*x1(5);
        pararout(end,1)*x1(3)+pararout(end,1)*x1(4)+pararout(end,6)*x1(5);
        pararout(end,7)*x1(5);
        pararout(end,6)*x1(5);
        pararout(end,8)*x1(3)+pararout(end,9)*x1(4)];
     x1=x1+changeall*1; 
     SEAIQRD1(n,:)=x1';
end
end
