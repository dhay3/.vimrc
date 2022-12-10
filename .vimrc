"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"    Cyberpelican
" Version:
"    0.2
" 
" Common references
" github.com/amix/vimrc/blob/master/vimrcs/basic.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" Common Global Options
set nocompatible
set encoding=utf-8
set confirm
set fileformats=unix,dos,mac
set backspace=indent,eol,start

" Disable Annoying Sound On Error
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Indention Options
set autoindent
set smartindent
set smarttab
set tabstop=2
set expandtab
set shiftwidth=2
set shiftround

" Search Options
set hlsearch
set magic
set ignorecase
set incsearch
set smartcase
set showmatch
set matchtime=5

" Command Options
set cmdheight=1
set wildmenu

" Diff Options
" set diff
" set diffopt=filler,vertical

" Display Options
set title
set ruler
set number
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
set scrolloff=7
syntax on
" colorscheme torte

" Miscellaneous Options
set lazyredraw
set autoread
set noautowrite
set spell
set wrap
set nocursorline
set shell=sh
set regexpengine=0
filetype plugin on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Maps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" normal mode maps
map <F2> GoDate: <Esc>:read !date<CR>kJ
" map <space> /

" insert mode maps
imap <F2> <CR>Date: <Esc>:read !date<CR>kJa<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocmds
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" delete trailing white space on save
if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.java,*.py,*.go,*.yml,*.yaml,*.json,*.sh :call CleanExtraSpaces()
endif

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" code autocompletion
" autocmd FileType css  set omnifunc=csscomplete#CompleteCSS
" autocmd FileType js   set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType php  set omnifunc=phpcomplete#CompletePHP


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Code
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
" vimawesome.com
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'valloric/youcompleteme'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
" vimawesome.com/plugin/nerdtree-red
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'

" github.com/tiagofumo/vim-nerdtree-syntax-highlight
" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
" vimawesome.com/plugin/vim-airline-superman
" vimawesome.com/plugin/vim-airline-themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='violet'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
" https://vimawesome.com/plugin/syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_sh_checkers = ['sh']
let g:syntasitc_c_checkers = ['gcc']
let g:syntasitc_cpp_checkers=['cpplint']
let g:syntasitc_python_checkers = ['pylint']
let g:syntasitc_go_checkers = ['golint']
let g:syntasitc_java_checkers = ['javac']
let g:syntasitc_html_checkers = ['eslint']
let g:syntastic_javascript_checkers = ['jslint']
let g:syntasic_json_checkers = ['jsonlint']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_ruby_checkers = ['rubylint']
let g:syntastic_sql_checkers = ['sqllint']
let g:syntastic_xml_checkers = ['xmllint']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntasitc_dockerfile_checkers = ['dockerfile_lint']
let g:syntastic_lua_checkers = ['']
let g:syntastic_perl_checkers = ['']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Solarized
" vimawesome.com/plugin/vim-colors-solarized-ours
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
let g:solarized_termcolors = 256
set background=dark
colorscheme solarized
