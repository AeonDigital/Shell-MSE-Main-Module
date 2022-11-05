set runtimepath^=$XDG_CONFIG_HOME/vim
set runtimepath+=$XDG_DATA_HOME/vim
set runtimepath+=$XDG_CONFIG_HOME/vim/after

set packpath^=$XDG_DATA_HOME/vim,$XDG_CONFIG_HOME/vim
set packpath+=$XDG_CONFIG_HOME/vim/after,$XDG_DATA_HOME/vim/after

let g:netrw_home = $XDG_DATA_HOME."/vim"
call mkdir($XDG_DATA_HOME."/vim/spell", 'p')

set backupdir=$XDG_STATE_HOME/vim/backup | call mkdir(&backupdir, 'p')
set directory=$XDG_STATE_HOME/vim/swap   | call mkdir(&directory, 'p')
set undodir=$XDG_STATE_HOME/vim/undo     | call mkdir(&undodir,   'p')
set viewdir=$XDG_STATE_HOME/vim/view     | call mkdir(&viewdir,   'p')

if !has('nvim') | set viminfofile=$XDG_STATE_HOME/vim/viminfo | endif





"
" Ativa o uso do mouse
set mouse=a

"
" Ativa a barra de exibição do seu terminal
set title
"
" Mostra a barra de status
set laststatus=2
"
" Adiciona opção de confirmação mais amigável
set confirm
"
" Aumenta o tamanho para mostrar mensagens na barra de comandos
set cmdheight=2
"
" Marca automaticamente as palavras sendo pesquisadas
set incsearch
"
" Ignora o 'case' nas buscas
set ignorecase
"
" Religa o 'case sensitive' para buscas se ao menos 1 caracter
" maiúsculo for digitado na string que está sendo usada para
" executar a consulta.
set smartcase
"
" Adiciona o 'menu' de comandos aptos a serem selecionados
" Desta forma, quando está digitando um comando, usando <TAB>
" aparecerá uma linha de complementos válidos para o comando
" inicial. Usando o próprio <TAB> você pode navegar entre as
" opções e pode usar <SHIFT>+<TAB> para retroceder.
set wildmenu
"
" Cria um 'buffer' de linhas sempre visíveis no fim do arquivo
set scrolloff=5
"
" Desabilita o uso de arquivos de backup
set nobackup
set nowritebackup
"
" Configura a posição de novos editores ao usar o 'split'
set splitright
set splitbelow


"
" Habilita o uso de plugins especiais conforme os tipos de arquivos
filetype on
filetype plugin on
filetype indent on


"
" Habilita o uso de 'syntax highlight'
syntax on
"
" Define o tema a ser usado
color default

"
" Define o encoding padrão
set encoding=utf-8
"
" Mostra o número das linhas
set number

"
" Tamanho do caracter de tabulação
set tabstop=2
"
" Mostra os caracteres de tabulação existentes com esta quantidade de 'espaços'
set softtabstop=2
"
" Quantidade de caracteres usados para identar usando '>'
set shiftwidth=2
"
" Define para utilizar espaços ao invés do caracter <TAB>
set expandtab
"
" Insere tabulação no início da linha de acordo com o recuo atual
set smarttab
"
" Insere um novo nível de indentação de acordo com o escopo
set smartindent

"
" Quebra automática de linha
set wrap

