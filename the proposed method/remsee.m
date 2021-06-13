function [rmse,rmspe,nrmse] = rmsee(X,Y)

rmse = sqrt(mean((Y - X).^2));
rmspe= sqrt(mean(sum(abs((Y - X)/(abs(X))).^2)));
nrmse=rmse/(max(X)-min(X));
