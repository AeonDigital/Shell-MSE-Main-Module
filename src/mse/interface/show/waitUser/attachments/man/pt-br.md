# Synopsis

Mostra uma mensagem para o usuário e interrompe a execução do script até que 
ele digite uma tecla qualquer.



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

Configure o tipo da mensagem a ser mostrada para o usuário.


&nbsp;

## string titleString

- aka       : --titleString
- hint      :  
  Título da mensagem.

Se `""`, usará o título padrão conforme o `type` de mensagem, ou, deixará a
linha do título vazia em caso de tipo de mensagem `none`.



&nbsp;

# Returns string

Printa na tela a mensagem indicada e aguarda que o usuário precione qualquer 
tecla para prosseguir.