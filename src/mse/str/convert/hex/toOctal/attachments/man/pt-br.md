# Synopsis

Converte um `hex` para seu respectivo `octal`.



&nbsp;

# Parameters

## charHex value

- aka       : -v --value
- hint      :  
  Valor que será convertido.



&nbsp;

# Examples

``` shell
  mse_str_convert_hex_toOctal "C3 AD" 
  303 255
```



&nbsp;

# Returns charOctal

Representação `octal` do `hex` informado.
Valores multibyte retornarão mais de um valor, cada qual representando um de 
seus bytes.