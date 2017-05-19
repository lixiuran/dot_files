#/bin/bash
# when edit php file add comments
# author lixiuran

# download vim plugin from git 
echo "download the vim plugin from git ....."

vimVer=`vim --version|awk 'NR==1{print}'|awk '{print $5}'|sed 's/\.//g'`

file='/tmp/php-doc.vim'

if [ ! -f ${file} ];then
	wget https://raw.githubusercontent.com/xiaobenxiong/dot_files/master/vim/php-doc.vim -O /tmp/php-doc.vim
else
	echo "${file} has already download !"
fi

echo "-------开始复制文件:need sudo !--------"

sudo cp -rfv /tmp/php-doc.vim /usr/share/vim/vim${vimVer}/autoload/php-doc.vim
sudo chmod 644 /usr/share/vim/vim${vimVer}/autoload/php-doc.vim
echo "------复制文件结束--------"

ret=$(grep -l 'php-doc.vim' ~/.vimrc)
if [ $? -eq 0 ];then
	echo "config already write to ~/.vimrc"
	echo "SUCCESS"
	exit 2
fi
echo "\"开始追加 php-doc.vim 配置文件"
echo "source /usr/share/vim/vim${vimVer}/autoload/php-doc.vim" >> ~/.vimrc
echo "inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i" >> ~/.vimrc
echo "nnoremap <C-P> :call PhpDocSingle()<CR>" >> ~/.vimrc
echo "vnoremap <C-P> :call PhpDocRange()<CR>" >> ~/.vimrc
echo "\"结束追加 php-doc.vim 配置文件"

echo "SUCCESS..."

