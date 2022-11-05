Shell-MSE-Main-Module
======================

> [Aeon Digital](http://www.aeondigital.com.br)
>
> rianna@aeondigital.com.br

&nbsp;

Módulo básico para o ``myShellEnv``.  
Trata-se de um conjunto de ferramentas que visa oferecer uma série de facilitadores para a construção de scripts
e módulos em ambientes de ``shell`` como o ``Bash``.  


&nbsp;
&nbsp;


________________________________________________________________________________________________________________________

## Instalação

Abra o seu ``shell`` e use os seguintes comandos:  

``` shell
curl -O https://raw.githubusercontent.com/AeonDigital/Shell-MSE-Main-Module/main/install.sh
chmod +x install.sh
./install.sh
```


&nbsp;
&nbsp;


________________________________________________________________________________________________________________________

## Outros módulos

Você pode conhecer/instalar/desinstalar outros módulos de ferramentas usando os comandos mostrados abaixo:  

``` shell
# Listar módulos aptos a serem instalados
mse mng submodule list --

Submodule         Installed  Enabled
Shell-MSE-Notes   0          0
Shell-MSE-Prompt  0          0


# Instalando um módulo 
mse mng submodule install -- "ModuleName"
```


&nbsp;
&nbsp;


________________________________________________________________________________________________________________________

## Atualizando sua instalação

Com alguma frequencia o módulo principal e submódulos são atualizados.  
Para atualizá-los use:  

``` shell
mse mng submodule updateAll --
```


&nbsp;
&nbsp;


________________________________________________________________________________________________________________________

## Importante

Este projeto - por hora - é um exercício pessoal de construção de ferramentas usando o ``Bash`` em suas funções mais
básicas para fins de estudo, domínio e diversão. Tanto quanto possível foi tentado evitar qualquer outro comando que 
não fossem as capacidades ``naturais`` deste ``shell``. Em alguns momentos isto não foi possível mas valeu o esforço.  

Tenho usado este ferramental pontualmente para trabalhos profissionais não críticos e reconheço que pode melhorar 
muito, em especial se abrir mão de usar ``only Bash features`` mas isto quebraria o intento original então, por hora,
ficará assim mesmo.  

Uma documentação apropriada deverá ser feita num futuro de médio/longo prazo, até lá o jeito é instalar e deixar que o 
autocomplete ``mse`` lhe guie:  

``` shel
mse <TAB><TAB>
```

Tendo isto em mente, use e aprimore a vontade.  


&nbsp;
&nbsp;


________________________________________________________________________________________________________________________

## Licença

Para este projeto foi usada a [Licença MIT](LICENCE.md).
