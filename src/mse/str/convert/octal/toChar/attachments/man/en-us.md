# Synopsis

Converts a `octal` to its respective `char`.



&nbsp;

# Parameters

## charOctal value

- aka       : -v --value
- hint      :  
  Value that will be converted.



&nbsp;

# Examples

``` shell
  mse_str_convert_octal_toChar "303 255" 
  í
```



&nbsp;

# Returns char

`Char` representation of the reported `octal`.
Multibyte values will return more than one value, each representing one of its 
bytes.