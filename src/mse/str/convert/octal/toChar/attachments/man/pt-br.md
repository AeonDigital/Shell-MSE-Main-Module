# Synopsis

Converte um `octal` para seu respectivo `char`.



&nbsp;

# Parameters

## charOctal value

- aka       : -v --value
- hint      :  
  Valor que será convertido.



&nbsp;

# Examples

``` shell
  mse_str_convert_octal_toChar "303 255" 
  í
```



&nbsp;

# Returns char

Representação `char` do `octal` informado.
Valores multibyte retornarão mais de um valor, cada qual representando um de 
seus bytes.