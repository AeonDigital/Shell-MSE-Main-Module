# Synopsis

Converte um `char` para seu respectivo `octal`.



&nbsp;

# Parameters

## char value

- aka       : -v --value
- hint      :  
  Valor que será convertido.



&nbsp;

# Examples

``` shell
  mse_str_convert_char_toOctal "í" 
  303 255
```



&nbsp;

# Returns charOctal

Representação `octal` do `char` informado.
Valores multibyte retornarão mais de um valor, cada qual representando um de 
seus bytes.



&nbsp;

## Dependencies

- printf