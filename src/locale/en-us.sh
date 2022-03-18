#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







lbl_runTests_UnitTestNotFound+="\n"
lbl_runTests_UnitTestNotFound+="    Attention\n"
lbl_runTests_UnitTestNotFound+="    Could not run tests because module \"Shell-MSE-UnitTest\" was not found.\n"
lbl_runTests_UnitTestNotFound+="    Use the following commands to add and configure it:\n"
lbl_runTests_UnitTestNotFound+="    - git submodule add https://github.com/AeonDigital/Shell-MSE-UnitTest.git \n"
lbl_runTests_UnitTestNotFound+="    - git submodule set-branch --branch main -- ./Shell-MSE-UnitTest \n"
lbl_runTests_UnitTestNotFound+="    - git submodule update --remote \n"
lbl_runTests_UnitTestNotFound+="\n"
lbl_runTests_UnitTestNotFound+="    If the module \"Shell-MSE-UnitTest\" is already part of the current repository you can\n"
lbl_runTests_UnitTestNotFound+="    start it using the following commands:\n"
lbl_runTests_UnitTestNotFound+="    - git submodule init \n"
lbl_runTests_UnitTestNotFound+="    - git submodule update --remote \n"
lbl_runTests_UnitTestNotFound+="\n"


lbl_generic_ERROR="ERROR"
lbl_generic_in="in"
lbl_generic_LostArguments="lost arguments"


lbl_registerModule_EmptyDir+="\n"
lbl_registerModule_EmptyDir+="    Attention:\n"
lbl_registerModule_EmptyDir+="    The scripts directory is empty: [[DIR]] \n"
lbl_registerModule_EmptyDir+="    Aborted operation!\n\n"
