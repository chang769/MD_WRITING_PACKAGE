"
"  \ \   / /_ _|  \/  |  _ \ / ___|
"   \ \ / / | || |\/| | |_) | |
"    \ V /  | || |  | |  _ <| |___
"     \_/  |___|_|  |_|_| \_\\____|
"


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" =======================================================================================================================
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'bling/vim-bufferline'

" Terminal
Plug 'voldikss/vim-floaterm'

" File navigation
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Code assistant
Plug 'jpalardy/vim-slime'

" Auto-Completion: Language Server Protocol
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Undo Tree: easy browes historical changes
Plug 'mbbill/undotree/'

" Error checking
Plug 'w0rp/ale'

" Python
Plug 'vim-scripts/indentpython.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vimwiki/vimwiki'

" LaTeX
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Bookmark
Plug 'kshenoy/vim-signature'
" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

call plug#end()
" =======================================================================================================================

" ===
" === Dress up my vim
" ===
"map <LEADER>c1 :set background=dark<CR>:colorscheme snazzy<CR>:AirlineTheme dracula<CR>
"map <LEADER>c2 :set background=light<CR>:colorscheme ayu<CR>:AirlineTheme ayu_light<CR>

"set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme snazzy
"let g:SnazzyTransparent = 1
"set background=dark
"let g:airline_theme='dracula'

"let g:lightline = {
"  \     'active': {
"  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
"  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
"  \     }
"  \ }

" ===
" Plug - Airline
" ===
" Tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" Theme
let g:airline_theme= 'dark'
"let g:airline_powerline_fonts= 1
"

" ===
" Plug - NerdTree
" ===
" Shortcut to open NERDTree
map nt :NERDTreeToggle<CR>
" Open NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0  && !exists("s:std_in") | NERDTree | endif
" Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1  && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Change default arrows
"let g: NERDTreeDirArrowExpandable = ''
"let g: NERDTreeDirArrowCollapsible = ''
" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$")  == 1  && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Show hidden files and bookmarks by default
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1

" ===
" Plug - NerdTree-git
" ===
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ===
" Plug - coc.nvim ---------------------------------------------auto completion
" ===
let g:coc_global_extensions = [
                        \'coc-marketplace',
                        \'coc-actions',
                        \'coc-snippets',
                        \'coc-clangd',
                        \'coc-json', 
                        \'coc-phpls',
                        \'coc-python', 
                        \'coc-pyright', 
                        \'coc-r-lsp', 
                        \'coc-eslint',
                        \'coc-tsserver',
                        \'coc-prettier',
                        \'coc-html', 
                        \'coc-css', 
                        \'coc-sql',
                        \'coc-sh',
                        \'coc-sourcekit',
                        \'coc-texlab',
                        \'coc-translator',
                        \'coc-todolist',
                        \'coc-lists',
                        \'coc-syntax',
                        \'coc-gitignore',
                        \'coc-explorer',
                        \'coc-flutter-tools',
                        \'coc-vimlsp']

" TextEdit might fail if hidden is not set.
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

" Use <LEADER>d to show documentation in preview window.
nnoremap <silent> <LEADER>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
"|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Folding
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>




" ===
" === Plug - vim-latex-live-preview
" ===


map <C-p> :! zathura $(echo % \| sed 's/tex$/pdf/') & disown<CR>




" ===
" === Plug - Markdown-Preview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
"let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'



" ===
" === Plug - vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_corner_corner='+'
"let g:table_mode_header_fillchar='='


" ===
" === Plug - vimwiki
" ===
let g:vimwiki_list = [{
  \ 'automatic_nested_syntaxes':1,
  \ 'path_html': '~/wiki_html',
  \ 'path': '~/wiki/study/',
  \ 'template_path': '~/.vim/vimwiki/template/',
  \ 'syntax': 'markdown',
  \ 'ext':'.md',
  \ 'template_default':'markdown',
  \ 'custom_wiki2html': '~/.vim/vimwiki/wiki2html.sh',
  \ 'template_ext':'.html'
  \},
  \{
  \ 'automatic_nested_syntaxes':1,
  \ 'path_html': '~/wiki_html',
  \ 'path': '~/wiki/research/',
  \ 'template_path': '~/.vim/vimwiki/template/',
  \ 'syntax': 'markdown',
  \ 'ext':'.md',
  \ 'template_default':'markdown',
  \ 'custom_wiki2html': '~/.vim/vimwiki/wiki2html.sh',
  \ 'template_ext':'.html'
  \},
  \{
  \ 'automatic_nested_syntaxes':1,
  \ 'path_html': '~/wiki_html',
  \ 'path': '~/wiki/personal/',
  \ 'template_path': '~/.vim/vimwiki/template/',
  \ 'syntax': 'markdown',
  \ 'ext':'.md',
  \ 'template_default':'markdown',
  \ 'custom_wiki2html': '~/.vim/vimwiki/wiki2html.sh',
  \ 'template_ext':'.html'
  \}]


" ===
" Plug - Ale
" ===
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']


" ===
" Plug - Undotree
" ===
let g:undotree_DiffAutoOpen = 1
map <LEARDER>L :UndotreeToggle<CR>

" ===
" === Plug - Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>

" ===
" === Plug - Slime
" ===
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
let g:slime_python_ipython = 1

" ===
" === Plug - vim-signiture
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" =======================================================================================================================
" --------------------------------------------------------------
"  editor 
" --------------------------------------------------------------
" for most of the extension plugins
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" Set cursor shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" For color
let &t_ut=''

" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1


" Spelling Check 
map <LEADER>sc :set spell!<CR>

set encoding=utf-8
set mouse=a
set scrolloff=5
set noswapfile
set showmode                    "show the current mode

set number                     " Show current line number
set relativenumber             " Show relative line numbers
set ruler
set cursorline
set wrap
set showcmd     	       " Show command
set wildmenu                   " Use tab to select command

" Size of tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab


" Indentation
set tw=0
set indentexpr= 
set backspace=indent,eol,start 
"set foldmethod=indent
set autoindent

" Undo and redo
set undofile
set undodir=~/.vim/undodir/


" Hidden end of lines
set list
"set listchars=tab:>> ,trail:

" Status, command workdirectory, and auto-lastlocation
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" leader key ==========================================================================
let mapleader=' '
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
" =====================================================================================


syntax enable
syntax on

" Search
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>


" Disable direction buttons
inoremap <Up> <Nop>
nnoremap <Up> <Nop>
inoremap <Down> <Nop>
nnoremap <Down> <Nop>
inoremap <Left> <Nop>
nnoremap <Left> <Nop>
inoremap <Right> <Nop>
nnoremap <Right> <Nop>
inoremap jk <Esc>
inoremap <Ese> <Nop>

" ===
" Quick vertical move
" ===
nnoremap J 5j
nnoremap K 5k
nnoremap H 7h
nnoremap L 7l


" ===
" Navigate by display line rather than real line
" ===
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j


" ===
" use system clipboard
" https://anuragpeshne.github.io/essays/vim/7.html
" ===
set pastetoggle=<F2>
set clipboard+=unnamedplus

noremap y "+y
noremap yy "+yy
noremap Y "+y$
noremap x "+x
noremap dd "+dd
noremap d "+d
noremap D "+D
noremap c "+c
noremap C "+C
noremap p "+p
noremap P "+P


" ===
" In insert or command mode, move normally by using Ctrl
" ===
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" ===
" Quick save and quit
" ===
map s <nop>
map S :w<CR>
"map Q :q<CR>
map R :source $MYVIMRC<CR>

" ===
" Windows
" ===
" Split windows
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>
" Moving actions
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
" Change window size
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>
" Change split direction
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

" ===
" Tabs
" ===
map <LEADER>e :tabe<CR>:e 


" ===============================================================================================================================
let $TMPDIR=$HOME."/tmp"
let g:python_host_prog = "/Users/shuch/anaconda3/bin/python"
let g:python3_host_prog = "/Users/shuch/anaconda3/bin/python3.8"
" ===============================================================================================================================





" ===============================================================================================================================
" Markdown-snippets
" ===============================================================================================================================
"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,l --------<Enter>


" ===============================================================================================================================
" LaTex-snippets
" ===============================================================================================================================



" ===============================================================================================================================
" HTML-snippets
" ===============================================================================================================================





" ===============================================================================================================================
" Auto compile
" ===============================================================================================================================
map <LEADER>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'tex'
    exec "!pdflatex %"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc

map <LEADER>R :call CompileBuildrrr()<CR>
func! CompileBuildrrr()
  exec "w"
  if &filetype == 'vim'
    exec "source $MYVIMRC"
  elseif &filetype == 'markdown'
    exec "echo"
  endif
endfunc




