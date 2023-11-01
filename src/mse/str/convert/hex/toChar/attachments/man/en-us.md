# Synopsis

Converts a `hex` to its respective `char`.



&nbsp;

# Parameters

## charHex value

- aka       : -v --value
- hint      :  
  Value that will be converted.



&nbsp;

# Examples

``` shell
  mse_str_convert_hex_toChar "C3 AD" 
  í
```



&nbsp;

# Returns char

`Char` representation of the reported `hex`.
Multibyte values will return more than one value, each representing one of its 
bytes.



&nbsp;

## Dependencies

- printf