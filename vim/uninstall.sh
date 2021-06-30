install_path=$(
  cd $(dirname $0)
  pwd
)
config_path=$(
  cd $install_path/..
  pwd
)
echo "====> Config file root path is: ${config_path}"

if [ -h ~/.vimrc ]; then
    echo '====> Uninstall vim'
else
    echo '====> Do not need uninstall'
    exit 0
fi

echo '====> Remove vimrc'
rm ~/.vimrc >/dev/null 2>&1

echo '====> move vimrc file back'
mv $config_path/bak/vimrc.bak ~/.vimrc

echo '====> Remove nvim'
rm -r ~/.config/nvim >/dev/null 2>&1
rm -r ~/.vim/init.vim >/dev/null 2>&1

echo '====> move nvim folder back'
mv $config_path/bak/nvim_bak ~/.config/nvim >/dev/null 2>&1


