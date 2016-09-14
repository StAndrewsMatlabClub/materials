
%Change matlab default plotting options for better publication quality plots

%First make lines larger
set(groot,'DefaultLineLineWidth',3)

%I like white backgrounds
set(groot,'DefaultFigureColor','w')

%Make fonts BIGGER
set(groot,'DefaultAxesFontSize',24)
set(groot,'DefaultTextFontSize',24)

%This is a setting that makes ALL plots come black, and 
%myCol is a matrix that sets up a list of RGB colors that will be used by
%matlab for making figures
myCol = [0 0 0; 0 0 0];
%Now override the default matlab color list
set(groot,'DefaultAxesColorOrder',myCol)

%Instead of changing color, make lines alternate between solid ('-') and
%dotted (':')
set(groot,'DefaultAxesLineStyleOrder',{'-',':'})