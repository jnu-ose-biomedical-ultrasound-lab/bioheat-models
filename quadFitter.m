function [mseBase,xnewer,ynewer,ynew]=quadFitter(x,y,resampleRate,pIn)
% quadFilter.m
% by John LaRocco
% JNU Ocean Systems Engineering
% Biomedical Ultrasound Lab
% 18 Sept 2019
% Function: Filter takes inputs and outputs (x and y), fits a polynominal
% (pIn), resamples the input vectors (ynewer,xnewer) and outputs error of the
% fitted model (mseBase). 

% Inputs:
% x: Input variable (1D matrix/vector)
% y: Output variable (1D matrix/vector)
% resampleRate: length of output data (positive, complete integer)
% pIn: order of model to fit (positive, complete integer)

% Outputs:
% xnewer: Resampled input (1D matrix/vector)
% ynewer: Resampled outputs of fitted model (1D matrix/vector)
% ynew: Initial outputs of fitted model (1D matrix/vector)
% mseBase: mean squared error (MSE) of model fitted to initial vectors (positive, complete integer)


p = polyfit(x,y,pIn);
ynew = polyval(p,x);
mseBase = immse(y, ynew);
xnewer=linspace(x(1),x(end),resampleRate);
ynewer = polyval(p,xnewer);


end
