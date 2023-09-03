#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







declare -ga MSE_GLOBAL_LABEL_MONTH=("" "Janeiro" "Fevereiro" "Março" "Abril" "Maio" "Junho" "Julho" "Agosto" "Setembro" "Outubro" "Novembro" "Dezembro")
declare -ga MSE_GLOBAL_LABEL_WEEKDAY=("" "Segunda" "Terça" "Quarta" "Quinta" "Sexta" "Sábado" "Domingo")
declare -ga MSE_GLOBAL_LABEL_DAYPERIOD=("" "Madrugada" "Manhã" "Tarde" "Noite")


lbl_err_lostParameters="Foram perdidos [[LOST]] parametros."
lbl_err_variableAlreadExists="Variável \"[[VAR]]\" já existe"
lbl_err_variableDoNotExists="Variável \"[[VAR]]\" não existe"
lbl_err_variableDoNotExistsInSection="Variável \"[[VAR]]\" não existe na seção \"[[SECTION]]\""

lbl_err_paramA_HasInvalidValue="Parametro \"[[PARAM_A]]\" foi definido com um valor inválido"
lbl_err_paramA_HasInvalidOption="Parametro \"[[PARAM_A]]\" foi definido com uma opção inválida"
lbl_err_paramA_IsOutOfRange="Parametro \"[[PARAM_A]]\" está fora dos limites"
lbl_err_paramA_IsRequired="Parametro \"[[PARAM_A]]\" é obrigatório"
lbl_err_paramA_IsNot_A="Parametro \"[[PARAM_A]]\" não é um [[A]]"
lbl_err_paramA_IsNotAn_A="Parametro \"[[PARAM_A]]\" não é um [[A]]"
lbl_err_paramA_IsGreaterThanMaxLength="Parametro \"[[PARAM_A]]\" é maior do que o tamanho máximo permitido ( [[MAXLENGTH]] )"
lbl_err_paramA_IsNotValid_A_RepresentationOf_B="Parametro \"[[PARAM_A]]\" não é um representante [[A]] de um [[B]]"
lbl_err_paramA_MustBeGreaterOrEqualsThan_A="Parametro \"[[PARAM_A]]\" deve ser maior ou igual a [[A]]"
lbl_err_paramA_MustBeLessOrEqualsThan_A="Parametro \"[[PARAM_A]]\" deve ser menor ou igual a [[A]]"
lbl_err_paramA_MustBeNameOfExistentFunction="Parametro \"[[PARAM_A]]\" deve ser o nome de uma função existente"

lbl_err_cannotCreateNewFileIn="Não foi possível criar um novo arquivo em [[LOCAL]]"
lbl_err_paramA_PointsToNonExistentFile="Parametro \"[[PARAM_A]]\" aponta para um arquivo inexistente"

lbl_err_cannotCreateNewDirectoryIn="Não foi possível criar um novo diretório em [[LOCAL]]"
lbl_err_paramA_PointsToNonExistentDirectory="Parametro \"[[PARAM_A]]\" aponta para um diretório inexistente"

lbl_err_paramA_MustBeAnArray="Parametro \"[[PARAM_A]]\" deve ser um array"
lbl_err_paramA_MustBeAnAssocArray="Parametro \"[[PARAM_A]]\" deve ser um array associativo"
lbl_err_paramA_IsAnEmptyArray="Parametro \"[[PARAM_A]]\" é um array vazio"
lbl_err_paramA_BothArraysMustHaveSameNumberOfElements="Parametros \"[[PARAM_A]]\" e \"[[PARAM_B]]\" devem ter o mesmo número de elementos"
lbl_err_paramA_MustBeAnArrayWithAtLast_Min="Parametro \"[[PARAM_A]]\" deve ser um array com ao menos [[MIN]] elementos"
lbl_err_paramA_MustBeAnArrayWithAtLast_Max="Parametro \"[[PARAM_A]]\" deve ser um array com no máximo [[MAX]] elementos"
lbl_err_paramA_LostTheRequiredKey_Key="Parametro \"[[PARAM_A]]\" não possui a chave \"[[KEY]]\" exigida"

lbl_err_paramA_RequiredFor_A_Operation="Parametro \"[[PARAM_A]]\" é exigido para a operação do tipo \"[[A]]\""

lbl_err_checkForValidOptionsUsingFunction="Verifique por opções válidas usando a função \"[[FUNCTION]]\""
lbl_err_chooseOneOfThisOptions="Escolha uma destas opções: "

lbl_err_cannotIdentifyTargetLine="Não foi possível identificar a linha alvo para executar esta operação."
