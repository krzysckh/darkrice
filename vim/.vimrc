filetype plugin indent on

syntax on

so /home/krzych/scripts/despacito.vim

set relativenumber
set showcmd
set mouse=a
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set termguicolors


let &t_SI = "\e[5 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"


call plug#begin('~/.vim/plugged')
	Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase'}
	Plug 'mhinz/vim-startify'
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'preservim/nerdcommenter'
	Plug 'fadein/vim-FIGlet'
	Plug 'mhinz/vim-halo'
	Plug 'krzysckh/turtel-vim'
	Plug 'tc50cal/vim-terminal'
	Plug 'yuratomo/w3m.vim'
	Plug 'theniceboy/vim-calc'
	Plug 'mattpenney89/vimify'
	Plug 'itchyny/calendar.vim'
	Plug 'ashisha/image.vim'
	Plug 'itchyny/lightline.vim'

	" IDE features
	Plug 'prabirshrestha/async.vim'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'

	Plug 'mattn/vim-lsp-settings'

	Plug 'ajh17/vimcompletesme'
call plug#end()

map \f :FIGlet<CR>
map \new :tabnew<CR>
map \tree :NERDTreeToggle<CR>
map \term :tabnew<CR>:term<CR><C-w>jZQ
map \tterm :tabnew<CR>:Terminal bash<CR>
map \todo :tabnew<CR>:e ~/todo<CR>
map \w3m :tabnew<CR>:W3m<CR>
map \e :call Calc()<CR>
map \json :%!python3 -m json.tool<CR>
map \\ :call halo#run({'shape':'line'})<CR>
map \start :Startify<CR>
map \spt :call feedkeys(':SpSearch ' . input("gib search: "))<CR>
map \cal :Calendar<CR>

let g:Hexokinase_highlighters = ['backgroundfull']
let g:NERDCreateDefaultMappings = 1

let g:w3m#homepage = "https://lite.duckduckgo.com/lite"

" startify
let g:startify_custom_header =
	\ startify#pad(split(system('figlet -w $(tput cols) -c -f speed vim'), '\n'))

let g:startify_lists = [
			\ { 'type': 'files', 'header': ['recent'] },
			\ { 'type': 'dir', 'header': ['in '. getcwd()] }
			\ ]

" spotify

let g:spotify_token = readfile('/home/krzych/txt/spt_token')[0]

if executable('clangd')
	augroup lsp_clangd
		autocmd!
		autocmd User lsp_setup call lsp#register_server({
					\ 'name': 'clangd',
					\ 'cmd': {server_info->['clangd']},
					\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
					\ })
		autocmd FileType c setlocal omnifunc=lsp#complete
		autocmd FileType cpp setlocal omnifunc=lsp#complete
		autocmd FileType objc setlocal omnifunc=lsp#complete
		autocmd FileType objcpp setlocal omnifunc=lsp#complete
	augroup end
endif

