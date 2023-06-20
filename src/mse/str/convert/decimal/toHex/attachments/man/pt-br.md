# Synopsis

Converte um `decimal` para seu respectivo `hex`.



&nbsp;

# Parameters

## charDecimal value

- aka       : -v --value
- hint      :  
  Valor que será convertido.



&nbsp;

# Examples

``` shell
  mse_str_convert_decimal_toHex "195 173" 
  C3 AD
```



&nbsp;

# Returns charHex

Representação `hex` do `decimal` informado.
Valores multibyte retornarão mais de um valor, cada qual representando um de 
seus bytes.