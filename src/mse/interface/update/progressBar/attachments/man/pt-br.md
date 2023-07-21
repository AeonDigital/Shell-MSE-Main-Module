# Synopsis

Atualiza a barra de progresso na linha do prompt (iniciada pelo comando 
"mse_interface_show_progressBar".



&nbsp;

# Parameters

## assoc arrayConfig

- aka       : -a --arrayConfig
- hint      :  
  Nome do array associativo contendo as configurações da barra de progresso.

Se omitido ou inválido, será iniciado o array associativo 
"MSE_PROGRESSBAR_THEME_CONFIG" usando o tema padrão e este será usado para a 
formatação da mensagem.


&nbsp;

## int barAtualProgress

- aka       : --barAtualProgress
- default   : 0
- min       : 0
- max       : 100
- hint      :  
  Percentual atual de andamento do progresso (de 0 à 100).

Valores inválidos serão revertidos para "0".


&nbsp;

## string infoData

- aka       : --infoData
- hint      :  
  Informação que deve ser usada para preencher a área informativa.

["info_data"]
Se o percentual de avanço for aparecer também, esta informação aparecerá após o 
mesmo.



&nbsp;

# Returns string

Printa na tela a barra de progresso conforme configuração passada.