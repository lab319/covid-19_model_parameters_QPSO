# covid-19_model_parameters_QPSO
This folder contains MATLAB and data files needed to simulate the dynamics of COVID-19 in China.
# The data of the program
The data used in this research are collected from the statistics released by the Chinese authorities available: http://www.nhc.gov.cn/xcs/yqtb/list_gzbd.shtml
Datas are contained in China.mat(1st column: infected; 2nd column: recovered; 3rd column: dead)

# The describe of the program

1)main.m:The main file of the program, click Run.It contains code to improve the algorithm

2)Simulatea.m:Its function is to identify the SEAIQRD model parameters

3)Simulateb.m:Output the fitted results of the model

4)rmsee.m and mae.m:The evaluation index
