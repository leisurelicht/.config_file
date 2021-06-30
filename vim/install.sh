install_path=$(
  cd $(dirname $0)
  pwd
)
config_path=$(
  cd $install_path/..
  pwd
)
echo "====> Config file root path is: ${config_path}"

function install_from_file() {
  while read -r line; do
    if [[ ! $line =~ "#" ]]; then
      echo "$2 $3 $4 $line"
      $2 $3 $4 $line
    fi
  done <$1
}


if [[ `uname -a` =~ "Darwin" ]]; then
  if ! command -v brew >/dev/null 2>&1; then
    echo "====> Command brew is not be installed, start to install"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "====> Commnad brew is already installed"
  fi

  echo "====> Use brew to intall necessary"

  brew install vim --with-override-system-vi
  brew install neovim
  brew install fcitx-remote-for-osx --with-input-method=osx-pinyin
  brew tap homebrew/cask-fonts
  brew cask install font-hack-nerd-font

  if ! command -v ctags >/dev/null 2>&1; then
    echo "----> Use brew to install ctags"
    brew install ctags
  else
    echo "----> Command ctags is already installed"
  fi

  if ! command -v $(brew --prefix)/bin/pip3 >/dev/null 2>&1; then
    echo "----> Use brew to install pip3"
    brew install python
  else
    echo "----> Command pip3 is already installed"
  fi

  if ! command -v $(brew --prefix)/bin/pip2 >/dev/null 2>&1; then
    echo "----> Use brew to install pip2"
    brew install python@2
  else
    echo "----> Command pip2 is already installed"
  fi

  if ! command -v yarn >/dev/null 2>&1; then
    echo "----> Use brew to install yarn"
    brew install node
    brew install yarn
  else
    echo "----> Command yarn is already installed"
  fi

  if ! command -v go >/dev/null 2>&1; then
    echo "----> Use brew to install go"
    brew install go
  else
    echo "----> Command go is already installed"
  fi

  if ! command -v gem >/dev/null 2>&1; then
    echo "----> Use brew to install gem"
    brew install ruby
  else
    echo "----> Command gem is already installed"
  fi

  pip3list=$($(brew --prefix)/bin/pip3 list | awk '{print $1}' | awk 'NR>2' | xargs echo)
  pip2list=$($(brew --prefix)/bin/pip2 list | awk '{print $1}' | awk 'NR>2' | xargs echo)
  if ! [[ $pip3list =~ 'neovim' || $pip2list =~ 'neovim' ]]; then
    echo "----> Install neovim python client"
    $(brew --prefix)/bin/pip3 install neovim
  else
    echo "----> Neovim python client already installed"
  fi

  echo "====> Upgrade pip "
  $(brew --prefix)/bin/pip3 install --upgrade pip
  # $(brew --prefix)/bin/pip2 install --upgrade pip

  echo "====> Use pip to install package"
  $(brew --prefix)/bin/pip3 install --upgrade -r $install_path/installs/pip3_install
  # $(brew --prefix)/bin/pip2 install --upgrade -r $install_path/installs/pip2_install

  echo "====> Use gem to install package"
  install_from_file $install_path/installs/gem_install gem install

  echo "====> Use yarn to install package"
  install_from_file $install_path/installs/yarn_install yarn install -g

  echo "====> Use go to install package"
  install_from_file $install_path/installs/go_install go get -u


elif [[ `uname -a` =~ "Ubuntu" ]]; then
  echo "====> Use snap to intall necessary"

  snap install nvim --classic

  if ! command -v curl >/dev/null 2>&1; then
      echo "----> Use snap to install curl"
      snap install curl
  else
      echo "----> Command curl is already installed"
  fi

  if ! command -v ctags >/dev/null 2>&1; then
    echo "----> Use snap to install ctags"
    snap install universal-ctags
  else
    echo "----> Command ctags is already installed"
  fi

  if ! command -v /usr/bin/pip3 >/dev/null 2>&1; then
    echo "----> Command pip3 is not installed"
    exit 0
  else
    echo "----> Command pip3 is already installed"
  fi
fi

echo "====> Create back up dir"

echo "====> Back up dir path is: ${config_path}/bak"
if [ ! -d $config_path/bak ]; then
  mkdir -p $config_path/bak
fi

if [ -f ~/.vimrc ]; then
  echo "====> Vim config file vimrc is exist, backup and delete it."
  mv ~/.vimrc $config_path/bak/vimrc.bak
  rm ~/.vimrc >/dev/null 2>&1
fi

echo "====> Create vimrc link"
ln -s $config_path/vim/vimrc ~/.vimrc

if [ ! -d ~/.config/ ]; then
  mkdir ~/.config/
fi

if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi

echo "====> Install vim PlugInstall"
vim +PlugInstall +UpdateRemotePlugins +qa

if [ -d ~/.config/nvim ]; then
    echo "====> Neovim config dir nvim is exist, backup and delete it."
    mv ~/.config/nvim $config_path/bak/nvim_bak
fi

echo "====> Create neovim config file links"
rm -r ~/.config/nvim >/dev/null 2>&1
ln -s ~/.vim ~/.config/nvim

echo "====> Create neovim init file links"
# rm ~/.config/nvim/init.vim >/dev/null 2>&1
ln -s ~/.vimrc ~/.config/nvim/init.vim

# 安装vim插件
echo "====> Install nvim PlugInstall"
nvim +PlugInstall +UpdateRemotePlugins +qa

echo "**** Please change Non-ASCII Font to Hack Nerd Font ****"
