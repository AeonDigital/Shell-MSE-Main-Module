# Synopsis

Eliminates any existing white space immediately BEFORE and AFTER the indicated 
substring.



&nbsp;

# Parameters

## string substring

- aka       : -ss --substring
- hint      :  
  Target substring.

&nbsp;


## string string

- aka       : -s --string
- hint      :  
  String that will be changed.

&nbsp;


## string position

- aka       : -pos --position
- default   : b
- options   :
  - b: both
  - l: left
  - r: right
- hint      :  
  Indicates when the change should be made only on one side of the target 
  substring.

&nbsp;



# Example

``` shell
  mse_str_trim_substring ":" "  Keep  calm   :   and   ... :   think  "
    Keep  calm:and   ...:think
```


&nbsp;

# Returns string

Prints the altered string.