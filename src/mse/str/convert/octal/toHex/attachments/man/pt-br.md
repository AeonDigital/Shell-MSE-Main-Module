# Synopsis

Converte um `octal` para seu respectivo `hex`.



&nbsp;

# Parameters

## charOctal value

- aka       : -v --value
- hint      :  
  Valor que será convertido.



&nbsp;

# Examples

``` shell
  mse_str_convert_octal_toHex "303 255" 
  C3 AD
```



&nbsp;

# Returns charHex

Representação `hex` do `octal` informado.
Valores multibyte retornarão mais de um valor, cada qual representando um de 
seus bytes.