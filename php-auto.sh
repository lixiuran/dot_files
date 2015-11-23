#/bin/bash
# php code auto tip

wget https://github.com/xiaobenxiong/dot_files/blob/master/vim/neocomplcache-8.0.zip -O /tmp/neocomplcache-8.0.zip

unzip /tmp/neocomplcache-8.0.zip -d /tmp/neocomplcache 

v=`vim --version|awk 'NR==1{print}'|awk '{print $5}'|sed 's/\.//g'`

sudo cp -rfv /tmp/neocomplcache/autoload/* /usr/share/vim/vim${v}/autoload/
sudo cp -rfv /tmp/neocomplcache/plugin/* /usr/share/vim/vim${v}/plugin/
sudo cp -rfv /tmp/neocomplcache/doc/* /usr/share/vim/vim${v}/doc/

echo "copy plugin success!"

contents=$(cat << EOF

if &term=="xterm"
  set t_Co=8
  set t_Sb=^[[4%dm
  set t_Sf=^[[3%dm
endif
let g:neocomplcache_enable_at_startup = 1 
EOF
)

echo ${contents} >>~/.vimrc
echo "copy config file success !"
echo "SUCCESS"
