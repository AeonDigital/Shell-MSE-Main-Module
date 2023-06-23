# Synopsis

Converts a `char` to its respective `decimal`.



&nbsp;

# Parameters

## char value

- aka       : -v --value
- hint      :  
  Value that will be converted.



&nbsp;

# Examples

``` shell
  mse_str_convert_char_toDecimal "í" 
  195 173
```



&nbsp;

# Returns charDecimal

`Decimal` representation of the reported `char`.
Multibyte values will return more than one value, each representing one of its 
bytes.