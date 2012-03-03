filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype plugin indent on

" выключаем Vi-совместимость
set nocompatible

" меню с кодировками
set wildmenu
set wildcharm=<Tab>
    menu Encoding.koi8-r        :e ++enc=koi8-r<CR>
    menu Encoding.windows-1251  :e ++enc=cp1251<CR>
    menu Encoding.ibm-866       :e ++enc=ibm866<CR>
    menu Encoding.utf-8         :e ++enc=utf-8 <CR>
map <F8> :emenu Encoding.<TAB>

" активный язык
"language en_US.UTF-8
language ru_RU.utf8

" Минимальная высота окна
set winminheight=0

" Минимальная ширина окна
set winminwidth=0

" смещение окна при заходе курсора за экран
set scrolljump=3

" количество строк перед смещением окна при заходе курсора за экран
set scrolloff=3

" Выключаем надоедливый звонок
set novisualbell
set t_vb=   

" Всегда отображать статусную строку для каждого окна
set laststatus=2
set statusline=%<%f%h%m%r\ %{fugitive#statusline()}\ %b\ %{&encoding}\ 0x%B\ %l,%c%V\ %P
"set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
"set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'

" allow to use backspace instead of "x"
set backspace=indent,eol,start whichwrap+=<,>,[,]
" allow backspacing over everything in insert mode
" set backspace=indent,eol,start

" Размер табуляции
set tabstop=4
set softtabstop=4
set smarttab
set expandtab

" Размер сдвига при нажатии на клавиши << и >>
set shiftwidth=4

" Копирует отступ от предыдущей строки
set autoindent

" Включаем 'умную' автоматическую расстановку отступов
set smartindent

" Включаем подсветку синтаксиса
syntax on

" Включаем перенос строк
set wrap

" Перенос строк по словам, а не по буквам
set linebreak

" Включаем отображение выполняемой в данный момент команды в правом нижнем углу экрана.
" К примеру, если вы наберете 2d, то в правом нижнем углу экрана Vim отобразит строку 2d.
set showcmd

" Все swap файлы будут помещаться в эту папку
"set dir=~/tmp/swp
set directory=~/tmp/vim
set backupdir=~/tmp/vim

" ужасающих розовый цвет дефолтного окошка убираем
hi Pmenu ctermbg=239

" список кодировок, которые Vim будет перебирать при открытии файла. Про имена кодировок читать в :help encoding-names.
set fileencodings=utf-8,cp1251,koi8-r,cp866
" кодировка терминала
set termencoding=utf-8
set formatoptions=tcql
set helplang=ru
set ruler

"folding settings
set foldenable
set foldmethod=indent
set foldnestmax=2
set foldlevelstart=99

set formatoptions-=o "dont continue comments when pushing o/O

colors habiLight
set ignorecase
set smartcase
set hlsearch
set incsearch
set listchars+=precedes:<,extends:>
set sidescroll=5
set sidescrolloff=5
set showmatch
set history=500
set undolevels=100
set ttyfast
set cpoptions+=$
set virtualedit=all
set hidden
set mousehide
" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

set number

let g:netrw_list_hide   = '\.pyc'
let g:proj_flags	= 'giSsTt'

let python_highlight_all=1

highlight Comment ctermfg=darkgrey

nmap <C-T> :tabnew<CR>
nmap <C-PageUp> :tabp<CR>
nmap <C-PageDown> :tabn<CR>

" Toggle paste mode
nmap  ,p :set invpaste<CR>:set paste?<CR>

" Turn off that stupid highlight search
nmap  <Space> :set invhls<CR>:set hls?<CR>

" Set text wrapping toggles
nmap  ,w :set invwrap<CR>:set wrap?<CR>

" Switch to before buffer
nmap ,# :b#<CR>

imap <C-Space> <C-N>

" сохранить файл
imap <F2> <Esc>:w<CR>a
nmap <F2> :w<CR>

" сохранить все файлы
imap <S-F2> <Esc>:wa<CR>a
nmap <S-F2> :wa<CR>

" открыть проводник по файловой системе
nmap <F3> :execute 'NERDTreeToggle ' . getcwd()<CR>

" Удалить буфер
imap <C-F4> <Esc>:bd<CR>a
nmap <C-F4> :bd<CR>

"подсвечивать всё, что вылазит за 80-ю колонку
"au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
"au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.*', -1)

" highlight trailing spaces
au BufNewFile,BufRead * let b:mtrailingws=matchadd('ErrorMsg', '\s\+$', -1)
" highlight tabs between spaces
au BufNewFile,BufRead * let b:mtabbeforesp=matchadd('ErrorMsg', '\v(\t+)\ze( +)', -1)
au BufNewFile,BufRead * let b:mtabaftersp=matchadd('ErrorMsg', '\v( +)\zs(\t+)', -1)


augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

" auto restore position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Taglist
" Toggle tags
nnoremap <silent> <F9> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1

let NERDTreeIgnore=['\.pyc$', '\~$']
let g:bufExplorerShowRelativePath=1

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate

inoremap <C-CR> <Esc>
