# Synopsis

Splits the passed string into an array using the indicated separator.



&nbsp;

# Parameters

## string separator

- aka       : -sep --separator
- hint      :  
  Separator.

&nbsp;


## string string

- aka       : -s --string
- hint      :  
  Original string (which will be splited).

&nbsp;


## bool removeEmpty

- aka       : -r --removeEmpty
- default   : 0
- hint      :  
  Indicates when empty values should be kept in the resulting array.

&nbsp;


## bool trim

- aka       : -t --trim
- hint      :  
  indicates when to perform a `trim` on each of the values found.

&nbsp;



# Example

``` shell
  mse_str_split "-" "2022-12-22"
  echo "${MSE_LAST_FUNCTION_RETURN[0]}"
  2022
  echo "${MSE_LAST_FUNCTION_RETURN[1]}"
  12
```


&nbsp;

# Returns array

The result will be defined in the variable `MSE_LAST_FUNCTION_RETURN`.