filetype plugin indent on
" basic filetype thingies

let mapleader = ","
" easier leader

syntax on
" of course

so /home/krzych/scripts/despacito.vim
"  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" change that to path to despacito.vim (if you're using that colorscheme)

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
set title

au BufNewFile,BufRead *.xaml setf xml
au BufNewFile,BufRead *.axaml setf xml

let &t_SI = "\e[5 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"

" pipe for insert, block for the rest

call plug#begin('~/.vim/plugged')
	Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase'}
	" html cololrs
	Plug 'mhinz/vim-startify'
	" start page (\start)
	Plug 'preservim/nerdtree'
	" file tree (\tree)
	Plug 'ryanoasis/vim-devicons'
	" icons
	Plug 'preservim/nerdcommenter'
	" autocomments (\c<Space>)
	Plug 'fadein/vim-FIGlet'
	" figlet fonts (\f)
	Plug 'mhinz/vim-halo'
	" where is my cursor?? (\\)
	Plug 'krzysckh/turtel-vim'
	Plug 'tc50cal/vim-terminal'
	" vim terminal 2 (\\term)
	Plug 'yuratomo/w3m.vim'
	" web browser
	Plug 'theniceboy/vim-calc'
	" calculator (\e)
	Plug 'mattpenney89/vimify'
	" spotify controls in vim (\spt)
	Plug 'itchyny/calendar.vim'
	" calendar (\cal)
	Plug 'ashisha/image.vim'
	" showing images in vim
	" if you want to use it with python3 instead of python
	" you need to edit the source code
	" to use list(range()) instead of xrange()
	" and enable autocompletion for images in bash-completion
	" in /usr/share/bash-completion/bash_completion

	" IDE features
	Plug 'prabirshrestha/async.vim'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'mattn/vim-lsp-settings'
	Plug 'ajh17/vimcompletesme'

	Plug 'jiangmiao/auto-pairs'
call plug#end()

map <leader>f :FIGlet<CR>
" figlets selected text
map <leader>tree :NERDTreeToggle<CR>
" man...
map <leader>term :tabnew<CR>:term<CR><C-w>jZQ
" crates terminal in new window
map <leader>tterm :tabnew<CR>:Terminal bash<CR>
" creates the other terminal in new window
map <leader>todo :tabnew<CR>:e ~/todo<CR>
" opens ~/todo in new tab
map <leader>w3m :tabnew<CR>:W3m<CR>
" opens w3m in new tab
map <leader>e :call Calc()<CR>
" calculates equation in line
map <leader>json :%!python3 -m json.tool<CR>
" beautifulies selected json
map <leader><leader> :call halo#run({'shape':'line'})<CR>
" where is my cursor???
map <leader>start :Startify<CR>
" startpage
map <leader>spt :call feedkeys(':SpSearch ' . input("gib search: "))<CR>
" asks for query for spotify
map <leader>cal :Calendar<CR>
" runs calendar

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
"highlight StartifyHeader guifg=#f04d4d cterm=bold
highlight StartifyHeader guifg=#dedede cterm=bold

" spotify

let g:spotify_token = readfile('/home/krzych/txt/spt_token')[0]
"                               ~~~~~~~~~~~~~~~~~~~~~~~~~~
"                             replace this with path to your spotify token
"                             application

let g:lsp_diagnostics_float_cursor = 1

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

