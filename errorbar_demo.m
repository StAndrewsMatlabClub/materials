% errorbar demo

%% if you have symmetrical error bars
%an example of using errorbar when you have symmetrical error bars
% day = [1:1:30];
% chocolateEaten = [50 20 0 0 100 35 15 75 250 0 5 75 45 95 60 5 55 25 30 ...
%     100 5 200 90 0 10 60 30 40 20 50]; %the number of grams of chocolate 
% %eaten by a chocoholic (me) every day for a month
% 
% sem = std(chocolateEaten)/sqrt(length(chocolateEaten)); %calculating the 
% %standard error of the mean for chocolateEaten. Matlab still doesn't have 
% %a function for directly calculating the standard error, so we need to work
% %out the standard deviation and divide by the square root of the sample
% %number to find the sem.
% 
% semrepmat = repmat(sem,1,length(chocolateEaten)); %making a repeat matrix 
% %of of the standard error to plot with each data point. I don't know if
% %this is necessarily what you should do but for the sake of this example
% 
% figure(1)
% errorbar(day, chocolateEaten, semrepmat, '-xk'); %day, chocolateEaten and 
% %semrepmat all need to be the same size or this won't work.
% 
% axis([0 max(day) 0 max(chocolateEaten)]);
% set(gca, 'Xtick', 0:2:max(day));
% set(gca, 'Ytick', 0:25:max(chocolateEaten));
% set(gca,'FontSize',16);
% xlabel('Day');
% ylabel('Chocolate eaten (g)');
% title('Chocolate eaten every day with SEM');

%% if you have non-symmetrical error bars

%an example more closely based on the kind of data you would get with a
%psychophysics experiment where the answer can be correct or incorrect.

%In this example because you can only have correct or incorrect as your
%answers, the data has a binomial distribution, so you would need to do a 
%binomial fit on the data. 

%With this data, we'll be plotting the confidence intervals of the data 
%points rather than the standard deviation or error. This type of data has 
%non-symmetrical confidence intervals bars.
conditions = [1:1:10];
correctTrials = [25 26 27 36 43 49 50 50 50 50];
totalTrials = repmat(50,1,10);
correctTrialsPercentage = correctTrials./totalTrials;

[phat, pci] = binofit(correctTrials, totalTrials); %we're really interested
%in pci for the error bars as the values in this matrix are the confidence 
%interval for each condition's data. phat is the probability estimate.

lowerCIs = pci(:,1); %column one of pci contains the lower confidence interval values for each condition
upperCIs = pci(:,2); %similarly column 2 contains the upper confidence intervals for each condition

%The value given by the CI values is where the bar of the error
%bar should be, but if you plot this directly it adds that value onto the 
%value of the point, rather than plotting the error bar to end in that position. 
%As a result, for the confidence intervals to appear correctly we need to 
%find the size of the error bars to plot.
lowerErrorbars = correctTrialsPercentage - lowerCIs'; %size of the lower error bars
upperErrorbars = upperCIs' - correctTrialsPercentage; %size of the upper error bars

figure(2)
errorbar(conditions, correctTrialsPercentage, lowerErrorbars, upperErrorbars, '-xk');

axis([min(conditions) max(conditions) 0 max(correctTrialsPercentage)]);
set(gca, 'Xtick', min(conditions):1:max(conditions));
set(gca, 'Ytick', 0:0.1:1);
set(gca,'FontSize',16);
xlabel('Condition');
ylabel('Percentage correct (%)');
title('Percentage correct values with confidence intervals');

