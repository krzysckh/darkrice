echo system('vimeverywhere_pop_float')

filetype plugin indent on
" basic filetype thingies

set colorcolumn=80

let mapleader = ","
" easier leader

syntax on
" of course

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
set backspace=indent,eol,start

set noexpandtab
set tabstop=8
set softtabstop=8
set shiftwidth=8

au BufNewFile,BufRead *.xaml setf xml
au BufNewFile,BufRead *.axaml setf xml

au BufNewFile,BufRead *.nelua setf lua

"au BufNewFile,BufRead *.y call Set_tab_to_spaces()

let &t_SI = "\e[5 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"

" pipe for insert, block for the rest

call plug#begin('~/.vim/plugged')
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase'}
  " html colors
  Plug 'mhinz/vim-startify'
  " start page (,start)
  Plug 'ryanoasis/vim-devicons'
  " icons
  Plug 'preservim/nerdcommenter'
  " autocomments (,c<Space>)
  Plug 'mhinz/vim-halo'
  " where is my cursor?? (,,)
  Plug 'krzysckh/turtel-vim'
  " Plug 'mattpenney89/vimify'
  " spotify controls in vim (,spt)
  Plug 'wakatime/vim-wakatime'
  " wakatime stats
  "Plug 'vimsence/vimsence'
  " discord rich presence
  Plug 'editorconfig/editorconfig-vim'
  " .editorconfig
  Plug 'sirosen/vim-rockstar'
  Plug 'sainnhe/everforest', { 'commit': 'd855af543410c4047fc03798f5d58ddd07abcf2d' }
  " colorscheme
  Plug 'hotchpotch/perldoc-vim'
  " perldoc K
  Plug 'junegunn/vim-easy-align'
  " align
  Plug 'jaawerth/fennel.vim'
  " fennel syntax
  Plug 'janet-lang/janet.vim'
  " janet syntax
  Plug 'ollykel/v-vim'
  " v syntax
  Plug 'vala-lang/vala.vim'
  " vala syntax
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'thosakwe/vim-flutter'
  " flutter and dart
  Plug 'junegunn/fzf.vim'
  " fzf

  " IDE features
  "Plug 'prabirshrestha/async.vim'
  "Plug 'prabirshrestha/vim-lsp'
  "Plug 'prabirshrestha/asyncomplete.vim'
  "Plug 'prabirshrestha/asyncomplete-lsp.vim'
  "Plug 'mattn/vim-lsp-settings'
  "Plug 'ajh17/vimcompletesme'
  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

  "Plug 'jiangmiao/auto-pairs'
call plug#end()

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nmap <leader>a <Plug>(EasyAlign)
xmap <leader>a <Plug>(EasyAlign)

nmap <leader>b :Buffers<cr>

nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

map <leader>todo :tabnew<CR>:e ~/todo<CR>
map <leader><leader> :call halo#run({'shape':'line'})<CR>

imap <C-l> λ

command! -range=% Topdf :hardcopy > %.ps | !ps2pdf %.ps && rm %.ps && echo "=> %.pdf"

let g:fzf_buffers_jump = 1
let g:Hexokinase_highlighters = ['backgroundfull']
let g:NERDCreateDefaultMappings = 1
let g:hy_enable_conceal = 1

" startify
let g:startify_custom_header =
      \ startify#center(split(system('figlet -w $(tput cols) -f speed vim'), '\n'))

" the old solution ↓ stopped working for some reason lol
" \ startify#pad(split(system('figlet -w $(tput cols) -c -f speed vim'), '\n'))

let g:startify_lists = [
      \ { 'type': 'files', 'header': ['recent'] },
      \ { 'type': 'dir', 'header': ['in '. getcwd()] }
      \ ]

let g:lsp_diagnostics_float_cursor = 1

set background=dark
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1
colorscheme everforest

set guifont=agave\ Nerd\ Font\ 15
set guioptions=Ac

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
