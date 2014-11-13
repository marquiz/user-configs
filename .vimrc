set nocompatible
"filetype plugin on     " takes some actions based on your filetype--used for changelog
filetype plugin indent on
set expandtab           " use spaces instead of tabs
set tabstop=4           " tabstops of #
set shiftwidth=4        " indents of #
"set textwidth=78        " screen in 80 columns wide, wrap at 78
set formatoptions=croqt  " add 'l' to not break long lines
set smarttab
set pastetoggle=<F3>
set list listchars=tab:»·,trail:·

hi WhiteSpaceEOL ctermbg=red
match WhiteSpaceEOL /\s\+$/

" highlight 80th column with very dark grey
set colorcolumn=80
highlight ColorColumn ctermbg=233

"hi Tab ctermbg=blue gui=underline guifg=blue
hi Tab ctermbg=blue
2match Tab /\t/

"autocmd FileType c source ~/.vim/c-kern.vim
autocmd FileType c source ~/.vim/c-2.vim
autocmd FileType make setlocal noexpandtab

"copy to systems CLIPBOARD buffer instead of PRIMARY ("mouse selection" buf)
vnoremap <C-c> "+y

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
