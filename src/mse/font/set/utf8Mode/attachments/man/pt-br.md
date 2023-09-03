# Synopsis

Identifica/Ativa/Desativa o modo UTF-8 do terminal `bash`.



&nbsp;

# Parameters

## string action

- aka       : -a --action
- default   : check
- options   : 
  - check : c
  - on    : 1
  - off   : 0
- hint      :  
  Ação a ser feita.

Se for omitido, ou, se `check` irá tentar desenhar na tela o caracter unicode 
"cavalo branco" do xadres `♘`.
A conferência deve ser feita visualmente pelo operador humano.

Indicando `on` ou `off` irá respectivamente ativar ou desativar o UTF-8 do seu 
terminal.



&nbsp;

# Returns string

Em qualquer caso de uso irá tentar printar o caracter unicode "cavalo branco" 
do xadres `♘` para conferencia visual do usuário sobre o estado atual desta configuração.