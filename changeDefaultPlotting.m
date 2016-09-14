
%Change matlab default plotting options for better publication quality plots

%First make lines larger
set(0,'DefaultLineLineWidth',3)

%I like white backgrounds
set(0,'DefaultFigureColor','w')

%Make fonts BIGGER
set(0,'DefaultAxesFontSize',24)
set(0,'DefaultTextFontSize',24)

%This is a setting that makes ALL plots come black, and 
%myCol is a matrix that sets up a list of RGB colors that will be used by
%matlab for making figures
myCol = [0 0 0; 0 0 0];
%Now override the default matlab color list
set(0,'DefaultAxesColorOrder',myCol)

%Instead of changing color, make lines alternate between solid ('-') and
%dotted (':')
set(0,'DefaultAxesLineStyleOrder',{'-',':'})