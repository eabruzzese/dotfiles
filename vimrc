" Load plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Remap leader to comma
let mapleader=","

" Make vim redrawing much faster
set lazyredraw
set ttyfast

set mouse=a
set guioptions=egm
set guifont=Menlo:h14
set antialias

" More sane window split resizing
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

autocmd ColorScheme janah highlight Normal ctermbg=235
colorscheme janah
set splitbelow
set splitright

" Soft tabs
set shiftwidth=4
set softtabstop=4
set softtabstop=0
set tabstop=4
set expandtab

" Fix numbers.vim bug with Vim 7.4+
set number

" Put temp files in the same spot
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Use english for spellchecking
set spl=en spell
set nospell

" Indent-Guides
autocmd VimEnter * :IndentGuidesEnable
let g:indent_guides_auto_colors = 0
highlight IndentGuidesEven ctermbg=233
highlight IndentGuidesOdd ctermbg=black

" Ignore case on search unless search has uppercase characters
set ignorecase
set smartcase

" Use relative line numbers, but show the absolute number on the current line
set number

" Show whitespace as unicode chars
set listchars=tab:‣\ ,trail:\ ,extends:…,precedes:…,nbsp:˖
set list

" 120-column line
set colorcolumn=120
highlight! link ColorColumn CursorColumn

let g:airline_powerline_fonts            = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_guide_size           = 1
let g:indent_guides_start_level          = 2
let g:flake8_show_in_gutter              = 1

autocmd BufWritePost *.py call Flake8()

let g:numbers_exclude    = ['tagbar', 'gundo', 'minibufexpl']

nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" rainbow_parentheses.vim
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]
let g:rbpt_max = len(g:rbpt_colorpairs)

""""""""""""""""
""" NERDTree """
""""""""""""""""

let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']

nnoremap <leader>f :NERDTreeFind<enter>
nnoremap <leader>n :NERDTreeToggle<enter>

""""""""""""""""""
"""" Keywords """"
""""""""""""""""""
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
  endif
endif

""""""""""""""""""
""" Whitespace """
""""""""""""""""""

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | :call <SID>StripTrailingWhitespaces() | endif

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    silent! %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

""""""""""""""
""" CTRL P """
""""""""""""""

let g:ctrlp_custom_ignore = '\.git$\|tmp$\|\.bundle$\|public/uploads$\|public/system$\|public\/topics$\|public/user_profiles\|\.sass-cache$|node_modules$'

" Use The SilverSearcher to find files. It means we no longer need to cache.
let g:ag_binary = system("which ag | xargs echo -n")
if filereadable(g:ag_binary)
  let g:ctrlp_user_command = g:ag_binary . ' %s -l --nocolor -g ""'
endif

let g:ctrlp_use_caching = 0

"""""""""""""""""""
""" Neocomplete """
"""""""""""""""""""

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"""""""""""""""""
""" Hard Mode """
"""""""""""""""""

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

""""""""""""""""
""" Mappings """
""""""""""""""""
inoremap jj <Esc>
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

"""""""""""""""""
""" Scrolloff """
"""""""""""""""""

set nowrap
set scrolloff=999
set sidescrolloff=999

""""""""""""""""""""
""" Code Folding """
""""""""""""""""""""

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

""""""""""""""""""
""" File Types """
""""""""""""""""""

au BufRead,BufNewFile *.dataview setf handlebars

""""""""""""""""""""
""" Local Config """
""""""""""""""""""""
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
