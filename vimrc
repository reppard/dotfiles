set nocompatible
syntax on

filetype off
execute pathogen#infect()
filetype plugin indent on
setlocal foldmethod=syntax

compiler ruby

set hlsearch
set number
set incsearch
set backspace=indent,eol,start
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set ruler
set wrap
set dir=/tmp//
set scrolloff=25
set foldlevelstart=20
set ignorecase
set smartcase

let g:syntastic_puppet_puppetlint_args = '--no-autoloader_layout-check'
let g:AckAllFiles = 0
let g:AckCmd = 'ack-grep --type-add ruby=.feature --ignore-file=*.xml --ignore-dir=vendor/bundle --ignore-dir=tmp 2> /dev/null'

let html_use_css=1
let html_number_lines=0
let html_no_pre=1

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

let g:rubycomplete_buffer_loading = 1

let g:fuzzy_ignore = "*.log,tmp/*,db/sphinx/*,data"
let g:fuzzy_ceiling = 50000
let g:fuzzy_matching_limit = 10

let g:no_html_toolbar = 'yes'

let coffee_no_trailing_space_error = 1

autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

autocmd FileType tex setlocal textwidth=78
autocmd BufNewFile,BufRead *.txt setlocal textwidth=78

" toggle relative number
function! ToggleRelativeNumber()
  if &relativenumber
    set number
  else
    set relativenumber
  endif
endfunction

autocmd FileType ruby runtime ruby_mappings.vim
imap <C-L> <SPACE>=><SPACE>
imap <C-L> <SPACE>=><SPACE>
map <silent> <LocalLeader>py :w !python %<CR>
map <silent> <LocalLeader>ry :w !bundle exec ruby %<CR>
map <silent> <LocalLeader>sp :w !bundle exec rspec %<CR>
map <silent> <LocalLeader>rt :!/usr/bin/ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f<CR>
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>
map <silent> <LocalLeader>ff :CtrlP<CR>
map <silent> <LocalLeader>ft :CtrlPTag<CR>
map <silent> <LocalLeader>fb :CtrlPBuffer<CR>
map <silent> <LocalLeader>fr :CtrlPClearAllCache<CR>
map <silent> <LocalLeader>gd :e product_diff.diff<CR>:%!git diff<CR>:setlocal buftype=nowrite<CR>
map <silent> <LocalLeader>gb :!git blame %<CR>
map <silent> <LocalLeader>nh :nohls<CR>
map <LocalLeader>aw :Ack '<C-R><C-W>'
map <silent> <LocalLeader>bd :bufdo :bd<CR>
nnoremap <silent> <LocalLeader>rr :call ToggleRelativeNumber()<cr>
nnoremap <silent> <LocalLeader><CR> :tabe<CR>
nnoremap <silent> <LocalLeader>[ :tabp<CR>
nnoremap <silent> <LocalLeader>] :tabn<CR>
nnoremap <silent> <LocalLeader><Space> :noh<CR>
nnoremap <silent> <LocalLeader>ww :%s/\s\+$//<CR>:let @/=''<CR><C-o>
map <silent> <localleader>ae :Tab /=<CR>
map <silent> <localleader>ar :Tab /=><CR>

cnoremap <Tab> <C-L><C-D>

if version >= 700
    autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_us
    autocmd FileType tex setlocal spell spelllang=en_us
endif

" ------------------------------------------------------------------
"  Color
" ------------------------------------------------------------------
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized


" Comment colors
highlight Comment ctermfg=DarkMagenta
highlight VirtSplit ctermbg=red guibg=red

nmap <silent> <localleader>d :set background=dark<bar>let g:solarized_termcolors=256<bar> colorscheme solarized<CR>
nmap <silent> <localleader>l :set background=light<bar>let g:solarized_termcolors=256<bar> colorscheme solarized<CR>

set laststatus=2
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
set statusline+=%-40f\                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10(L(%l/%L)%)\           " line
set statusline+=%2(C(%v/125)%)\           " column
set statusline+=%P                        " percentage of file

" http://techspeak.plainlystated.com/2009/08/vim-tohtml-customization.html
function! DivHtml(line1, line2)
  exec a:line1.','.a:line2.'TOhtml'
  %g/<style/normal $dgg
  %s/<\/style>\n<\/head>\n//
  %s/body {/.vim_block {/
  %s/<bods\(.*\)>\n/<div class="vim_block"\1>/
  %s/<\/body>\n<\/html>/<\/div>
  "%s/\n/<br \/>\r/g

  set nonu
endfunction

command! -range=% DivHtml :call DivHtml(<line1>,<line2>)
set undodir=~/.vim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" ctrlp settings
nnoremap <silent> <LocalLeader>pp :CtrlP<CR>
let g:ctrlp_map = ''
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
    \ }
let g:ctrlp_max_files = 0
let g:ctrlp_switch_buffer = 1
let g:ctrlp_max_height = 20
let g:ctrlp_clear_cache_on_exit = 0
