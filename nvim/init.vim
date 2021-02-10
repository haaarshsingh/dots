"I use Visual Studio Code for most of my projects, and am slowly transitioning to NeoVim. Due to that, this config is copied from https://github.com/yashguptaz/dotfiles-and-config

"any  mkdir ~/.vim/undodir -p
" For copying text hold shift and drag over text and use ctrl+shift+c to copy
" :source %
" Install vim plug https://github.com/junegunn/vim-plug
" :PlugInstall
syntax on

set number
set encoding=utf-8
set pumheight=10
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set pumheight=10
set hidden
set noshowmode
set mouse=a
set backupcopy=yes
set clipboard=unnamedplus
set autoindent
set signcolumn=yes
set nohlsearch
set scrolloff=8
" Press F3 to get in paste mode
set pastetoggle=<F3>
" don't give |ins-completion-menu| messages.
set shortmess+=c

call plug#begin('~/.vim/plugged')

Plug 'haishanh/night-owl.vim'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vim-which-key'
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug '~/.fzf'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'justinmk/vim-sneak'
Plug 'preservim/nerdcommenter'
Plug 'alvan/vim-closetag'
Plug 'unblevable/quick-scope'
Plug 'jparise/vim-graphql'
Plug 'anned20/vimsence'
" Themes
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'haishanh/night-owl.vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'ghifarit53/tokyonight-vim'

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-startify'
Plug 'pantharshit00/vim-prisma'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'wakatime/vim-wakatime'

" Codi Config
" Change the color
highlight CodiVirtualText guifg=cyan

let g:codi#virtual_text_prefix = "❯ "


"
let g:codi#aliases = {
                   \ 'javascript.jsx': 'javascript',
                   \ }

" Git Tooling
" Plug 'mhinz/vim-signify' " Sign Columns
Plug 'tpope/vim-fugitive' " Run `:git` commands
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim' " Git commit browser

call plug#end()

" Appereance
" Night Owl
" If you have vim >=8.0 or Neovim >= 0.1.5
if has('nvim') || has('termguicolors')
  set termguicolors
endif
 
" Tokyo Night
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

" colorscheme 
syntax enable
colorscheme nightfly 
" Make background transparent 
" highlight Normal guibg=none

highlight ColorColumn ctermbg=0 guibg=lightgrey
hi VertSplit ctermfg=Black ctermbg=DarkGray

" Automatically determine next indentation level
filetype plugin on
filetype indent off

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = ''
"let g:airline#extensions#tabline#right_sep = ''
"let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_section_z = '%{coc#status()}'

"" Use 'lucius' if not using a color theme in Vim
"" When using NightOwl use biogoo theme
"let g:airline_theme='biogoo'
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'

let g:airline_left_sep = ''
let g:airline_right_sep = ''

set showtabline=2

set background=dark
set t_Co=256
set fillchars+=vert:\│
set cmdheight=2


" ctrl + p looks nice now :D
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" ripgrep
if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " "

:nmap <C-e> :CocCommand explorer<CR>
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)

" alt + hjkl to resize
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

nnoremap <C-c> <Esc>
nnoremap <C-p> :Files<Cr>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" Vertical Split
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>s :Rg<SPACE>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>


nnoremap <C-s> :w<CR> " Alternate way to save
nnoremap <C-Q> :wq!<CR> " Alternate way to quit

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>
" Close buffer with ctrl+w
nnoremap <silent> <C-w> :bd<CR>

" Better Tabbing
vnoremap < <gv
vnoremap > >gv

" Better Window Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

source $VIMRUNTIME/mswin.vim

" --- CONFIGS ---
" Don't search for node_modules and things when using ctrl+p
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:airline#extensions#coc#enabled = 1

"  Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

" from readme
" if hidden is not set, TextEdit might fail
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Signify Config
" autocmd vimenter * SignifyToggle " Don't start Signify when Vim starts

" Sneak
let g:sneak#label = 1

" case insensitive sneak
let g:sneak#use_ic_scs = 1

" immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
let g:sneak#s_next = 1

" remap so I can use , and ; with f and t
map gS <Plug>Sneak_,
map gs <Plug>Sneak_;

" Change the colors
highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow

" NERDcommentor
" Remap comment key
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle

" Autoclose Tags
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.jsx, *.js, *.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx, *.tsx, *.js'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
" let g:closetag_close_shortcut = '<leader>>'

" Vim Quickscope Config
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=150
let g:startify_enable_special = 0
let g:startify_session_persistence = 1

" Startify
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1

let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Files']            },
    \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ ]

let g:startify_bookmarks = [
    \ { 'i': '~/.config/nvim/init.vim' },
    \ { 'z': '~/.zshrc' },
  \ ]


let g:startify_custom_header = [
\ '        _                             __                  ',
\ ' _   __(_)___ ___     ____ _____     / /_  _______________',
\ '| | / / / __ `__ \   / __ `/ __ \   / __ \/ ___/ ___/ ___/',
\ '| |/ / / / / / / /  / /_/ / /_/ /  / /_/ / /  / /  / /    ',
\ '|___/_/_/ /_/ /_/   \__, /\____/  /_.___/_/  /_/  /_/     ',
\ '                   /____/                                 ',
\]

