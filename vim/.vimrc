echo system('vimeverywhere_pop_float')

filetype plugin indent on
" basic filetype thingies

set colorcolumn=80

let mapleader = ","
" easier leader

syntax on
" of course

so /home/krzych/res/despacito.vim
"  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" change that to path to despacito.vim (if you're using that colorscheme)

function Set_spaces()
	set expandtab
	set tabstop=2
	set softtabstop=2
	set shiftwidth=2
endfunction


autocmd Filetype c call Set_spaces()
autocmd Filetype cpp call Set_spaces()

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
	Plug 'preservim/nerdtree'
	" file tree (,tree)
	Plug 'ryanoasis/vim-devicons'
	" icons
	Plug 'preservim/nerdcommenter'
	" autocomments (,c<Space>)
	Plug 'fadein/vim-FIGlet'
	" figlet fonts (,f)
	Plug 'mhinz/vim-halo'
	" where is my cursor?? (,,)
	Plug 'krzysckh/turtel-vim'
	Plug 'tc50cal/vim-terminal'
	" vim terminal 2 (,term)
	Plug 'yuratomo/w3m.vim'
	" web browser
	" Plug 'mattpenney89/vimify'
	" spotify controls in vim (,spt)
	Plug 'ashisha/image.vim'
	" showing images in vim
	" if you want to use it with python3 instead of python
	" you need to edit the source code
	" to use list(range()) instead of xrange()
	" and enable autocompletion for images in bash-completion
	" in /usr/share/bash-completion/bash_completion
	Plug 'wakatime/vim-wakatime'
	" wakatime stats
	"Plug 'vimsence/vimsence'
	" discord rich presence
	Plug 'editorconfig/editorconfig-vim'
	" .editorconfig
	Plug 'vim-utils/vim-man'
	" man pages lol

	" IDE features
	Plug 'prabirshrestha/async.vim'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'mattn/vim-lsp-settings'
	"Plug 'ajh17/vimcompletesme'

	"Plug 'jiangmiao/auto-pairs'
call plug#end()

map <leader>f :FIGlet<CR>
" figlets selected text
map <leader>tree :NERDTreeToggle<CR>
" man...
" map <leader>term :tabnew<CR>:term<CR><C-w>jZQ
" crates terminal in new window
map <leader>tterm :tabnew<CR>:Terminal bash<CR>
" creates the other terminal in new window
map <leader>todo :tabnew<CR>:e ~/todo<CR>
" opens ~/todo in new tab
map <leader>w3m :tabnew<CR>:W3m<CR>
" opens w3m in new tab
map <leader>e :%!bc<CR>
" calculates equation in line
map <leader>json :%!python3 -m json.tool<CR>
" beautifulies selected json
map <leader><leader> :call halo#run({'shape':'line'})<CR>
" where is my cursor???
map <leader>start :Startify<CR>
" startpage

" map <leader>spt :call feedkeys(':SpSearch ' . input("gib search: "))<CR>
" asks for query for spotify
" ain't using that anymore

command! -range=% Topdf :hardcopy > %.ps | !ps2pdf %.ps && rm %.ps && echo "=> %.pdf"

let g:Hexokinase_highlighters = ['backgroundfull']
let g:NERDCreateDefaultMappings = 1

let g:w3m#homepage = "https://lite.duckduckgo.com/lite"

" startify
let g:startify_custom_header = 
			\ startify#center(split(system('figlet -w $(tput cols) -f speed vim'), '\n'))

" the old solution ↓ stopped working for some reason lol
" \ startify#pad(split(system('figlet -w $(tput cols) -c -f speed vim'), '\n'))

let g:startify_lists = [
			\ { 'type': 'files', 'header': ['recent'] },
			\ { 'type': 'dir', 'header': ['in '. getcwd()] }
			\ ]
highlight StartifyHeader guifg=#dedede cterm=bold

" spotify

" let g:spotify_token = readfile('/home/krzych/txt/spt_token')[0]
"                               ~~~~~~~~~~~~~~~~~~~~~~~~~~
"                             replace this with path to your spotify token
"                             application

"let g:lsp_diagnostics_float_cursor = 1
