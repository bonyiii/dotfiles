" http://biodegradablegeek.com/2007/12/using-vim-as-a-complete-ruby-on-rails-ide/#config
set nocompatible  " We don't want vi compatibility.

" Add recently accessed projects menu (project plugin)gregsexton/
set viminfo^=!

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" alt+n or alt+p to navigate between entries in QuickFix
"map   :cp
"map   :cn

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

syntax enable

" SuSE default better but this is the 2nd best ;)
" colorscheme ron

" make diff readable if terminal 256 colors
set t_Co=256
"set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
" colorscheme vividchalk  " Uncomment this to set a default theme

" Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set list " Show $ at end of line and trailing space as ~
" with set list on, Display whitespace characters
" listchar = lcs
set listchars=tab:·\ ,trail:·,eol:¬,extends:❯,precedes:❮
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
set hlsearch      " highlight the current line the cursor is on

" " :retab in command line replaces tabs with spaces, is this a comment for myself?
" https://github.com/technicalpickles/pickled-vim/blob/master/home/.vimrc
" Change <Leader>
let mapleader = ","

" Set temporary directory (don't litter local dir with swp/tmp files)
set directory=/tmp/

" Enable tab complete for commands.
" first tab shows all matches. next tab starts cycling through the matches
set wildmenu
set wildmode=list:longest,full

" Nice statusbar
"set laststatus=2
"set statusline=\ "
"set statusline+=%f\ " file name
"set statusline+=[
"set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
"set statusline+=%{&fileformat}] " file format
"set statusline+=%h%1*%m%r%w%0* " flag
"set statusline+=%= " right align
"set statusline+=%-10.(%l,%c%V%)\ %<%P " offset

" enable setting title
set title
"configure title to look like: Vim /path/to/file
set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70

" ctrl-p ignores and whatnot
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux

" Turn on language specific omnifuncs
"autocmd FileType ruby set omnifunc=rubycomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType c set omnifunc=ccomplete#Complete

" https://github.com/technicalpickles/pickled-vim/blob/master/home/.vimrc ends

" gvim specific
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

" http://kien.github.com/ctrlp.vim/#installation
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" Vundle settings
filetype off                   " required!¬

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" My Plugins here:
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails.git'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-endwise'
Plugin 'kien/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elixir-lang/vim-elixir'
Plugin 'vimux'
Plugin 'claco/jasmine.vim'
Plugin 'ivalkeen/vim-ctrlp-tjump'
Plugin 'gregsexton/gitv'
Plugin 'yaymukund/vim-rabl'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'bling/vim-airline'
"Plugin 'https://github.com/vimtaku/hl_matchit.vim'

" Themes
Plugin 'sickill/vim-monokai'
Plugin 'vim-scripts/C64.vim'
Plugin 'tomasr/molokai'
Plugin 'endel/vim-github-colorscheme'

" wtf???
Plugin 'https://github.com/lmeijvogel/vim-yaml-helper.git'

"Plugin 'Floobits/floobits-vim'

" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

call vundle#end()
filetype plugin indent on     " required!

" Remove trailing whitspace
" http://vimcasts.org/episodes/tidying-whitespace/
nnoremap cw :%s/\s\+$//e<CR>
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre *.rb :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.feature :call <SID>StripTrailingWhitespaces()

" An excellent expanation wtf nnoremap is! normal mode non recursive mapping
" http://stackoverflow.com/questions/3776117/vim-what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-ma
nnoremap <Leader>tj :CtrlPtjump<cr>

" Move back and forth in git history
nnoremap <Leader>n :cnext<cr>
nnoremap <Leader>r :cprev<cr>
cabbrev Ex Explore

" http://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
"nnoremap <C-j> <C-W><C-J>
"nnoremap <C-k> <C-W><C-K>
"nnoremap <C-l> <C-W><C-L>
"nnoremap <C-h> <C-W><C-H>

" help pastetoggle
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " " render properly when inside 256-color tmux and GNU screen.
  " " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Bulition from 7.3 just runtime it here
"runtime macros/matchit.vim

" hl_mathchit plugin
"let g:hl_matchit_enable_on_vim_startup = 1
