%% Special characters cheat sheet

%% Square brackets ([])
% Used to form:
vectHorz1 = [2 4 93 5];            % Horizontal Vectors
vectHorz2 = [3, 7, 61, 20];        % Horizontal Vectors
vectVert = [6; 4; 93; 4*2];        % Vertical Vectors
matrix1 = [1 5 3; 4 2 1; 39 4 1];  % Matrices (equal dimension assignment)
% Helpful for delete functions
emptyMatrix = [];
% Assign function output to multiple variables
[R, P] = corrcoef(vectHorz1, vectHorz2);

%% Curly braces ({})
% Used to form
cellArray1 = {1, 2, 3; 'a', 'b', 'c'};  % Cell arrays
cellArray2= {{magic(3)}, 1, 'fish'};    % Nesting levels preserved
cellArray2{3} = 'blue fish';            % Address content of cell arrays
cellArray2{1}{1} = 7;                   % Address nested cells

%% Parentheses ()
% Indicate mathematical precedence:
value1 = 2*1+3;
value2 = 2*(1+3);
% Enclose function arguments
exist('cellArray1', 'var');
% Index into/retrieve from matrices/vectors
var1 = rand(13);
var1(1) = 2;

%% Equals (=)
var2 = var1+40;         % Assignment statements
var1 = var1(var1 == 2);  % Relational equals operator

%% Apostrophe (')
vectHorz1Trans = vectHorz1'; % Matrix transposition
string1 = 'data';            % Indicate strings
string2 = '''data''';        % Use double quotations to produce ' string

%% Decimal point (.)
% As standard decimal point
decimalNums = [2/5, 0.4, .4e1];                % Decimal numbers
% Field access/construction
exampleStruct.field1 = var2;                   % Standard
exampleStruct.(sprintf('field%d', var1)) = 60; % Dynamic access/construction
var3 = (1  + decimalNums...
    /7 - value1 + value2);                     % continuation 

% Double .. indicates parent folder

%% Comma (,)
vectHorz3 = [6, 32, 6, 20];       % Seperate matrix subscripts
sizeVar = size(var3, 2);          % Seperate function arguments

%% Semicolon (;)
vectVert2 = [6; 4; 93; 4*2];       % Inside brackets to make verticals
value3 = 1+3;                      % End rows/supress output from command

%% Colon (:)
vectHorz4 = 1:2:250; % Make vectors
% This can be used for loop iterations:
loopVar = 0;
for loop = 1:2:250
    loopVar = loopVar + loop;
end

%% Percent (%)
% Indicates a comment (double for start of new section)
% Help for a  function/script matlab uses first continguous comment lines

%% Exclamation point (!)
%Issue a command to the operating system (shell escape)
!dir &

%% At (@)
% function handle
zerosHandle = @zeros;
var4 = zerosHandle(value1);


