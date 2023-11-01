# Synopsis

Converts a `hex` to its respective `decimal`.



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
  195 173
```



&nbsp;

# Returns charDecimal

`Decimal` representation of the reported `hex`.
Multibyte values will return more than one value, each representing one of its 
bytes.



&nbsp;

## Dependencies

- printf