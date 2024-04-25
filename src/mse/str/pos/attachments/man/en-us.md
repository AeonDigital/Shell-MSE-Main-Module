# Synopsis

Identifies the position of the first occurrence of a given character in a 
string.



&nbsp;

# Parameters

## string string

- aka       : -s --string
- hint      :  
  String where the search will be done.


&nbsp;

## char char

- aka       : -c --char
- hint      :  
  Character being searched for.

&nbsp;


# Example

``` shell
  mse_str_pos "text" "t"
  0

  mse_str_pos "text" "x"
  2

  mse_str_pos "text" "w"
  -1
```


&nbsp;

# Returns int

Returns the position at which the first target character was found within the 
string.
If not found, the value '-1' is returned.