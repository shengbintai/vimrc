 set fileencodings=utf-8,gbk,utf-16le,cp1252,iso-8859-15,ucs-bom
 set termencoding=utf-8
 set encoding=utf-8

set rnu
if has('mouse')
  set mouse-=a
endif

if has('linux')
" Enable clipboard from vim to global clipboard
  set clipboard=unnamedplus
endif

set cursorline
set cursorcolumn

set nu
set nowrap
map zl zL
map zh zH
if has("win32")
  nmap <silent> <leader>em :e $MYVIMRC<CR>
  nmap <silent> <leader>ep :e $HOME/.vim/vim_runtime/vimrcs/plugins_config.vim<CR>
  nmap <silent> <leader>ev :e $HOME/.vim/vim_runtime/sources_non_forked/vim-snippets/snippets/verilog.snippets<cr>.
else
  nmap <silent> <leader>em :e $MYVIMRC<CR>
  nmap <silent> <leader>ep :e ~/.vim_runtime/vimrcs/plugins_config.vim<CR>
  nmap <silent> <leader>ev :e!~/.vim_runtime/sources_non_forked/vim-snippets/snippets/verilog.snippets<cr>
  nmap <silent> <F9> :packadd termdebug<CR><ESC>:Termdebug<CR><ESC><c-w>w<c-w>w<c-w>H            
endif
