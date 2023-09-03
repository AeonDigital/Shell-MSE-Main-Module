# Synopsis

Mostra uma mensagem de status para o usuário usando o tema que está atualmente 
configurado na variável `MSE_MESSAGE_THEME_NAME`.



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

# Returns string

Printa na tela a mensagem indicada conforme configuração passada.