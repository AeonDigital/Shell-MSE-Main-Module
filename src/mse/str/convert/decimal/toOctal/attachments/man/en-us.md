# Synopsis

Converts a `decimal` to its respective `octal`.



&nbsp;

# Parameters

## charDecimal value

- aka       : -v --value
- hint      :  
  Value that will be converted.



&nbsp;

# Examples

``` shell
  mse_str_convert_decimal_toOctal "195 173" 
  303 255
```



&nbsp;

# Returns charOctal

`Octal` representation of the reported `decimal`.
Multibyte values will return more than one value, each representing one of its 
bytes.



&nbsp;

## Dependencies

- printf