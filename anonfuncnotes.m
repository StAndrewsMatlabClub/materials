%Creating a simple anonymous function

func = @(x) (x+2);
func(5)

%Anonymous functions can make use of existing functions
func = @(x) num2str(x+2);
func(10)

%Anonymous functions that refer to variables need to be updated when the
%variables change value.

n=20;
func = @(x) num2str(x+n);
n=5;
func(4)

func = @(x) num2str(x+n);
func(4)

%Anonymous functions can output a new function
func = @(x) (@(y)(y+x));
func2 = func(5);
func2(10)

%Using cellfun
%Let's say you have a cell array containing numerical arrays...

cella = cell(1,4);

for i = 1:4
cella(i) = {datasample(1:7*i,7,'Replace',false)};
end
open cella

%...and you want to sort the numerical arrays in each cell
cellasorted = cellfun(@sort,cella,'UniformOutput',false);
%This does the same thing:
cellasorted = cellfun(@(x)sort(x), cella,'UniformOutput',false);

open cellasorted

%You can also check the size of the array in each cell, and return the sizes in A:
A = cellfun('size', cella, 1) %Note that there are two inputs here, because 'size' needs to be told which dimension to check the size of
A = cellfun('size', cella, 2)

%cellfun also takes anonymous functions, applying them to each cell
%separately (so, x represents each cell, individually). Here, the contents
%of each cell will be multiplied by 2, and output as A.

A = cellfun(@(x)(x*2), cella,'UniformOutput',false)

%Functions returned by an anonymous function can also be returned into a new array (B), and in this case, the
%x in each new function refers to the array in the corresponding cell in cella
B = cellfun(@(x)(@(y)(x>y)), cella,'UniformOutput',false)

B{1}(4) %This compares 4 to each of the items in cella(1), as per the function in B(1)...

%...while this applies the function in B(1) to each cell of cella
%separately, returning the results in a new cell array. Remember that each
%cell in cella is being compared to cella (1), because the x in B(1)
%represents cella(1).
C = cellfun(B{1}, cella,'UniformOutput', false);