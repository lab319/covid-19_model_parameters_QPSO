function [y,SEAIQRD,pararout]=fitnessn(ParSwarm,data)
N=data.N;
x=data.intiad;
t=1:data.step:data.maxday;
[SEAIQRD,pararout]= Simulatea(ParSwarm,data.step,x,N,t,data);

y=sum(sum(abs(data.China(1:data.maxday,[1 2 3 ])-SEAIQRD(:,[5 8 7 ])))./sum(abs(data.China(1:data.maxday,[1 2 3 ]))));


end

