#!/bin/bash -eu
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
lbl_generic_ModuleNotFound+="    O módulo \"[[MODULE]]\" não foi carregado.\n"
lbl_generic_ModuleNotFound+="    Use o comando a seguir para carregá-lo:\n"
lbl_generic_ModuleNotFound+="    - git submodule update --remote \n"
lbl_generic_ModuleNotFound+="\n"


lbl_generic_ERROR="ERRO"
lbl_generic_in="em"
lbl_generic_LostArguments="argumento perdido"


lbl_registerModule_EmptyDir=""
lbl_registerModule_EmptyDir+="    Atenção:\n"
lbl_registerModule_EmptyDir+="    Diretório de scripts do módulo está vazio: [[DIR]] \n"
lbl_registerModule_EmptyDir+="    Operação abortada!\n\n"
