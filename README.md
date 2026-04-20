# covid-19_model_parameters_QPSO
This folder contains MATLAB and data files needed to simulate the dynamics of COVID-19 in China.
# Citation

Baoshan Ma*,Jishuang Qi,Yiming Wu,Pengcheng Wang, Di Li,Shuxin Lin*. Parameter estimation of the COVID-19 transmission model using an improved quantum-behaved particle swarm optimization algorithm[J]. Digital signal processing, 2022, 127: 103577.https://doi.org/10.1016/j.dsp.2022.103577
# The data of the program
The data used in this research are collected from the statistics released by the Chinese authorities available: http://www.nhc.gov.cn/xcs/yqtb/list_gzbd.shtml
Data is contained in China.mat(1st column: infected; 2nd column: recovered; 3rd column: dead)

# The describe of the program

1)the SEAIQRD model:It contains two files:Simulatea.m and Simulateb.m. Simulatea.m:SEAIQRD model parameter estimation by the improved QPSO algorithm. Simulateb.m:the fitting result by the SEAIQRD model.

2)the proposed method:This is our main analyses, which contains multiple files.

3)other methods: We compared the performance of our method with several other parameters estimation methods.


