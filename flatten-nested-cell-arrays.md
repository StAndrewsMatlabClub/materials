# Flatten (Nested) Cell Arrays

[Flatten (nested) cell array](http://blogs.mathworks.com/pick/2016/05/13/flatten-nested-cell-arrays/)

## Very simple example of cellflat usage ##

```
c = {'cell', {'nested1', {'nested2', {'nested3'}}}}

cellflat(c) # => 'cell'    'nested1'    'nested2'    'nested3'

cellflat(c, 2) # => 'cell'    'nested1'    'nested2'    {1x1 cell}

cellflat(c, 1) # => 'cell'    'nested1'    {1x2 cell}

```

The (much more) complicated example in the article makes use of regular expressions. 

## Regular Expressions ##

Used to parse text when basic text functions (e.g., strfind) fall short or involve too much extra coding. For example, let's suppose we have a file of integers, with each line looking something like:
```
line = 100, 23, 43, 1001, 24
```
We can certainly parse this using standard string functions, but it will get tedious fairly quickly. In order to parse with a regular expression, we first define a regular expression and use it with Matlab's regexp function:
```
re = '\d+'
regexp(line, re, 'match') # => '100'    '23'    '43'    '1001'    '24'
```
So what does '\d+' do? \d matches against a single digit, and + looks for one or more of the match. In this way \d+ can match 1 or 1234567.

Let's extend the example slightly and put in some real numbers:
```
line = '100, 23.50, 43.1, 1001, 24.3'
regexp(line, re, 'match') # => '100' '23' '50' '43' '1' '1001' '24''3'
```
Unfortunately it is treating the reals as two different numbers. We can fix this by extending our regular expression (regex to its friends) to check for an optional '.' character. We'll start with a first crude attempt using the '|' or operator:
```
re = '\d+|\d+\.\d+'
regexp(line, re, 'match') # => '100' '23' '50' '43' '1' '1001' '24''3'
```
This still gives the same result. Why? The expression is being matched against the first part of the regex, and ignores the rest of it. If we reverse the order we should be able to match reals:
```
re = '\d+\.\d+|\d+'
regexp(line, re, 'match') # => '100'    '23.50'    '43.1'    '1001'    '24.3'
```
And this works. We can further refine this via an optional group, ()?:
```
re = '\d+(\.\d+)?'
regexp(line, re, 'match') # => '100'    '23.50'    '43.1'    '1001'    '24.3'
```


### Notes ###

* Alpha-numeric characters, match literally, e.g., a regex of 'test' will simply match 'test'.
* '.' is used to match any character in an regex, which means that we have to escape it with a '\\.'. There are quite a few other special characters used in regular expressions which also need to be escaped.

[Further Matlab details](http://uk.mathworks.com/help/matlab/matlab_prog/regular-expressions.html#f0-42884)
