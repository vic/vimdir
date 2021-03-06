" ~/.vimrc (configuration file for vim only)

" pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" filetypes
filetype plugin on
filetype indent on

" set smartindent
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set textwidth=80
set number
set incsearch

" colorscheme default
colorscheme anotherdark

" Gundo
nnoremap <F5> :GundoToggle<CR>

" omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" <C-Space> -> try omnicomplete, fallback to <C-n>
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"

" Django templates
autocmd FileType python set ft=python.django
autocmd FileType html set ft=htmldjango.html

" Maven projects
nnoremap mvn :set wildignore+=target/**,*/**/target/**,*.class<CR>:CommandTFlush<CR>

" closetag
autocmd FileType html,xml,xsl source ~/.vim/bundle/closetag-vim/plugin/closetag.vim

" jquery - activate: ':setfiletype jquery'
autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" ruby
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_classes_in_global=1
let g:ruby_operators=1
let g:ruby_space_errors=1

" erlang
let g:erlangHighlightBIFs=1
let g:erlangCheckFile='~/.vim/bundle/vimerl/compiler/erlang_check.erl'
let g:erlangCompleteFile='~/.vim/bundle/vimerl/autoload/erlang_complete.erl'
let g:erlangCompletionGrep='zgrep'
let g:erlangManPath='/usr/lib64/erlang/man'
let g:erlangManSuffix='\.gz'

" gist
let g:gist_clip_command='xclip -selection clipboard'
let g:gist_detect_filetype=1
let g:gist_show_privates=1

" Automatically remove trailing whitespace on save for these file types.
autocmd FileType c,cpp,erlang,java,javascript,python,ruby autocmd BufWritePre
    \ <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

set nowildmenu
set wildmode=list:longest

" ~/.vimrc ends here
