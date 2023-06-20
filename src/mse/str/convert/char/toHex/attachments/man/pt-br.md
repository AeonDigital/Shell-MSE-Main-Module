# Synopsis

Converte um `char` para seu respectivo `hex`.



&nbsp;

# Parameters

## char value

- aka       : -v --value
- hint      :  
  Valor que será convertido.



&nbsp;

# Examples

``` shell
  mse_str_convert_char_toHex "í" 
  C3 AD
```



&nbsp;

# Returns charHex

Representação `hex` do `char` informado.
Valores multibyte retornarão mais de um valor, cada qual representando um de 
seus bytes.