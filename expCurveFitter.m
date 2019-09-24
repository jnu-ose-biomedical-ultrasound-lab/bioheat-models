function [mseBase,fittedModel,heatModel,coolModel]=expCurveFitter(x,heatRate,maxTerm)
% expCurveFilter.m
% by John LaRocco
% JNU Ocean Systems Engineering
% Biomedical Ultrasound Lab
% 24 Sept 2019
% Function: Function fits an exponential heating and cooling curves to an
% an input vector. 

% Inputs:
% x: Temperature vector (1D matrix/vector)
% heatRate: number of datapoints for heating period (positive, complete integer)
% maxTerm: Max temperature (single value), not necessarily value in vector

% Outputs:
% heatModel: Model of heating (1D matrix/vector)
% coolModel: Model of cooling (1D matrix/vector)
% fittedModel: Model of both heating and cooling (1D matrix/vector)
% mseBase: mean squared error (MSE) of model fitted to inputs (positive, complete integer)

%heaterLine=exp(linspace(min(x(1:heatRate)),maxTerm,length(1:heatRate)));
heaterLine=exp((1:heatRate));
heatModel=maxTerm*heaterLine/max(heaterLine);

coolBase=length(x)-length(heatModel);
cooler=exp((1:coolBase));
coolModel=maxTerm-(maxTerm*(cooler./max(cooler)));

fittedModel=[heatModel coolModel];
mseBase = immse(fittedModel, x);


end
