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

