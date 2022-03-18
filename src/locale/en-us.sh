#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







lbl_generic_MainModuleNotFound+="\n"
lbl_generic_MainModuleNotFound+="    Attention\n"
lbl_generic_MainModuleNotFound+="    The module \"Shell-MSE-Main-Module\" was not found.\n"
lbl_generic_MainModuleNotFound+="    Use the following commands to add and configure it:\n"
lbl_generic_MainModuleNotFound+="    - git submodule add https://github.com/AeonDigital/Shell-MSE-Main-Module.git \n"
lbl_generic_MainModuleNotFound+="    - git submodule set-branch --branch main -- ./Shell-MSE-Main-Module \n"
lbl_generic_MainModuleNotFound+="    - git submodule update --remote \n"
lbl_generic_MainModuleNotFound+="\n"
lbl_generic_MainModuleNotFound+="    If the module \"Shell-MSE-Main-Module\" is already part of the current repository you can\n"
lbl_generic_MainModuleNotFound+="    start it using the following commands:\n"
lbl_generic_MainModuleNotFound+="    - git submodule init \n"
lbl_generic_MainModuleNotFound+="    - git submodule update --remote \n"
lbl_generic_MainModuleNotFound+="\n"


lbl_generic_UnitTestNotFound+="\n"
lbl_generic_UnitTestNotFound+="    Attention\n"
lbl_generic_UnitTestNotFound+="    Could not run tests because module \"Shell-MSE-UnitTest\" was not found.\n"
lbl_generic_UnitTestNotFound+="    Use the following commands to add and configure it:\n"
lbl_generic_UnitTestNotFound+="    - git submodule add https://github.com/AeonDigital/Shell-MSE-UnitTest.git \n"
lbl_generic_UnitTestNotFound+="    - git submodule set-branch --branch main -- ./Shell-MSE-UnitTest \n"
lbl_generic_UnitTestNotFound+="    - git submodule update --remote \n"
lbl_generic_UnitTestNotFound+="\n"
lbl_generic_UnitTestNotFound+="    If the module \"Shell-MSE-UnitTest\" is already part of the current repository you can\n"
lbl_generic_UnitTestNotFound+="    start it using the following commands:\n"
lbl_generic_UnitTestNotFound+="    - git submodule init \n"
lbl_generic_UnitTestNotFound+="    - git submodule update --remote \n"
lbl_generic_UnitTestNotFound+="\n"


lbl_generic_ModuleNotFound+="\n"
lbl_generic_ModuleNotFound+="    Attention\n"
lbl_generic_ModuleNotFound+="    The module \"[[MODULE]]\" was not loaded.\n"
lbl_generic_ModuleNotFound+="    Use the following commands to load it:\n"
lbl_generic_ModuleNotFound+="    - git submodule update --remote \n"
lbl_generic_ModuleNotFound+="\n"


lbl_generic_ERROR="ERROR"
lbl_generic_in="in"
lbl_generic_LostArguments="lost arguments"


lbl_registerModule_EmptyDir+="\n"
lbl_registerModule_EmptyDir+="    Attention:\n"
lbl_registerModule_EmptyDir+="    The scripts directory is empty: [[DIR]] \n"
lbl_registerModule_EmptyDir+="    Aborted operation!\n\n"
