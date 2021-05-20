set nocompatible
filetype off

" Plugins {{{
call plug#begin()
Plug 'lervag/vimtex'
" Support bundles
" Plug 'ervandew/supertab'
Plug 'let-def/ocp-indent-vim'
Plug 'Rip-Rip/clang_complete'
" Plug 'scrooloose/syntastic'
Plug 'tpope/vim-abolish'
" Plug 'jgdavey/tslime.vim'
" Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Plug 'benekastah/neomake'
" Plug 'moll/vim-bbye'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'vim-scripts/gitignore'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'int3/vim-extradite'

" Bars, panels, and files
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'jpalardy/vim-slime'
" Plug 'majutsushi/tagbar'
" Plug 'ctrlpvim/ctrlp.vim'

" Text manipulation
Plug 'ntpeters/vim-better-whitespace'
" Plug 'vim-scripts/Align'
" Plug 'tpope/vim-commentary'
" Plug 'godlygeek/tabular'
" Plug 'michaeljsmith/vim-indent-object'
" Plug 'easymotion/vim-easymotion'
" Plug 'ConradIrwin/vim-bracketed-paste'
" Plug 'simnalamburt/vim-mundo'

" Allow pane movement to jump out of vim into tmux
" Plug 'christoomey/vim-tmux-navigator'

" Colorscheme
Plug 'vim-scripts/wombat256.vim'

" Custom bundles
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code Completion
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
" Plug 'styled-components/vim-styled-components'
" Plug 'davidhalter/jedi-vim'
" Plug 'vim-airline/vim-airline-themes'
Plug 'sethwklein/vim-go-fmt-on-save'
Plug 'racer-rust/vim-racer'
" Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Plug 'zah/nim.vim'
" Plug 'hashivim/vim-terraform'
Plug 'rust-lang/rust.vim'
" Plug 'sophacles/vim-processing'
" Plug 'leafgarland/typescript-vim'
Plug 'bazelbuild/vim-bazel'
Plug 'google/vim-maktaba'
" Plug 'google/vim-codefmt'
" Plug 'google/vim-codereview'
" Plug 'Valloric/YouCompleteMe'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'petRUShka/vim-sage'
call plug#end()

filetype plugin indent on
" }}}

" File Specific Settings {{{
" augroup autoformat_settings
  " autocmd FileType bzl AutoFormatBuffer buildifier
  " autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  " autocmd FileType dart AutoFormatBuffer dartfmt
  " autocmd FileType go AutoFormatBuffer gofmt
  " autocmd FileType gn AutoFormatBuffer gn
  " autocmd FileType html,css,json AutoFormatBuffer js-beautify
  " autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
" augroup END
" augroup filetype
  " au! BufRead,BufNewFile *.proto setfiletype proto
" augroup END
" }}}

syntax enable
set omnifunc=syntaxcomplete#Complete
set pastetoggle=<F4>
nnoremap <silent> <F2> :noh<CR>

" Fold Settings {{{
set foldmethod=syntax
set foldlevelstart=99
set foldcolumn=0
" augroup AutoSaveFolds
"   silent autocmd!
"   silent autocmd BufWinLeave ?* silent mkview
"   silent autocmd BufWinEnter ?* silent loadview | AirlineRefresh
"   silent autocmd BufWinEnter ?* source $MYVIMRC | AirlineRefresh
" augroup END
augroup vimrcFold
  autocmd!
  autocmd FileType vim set foldmethod=marker foldlevelstart=99
  autocmd Filetype go set foldmethod=syntax foldlevelstart=99 foldcolumn=0
augroup END
augroup manualFolding
  autocmd!
  autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
augroup END
" }}}

" General {{{
set history=700
set autoread
set formatprg=par
let $PARINIT = 'rTbgqR B=.,?_A_a Q=_s>|'
set updatetime=300
" }}}

" Mappings {{{
noremap Q <nop>
map <silent> <leader>r :redraw!<CR>
nmap <leader>y "*y
vmap <leader>y "*y
nmap <leader>d "*d
vmap <leader>d "*d
nmap <leader>p "*p
vmap <leader>p "*p
command! WQ wq
command! Wq wq
command! W w
command! Q q
command! XA xa
command! Xa xa
cnoreabbrev X x
" }}}

" VIM user interface {{{
set so=7
set wildmenu
set wildmode=list:longest,full
set ruler
set number
set cmdheight=1
set backspace=eol,start,indent
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set noerrorbells
set vb t_vb=
set belloff=all
set t_Co=256
set background=dark
set cursorline
set encoding=utf8
set ffs=unix,dos,mac
set colorcolumn=80
highlight CursorLine cterm=bold ctermbg=233
" set whichwrap+=<,>,h,l
" }}}

" Source the vimrc file after saving it
augroup sourcing
  autocmd!
  autocmd bufwritepost .vimrc source $MYVIMRC
augroup END

" Open file prompt with current path
nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

" Show undo tree
nmap <silent> <leader>u :MundoToggle<CR>

" Text, tab and indent related {{{
set encoding=utf8
set shiftwidth=2
set softtabstop=2
set tabstop=2
set eol
set binary
set expandtab
set list
set listchars=tab:··
set lbr
set tw=500
set ai
set si
highlight ExtraWhitespace ctermbg=red
" match ExtraWhitespace /\s\+$/
" }}}

" Visual mode related {{{
" vnoremap <silent> * :call VisualSelection('f', '')<CR>
" vnoremap <silent> # :call VisualSelection('b', '')<CR>
" }}}
"
set splitright
set splitbelow

nnoremap * #<c-o>
nnoremap # *<c-o>

" Moving around, tabs, windows and buffers {{{
nnoremap <c-i> <c-a>
nnoremap j gj
nnoremap k gk
noremap <c-h> <c-w>h
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-l> <c-w>l
nmap <silent> <leader><cr> :noh\|hi Cursor guibg=red<cr>
augroup last_edit
  autocmd!
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
augroup END
set viminfo^=%
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>
" }}}

" Status line {{{
set viewoptions-=options
" set laststatus=2
" set statusline=
" set statusline+=%f
" set statusline+=%m
" set statusline+=%=
" set statusline+=\ 0x%B
" }}}

" Editing mappings {{{
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
" }}}

" Spell checking {{{
map <leader>ss :setlocal spell!<cr>
" }}}

" Helper functions {{{
function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction
function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction
" }}}

" NERDTree {{{
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
" }}}

" Tags {{{
map <leader>tt :TagbarToggle<CR>
set tags=tags;/
set cst
set csverb
" }}}

" Git {{{
let g:extradite_width = 60
function! NonintrusiveGitGrep(term)
  execute "copen"
  execute "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
  execute "silent! Ggrep " . a:term
  execute "redraw!"
endfunction
command! -nargs=1 GGrep call NonintrusiveGitGrep(<q-args>)
nmap <leader>gs :Gstatus<CR>
nmap <leader>gg :copen<CR>:GGrep
nmap <leader>gl :Extradite!<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gb :Gblame<CR>
function! CommittedFiles()
  let qf_list = []
  let git_output = system("git diff-tree --no-commit-id --name-only -r HEAD\n")
  for committed_file in split(git_output, "\n")
    let qf_item = {'filename': committed_file}
    call add(qf_list, qf_item)
  endfor
  call setqflist(qf_list)
endfunction
nnoremap <silent> <leader>g? :call CommittedFiles()<CR>:copen<CR>
" }}}

" Completion {{{
set completeopt+=longest
" }}}

map <C-n> :NERDTreeToggle<CR>
nmap <C-m> :TagbarOpenAutoClose<CR>

map <F3> :StripWhitespace<CR>

" inoremap <tab> <C-x><C-o>
" inoremap <s-tab> <C-x><C-p>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" start nerdtree if vim is opened with no files as argument
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Nerdtree git plugin symbols
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "ᵐ",
    \ "Staged"    : "ˢ",
    \ "Untracked" : "ᵘ",
    \ "Renamed"   : "ʳ",
    \ "Unmerged"  : "ᶴ",
    \ "Deleted"   : "ˣ",
    \ "Dirty"     : "˜",
    \ "Clean"     : "ᵅ",
    \ "Unknown"   : "?"
\ }

let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
    \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1

let g:SuperTabDefaultCompletionType = '<c-p>'
let g:SuperTabMappingForward = '<tab>'
let g:SuperTabMappingBackward = '<s-tab>'

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

set hidden
let g:racer_cmd = "/home/david/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" merlin
let g:opamshare=substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"
" execute "set rtp+=" . g:opamshare . "/ocp-indent/vim"
" let g:syntastic_ocaml_checkers = ['merlin']

let g:slime_target = "tmux"
let g:clang_library_path='/usr/lib/llvm-3.8/lib/libclang.so.1'

let g:tex_flavor = 'xetex'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_ignore_filters = [
  \ 'LaTeX Font Warning',
\]
let g:vimtex_complete_enabled = 0
let g:vimtex_include_search_enabled = 0
let g:vimtex_indent_enabled = 0
let g:tex_indent_items = 0

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

augroup ReactFiletypes
  autocmd!
  autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx
  autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx
augroup END

let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-eslint']

autocmd Filetype python setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 nosmartindent
autocmd Filetype sage.python setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 nosmartindent
autocmd Filetype go setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=7
autocmd Filetype tex setlocal spelllang=en_us spell
autocmd Filetype markdown setlocal spelllang=en_us spell
