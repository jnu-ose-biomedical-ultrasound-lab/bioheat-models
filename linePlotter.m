function [bestP,mse]=linePlotter(x,y,resampleRate,pRange)
% linePlotter.m
% by John LaRocco
% JNU Ocean Systems Engineering
% Biomedical Ultrasound Lab
% 19 Sept 2019
% Function: Matches models to data, plots them, and finds one with lowest
% error.

% Inputs:
% x: Input variable (1D matrix/vector)
% y: Output variable (1D matrix/vector)
% resampleRate: length of output data (positive, complete integer)
% pRange: Specific orders of polynomial to fit (1D matrix/vector)

% Outputs:
% mse: mean squared error (MSE) for each order (1D matrix/vector)
% bestP: model order corresponding to lowest error 

mse=zeros(1,length(pRange));
for i=1:length(pRange)
p=pRange(i);
    
    %[mseBase,xnewer,ynewer,ynew]=quadFitter(timeRange,tempRange,150,2);
[mseBase,xnewer,ynewer,~]=quadFitter(x,y,resampleRate,p);
mse(i)=mseBase;
figure
plot(x,y,'o')
xlabel('Time (sec)')
ylabel('Temp (C)')
hold on
plot(xnewer,ynewer)
hold off
end

bestP=pRange(find(mse == min(mse)));


end
