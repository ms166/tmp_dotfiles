" stop cursor from changing in neovim
set guicursor=n-i-v-c:block-Cursor
set guicursor+=n-i-v-c:blinkon0
set guicursor+=i:ver100-iCursor

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

"================== PLUGINS SECTION BEGIN======================
" https://github.com/junegunn/vim-plug/wiki/tutorial

" directory for plugins used by vim-plug plugin manager
call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'https://github.com/preservim/nerdcommenter'

"remove because I am now using CoC
"Plug 'https://github.com/neomake/neomake'

" themes / colour schemes
Plug 'https://github.com/AlessandroYorba/Alduin'
Plug 'https://github.com/mhartington/oceanic-next'
Plug 'https://github.com/tomasr/molokai'
Plug 'https://github.com/rakr/vim-one'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight'
Plug 'mattn/emmet-vim'
Plug 'https://github.com/dunstontc/vim-vscode-theme'
Plug 'https://github.com/flrnd/plastic.vim'
Plug 'sainnhe/edge'
Plug 'https://github.com/franbach/miramare'
Plug 'https://github.com/sainnhe/forest-night'
Plug 'https://github.com/arcticicestudio/nord-vim'
Plug 'https://github.com/cocopon/iceberg.vim'
Plug 'Pocco81/AutoSave.nvim'

" autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"================== PLUGINS SECTION END======================



"==============COLOURSCHEME BEGIN================
if (has("termguicolors"))
    set termguicolors
endif

"for gruvbox
"let g:gruvbox_contrast_dark='light'

colorscheme gruvbox


"==============COLOURSCHEME END================


" neomake settings BEGIN ======================
"call neomake#configure#automake('w')

"let g:neomake_cpp_enabled_makers=['gpp']
"let g:neomake_cpp_gpp_maker = {
            "\ 'exe' : 'g++',
            "\ 'args' : ['-O2', '-std=c++17', '-Wno-unused-result', '-Wshadow','-Wall', '-D_GLIBCXX_DEBUG']
            "\ }

"let g:neomake_python_enabled_makers=['pep8']
"let g:neomake_python_pep8_maker = {
    "\ 'exe' : 'python3'
    "\}

" neomake settings END ======================

" Set relative numbering and absolute numbering for current line
set relativenumber
set nu rnu

" fast scrolling
set ttyfast

" Turn on syntax highlighting
syntax on

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" For plugins to load correctly
filetype plugin indent on


" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap

" formatting options - do not understand
set formatoptions=tqn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" backspace uses these options by default; setting them explicitly anyway
set backspace=indent,eol,start

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Set status line display (copied....create your own)
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [BUFFER=%n]

" Encoding
set encoding=utf-8

" split to the right in case of horizontal split and below for vertical
set splitbelow
set splitright


" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" switch off the flashing when you enter something meaningless
set belloff=all

" show 5 lines above and below cursor
set scrolloff=5

" ========================MAPPINGS BEGIN================================

" remove some default key-bindings
inoremap <F1> <Nop>
nnoremap <F1> <Nop>
nnoremap Q <Nop>
map <F4> <Nop>
tmap <F4> <Nop>

let mapleader=","

inoremap <c-u> <esc>viwUea
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>
nnoremap <leader>w :w<cr>
nnoremap <leader>m :NERDTreeToggle<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>= :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>+ :resize +5<CR>
nnoremap <leader>_ :resize -5<CR>


" mappings for hiding splits
nnoremap <c-p> :hide<CR>

" quit all open buffers
nnoremap <leader>z :qa!<CR>

" turn of NERDCommenter's default mappings
let g:NERDCreateDefaultMappings = 0

" set nerdcommenter key
map <leader>t <plug>NERDCommenterToggle

" remove nerdCommenter mapping - use this when NERDCommenter's default mappings are enabled and you want to remap <leader>ca to something else
"noremap <leader>ca <Nop>

" copy whole file
nnoremap <leader>ca gg<S-V><S-G>"+y<Esc>

" remove highlights
nnoremap <space> :noh<CR>

" auto complete brackets/braces
inoremap {<CR> {<CR>}<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko

" map <leader>e to copy current pwd to system clipboard
nnoremap <leader>e :let @+ = system('pwd')<cr>

" map <C-l> to '\n'
inoremap <C-l> '\n'

" ========================MAPPINGS END================================



" when vim starts go into insert mode
autocmd VimEnter * execute "normal! \i"

" when vim starts source vimrc so that <leader>ca works



"==========compile and run======================
map <F5> :call Compile()<CR>
func! Compile()
    if &filetype == 'java'
        exec "w"
        exec "!javac -d . %"
    elseif &filetype == 'cpp'
        "-std=c++17 also works below
        exec "w"
        exec "!g++ -std=c++17 -Wshadow -Wall -o %< % -fsanitize=address -fsanitize=undefined -g -D_GLIBCXX_DEBUG -g"
    elseif &filetype == 'c'
        exec "w"
        exec "!gcc -o %< %"
    elseif &filetype == 'TEX'
        let file_name = expand('%:t:r')
        exec "w"
        exec "!pdflatex ". file_name
        exec "!bibtex ". file_name
        exec "!pdflatex ". file_name
        exec "!pdflatex ". file_name
    endif
endfunc
"==========compile and run end======================

" to enable java-specific higlighting
let java_highlight_functions = 1
let java_highlight_all = 1

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" remove comment continuation onto next line
au FileType * set fo-=c fo-=r fo-=o

" for deleting inside html tags
nnoremap ;c ?><CR>ld/<<CR><Esc>:noh<CR>

" remap emmet-vim trigger if filetype is html.... TURN OFF WHEN NOT NEEDED
"let g:user_emmet_leader_key=','


"latex tab space
nnoremap ;t i\hspace*{1em}<Esc>

" map key to compile latex using custom script
nnoremap ;g : !compileTex<cr><cr>

" We dont need a python2 provider
let g:loaded_python_provider = 0

" Use tab and shift-tab to cycle through autocomplete suggestions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

