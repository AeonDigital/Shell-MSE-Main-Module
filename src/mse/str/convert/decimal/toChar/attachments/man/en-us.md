# Synopsis

Converts a `decimal` to its respective `char`.



&nbsp;

# Parameters

## charDecimal value

- aka       : -v --value
- hint      :  
  Value that will be converted.



&nbsp;

# Examples

``` shell
  mse_str_convert_decimal_toChar "195 173" 
  í
```



&nbsp;

# Returns char

`Char` representation of the reported `decimal`.
Multibyte values will return more than one value, each representing one of its 
bytes.