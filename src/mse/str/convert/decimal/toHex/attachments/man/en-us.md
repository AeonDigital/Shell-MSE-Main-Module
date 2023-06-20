# Synopsis

Converts a `decimal` to its respective `hex`.



&nbsp;

# Parameters

## charDecimal value

- aka       : -v --value
- hint      :  
  Value that will be converted.



&nbsp;

# Examples

``` shell
  mse_str_convert_decimal_toHex "195 173" 
  C3 AD
```



&nbsp;

# Returns charHex

`Hex` representation of the reported `decimal`.
Multibyte values will return more than one value, each representing one of its 
bytes.