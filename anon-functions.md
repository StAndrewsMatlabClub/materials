# Anonymous Functions #

## Preamble: function handles ##

It is possible to store a handle to a function in a variable, just as you can with any other data type, e.g., we could store a handle to an existing function:

        s = @sqrt;
        s(16); % => 4

In comp sci, these are called first-class functions, as they can be passed around as any other data type within the language, e.g., we can pass functions to functions to functions...

## Defining an anonymous function ##

        cubed = @(n) n.^3;
        cubed(3); % => 27
        cubed([1,2,3]); % => 1 8 27

* the @ must be followed by parenthesis even if the function has no parameters
* an anonymous function does not have to be assigned to an intermediate variable, it can be passed directly to a function

## Closures ##

The context in which an anonymous function is defined, is available to the function:

        p     = 3;
        cubed = @(n) n.^p;
        cubed(3); % => 27

If we change the value of p to, say, 2:

        p = 2;
        cubed(3); % => 27

It still gives the same result as before, as the cubed function is referencing the context in which it was defined, not the context in which it is being invoked. We can even wipe the variable, and we still get the same result:

        clear p; 
        cubed(3); % => 27

## Function composition ##

We can compose anonymous functions in terms of other functions:

        cubed   = @(n) n.^3;
        squared = @(n) n.^2;
        power6  = @(n) squared(cubed(n));
        power6(2); % => 64

## Function returning a function (currying) ##

We can define an anonymous function that returns another anonymous function, e.g. 

        add    = @(x) @(y) x + y;
        plus10 = add(10); 
        plus10(1); % => 11
        plus10(2); % => 12

## Limitations

* no conditional statements
* (apparently) very slow to run

--  Ken Munro 2016-07-13
