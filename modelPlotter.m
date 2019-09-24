function [mseBase,fittedModel,heatModel,coolModel]=modelPlotter(x,heatRate,maxTerm)
% linePlotter.m
% by John LaRocco
% JNU Ocean Systems Engineering
% Biomedical Ultrasound Lab
% 24 Sept 2019
% Function: Matches models to data, plots them, and outputs error.

% Inputs:
% x: Temperature vector (1D matrix/vector)
% heatRate: number of datapoints for heating period (positive, complete integer)
% maxTerm: Max temperature (single value), not necessarily value in vector

% Outputs:
% heatModel: Model of heating (1D matrix/vector)
% coolModel: Model of cooling (1D matrix/vector)
% fittedModel: Model of both heating and cooling (1D matrix/vector)
% mseBase: mean squared error (MSE) of model fitted to inputs (positive, complete integer)

[mseBase,fittedModel,heatModel,coolModel]=expCurveFitter(x,heatRate,maxTerm);
 

figure
plot(x,'o')
xlabel('Time')
ylabel('Temp (C)')
hold on
plot(fittedModel)
hold off



end
