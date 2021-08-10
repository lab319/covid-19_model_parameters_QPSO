# covid-19_model_parameters_QPSO
This folder contains MATLAB and data files needed to simulate the dynamics of COVID-19 in China.
# Citation
Baoshan Ma*,Jishuang Qi,Yiming Wu,Pengcheng Wang, Di Li,Shuxin Lin*.Parameters Estimation of the COVID-19 Transmission Model using an Improved Quantum-Behaved Particles Swarm Optimization Algorithm.(under review).
# The data of the program
The data used in this research are collected from the statistics released by the Chinese authorities available: http://www.nhc.gov.cn/xcs/yqtb/list_gzbd.shtml
Data is contained in China.mat(1st column: infected; 2nd column: recovered; 3rd column: dead)

# The describe of the program

1)the SEAIQRD model:It contains two files:Simulatea.m and Simulateb.m. Simulatea.m:SEAIQRD model parameter estimation by the improved QPSO algorithm. Simulateb.m:the fitting result by the SEAIQRD model.

2)the proposed method:This is our main analyses, which contains multiple files.

3)other methods: We compared the performance of our method with several other parameters estimation methods.


