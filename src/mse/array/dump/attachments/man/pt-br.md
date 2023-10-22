# Synopsis

Processa as chaves e valores do array alvo e retorna uma coleção de linhas de 
dados capaz de remontá-lo.

Em cada linha de dados estará presente um único valor do array seja ele uma 
matriz comum ou um do tipo associativo.



&nbsp;

# Parameters

## array arrayName

- aka       : -a --arrayName
- hint      :  
  Nome do array alvo.


&nbsp;

## bool isGlobal

- aka       : -g --isGlobal
- default   : 0
- hint      :
  Indica quando o array deve ser marcado como sendo de escopo global.


&nbsp;

## string arrayNewName

- aka       : -ann --arrayNewName
- hint      :
  Se informado irá usar este valor como nome do array na saída final.


&nbsp;

## string prefixLines

- aka       : -pl --prefixLines
- hint      :
  Se informado irá usar este valor na frente de cada linha.

Útil se deseja printar uma versão comendata do código do array.



&nbsp;

# Returns string

Uma ou mais linhas de dados representando a declaração e preenchimento do array 
alvo.

Lembre-se que arrays associativos não mantém a posição de suas chaves.