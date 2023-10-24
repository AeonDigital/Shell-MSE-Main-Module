# Synopsis

Splits the passed string into an array using the indicated separator.



&nbsp;

# Parameters

## array arrayName

- aka       : -a --arrayName
- hint      :  
  Name of the array that will be populated with the processing result.
    

&nbsp;


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
  declare -a arrSplit=()
  mse_str_split "arrSplit" "-" "2022-12-22"
  echo "${arrSplit[0]}"
  2022
  echo "${arrSplit[1]}"
  12
```


&nbsp;

# Returns array

The result will be defined in the indicated array.