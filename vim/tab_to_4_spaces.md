# 탭을 4 스페이스로 변경

*(출처: https://stackoverflow.com/a/234578/4728845)*

`~/.vimrc`에 아래 추가.


```vim
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
```