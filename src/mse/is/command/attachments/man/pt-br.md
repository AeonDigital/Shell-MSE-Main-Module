# Synopsis

A partir de um comando que executa um programa, identifica se o mesmo está 
disponível para uso.



&nbsp;

# Parameters

## string value

- aka       : -v --value
- hint      :  
  Comando que será usado para testar a disponibilidade do programa.

É recomendado o uso de algum comando com um argumento de baixo impacto como os 
típicos `-v` ou `--version`.



&nbsp;

# Returns bool

`1` se `true` ou `0` se `false`.