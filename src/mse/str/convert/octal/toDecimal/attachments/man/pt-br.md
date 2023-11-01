# Synopsis

Converte um `octal` para seu respectivo `decimal`.



&nbsp;

# Parameters

## charOctal value

- aka       : -v --value
- hint      :  
  Valor que será convertido.



&nbsp;

# Examples

``` shell
  mse_str_convert_octal_toDecimal "303 255" 
  195 173
```



&nbsp;

# Returns charDecimal

Representação `decimal` do `octal` informado.
Valores multibyte retornarão mais de um valor, cada qual representando um de 
seus bytes.



&nbsp;

## Dependencies

- printf