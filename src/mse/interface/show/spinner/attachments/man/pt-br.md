# Synopsis

Ativa um spinner que visa dar ao usuário a percepção de que um processo está 
em andamento. 

Esta função ativa a configuração `+m` do bash que faz com que todos os 
processos rodem de forma desanexados.

Para interromper o spinner basta evocar novamente esta função; neste caso a 
configuração `+m` será desativada.



&nbsp;

# Parameters

## array spinnerPhases

- aka       : -sp --spinnerPhases
- default   : 
- hint      :  
  Nome do array contendo os caracteres usados para a `animação` do spinner.

Se omitido ou inválido, será usado o valor padrão definido em 
`MSE_SPINNER_DEFAULT`.

Opções prontas para uso são os modelos:
- MSE_SPINNER_COMEANDGO
- MSE_SPINNER_STICK_STAR.


## float interval

- aka       : -i --interval
- default   : 0.2
- hint      :
  Intervalo de tempo (em segundos) entre cada fase da `animação`.



&nbsp;

# Another informations

A construção deste spinner foi baseada nas orientações do seguinte tutorial:
- https://willcarh.art/blog/how-to-write-better-bash-spinners



&nbsp;

# Returns string

Printa na tela a barra de progresso conforme configuração passada.