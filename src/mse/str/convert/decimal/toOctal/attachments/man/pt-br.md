# Synopsis

Converte um `decimal` para seu respectivo `octal`.



&nbsp;

# Parameters

## charDecimal value

- aka       : -v --value
- hint      :  
  Valor que será convertido.



&nbsp;

# Examples

``` shell
  mse_str_convert_decimal_toOctal "195 173" 
  303 255
```



&nbsp;

# Returns charOctal

Representação `octal` do `decimal` informado.
Valores multibyte retornarão mais de um valor, cada qual representando um de 
seus bytes.



&nbsp;

## Dependencies

- printf