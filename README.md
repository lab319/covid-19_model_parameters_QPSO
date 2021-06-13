# covid-19_model_parameters_QPSO
This folder contains MATLAB and data files needed to simulate the dynamics of COVID-19 in China.
# The data of the program
The data used in this research are collected from the statistics released by the Chinese authorities available: http://www.nhc.gov.cn/xcs/yqtb/list_gzbd.shtml
Data is contained in China.mat(1st column: infected; 2nd column: recovered; 3rd column: dead)

# The describe of the program

1)the SEAIQRD model:It contains two files:Simulatea.m and Simulateb.m. Simulatea.m:SEAIQRD model parameter estimation by the improved QPSO algorithm. Simulateb.m:the fitting result by the SEAIQRD model.

2)the proposed method:we proposed an improved quantum behavior particle swarm optimization algorithm to effectively estimate the model parameters. First, we developed a novel approach to update the weight of the mean best position to improve the global search capacity. Second, we constructed a probability function for generating new particles in the later iteration to increase particle diversity.


