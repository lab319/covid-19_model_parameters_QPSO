
data=preset(data); 
N=data.N;
x=data.intiad;
%% 
para.popsize=200;
para.Generationnmax=100;
para.pcrossover=0.6;
para.pmutation=0.2;
para.timelimit=50; 
para.sel=2;
para.pcr=[1 0.3
    2 0.4
    3 0.3];
para.pmtseq=[1 0.2
    2 0.4
    3 0.1];
para.pmtnum=[1 2.2
    2 0.3
    3 0.5];
para.step=[0.3 0.6
    0.6 0.3
    0.4 0.2];
%%
Encode.degree=1;
Encode.style=1;
Encode.dnum=data.lzsize;
Encode.bounds{1}=[0;1]*ones(1,data.lzsize); 
%% 
fsolver.fitness=@fitnessn;
fsolver.minmax=-1;
%%
[result,paintd]=GAsolver(para,Encode,fsolver,data);
ParSwarm=result.ParSwarm;
[SEAIQRD,pararout]= Simulateb(ParSwarm,x,N,data);
x1=SEAIQRD(end,:)';
SEAIQRD1=Pre(pararout,x1);
