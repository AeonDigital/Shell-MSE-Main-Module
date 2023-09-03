# Synopsis

Prepara um array associativo preenchendo as chaves necessárias para executar um 
comando `mse_file_read`.



&nbsp;

# Description

A leitura de um arquivo permite filtrar e transformar as partes desejadas de 
acordo com as configurações definidas.

Existem quatro conjuntos de configurações que podem ser usados, abaixo está a 
descrição de cada uma e quais configurações fazem parte de cada conjunto.
A descrição de cada configuração pode ser vista nas informações sobre os 
parâmetros utilizados para esta função.


&nbsp;

## Parte 01: Controle em nível de bloco

Permite identificar quais partes do documento devem ser devolvidas ou a partir 
de onde deve ser ignorado.  
Chaves definidas nesta parte:

- block_start_check
- block_start_check_args
- block_start_check_args_sep
- block_start_get_first_line
- block_end_check
- block_end_check_args
- block_end_check_args_sep
- block_end_get_last_line
- block_check_invert


&nbsp;

## Parte 02: Controle em nível de linha

Permite que você passe regras que farão a validação linha por linha para 
identificar as que devem ser apresentadas.  
Chaves definidas nesta parte:

- line_check
- line_check_args
- line_check_args_sep
- line_check_invert
- line_check_has_linenumber


&nbsp;

## Parte 03: Controles de transformação

Configura transformações a serem aplicadas às linhas que serão retornadas.  
Chaves definidas nesta parte:

- line_transform
- line_transform_args
- line_transform_args_sep
- line_transform_has_linenumber


&nbsp;

## Parte 04: Outras configurações
  
Uso geral para configurações que não necessariamente se enquadram em nenhuma 
das opções acima.  
Chaves definidas nesta parte:

- line_hide_empty
- line_show_number



&nbsp;

## FUNÇÕES DE VALIDAÇÃO E TRANSFORMAÇÃO 

Ao ler um arquivo, você pode identificar as áreas dele que devem ser retornadas 
e também se alguma transformação deve ser feita nas linhas que serão 
apresentadas. Para cada uma dessas tarefas, você deve escrever uma função que 
informe o algoritmo o que fazer.

Para identificar os blocos a serem devolvidos, é necessário escrever uma função 
validadora.
Esta função tem como objetivo analisar o conteúdo das linhas do arquivo e 
testar se deve ou não ser tratado como o início de um bloco válido de texto.

Ambos os tipos de funções têm a mesma assinatura de parâmetro, mas diferem em 
retorno esperado. As funções do validador retornam um booleano e as 
transformadoras uma string.


### INTERFACE

```
  # Parameters
  ## assoc arrayName
  Nome do array associativo que traz as configurações de leitura atualmente em 
  uso.

  ## int lineNumber
  Número da linha.

  ## string lineContent
  Conteúdo da linha.

  ## bool isRaw
  Use `0` para informar que as linhas que estão sendo processadas estão no 
  formato "bruto" (tal qual como no arquivo original).
  Use `1` para informar que há, no conteúdo de cada linha, a informação 
  de seu respectivo número dentro do arquivo de destino.

  ## string args
  Argumentos opcionais.


  # Returns bool|string
  `bool` para **funções validadoras**
  `1` se o teste for positivo e `0` se negativo.

  `string` para **funções transformadoras**
  Retorna a linha transformada.
```



&nbsp;

# Parameters

## assoc arrayName

- aka       : -a --arrayName
- hint      :  
  Nome do array associativo que será preenchido.


&nbsp;

## function blockStartCheck

- aka       : --blockStartCheck
- hint      :  
  Nome de uma função validadora para identificar o início da parte válida do 
  o arquivo.

["block_start_check"]
Indica o nome de uma função validadora que pode identificar o início de uma 
parte **válida** do arquivo, correspondente ao que você deseja retornar.

Manter esse valor vazio fará com que todo o conteúdo do arquivo seja 
considerado **retornável**.
Caso contrário, ao indicar uma função validadora fará com que todas as linhas 
sejam considerados **não retornáveis** até atingir uma linha cujo teste dê 
positivo.

Veja a seção **FUNÇÕES DE VALIDAÇÃO E TRANSFORMAÇÃO**.


&nbsp;

## string blockStartCheckArgs

- aka       : --blockStartCheckArgs
- hint      :  
  Define argumentos extras para a função definida em **blockStartCheck**.

["block_start_check_args"]
Permite que você passe algumas informações que serão utilizadas na função 
validadora como argumento extra.

Veja a seção **FUNÇÕES DE VALIDAÇÃO E TRANSFORMAÇÃO**.


&nbsp;

## string blockStartCheckArgsSep

- aka       : --blockStartCheckArgsSep
- hint      :  
  Separador de valor para os argumentos da função **blockStartCheck**.

["block_start_check_args_sep"]
Indica a string que deve ser usada para **dividir** a coleção de argumentos 
passados em **blockStartCheckArgs**.


&nbsp;

## bool blockStartGetFirstLine

- aka       : --blockStartGetFirstLine
- default   : 0
- hint      :  
  Indica se a primeira linha válida do bloco deve ser retornada.

["block_start_get_first_line"]
Por padrão, a linha chave que indica o início de um bloco válido não é 
retornada. Use esse parâmetro para alterar esse comportamento.





&nbsp;

## function blockEndCheck

- aka       : --blockEndCheck
- hint      :  
  Nome de uma função validadora para identificar o fim da parte válida do 
  o arquivo.

["block_end_check"]
Indica o nome de uma função validadora que pode identificar o fim de uma 
parte **válida** do arquivo.

Ao manter esse valor vazio, o arquivo será retornado da primeira linha válida 
até sua última.
Por outro lado, a definição de uma função validadora fará com que o retorno do 
conteúdo seja interrompido quando atingir a primeira linha que satisfaça o 
critério definido .

Veja a seção **FUNÇÕES DE VALIDAÇÃO E TRANSFORMAÇÃO**.


&nbsp;

## string blockEndCheckArgs

- aka       : --blockEndCheckArgs
- hint      :  
  Define argumentos extras para a função definida em **blockEndCheck**.

["block_end_check_args"]
Permite que você passe algumas informações que serão utilizadas na função 
validadora como argumento extra.

Veja a seção **FUNÇÕES DE VALIDAÇÃO E TRANSFORMAÇÃO**.


&nbsp;

## string blockEndCheckArgsSep

- aka       : --blockEndCheckArgsSep
- hint      :  
  Separador de valor para os argumentos da função **blockEndCheck**.

["block_end_check_args_sep"]
Indica a string que deve ser usada para **dividir** a coleção de argumentos 
passados em **blockEndCheckArgs**.


&nbsp;

## bool blockEndGetLastLine

- aka       : --blockEndGetLastLine
- default   : 0
- hint      :  
  Indica se a última linha válida do bloco deve ser retornada.

["block_end_get_last_line"]
Por padrão, a linha chave que indica o fim de um bloco válido não é 
retornada. Use esse parâmetro para alterar esse comportamento.





&nbsp;


## bool blockCheckInvert

- aka       : --blockCheckInvert
- default   : 0
- hint      :  
  Inverte o resultado das funções **blockStartCheck** e **blockEndCheck** .

["block_check_invert"]
indicar se o resultado das funções definidas em **blockStartCheck** e 
**blockEndCheck** deve ser invertido.





&nbsp;


## function lineCheck

- aka       : --lineCheck
- hint      :  
  Nome de uma função validadora que identifica linhas válidas.

["line_check"]
Indica o nome de uma função validadora que permite identificar se a linha que 
está sendo processada atualmente deve ser devolvida.

Manter esse valor vazio fará com que todas as linhas dentro de um bloco válido 
sejam retornáveis.
Pelo contrário, ao indicar uma função validadora fará com que todas as linhas 
sejam considerados **não retornáveis**, exceto aqueles que passarem no teste 
proposto.

Veja a seção **FUNÇÕES DE VALIDAÇÃO E TRANSFORMAÇÃO**.


&nbsp;

## string lineCheckArgs

- aka       : --lineCheckArgs
- hint      :  
  Define argumentos extras para a função definida em **lineCheck**.

["line_check_args"]
Permite que você passe algumas informações que serão utilizadas na função 
validadora como argumento extra.

Veja a seção **FUNÇÕES DE VALIDAÇÃO E TRANSFORMAÇÃO**.


&nbsp;

## string lineCheckArgsSep

- aka       : --lineCheckArgsSep
- hint      :  
  Separador de valor para os argumentos da função **lineCheck**.

["line_check_args_sep"]
Indica a string que deve ser usada para **dividir** a coleção de argumentos 
passados em **lineCheck**.



&nbsp;


## bool lineCheckInvert

- aka       : --lineCheckInvert
- default   : 0
- hint      :  
  Inverte o resultado da função **lineCheck**.

["line_check_invert"]
Indique se o resultado da função definida em **lineCheck** deve ser invertida.



&nbsp;


## bool lineCheckHasLineNumber

- aka       : --lineCheckHasLineNumber
- default   : 0
- hint      :  
  Indica quando as informações de número de linha estão presentes no conteúdo 
  da linha.

["line_check_has_linenumber"]
Indica quando as informações de número de linha estão presentes no conteúdo da 
linha.





&nbsp;

## function lineTransform

- aka       : --lineTransform
- hint      :  
  Nome da função transformadora que será utilizada nas linhas válidas.

["line_transform"]
Indica o nome de uma função que promoverá uma transformação na linha alvo, 
permitindo que ela seja apresentada de forma diferente de como está atualmente 
cadastrada no arquivo.

Nenhuma alteração será feita no arquivo em si.

Veja a seção **FUNÇÕES DE VALIDAÇÃO E TRANSFORMAÇÃO**.


&nbsp;

## string lineTransformArgs

- aka       : --lineTransformArgs
- hint      :  
  Define argumentos extras para a função definida em **lineTransform**.

["line_transform_args"]
Permite que você passe algumas informações que serão utilizadas na função 
transformadora como argumento extra.

Veja a seção **FUNÇÕES DE VALIDAÇÃO E TRANSFORMAÇÃO**.


&nbsp;

## string lineTransformArgsSep

- aka       : --lineTransformArgsSep
- hint      :  
  Separador de valor para os argumentos da função **lineTransform**.

["line_transform_args_sep"]
Indica a string que deve ser usada para **dividir** a coleção de argumentos 
passados em **lineTransform**.



&nbsp;


## bool lineTransformHasLineNumber

- aka       : --lineTransformHasLineNumber
- default   : 0
- hint      :  
  Indica quando as informações de número de linha estão presentes no conteúdo 
  da linha.

["line_transform_has_linenumber"]
Indica quando as informações de número de linha estão presentes no conteúdo 
  da linha.





&nbsp;

## bool lineHideEmpty

- aka       : --lineHideEmpty
- default   : 0
- hint      :  
  Indicar se as linhas vazias devem ser removidas.

["line_hide_empty"]
Indicar se as linhas vazias devem ser removidas.



&nbsp;

## bool lineShowNumber

- aka       : --lineShowNumber
- default   : 0
- hint      :  
  Indicar se deseja exibir o número de cada linha.

["line_show_number"]
Indicar se deseja exibir o número de cada linha.



&nbsp;

# Returns void