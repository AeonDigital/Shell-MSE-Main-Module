# Synopsis

Converte um `char` para seu respectivo `decimal`.



&nbsp;

# Parameters

## char value

- aka       : -v --value
- hint      :  
  Valor que será convertido.



&nbsp;

# Examples

``` shell
  mse_str_convert_char_toDecimal "í" 
  195 173
```



&nbsp;

# Returns charDecimal

Representação `decimal` do `char` informado.
Valores multibyte retornarão mais de um valor, cada qual representando um de 
seus bytes.