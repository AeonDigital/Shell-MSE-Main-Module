# Synopsis

Eliminates any existing white space immediately AFTER the indicated substring.



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


# Example

``` shell
  mse_str_trim_substring_left "," "Keep calm   ,   and..."
  Keep calm   ,and...
```


&nbsp;

# Returns string

Prints the altered string.