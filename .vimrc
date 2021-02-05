call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'yuttie/comfortable-motion.vim'

call plug#end()

"hide help in nerdtree
let NERDTreeMinimalUI = 1 

"don't show these directories on Nerdtree
let NERDTreeIgnore=['__pycache__', 'node_modules']

"for comfortable_motion thing
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

"don't use comfortable_motion default key map
let g:comfortable_motion_no_default_key_mappings = 1

"don't search these directories and files when performing fuzzy search
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|build|dist)|(\.(swp|ico|git|svn))$'

"essential
if (has('termguicolors'))
  set termguicolors
endif

set backspace=indent,eol,start

"because why not
if (has('mouse'))
  set mouse=a
endif

"hide last status to keep interface clean
set laststatus=0
"
"set limit of text with only have 100 width
set textwidth=100

"perform incremental search (follow buffer when performing search)
set incsearch

"highlight found keyword when performing search
set hlsearch

"show line number
set number

"highlight typo
set spell

"use tab/space width 2 
set tabstop=2
set shiftwidth=2

"convert tab to space
set expandtab

"prevent doubles spaces that created by vim
set nojoinspaces

"highlight line
set cursorline

"use dark as background color
set background=dark

"fzf (fuzzy search) thing
set rtp+=/usr/local/opt/fzf

"synchronize yank thing with os
set clipboard^=unnamed,unnamedplus

"use color scheme one
colorscheme onedark

"yes
filetype plugin indent on

function ToggleBackground()
  if &background == "dark"
    set background=light
  else
    set background=dark
  endif
endfunction

"custom function
"this one for reload vim configuration
command! Reload :so ~/.vimrc

"this one for toggle background
"useful when I work at noon/night
command! ToggleBg call ToggleBackground()

"hide tilde (~) that representing empty line
highlight EndOfBuffer guifg=bg

"auto format all this files with Prettier asynchronously
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml PrettierAsync

"use tab to choose option from coc dropdown
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"and this is for shift tab
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"related with above, start
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
"related with above, end

"fold text
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"coc thing
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"create new tab with ctrl+t
nnoremap <C-t> :tabnew<CR>

"perform fuzzy search content (ripgrep) with ctrl+f
nnoremap <C-f> :Rg<CR>

"perform fuzzy search file nane (fzf) with ctrl+p
nnoremap <C-p> :Files<CR>

"reload syntax highlight with ctrl+c
nnoremap <C-c> :syntax sync fromstart<CR>

"remove highlight (usually after performing search) with ctrl+h
nnoremap <C-h> :noh<CR>

"toggle nerdtree with ctrl+b
nnoremap <C-b> :NERDTreeToggle<CR>

"select all text with ctrl+a
nnoremap <C-a> <esc>ggVG$<CR>

"performing "smooth-fast" scroll to bottom with shift+j
nnoremap <silent> <S-j> :call comfortable_motion#flick(50)<CR>
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(50)<CR>

"performing "smooth-fast" scroll to top with shift+k
nnoremap <silent> <S-k> :call comfortable_motion#flick(-50)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-50)<CR>

"resize current window vertically
"this is to top with shift+up arrow
noremap <silent> <S-Up> :resize +3<CR>

"this is to bottom with shift+down arrow 
noremap <silent> <S-Down> :resize -3<CR>

"this is for horizontally
"this is for right, with shift+right arrow
noremap <silent> <S-Right> :vertical resize +3<CR>

"this is for left, with shift+left arrow
noremap <silent> <S-Left> :vertical resize -3<CR>

"using terminal mode in vim? this is for you!
"back to normal mode just by using double esc
tnoremap <ESC><ESC> <C-\><C-N>

