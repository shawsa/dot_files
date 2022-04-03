set tabstop=4     " Size of a hard tabstop (ts).
set shiftwidth=4  " Size of an indentation (sw).
set noexpandtab   " Always uses tabs instead of space characters (noet).
set autoindent    " Copy indent from current line when starting a new line (ai).

set number
set relativenumber
set number

" Don't ask about writing when opening new file
set nohidden

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" plug - a plugin manager
call plug#begin()

"###############################
"# File explorer
"###############################
Plug 'preservim/nerdtree'

"###############################
"# vim-repl - REPL integration 
"###############################
Plug 'sillybun/vim-repl'
let g:repl_program = {
            \   'python': 'ipython --profile=vim',
            \   'r': 'R',
            \   }
let g:repl_predefine_python = {
			\	'autoreload' : '%load_ext auoreload; %autoreload 2',
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
let g:repl_cursor_down = 1
"let g:repl_python_automerge = 1
"let g:repl_ipython_version = '7'
"let g:repl_output_copy_to_register = "t"
nnoremap <leader>r :REPLToggle<Cr>
nnoremap <leader>e :REPLSendSession<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
let g:repl_position = 3

"###############################
"# Code completion
"###############################
Plug 'davidhalter/jedi-vim'

"###############################
"# Ale - linting
"###############################
Plug 'dense-analysis/ale'
let g:ale_fixers = {'python': ['autoimport', 'isort']}

call plug#end()
