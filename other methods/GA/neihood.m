function   [newpp,buf]=neihood(newpp,len_n,style1,style2,bounds,range)
%% 
if style1==0 || style1==1 
    if style2==1 
        buf=randperm(len_n,1);
    elseif style2==2
        buf=randperm(len_n,1);
    elseif style2==3
        ab=randperm(len_n,1);
        buf=randperm(len_n,ab);
    end
    newpp(buf)=newpp(buf)+(bounds(2,buf)-bounds(1,buf)).*rands(1,numel(buf)).*range;
    newpp(buf)=Ksave(newpp(buf),1,numel(buf),{bounds(:,buf)},style1);
elseif style1==2
    if style2==1 
        buf=randperm(len_n,2);
        newpp(buf(2:-1:1))=newpp(buf);
    elseif style2==2 
        buf=randperm(len_n,2);
        buf=sort(buf);
        newpp=[newpp(1:buf(1)-1),newpp(buf(2):-1:buf(1)),newpp(buf(2)+1:end)];
    else
        ab=randperm(len_n,1);
        buf=randperm(len_n,ab);
        buff=randperm(ab);
        newpp(buf)=newpp(buf(buff));
    end
end
