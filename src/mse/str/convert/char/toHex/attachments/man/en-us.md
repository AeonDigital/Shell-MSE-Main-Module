# Synopsis

Converts a `char` to its respective `hex`.



&nbsp;

# Parameters

## char value

- aka       : -v --value
- hint      :  
  Value that will be converted.



&nbsp;

# Examples

``` shell
  mse_str_convert_char_toHex "í" 
  C3 AD
```



&nbsp;

# Returns charHex

`Hex` representation of the reported `char`.
Multibyte values will return more than one value, each representing one of its 
bytes.