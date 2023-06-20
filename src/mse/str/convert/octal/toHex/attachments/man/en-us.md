# Synopsis

Converts a `octal` to its respective `hex`.



&nbsp;

# Parameters

## charOctal value

- aka       : -v --value
- hint      :  
  Value that will be converted.



&nbsp;

# Examples

``` shell
  mse_str_convert_octal_toHex "303 255" 
  C3 AD
```



&nbsp;

# Returns charHex

`Hex` representation of the reported `octal`.
Multibyte values will return more than one value, each representing one of its 
bytes.