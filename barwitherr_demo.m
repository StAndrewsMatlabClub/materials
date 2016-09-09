%barwitherr demo -- this is a user-created function available on matlab
%file exchange that will allow you to draw bar charts with error bars on
%them. 

%You can find it here: https://uk.mathworks.com/matlabcentral/fileexchange/30639-barwitherr-errors-varargin-

%Most common usage is probably: barwitherr(errors, x, y)

%do an example where 10 people are asked to pick a number between 1-10 on 4
%different days and compare the means and standard error for each day. 

%day 1
y1 = [2 2 3 4 7 3 5 1 6 4]; %numbers picked on day 1

meany1 = mean(y1); %the mean of the numbers picked on day 1
semy1 = std(y1)/sqrt(length(y1)); % the standard error of the mean of the numbers picked on day 1

%day 2
y2 = [3 3 1 8 6 5 3 2 4 9];

meany2 = mean(y2);
semy2 = std(y2)/sqrt(length(y2));

%day 3
y3 = [1 1 1 4 2 1 3 5 3 2];

meany3 = mean(y3);
semy3 = std(y3)/sqrt(length(y3));

%day 4
y4 = [7 5 6 3 2 8 9 10 6 4];

meany4 = mean(y4);
semy4 = std(y4)/sqrt(length(y4));


errors = [semy1 semy2 semy3 semy4]; %all of the errors we have calculated for each day to plot
y = [meany1 meany2 meany3 meany4]; %all of the means that we have calculated for the different days to plot
x = 1:1:4; %the different days

figure(1)
barwitherr(errors, x, y, 'r'); %the usage as above but also to specify the 
%colour of the bars as red so it's slightly easier to see the error bars

axis([0 5 0 10]);
set(gca, 'Xtick', 1:1:4);
set(gca, 'Ytick', 1:1:10);
set(gca,'FontSize',16);
xlabel('Day');
ylabel('Mean number picked');
title('The mean of the numbers picked on different days');