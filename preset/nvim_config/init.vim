set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin('~/.vim/plugged')

" gruvbox colours
Plug 'morhetz/gruvbox'

" ag vim
Plug 'mileszs/ack.vim'

Plug 'liuchengxu/vim-clap'

" computer musics
" SuperCollider
Plug 'davidgranstrom/scnvim', { 'do': {-> scnvim#install() } }
Plug 'madskjeldgaard/vim-supercollider-snippets'
Plug 'luisjure/csound-vim'
Plug 'tidalcycles/vim-tidal'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Close tags
Plug 'alvan/vim-closetag'

" Ultisnips
Plug 'SirVer/ultisnips'

" Deoplete
Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-tag'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Dirvish
Plug 'justinmk/vim-dirvish'

" Supertab
Plug 'ervandew/supertab'

" Autoformat
Plug 'Chiel92/vim-autoformat'

" Commentary
Plug 'tpope/vim-commentary'

" Eunuch
Plug 'tpope/vim-eunuch'

" Surround
Plug 'tpope/vim-surround'

" Repeat
Plug 'tpope/vim-repeat'

" Vim sensible
Plug 'tpope/vim-sensible'

" Lightline
Plug 'itchyny/lightline.vim'
Plug 'unblevable/quick-scope'

" Color schemes
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'

call plug#end()

"""""""""""""""""""""""""""""""
" GENERAL REMAPPINGS
"""""""""""""""""""""""""""""""
let mapleader = ","
let maplocalleader="."

" Reload vimrc
nnoremap <leader>rv :source $MYVIMRC<CR>

" Open tmux config file in new tab
nnoremap <leader>at :tabnew ~/.tmux.conf<CR>

" open .vimrc in a new tab
nnoremap <leader>av :tabnew $MYVIMRC<CR>

" open .vimrc in a new tab
nnoremap <leader>aj :tabnew ~/.jackdrc<CR>

" open i3 config in a new tab
nnoremap <leader>ai :tabnew ~/.i3/config<CR>

" open compton / picom config in a new tab
nnoremap <leader>ap :tabnew ~/.config/picom.conf<CR>

" open .bash_profile in a new tab
nnoremap <leader>ab :tabnew ~/.bash_profile<CR>

" Reload bash_profile
nnoremap <leader>rb :! source ~/.bash_profile<CR>

" Window movement
inoremap <C-J> <C-W><C-J>
inoremap <C-K> <C-W><C-K>
inoremap <C-L> <C-W><C-L>
inoremap <C-H> <C-W><C-H> 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Escape in terminal mode
tnoremap <Esc> <C-\><C-n>

" Open terminal
nnoremap <leader>t :sp term://zsh<cr>
nnoremap <leader>vt :vspl term://zsh<cr>

" fzf
nnoremap <C-p> :FZF<CR>

"""""""""""""""""""""""""""""""
" Settings
"""""""""""""""""""""""""""""""
" See search and replace results live
set wildmenu
set wildmode=full
set inccommand=split

" disable annoying conceal from indentLine
let g:indentLine_setConceal = 0
let conceallevel=0
set autoindent
set autowrite
set noexpandtab
set shiftwidth=4
set incsearch
set mouse=a
set tabstop=4
" set expandtab
" text width
" set textwidth=70

syntax enable
syntax on
filetype plugin indent on
set nocompatible 
" filetype off 

filetype plugin on

set relativenumber " show relative line numbers

"""""""""""""""
"  Autopairs  "
"""""""""""""""
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '|':'|'}

" autoformat on save
" au BufWrite * :Autoformat 
let g:autoformat_autoindent = 0
autocmd FileType supercollider let b:autoformat_autoindent=0

let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces = 1
"""""""""""""""""""""""""""""""
" Lightline
"""""""""""""""""""""""""""""""
function! LSPStatus() abort
	let l:diagnosticsDict = LanguageClient#statusLineDiagnosticsCounts()
	let l:errors = get(l:diagnosticsDict,'E',0)
	let l:warnings = get(l:diagnosticsDict,'W',0)
	let l:informations = get(l:diagnosticsDict,'I',0)
	let l:hints = get(l:diagnosticsDict,'H',0)
	return l:errors + l:warnings + l:informations + l:hints == 0 ? "✔ " : "E:" . l:errors . " " . "W :" . l:warnings . "I:" . l:informations . " " . "H:" . l:hints
endfunction

"""""""""""""""""""""""""""""""
" snippets
"""""""""""""""""""""""""""""""
nnoremap <leader>as :UltiSnipsEdit<cr>

" Expand snippets from UltiSnips with tab
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'scnvim-data', 'plugged/vim-snippets/UltiSnips']

"""""""""""""""""""""""""""""""
" SuperCollider stuff
"""""""""""""""""""""""""""""""
" wrap supercollider post window
autocmd FileType scnvim setlocal wrap
" scnvim neovim docs !
let g:scnvim_scdoc = 1

" vertical 'v' or horizontal 'h' split
let g:scnvim_postwin_orientation = 'v'

" position of the post window 'right' or 'left'
let g:scnvim_postwin_direction = 'right'

" default is half the terminal size for vertical and a third for horizontal
let g:scnvim_postwin_size = 50

" automatically open post window on a SuperCollider error
let g:scnvim_postwin_auto_toggle = 1

" duration of the highlight
let g:scnvim_eval_flash_duration = 100

" number of flashes. A value of 0 disables this feature.
let g:scnvim_eval_flash_repeats = 5

" set this variable if you don't want the "echo args" feature
let g:scnvim_echo_args = 1

" configure the color
highlight SCNvimEval guifg=black guibg=white ctermfg=black ctermbg=white
"
" Mappings
function! SCBindings() 
	" Start SCNvim
	 nnoremap <F1> :SCNvimStart<CR>

	" Recompile
	 nnoremap <leader>sk :SCNvimRecompile<CR>

	" Boot server
	 nnoremap <buffer> <leader>b :call scnvim#sclang#send_silent('Server.local.boot')<CR>

	" SCNvim Statusline
	"  nnoremap <F2> :SCNvimStatusLine<CR>

	" Servermeter
	 nnoremap <F2> :call scnvim#sclang#send("s.meter")<CR>

	" Plot nodetree
	 nnoremap <F3> :call scnvim#sclang#send("s.plotTree")<CR>

	" SCNvim tags recompile
	 nnoremap <F11> :SCNvimTags<CR>

	" Clear post window
	 nmap <F4> <Plug>(scnvim-postwindow-clear)

	" Hard stop
	 nmap <F12> <Plug>(scnvim-hard-stop)

	" Echo args
	 nnoremap <buffer>; :call scnvim#util#echo_args()<CR>
	 
	" Regenerate Ctags
	 nnoremap <buffer> <leader>rt :SCNvimTags<CR>
	" Look up implementation for class under cursor
	 nnoremap <buffer> <leader>si :split g]

	 nnoremap <buffer> <leader>rt :SCNvimTags<CR>

	 nnoremap <leader>as :EditSCSnippets<CR>
endfunction

augroup sc
	autocmd!
	autocmd filetype supercollider call SCBindings()
augroup end

""""""""""""""""""""""""""""""
"  Colors
"""""""""""""""""""""""""""""""
let base16colorspace=256  " Access colors present in 256 colorspace
" let g:base16_shell_path=base16-builder/output/shell/

" enable true color for nvim
if has('nvim')
    set inccommand=nosplit " preview changes (:s/) incrementally
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
else
    " put all swap files in one place
    " neovim already does this by default, ~/.local/share/nvim/swap
    set directory^=$HOME/.vim/.swap//
    set ttyfast " assume fast terminal connection
endif

set background=dark
set t_Co=256
colorscheme gruvbox

""""""""""""""""""""""""""""""
" Ignore
"""""""""""""""""""""""""""""""
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildignore+=*.jpg,*.png,*.gif,*.bmp,*.a,*.o,*.tiff,*.nef
set wildignore+=*.mp4,*.mkv,*.avi,*.srt

"""""""""""""""""""""""""""""""
" Deoplete
"""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('smart_case', v:true)

""""""""""
"  Clap  "
""""""""""
" If you want to make the window relative to the whole editor instead of current window:
let g:clap_layout = { 'relative': 'editor' }
let g:clap_layout = { 'width': '50%', 'height': '20%', 'row': '10%', 'col': '25%' }
let g:clap_preview_size = 50

nnoremap <silent><C-p> :<C-u>Clap files<cr>

nnoremap <silent> <Leader>fh :<C-u>Clap history<CR>
nnoremap <silent> <Leader>ff :<C-u>Clap files ++finder=fzf --ignore --hidden --files<cr>
nnoremap <silent> <Leader>ff :<C-u>Clap files <cr>
nnoremap <silent> <Leader>tc :<C-u>Clap colors<CR>
nnoremap <silent> <Leader>fa :<C-u>Clap grep2<CR>
nnoremap <silent> <Leader>fb :<C-u>Clap marks<CR>
