# Synopsis

Converts a `hex` to its respective `octal`.



&nbsp;

# Parameters

## charHex value

- aka       : -v --value
- hint      :  
  Value that will be converted.



&nbsp;

# Examples

``` shell
  mse_str_convert_hex_toOctal "C3 AD" 
  303 255
```



&nbsp;

# Returns charOctal

`Octal` representation of the reported `hex`.
Multibyte values will return more than one value, each representing one of its 
bytes.