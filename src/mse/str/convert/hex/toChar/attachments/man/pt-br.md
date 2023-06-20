# Synopsis

Converte um `hex` para seu respectivo `char`.



&nbsp;

# Parameters

## charHex value

- aka       : -v --value
- hint      :  
  Valor que será convertido.



&nbsp;

# Examples

``` shell
  mse_str_convert_hex_toChar "C3 AD" 
  í
```



&nbsp;

# Returns char

Representação `char` do `hex` informado.
Valores multibyte retornarão mais de um valor, cada qual representando um de 
seus bytes.