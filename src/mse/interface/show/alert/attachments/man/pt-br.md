# Synopsis

Mostra uma mensagem de alerta para o usuário usando o tema que está atualmente 
configurado na variável "MSE_GLOBAL_THEME_NAME".



&nbsp;

# Parameters

## string type

- aka       : --type
- default   : n
- options   : 
  - n   : none
  - i   : info
  - a   : attention
  - w   : warning
  - e   : error
  - f   : fail
  - s   : success
- hint      :  
  Tipo de mensagem.


&nbsp;

## string titleString

- aka       : --titleString
- hint      :  
  Título da mensagem.


&nbsp;

## array bodyLines

- aka       : --bodyLines
- hint      :  
  Nome do array que trás as linhas de dados a serem apresentadas.



&nbsp;

# Returns string

Printa na tela a mensagem indicada conforme configuração passada.