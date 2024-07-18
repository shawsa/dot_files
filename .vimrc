set tabstop=4     " Size of a hard tabstop (ts).
set shiftwidth=4  " Size of an indentation (sw).
set noexpandtab   " Always uses tabs instead of space characters (noet).
set autoindent    " Copy indent from current line when starting a new line (ai).

set number
set relativenumber
set number

" Don't ask about writing when opening new file
set hidden

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" trigger `autoread` when files changes on disk
      set autoread
      autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

" show file name
set laststatus=2

"Turn on spellcheck for html
autocmd FileType html setlocal spell

" plug - a plugin manager
call plug#begin()

"###############################
"# File explorer
"###############################
Plug 'preservim/nerdtree'

"###############################
"# HTML code completion
"###############################
Plug 'alvan/vim-closetag'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
" let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

"###############################
"# HTML tag matching
"###############################
Plug 'andymass/vim-matchup'
let g:matchup_surround_enabled=1

"###############################
"# Surround
"###############################
"Used for surrounding text with tags or delimiters
Plug 'tpope/vim-surround'

"###############################
"# Python code completion
"###############################
Plug 'davidhalter/jedi-vim'
let g:pymode_rope = 0

"###############################
"# Ale - linting
"###############################
Plug 'dense-analysis/ale'
let g:ale_fixers = {
	\'python': ['autoimport', 'black', 'isort'],
    \'html': ['prettier'],
    \'css': ['stylelint']
	\}
let g:ale_linters = {
	\ 'html': ['htmlhint'],
	\ 'css': ['stylelint'],
	\}
let g:ale_python_flake8_options = '--max-line-length=88 --extend-ignore=E203'

"###############################
"# Black - official plugin
"###############################
Plug 'psf/black', { 'branch': 'stable' }

"###############################
"# vim-slime - REPL integration 
"###############################
"Plug 'jpalardy/vim-slime'
"let g:slime_python_ipython = 1

"###############################
"# vim-repl - REPL integration 
"###############################
"Plug 'sillybun/vim-repl'
" For IPython version 8+ use version 7.1
" See https://github.com/sillybun/vim-repl/issues/148
"let g:repl_ipython_version = '7.1'
"
"Actually, I will just fork and fix it myself.
Plug 'shawsa/vim-repl'
let g:repl_program = {
            \   'python': 'ipython --profile=vim',
            \   'r': 'R',
			\   'clojure': 'lein repl',
            \   }
let g:repl_predefine_python = {
			\	'autoreload' : '%load_ext auoreload; %autoreload 2',
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
let g:repl_cursor_down = 1
"let g:repl_python_automerge = 1
let g:repl_output_copy_to_register = "r"
nnoremap <leader>r :REPLToggle<Cr>
nnoremap <leader>e :REPLSendSession<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
let g:repl_position = 3

"###############################
"# Fireplace - Closure reple integration
"###############################
Plug 'tpope/vim-fireplace'

"###############################
"# Fugitive - git plugin
"###############################
Plug 'tpope/vim-fugitive'

"###############################
"# commentary - commands for commenting
"###############################
Plug 'tpope/vim-commentary'

"###############################
"# LaTeX
"###############################
Plug 'lervag/vimtex'
syntax enable
let g:vimtex_compiler_latexmk = {'out_dir' : 'texaux',}

"###############################
"# Markdown
"###############################
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


call plug#end()
