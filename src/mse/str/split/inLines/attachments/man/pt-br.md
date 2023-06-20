# Synopsis

Efetua um split na string passada em um array onde cada linha terá no máximo o 
número de caracteres informados.
As palavras identificadas serão mantidas sem serem separadas entre as linhas.



&nbsp;

# Parameters

## string string

- aka       : -s --string
- hint      :  
  String original.

&nbsp;


## int maxLineLength

- aka       : -m -maxLineLength
- hint      :  
  Número máximo de caracteres por linha.

Se não for definido, ou, se inválido, usará o valor atual da variável 
"$COLUMNS".

&nbsp;



# Returns array

O resultado será definido na variável "MSE_LAST_FUNCTION_RETURN".