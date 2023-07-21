# Synopsis

Mostra uma barra de progresso no terminal.



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

## string format

- aka       : --format
- hint      :  
  Estilo do formato de apresentação da barra de progresso (conforme disponível 
  pelo tema).

Cada tema pode fornecer vários formatos de barra, se for o caso, neste 
parametro deve ser indicado qual deve ser usado. De outra forma o formato 
padrão será utilizado.


&nbsp;

## int barMaxCharLength

- aka       : --barMaxCharLength
- hint      :  
  Tamanho total da barra de progresso (em caracteres).

O tema usado pode modificar este valor conforme as próprias regras.


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

## char infoAlign

- aka       : --infoAlign
- default   : r
- options   :
  - r: right
  - l: left
- hint      :  
  Posicionamento da área informativa em relação à barra de progresso.


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