crde=[0.08 0.13
    0.08   0.2
    5.2 5.2];
timert=[1 11
    12 26 
    27 60];
abdfgk=[0.1	2 0.1 0.5 0.1 0.5 0.1 0.3 0.1 0.2 0.01 0.15 
0.1 2 0.1 0.5 0.1 0.5 0.1 0.3 0.1 0.2 0.01 0.15 
0.01	0.5	0.01	0.5	0.01	0.3 0.01	0.5	0.01	0.5	0.01 0.5 	
0.001	0.1	0.001	0.1	0.001	0.01 0.001	0.1	0.001	0.1	0.001 0.1		
0.01	0.2	0.01	0.2	0.01	0.2 0.01	0.2	0.01	0.2	0.01	0.2  
0.01	0.2	0.01	0.2	 0.01	0.2 0.01	0.2 0.01	0.2 0.01	0.2  ];
N=1392730000;

intiad=[1392728652;500;200;100;503;28;17;17;548];
maxday=60;
endday=80;
step=1;
load China.mat
data.crde=crde;
data.timert=timert;
data.abdfgk=abdfgk;
data.N=N;
data.China=x3;
data.maxday=maxday;
data.endday=endday;
data.intiad=intiad;
data.step=step;
data.gap=10;
clear  crde  timert abdfgk N x3 maxday  intiad step
