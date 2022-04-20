# Definição das regras de validação para parametros

Todas as regras de conferencia de parametros para funções devem ser
adicionadas em um array associativo onde, cada chave deve ser nomeada
como 'param_N' (onde N é o número do índice de cada argumento no array
especial '$@'.

Em cada chave as regras de validação devem ser dispostas na ordem indicada
abaixo. Alguns campos de definição de parametros variam conforme o tipo
de valor esperado para o mesmo.
Em cada chave, cada grupo de informação deve ser separado por um par de
dois pontos '::'

Campos que podem receber diferentes tipos de valores, e que, portanto,
possuem diferentes formas de validação deverão ser 'desdobrados' conforme
é indicado mais abaixo.

&nbsp;
&nbsp;

## CHAVE ESPECIAL 'count'

Esta chave é obrigatoria e sempre deve existir para que a validação dos
campos funcione adequadamente.
Indique nela a totalidade de argumentos que podem ser recebidos ao todo.
Ex:
declare -A checkParams
checkParams["count"]="4"

&nbsp;
&nbsp;

## CHAVES COMUNS

Para qualquer caso são esperados ao menos 3 especificações de validação
para cada argumento passado. Se deseja que algum parametro não seja validado
entre outros que serão basta deixar o valor de sua respectiva chave vazia.
Tais especificações são:  

- Nome
- Obrigatorio
- Tipo

&nbsp;

### 1. NOME

Informe o nome do campo para que, em caso de erro, a mensagem de erro saia
com um aspecto mais facilmente entendível por humanos.

&nbsp;

### 2. OBRIGATÓRIO OU OPCIONAL

Indica se o campo é ou não obrigatório.
Use os seguintes valores:  

  - optional | opt | o | 0  
  Informa que o parametro é opcional, ou seja pode ser ignorado ao evocar
  a função.
  - required | req | r | 1  
  Informa que o campo é obrigatorio, mesmo que seu valor seja vazio ele
  deve existir.

&nbsp;

### 3. TIPO DE VALOR

Indica o tipo de informação que é aceitável para este campo.

  `string`  
  Aceitará como válido qualquer string definida.
  Pela natureza do Bash significa dizer que qualquer valor especificado
  será aceito.

  `char`
  Aceita como válido um único caracter (UTF-8 safe).

  `charDecimal`
  Aceita como válido uma representação usando valores 'decimais' como 
  representação de um único caracter (UTF-8 safe).

  `charHex`
  Aceita como válido uma representação usando valores 'hex' como 
  representação de um único caracter (UTF-8 safe).

  `charOctal`
  Aceita como válido uma representação usando valores 'octais' como 
  representação de um único caracter (UTF-8 safe).

  `int`  
  Aceitará como válido qualquer valor que seja considerado uma representação
  de um numeral inteiro.

  `fileName`  
  Deve indicar o caminho para um arquivo.

  `dirName`  
  Deve indicar o caminho para um diretório.

  `functionName`  
  Deve indicar o nome de uma função existente na sessão.

  `arrayName`  
  Deve indicar o nome de um array unidimensional existente no contexto.

  `assocName`  
  Deve indicar o nome de um array associativo existente no contexto.

  `list`  
  Indica que há uma lista de opções válidas para o parametro.

  `validateFN`  
  Para casos em que é necessária uma validação mais complexa você pode
  usar uma função externa.
  Basta que a função implemente a interface de funções validadoras
  (seção abaixo) e ela será usada de forma transparente.

&nbsp;

### 4. VALOR PADRÃO | NOME DA FUNÇÃO VALIDADORA

Indica qual deve ser o valor padrão par este parametro se o mesmo for
omitido, ou se o valor indicado for uma string vazia.
Em alguns casos (mais abaixo) você vai querer 'pular' a especificação deste
campo mas como não pode deixá-lo vazio, use um caracter de ponto final para
simular que o mesmo está vazio.
Se, para qualquer finalidade, precisar usar um ponto final como valor padrão
(provavelmente de uma string), informe tal valor entre aspas simples.

Quando o tipo do valor for 'validateFN' este campo será obrigatório e
deverá trazer o nome de uma função que será usada para efetuar a validação
do respectivo campo.

&nbsp;

**EXEMPLOS DE DEFINIÇÕES SIMPLES DE PARAMETROS**  
checkParams["param_0"]="Nome  :: r :: string"  
checkParams["param_1"]="Idade :: r :: int"  
checkParams["param_2"]="Pais  :: r :: string  :: Brasil"  

&nbsp;
&nbsp;

-------------------------------------------------------------------------------

&nbsp;
&nbsp;

## ESPECIFICAÇÕES CONFORME O TIPO

Cada tipo de variável permite especificar outros atributos de validação
próprio. Abaixo estão as descrições extra para cada um.
Todos os atributos especificados abaixo são opcionais exceto se expressado
o contrário

&nbsp;


### STRING

**5. TAMANHO MÁXIMO DE CARACTERES**  
Especifique o tamanho máximo da string usando um valor inteiro maior ou
igual a 1.

&nbsp;


### INT

**5. VALOR MÍNIMO**  
Especifique o valor mínimo que o valor inteiro pode assumir.

**6. VALOR MÁXIMO**  
Especifique o valor máximo que o valor inteiro pode assumir.

&nbsp;


### FILENAME

**5. CRIAR SE NÃO EXISTIR**  
Por padrão, se o caminho apontar para um arquivo inexistente o teste falhará. 
  
  - create | yes | y | 1
  Para criar um novo arquivo no caminho indicado caso ele não exista.  
  - nocreate | no | n | 0
  Se omitido este será o comportamento normal.
  Neste caso a ausencia do arquivo alvo causará uma falha na validação.

&nbsp;


### DIRNAME

**5. CRIAR SE NÃO EXISTIR**  
Por padrão, se o caminho apontar para um diretório inexistente o teste

  - create | y | 1  
  Para criar um novo diretório no caminho indicado caso ele não exista.  
  - nocreate | n | 0
  Se omitido este será o comportamento normal.
  Neste caso a ausencia do diretório alvo causará uma falha na validação.

&nbsp;


### ARRAYNAME

**5. QUANTIDADE MÍNIMA DE ELEMENTOS**  
Especifique o valor mínimo de elementos esperados para o array ser
considerado como válido.

**6. QUANTIDADE MÁXIMA DE ELEMENTOS**  
Especifique o valor máximo de elementos esperados para o array ser
considerado como válido.

**VALIDAÇÃO DOS ELEMENTOS**  
Se você quiser, pode especificar uma chave extra informando como que os
valores do array devem ser validadas.
Para tal, use o seguinte modelo:

checkParams["param_5"]="UF :: r :: arrayName :: :: 1 :: 5"  
checkParams["param_5_element"]=" :: :: string :: :: 2"  

Note que na especificação acima usamos o sufixo '_element' para indicar
ao algoritmo que esta é a especificação dos elementos do array que está
especificado em 'param_5'.

&nbsp;


### ASSOCNAME

**5. CHAVES ESPERADAS**  
Especifique o nome de cada uma das chaves (separadas por vírgula) que podem
estar presentes no array associativo.  
Se você quiser, pode especificar regras de validação para cada uma destas
chaves conforme o modelo abaixo:

**VALIDAÇÃO DOS ELEMENTOS**  
checkParams["param_6"]="Funcionários :: r :: assocName :: :: Nome,Idade"  
checkParams["param_6_Nome"]="Nome :: r :: string :: :: 200"  
checkParams["param_6_Idade"]="Idade :: r :: int :: :: 0 :: 100"  

Note que para cada chave que desejamos validar deve existir uma nova entrada
em 'checkParams' usando o nome da chave como sufixo relacionado ao respectivo
campo.

&nbsp;


### LIST

Tipos 'list' consideram válidos apenas um grupo finito de valores. Para
descrever estes valores deve ser especificadas outras 2 chaves que se
correlacionam com o respectivo parametro conforme o modelo abaixo:

checkParams["param_7"]="Estado :: r :: list :: "  
checkParams["param_7_labels"]="São Paulo, Santa Catarina, Rio Grande do Sul"  
checkParams["param_7_values"]="SP, SC, RS"  

Note que no exemplo acima, cada item em 'labels' está separado por uma
vírgula e correlaciona-se a um único valor indicado em 'values'.  
A validação considerará válida a entrada de qualquer dos valores indicados
tanto 'labels' quanto 'values' e a verificação é case insensitive.

&nbsp;


### FUNÇÃO VALIDADORA

Abaixo segue a interface de uma função validadora para que ela funcione de
acordo com o restante do algoritmo de validação.

---

Descrição da verificação sendo realizada.

@param int $1
Número do argumento que está sendo verificado.

@param string $2
Valor bruto do argumento.

@return
'1' se a validação passar.
Mensagem de erro encontrada.
---

&nbsp;
&nbsp;

-------------------------------------------------------------------------------

&nbsp;
&nbsp;

## RESULTADO DA VALIDAÇÃO

A validação ocorrerá de forma linear, campo a campo e será interrompida na
primeira falha encontrada.
