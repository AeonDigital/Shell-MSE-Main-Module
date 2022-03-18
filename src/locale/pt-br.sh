#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







lbl_runTests_UnitTestNotFound="\n"
lbl_runTests_UnitTestNotFound+="    Atenção\n"
lbl_runTests_UnitTestNotFound+="    Não foi possível rodar os testes pois o módulo \"Shell-MSE-UnitTest\" não foi encontrado.\n"
lbl_runTests_UnitTestNotFound+="    Use os seguintes comandos para adicioná-lo e configurá-lo:\n"
lbl_runTests_UnitTestNotFound+="    - git submodule add https://github.com/AeonDigital/Shell-MSE-UnitTest.git \n"
lbl_runTests_UnitTestNotFound+="    - git submodule set-branch --branch main -- ./Shell-MSE-UnitTest \n"
lbl_runTests_UnitTestNotFound+="    - git submodule update --remote \n"
lbl_runTests_UnitTestNotFound+="\n"
lbl_runTests_UnitTestNotFound+="    Se o módulo \"Shell-MSE-UnitTest\" já faz parte do repositório atual você pode\n"
lbl_runTests_UnitTestNotFound+="    iniciá-lo usando os comandos a seguir:\n"
lbl_runTests_UnitTestNotFound+="    - git submodule init \n"
lbl_runTests_UnitTestNotFound+="    - git submodule update --remote \n"
lbl_runTests_UnitTestNotFound+="\n"


lbl_generic_ERROR="ERRO"
lbl_generic_in="em"
lbl_generic_LostArguments="argumento perdido"


lbl_registerModule_EmptyDir=""
lbl_registerModule_EmptyDir+="    Atenção:\n"
lbl_registerModule_EmptyDir+="    Diretório de scripts do módulo está vazio: [[DIR]] \n"
lbl_registerModule_EmptyDir+="    Operação abortada!\n\n"
