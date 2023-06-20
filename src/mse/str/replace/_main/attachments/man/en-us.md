# Synopsis

Replaces every occurrence of the old substring with the new substring in the 
original string.



&nbsp;

# Parameters

## string old

- aka       : -o --old
- hint      :  
  Old string (which will be replaced).

&nbsp;


## string new

- aka       : -n --new
- hint      :  
  New string (which will be added in place of the old one).

&nbsp;


## string string

- aka       : -s --string
- hint      :  
  Original string.

&nbsp;



# Example

``` shell
  mse_str_replace "22" "20" "2022-12-22"
  2020-12-20
```


&nbsp;

# Returns string

Prints the result of the performed substitution.