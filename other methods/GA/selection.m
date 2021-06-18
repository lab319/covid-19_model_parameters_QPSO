function [fnownew,populationnew]=selection(fnow,population,parasel,numin,numout)
%% 
seln=zeros(1,numout);
if parasel==1 
    f_z=fnow-min(fnow)+1;
    f_z=f_z./sum(f_z);
    cumsump=cumsum(f_z);
    for i=1:numout
        r=rand;
        prand=cumsump-r;
        j=find(prand>=0);
        seln(i)=j(1);
    end 
elseif parasel==2 
    for i=1:numout
        r=randperm(numin,2);
        [~,j]=max(fnow(r));
        seln(i)=r(j);
    end 
elseif parasel==3 
    for i=1:numout
        r=randperm(numin,4);
        [~,j]=max(fnow(r));
        seln(i)=r(j);
    end 
end
    fnownew=fnow(seln);
    populationnew=population(seln,:);
end
