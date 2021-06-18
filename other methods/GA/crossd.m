function   newpp=crossd(newpp,len_n,style1,style2)

if style2==1 
    a=randperm(len_n,1);
    selet=1:a;
elseif style2==2 
    a=randperm(len_n,2);
    selet=min(a):max(a);
elseif style2==3 
    a=randperm(len_n,1);
    b=randperm(len_n,a);
    selet=b;
end
if style1<=1 
    buf=newpp(1,selet);
    newpp(1,selet)=newpp(2,selet);
    newpp(2,selet)=buf;
elseif style1==2 
    lent=numel(selet);
    indexnew=zeros(1,lent);
    bufy=1:len_n;
    for z=1:lent
        bufe=find(newpp(2,bufy)==newpp(1,selet(z)));
        indexnew(z)=bufy(bufe(1));
        bufy(bufy==indexnew(z))=[];
    end
    indexnew=sort(indexnew);
    bufu=newpp(1,selet); 
    newpp(1,selet)=newpp(2,indexnew);
    newpp(2,indexnew)=bufu;
end
