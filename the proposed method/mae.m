function [MAE,MAPE,SMAPE]=MAE(X,Y)
oldbuf=double(X);
newbuf=double(Y);
[w,h]=size(oldbuf);
TotalPixel = w*h;
%MAE = sum(abs(X - Y))/TotalPixel;
MAE = mean(abs(X - Y));
MAPE = mean(sum(abs((X - Y))/sum(abs(X))));
SMAPE=mean(sum((abs(X-Y))/sum(0.5*(X+Y))));
