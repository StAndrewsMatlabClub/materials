%% linspace examples

%1
Y1 = linspace(1,100); %creates a vector linearly spaced numbers between 1 
%and 100. This vector has the default 100 values as n was not specified.

%2
Y2 = linspace(1, 100, 1000); %creates a 1000-value vector of linearly spaced 
%numbers between 1 and 100.

%% logspace examples

%1
Y3 = logspace(2,3); %creates a 50-value (default n = 50) vector of 
%logarithmically spaced numbers between 10^2 and 10^3 

%2
Y4 = logspace(2,3,200); %creates a 200-value vector of logarithmically 
%spaced numbers between 10^2 and 10^3

%3
Y5 = logspace(-2,pi); %creates a 50-value vector of logarithmically spaced 
%numbers between 10^-2 and pi.

%% accumarray examples

%1
ExSubs = [1; 2; 4; 7; 3; 3; 1]; %our vector of example subscripts to examine

A = accumarray(ExSubs,1); %should give an answer of [ 2; 1; 2; 1; 0; 0; 1] 
%because there are two 1's in subs, one 2, two 3's etc.

%2 
%An example of how you could use accumarray for calculating percentage
%correct values rather than using histc or histcounts. 

correctVals = [0; 0; 1; 1; 0; 1; 0; 1; 1; 1; 0; 1; 0; 1; 1; 0; 1; 1; 0; 1]; 
%Unfortunately, accumarray will only work if the subs vector only contains 
%positive integers, so it will not work with zeros.

adjustedVals = correctVals + 1; %This problem can be got around easily by 
%adding one to every value in the subs vector, so that you are then 
%comparing 1s and 2s rather than 0s and 1s.

correctTotals = accumarray(adjustedVals,1); %finding the number of incorrect 
%and correct responses using accumarray

percentageCorrect = correctTotals(2)/ length(adjustedVals); %finding the 
%percentage correct value from the number of correct values found with accumarray

%% cat examples

%our vectors to concatenate
vector1 = [2 2 2 2];
vector2 = [4 4 4 4]; 
vector3 = [6 6 6 6];

%1
c1 = cat(1, vector1, vector2); %concatenating along the first dimension, 
%so c1 will be a matrix of vector1 above vector2.

%2
c2 = cat(2, vector1, vector2, vector3); %concatenating in 2D, so c2 will be
%a matrix of vector1-vector2-vector3 from left to right.

%3
c3 = cat(3, vector1, vector2); %3D concatenation of the two vectors. 
%Vector1 will be in front of vector2.


%% horzcat examples
%similar to cat(2, a, b)

%more example vectors
vector4 = [8 8 8 8; 10 10 10 10];
vector5 = [12 12 12 12; 14 14 14 14];

%1 
hc1 = horzcat(vector1, vector2, vector3); %concatenates these three vectors 
%horizontally into one 1x12 double.
hc2 = horzcat(vector4, vector5); %makes a 2x8 double by putting vector 5 
%next to vector 4. The rows that were originally on the top of their 
%respective vectors still on the top row of this new matrix. 

%This does NOT work if the vectors you are trying to concatenate have 
%different numbers of rows.


%% vertcat examples
% similar to cat(1, a,b)

%1
vc1 = vertcat(vector1, vector2, vector3); %concatenates these three vectors 
%vertically into one 3x4 double with vector 1 as the top row, vector2 as
%the middle and vector3 as the bottom.

vc2 = vertcat(vector4, vector5); %an example where you have more rows in 
%each vector being concatenated.

%This does NOT work if the vectors you are trying to concatenate have 
%different numbers of columns.
