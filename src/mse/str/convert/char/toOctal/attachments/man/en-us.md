# Synopsis

Converts a `char` to its respective `octal`.



&nbsp;

# Parameters

## char value

- aka       : -v --value
- hint      :  
  Value that will be converted.



&nbsp;

# Examples

``` shell
  mse_str_convert_char_toOctal "í" 
  303 255
```



&nbsp;

# Returns charOctal

`Octal` representation of the reported `char`.
Multibyte values will return more than one value, each representing one of its 
bytes.



&nbsp;

## Dependencies

- printf