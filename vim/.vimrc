echo system('vimeverywhere_pop_float')

filetype plugin indent on

set colorcolumn=80

let mapleader = " "
nnoremap <space> <Nop>

syntax on

function Set_spaces()
  set expandtab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
endfunction

function Set_tabs()
  set noexpandtab
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
endfunction

autocmd Filetype make call Set_tabs()
autocmd Filetype * call Set_spaces()

set relativenumber
set number
set showcmd
set mouse=a
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite
set hidden
set termguicolors
set title
set ttyfast
set signcolumn=yes
set wildmenu
set wildoptions=fuzzy
set backspace=indent,eol,start

set noexpandtab
set tabstop=8
set softtabstop=8
set shiftwidth=8

au BufNewFile,BufRead *.xaml setf xml
au BufNewFile,BufRead *.axaml setf xml

au BufNewFile,BufRead *.nelua setf lua

let &t_SI = "\e[5 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"

" pipe for insert, block for the rest

call plug#begin('~/.vim/plugged')
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase'}
  Plug 'mhinz/vim-startify'
  Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdcommenter'
  Plug 'krzysckh/turtel-vim'
  Plug 'wakatime/vim-wakatime'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'sirosen/vim-rockstar'
  Plug 'sainnhe/everforest', { 'commit': 'd855af543410c4047fc03798f5d58ddd07abcf2d' }
  Plug 'hotchpotch/perldoc-vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'jaawerth/fennel.vim'
  Plug 'janet-lang/janet.vim'
  Plug 'ollykel/v-vim'
  Plug 'vala-lang/vala.vim'
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'thosakwe/vim-flutter'
  Plug 'junegunn/fzf.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'justinmk/vim-dirvish'
  Plug 'antoyo/vim-licenses'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-eunuch'
  Plug 'vim-scripts/transpose-words'
  Plug 'sillybun/vim-repl'
  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
call plug#end()

nmap <leader>y "+y
nmap <leader>p "+p
nmap <BS> <C-^>
nmap > >>
nmap < <<
tnoremap <S-space> <space>

map <leader>lc :s/^/; /<cr>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nmap <leader>a <Plug>(EasyAlign)
xmap <leader>a <Plug>(EasyAlign)

nmap <leader>b :Buffers<cr>

nmap <leader>r :REPLToggle<cr>

nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

nmap <C-t> <Plug>Transposewords
imap <C-t> <Plug>Transposewords
cmap <C-t> <Plug>Transposewords

imap <C-l> λ

command! -range=% Topdf :hardcopy > %.ps | !ps2pdf %.ps && rm %.ps && echo "=> %.pdf"

let g:sendtorepl_invoke_key = "<leader>e"
let g:repl_console_name = '*repl*'
let g:repl_position = 3
let g:repl_input_symbols = {
      \ 'python': ['>>>', '>>>>', 'ipdb>', 'pdb', '...'],
      \ 'scheme': ['>', ''],
      \ 'racket': ['>', '']
      \ }

let g:repl_program = {
      \	'python': ['python'],
      \ 'scheme' : ['ol'],
      \ 'racket' : ['racket'],
      \	'default': ['bash']
      \	}

let g:fzf_buffers_jump = 1
let g:Hexokinase_highlighters = ['backgroundfull']
let g:NERDCreateDefaultMappings = 1

let g:licenses_copyright_holders_name = 'krzysckh <kpm@linux.pl>'
let g:licenses_default_commands = ['gpl', 'mit', 'bsd2', 'bsd3', 'wtfpl', 'cc0']

" startify
if has('gui_running')
  let g:startify_custom_header =
        \ startify#center(split(system('figlet -w 80 -f speed vim'), '\n'))
else
  let g:startify_custom_header =
        \ startify#center(split(system('figlet -w $(tput cols) -f speed vim'), '\n'))
endif

let g:startify_lists = [
      \ { 'type': 'files', 'header': ['recent'] },
      \ { 'type': 'dir', 'header': ['in '. getcwd()] }
      \ ]

let g:lsp_diagnostics_float_cursor = 1

set background=dark
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1
colorscheme everforest

set guifont=Lilex\ 12
set guioptions=Ac
set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~

set signcolumn=yes
let g:vcm_tab_complete = 'user'
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()

highlight RedundantWhitespace ctermbg=red guibg=#4c3743
match RedundantWhitespace /\s\+$/
autocmd User StartifyReady match RedundantWhitespace //
autocmd User StartifyBufferOpened match RedundantWhitespace /\s\+$/

aug Conceal
  au!
  au FileType * syntax match Normal /\<sum\>/ conceal cchar=∑
  au FileType * syntax match Boolean /\<\#t\(rue\)\?\>/ conceal cchar=⊤
  au FileType * syntax match Boolean /\<\#f\(alse\)\?\>/ conceal cchar=⊥
aug END

set conceallevel=2
set concealcursor=nv

set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'everforest',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

let g:lightline.mode_map = {
    \ 'n':      'normal',
    \ 'i':      'insert',
    \ 'R':      'replace',
    \ 'v':      'visual',
    \ 'V':      'v-line',
    \ "\<C-v>": 'v-block',
    \ 'c':      'command',
    \ 's':      'select',
    \ 'S':      's-line',
    \ "\<C-s>": 's-block',
    \ 't':      'terminal',
    \ }

augroup dirvish_config
  autocmd!
  autocmd FileType dirvish nnoremap <silent><buffer> h
        \ <Plug>(dirvish_up)
  autocmd FileType dirvish nnoremap <silent><buffer> <bs>
        \ <Plug>(dirvish_up)
augroup END
