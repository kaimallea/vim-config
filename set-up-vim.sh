#!/bin/sh

NVIM_VERSION="0.6.0"
DARWIN_PACKAGE="https://github.com/neovim/neovim/releases/download/v$NVIM_VERSION/nvim-macos.tar.gz"
LINUX_PACKAGE="https://github.com/neovim/neovim/releases/download/v$NVIM_VERSION/nvim.appimage"
VIM_CONFIG="https://raw.githubusercontent.com/kaimallea/vim-config/master/init.vim"
VIM_CONFIG_DIR="$HOME/.config/nvim"

install_nvim()
{
  if command -v nvim > /dev/null 2>&1
  then
    echo "nvim is already installed, skipping..."
    return
  fi

  # shellcheck disable=SC2164
  cd "$HOME"
  mkdir -p "$HOME/bin"

  if [ "$(uname)" = "Darwin" ]; then
    curl -L -O $DARWIN_PACKAGE
    tar xzvf nvim-macos.tar.gz
    ln -s "$HOME/nvim-osx64/bin/nvim" "$HOME/bin/nvim"
  fi

  if [ "$(uname)" = "Linux" ]; then
    curl -L -O $LINUX_PACKAGE
    chmod u+x nvim.appimage
    ln -s "$HOME/nvim.appimage" "$HOME/bin/nvim"
  fi

  # shellcheck disable=SC2016
  echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
  # shellcheck disable=SC2016
  echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.zshrc"
}

install_nvim_config()
{
  mkdir -p "$VIM_CONFIG_DIR"
  if [ -f "$VIM_CONFIG_DIR/init.vim" ]; then
    echo "init.vim already exists, renaming it to init.vim.old..."
    mv "$VIM_CONFIG_DIR/init.vim" "$VIM_CONFIG_DIR/init.vim.old"
  else
    echo "init.vim does not exist, downloading..."
  fi

  curl -L -O $VIM_CONFIG
  mv init.vim "$VIM_CONFIG_DIR/init.vim"
}

install_nvim
install_nvim_config

"$HOME"/bin/nvim --headless +PlugInstall +qall
