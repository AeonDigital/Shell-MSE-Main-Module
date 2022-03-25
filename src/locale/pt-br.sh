#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







lbl_generic_MainModuleNotFound+="\n"
lbl_generic_MainModuleNotFound+="    Atenção\n"
lbl_generic_MainModuleNotFound+="    O módulo \"Shell-MSE-Main-Module\" não foi encontrado.\n"
lbl_generic_MainModuleNotFound+="    Use os seguintes comandos para adicioná-lo e configurá-lo:\n"
lbl_generic_MainModuleNotFound+="    - git submodule add https://github.com/AeonDigital/Shell-MSE-Main-Module.git \n"
lbl_generic_MainModuleNotFound+="    - git submodule set-branch --branch main -- ./Shell-MSE-Main-Module \n"
lbl_generic_MainModuleNotFound+="    - git submodule update --remote \n"
lbl_generic_MainModuleNotFound+="\n"
lbl_generic_MainModuleNotFound+="    Se o módulo \"Shell-MSE-Main-Module\" já faz parte do repositório atual você pode\n"
lbl_generic_MainModuleNotFound+="    iniciá-lo usando os comandos a seguir:\n"
lbl_generic_MainModuleNotFound+="    - git submodule init \n"
lbl_generic_MainModuleNotFound+="    - git submodule update --remote \n"
lbl_generic_MainModuleNotFound+="\n"


lbl_generic_UnitTestNotFound+="\n"
lbl_generic_UnitTestNotFound+="    Atenção\n"
lbl_generic_UnitTestNotFound+="    Não foi possível rodar os testes pois o módulo \"Shell-MSE-UnitTest\" não foi encontrado.\n"
lbl_generic_UnitTestNotFound+="    Use os seguintes comandos para adicioná-lo e configurá-lo:\n"
lbl_generic_UnitTestNotFound+="    - git submodule add https://github.com/AeonDigital/Shell-MSE-UnitTest.git \n"
lbl_generic_UnitTestNotFound+="    - git submodule set-branch --branch main -- ./Shell-MSE-UnitTest \n"
lbl_generic_UnitTestNotFound+="    - git submodule update --remote \n"
lbl_generic_UnitTestNotFound+="\n"
lbl_generic_UnitTestNotFound+="    Se o módulo \"Shell-MSE-UnitTest\" já faz parte do repositório atual você pode\n"
lbl_generic_UnitTestNotFound+="    iniciá-lo usando os comandos a seguir:\n"
lbl_generic_UnitTestNotFound+="    - git submodule init \n"
lbl_generic_UnitTestNotFound+="    - git submodule update --remote \n"
lbl_generic_UnitTestNotFound+="\n"


lbl_generic_ModuleNotFound+="\n"
lbl_generic_ModuleNotFound+="    Atenção\n"
lbl_generic_ModuleNotFound+="    O módulo \"[[MODULE]]\" não foi encontrado.\n"
lbl_generic_ModuleNotFound+="    Use o comando a seguir para carregá-lo:\n"
lbl_generic_ModuleNotFound+="    - git submodule update --remote \n"
lbl_generic_ModuleNotFound+="\n"


lbl_generic_ERROR="ERRO"
lbl_generic_in="em"
lbl_generic_expected="esperado"

lbl_genericError_lostArgument="argumento perdido"
lbl_genericError_emptyArray="array vazio"
lbl_genericError_invalidType="tipo inválido"
lbl_genericError_invalidValue="valor inválido"
lbl_genericError_invalidArgument="argumento inválido"
lbl_genericError_expectedOnly="esperado apenas"
lbl_genericError_cannotSave="não foi possível salvar"
lbl_genericError_emptyListOfOptions="lista de opções vazia"
lbl_genericError_emptyListOfBooleanOptions="lista de opções boleanas vazia"
lbl_genericError_checkValidOptionsIn="verifique por valores válidos em"
lbl_genericError_especifiedFileNotExists="o arquivo especificado não existe"
lbl_genericError_configurationFileNotFound="arquivo de configuração não foi encontrado"

lbl_genericMessage_pressAnyKeyToProceed="Precione qualquer tecla para prosseguir"


lbl_registerModule_EmptyDir+="\n"
lbl_registerModule_EmptyDir+="    Atenção:\n"
lbl_registerModule_EmptyDir+="    Diretório de scripts do módulo está vazio: [[DIR]] \n"
lbl_registerModule_EmptyDir+="    Operação abortada!\n\n"





#
# Coleção de opções aceitas para um 'prompt' do tipo 'bool'.
unset lbl_generic_boolPromptLabels
lbl_generic_boolPromptLabels=(
  "sim" "s" "nao" "n"
)

#
# Coleção de valores correspondentes às opções de 'labels' de um 'prompt'
# do tipo 'bool'.
unset lbl_generic_boolPromptValues
lbl_generic_boolPromptValues=(
  1 1 0 0
)





MSE_MD_ICOLOR_AVAILABLE_COLOR_LABELS=(
  'Normal'
  'Preto' 'Cinza escuro' 'Cinza claro' 'Branco' 'Vermelho' 'Vermelho claro'
  'Verde' 'Verde claro' 'Marrom' 'Amarelo' 'Azul' 'Azul claro'
  'Purpura' 'Purpura claro' 'Ciano' 'Ciano claro'
)


lbl_icolor_showFontAttributes_AttrOptions="As seguintes opções de atributos estão disponíveis"
lbl_icolor_showTextColors_TableHeaders="Cor:Raw:Variavel:Aparencia"
lbl_icolor_showTextColors_TableFilter01="Variavel"
lbl_icolor_showTextColors_TableFilter02="Cor,Variavel"
