" leader
let mapleader = ','

" setup minpac, a vim-plug interface for native vim packages 
set nocompatible
if empty(glob('~/.vim/autoload/plugpac.vim'))
    silent execute '!git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac'
    silent execute '!curl -fLo ~/.vim/autoload/plugpac.vim --create-dirs https://raw.githubusercontent.com/bennyyip/plugpac.vim/master/plugpac.vim'
    autocmd VimEnter * PackInstall
endif

" enable plugins
call plugpac#begin()

" core
Pack 'k-takata/minpac', { 'type': 'opt' } " vim-plug interface for native vim packages

" behavior
Pack 'tpope/vim-sensible'   " sane defaults
Pack 'tpope/vim-commentary' " toggle comments
Pack 'tpope/vim-surround'   " wrap blocks with parens, brackets, quotes, etc.
Pack 'ctrlpvim/ctrlp.vim'   " full path fuzzy finder
Pack 'dense-analysis/ale'   " async linting and language server client 
Pack 'ervandew/supertab'    " use <Tab> for insert completion
Pack 'majutsushi/tagbar'    " side bar for browsing the current file's tags
Pack 'tpope/vim-unimpaired' " set of standard symmetric key mappings
Pack 'preservim/nerdtree'   " file tree navigation

" look and feel 
Pack 'vim-airline/vim-airline'        " sleek status/tabline
Pack 'vim-airline/vim-airline-themes'
Pack 'chriskempson/base16-vim'        " base16 color schemes for vim
Pack 'jzelinskie/monokai-soda.vim'    " thanks Jimmy!
Pack 'fladson/vim-kitty'              " syntax highlighting for Kitty terminal configs

" language
Pack 'sheerun/vim-polyglot'                           " combo pack
Pack 'fatih/vim-go', { 'for': 'go', 'tag': 'v1.22' }  " go
Pack 'andrewstuart/vim-kubernetes', { 'for': 'yaml' } " k8s yaml and auto-complete

call plugpac#end()

" colors
" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif
colorscheme monokai-soda

" ale
nmap gd <Plug>(ale_go_to_definition)
let g:ale_lint_on_text_changed = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_set_highlights = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" supertab omni-complete
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
inoremap <S-Tab> <C-v><Tab>

" sync default register to clipboard
if has("unnamedplus")
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

" copy absolute path of current file buffer to clipboard
:command CopyPath let @+ = expand('%:p')

" fuzzy finding
nmap <C-B> :CtrlPBuffer<CR>
if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
else
    let g:ctrlp_user_command = "find %s --path '*.git*' -prune -o -type f" 
endif

" airline
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme = 'monochrome'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    let g:airline_symbols.maxliner = '' 
endif
let g:airline#extensions#ale#enabled = 1 " display ale error info in the status bar

map <C-n> :NERDTreeToggle<CR>

" vim-go
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def-tab)
let g:go_fmt_command = "goimports"
let g:go_fmt_options = { 'gofmt': '-s' }
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
if executable('golangci-lint')
    let g:go_metalinter_command='golangci-lint'
endif

" tags
nmap <silent> <leader>o :TagbarToggle<CR>

" toggle paste and wrap
nmap <silent> <leader>p :set invpaste<CR>:set paste?<CR>
nmap <silent> <leader>w :set invwrap<CR>:set wrap?<CR>

" use arrow keys to move blocks
nmap <Up> [e
nmap <Down> ]e
vmap <Up> [egv
vmap <Down> ]egv
nmap <Left> <<
nmap <Right> >>
vmap <Left> <gv
vmap <Right> >gv

" strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " save last search and cursor position
    let _s=@/
    let l = line('.')
    let c = col('.')

    " strip whitespace 
    %s/\s/+$//e

    " restore search history and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! -nargs=0 StripWhitespace call <SID>StripTrailingWhitespaces()

" par formatting
if system('par')
    let &formatprg=par\ -w80
endif

" set an undo directory
set undodir=~/.vimundo

" clear hlsearch on redraw
nnoremap <C-L> :nohlsearch<CR><C-L>

" general vim settings
set cursorline " highlight cursor location 
set completeopt-=preview " don't show extra completion info
set cpoptions=ces$ " compatibility 
set ffs=unix,dos " recognize line endings for unix based systems
set fillchars=vert:. " fill vsplit separator with '.'s 
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo " set commands to open folds
set guioptions-=T " remove gui toolbar
set guioptions-=m " remove gui menu bar 
set hidden " hide buffers when opening other files, without being forced to lose or save changes
set hlsearch " highlight all previous search matches
set ignorecase " ignore case in search patterns
set smartcase " override ignorecase option if the search pattern contains uppercase letters
set lazyredraw " don't redraw screen when executing macros, registers, and other commands -- if needed, redraw tih :redraw
set list listchars=tab:.\ ,eol:¬ " visually indicate tabs and line endings
set nobackup " don't create backup before overwriting a file
set noerrorbells " don't ring bell on error
set noswapfile " store file buffers in memory instead of swapfiles 
set number " show line numbers
set shellslash " always use forward slash when expanding file names
set showfulltag " show function arg template during completion 
set showmatch " briefly jump to matching bracket on bracket insert
set synmaxcol=2048 " max column in which to search for syntax items (highlighting, errors, etc)
set t_Co=256 " number of colors to use
set title " enable setting the terminal title 
set ts=4 sts=4 sw=4 et ci " 4-space tabs
set ttyfast " indicate a fast terminal connection -- improves redraw smoothness 
set belloff=all " don't flash the screen when an event occurs
set virtualedit=all " allow positioning the cursor anywhere, even without a character beneath
set wrapscan " searches wrap around the end of the file

