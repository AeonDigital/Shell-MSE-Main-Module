#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


MSE_FUNCTION_MAN["description"]="Efetua a contagem de linhas do arquivo ou string passada e printa o resultado."


MSE_FUNCTION_MAN["param.1.description"]="Caminho para o arquivo ou string que será usada."


MSE_FUNCTION_MAN["return.description"]=""
MSE_FUNCTION_MAN["return.description"]+="Total de linhas do arquivo.\n"
MSE_FUNCTION_MAN["return.description"]+="Devido a forma como o bash funciona com relação ao tratamento das linhas\n"
MSE_FUNCTION_MAN["return.description"]+="vazias no final dos arquivos, tenha em mente que a contagem de linhas irá\n"
MSE_FUNCTION_MAN["return.description"]+="apenas até a última linha não vazia do arquivo indicado."
