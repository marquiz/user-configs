set nocompatible
"filetype plugin on     " takes some actions based on your filetype--used for changelog
filetype plugin indent on

" EDITOR SETTINGS
set expandtab           " use spaces instead of tabs
set tabstop=4           " number of spaces one tab takes on screen
set shiftwidth=4        " number of spaces for indents
"set textwidth=78        " screen in 80 columns wide, wrap at 78
set formatoptions=croqt " add 'l' to not break long lines
set smarttab            " smart tab for indenting
set pastetoggle=<F3>

" DISPLAY / VIEW SETTINGS
set laststatus=2        " always show the status bar
set ruler               " show cursor position in status bar
" set number              " enable line numbers
set list listchars=tab:»·,trail:·,nbsp:¬   " show special characters
set colorcolumn=80      " highlight 80th column...
hi ColorColumn ctermbg=233          "...with very dark grey

hi WhiteSpaceEOL ctermbg=red        " hilight trailing whitespace with red
match WhiteSpaceEOL /\s\+$/

"hi Tab ctermbg=blue gui=underline guifg=blue
hi Tab ctermbg=blue                 " highlight tab and no-breaking space with blue
2match Tab /[ \t]/

" MISC SETTINGS
set nobackup            " do not create backup files

" Autoload vimrc when editing (and saving) it
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc so $MYVIMRC
augroup END

"autocmd FileType c source ~/.vim/c-kern.vim
autocmd FileType c source ~/.vim/c-2.vim
autocmd FileType html setlocal ts=2 sw=2
autocmd FileType htmldjango setlocal ts=2 sw=2
autocmd FileType make setlocal noexpandtab
autocmd FileType yaml setlocal ts=2 sw=2
autocmd FileType go 2match Tab /[ ]/
autocmd FileType go setlocal nolist

"copy to systems CLIPBOARD buffer instead of PRIMARY ("mouse selection" buf)
vnoremap <C-c> "+y

" Map <Space> to clear search highlight
map <Space> :noh<cr>

"set mouse mode
"if strlen($DISPLAY)
"    set mouse=a
"endif

if has("cscope")
"        set csprg=/usr/local/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb

    " Key Mappings
    map <C-[> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
    map <C-_> :cs find 0 <C-R>=expand("<cword>")<CR><CR>

    " Using 'CTRL-spacebar' then a search type makes the vim window
    " split vertically, with search result displayed in
    " the new window.
    nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif

" Disable vim version warning of the vim-go plugin
let g:go_version_warning = 0

" GO Highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
