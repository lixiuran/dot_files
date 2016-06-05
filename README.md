#VIM as a PHP IDE 
1. vim 编写php文件如何添加class注释或function注释？
wget https://raw.githubusercontent.com/xiaobenxiong/dot_files/master/vim/php-doc.vim 

cp ./php-doc.vim /usr/share/vim/vim73/autoload/php-doc.vim [注意你的vim的版本]

vim ~\.vimrc

source /usr/share/vim/vim73/autoload/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR> 

然后保存退出，随便编写一个php文件，在class或function所在的行按下 control+p
看看发生了什么?

2. vim 编写php,java,python 时如何向IDE一样自动提示函数？

wget https://github.com/xiaobenxiong/dot_files/blob/master/vim/neocomplcache-8.0.zip

unzip ./neocomplcache-8.0.zip -d ./neocomplcache 

sudo cp -rfv ./neocomplcache/autoload/* /usr/share/vim/vim73/autoload/
sudo cp -rfv ./neocomplcache/plugin/* /usr/share/vim/vim73/plugin/
sudo cp -rfv ./neocomplcache/doc/* /usr/share/vim/vim73/doc/

vim ~/.vimrc

if &term=="xterm"
  set t_Co=8
  set t_Sb=^[[4%dm
  set t_Sf=^[[3%dm
endif
let g:neocomplcache_enable_at_startup = 1

然后保存退出,随便编写一个php文件,任意写个php自带的函数，看看有没有提示！
