#!/bin/sh

NVIM_VERSION="0.6.1"
DARWIN_PACKAGE="https://github.com/neovim/neovim/releases/download/v$NVIM_VERSION/nvim-macos.tar.gz"
LINUX_PACKAGE="https://github.com/neovim/neovim/releases/download/v$NVIM_VERSION/nvim.appimage"
VIM_CONFIG="https://raw.githubusercontent.com/kaimallea/vim-config/master/init.vim"
VIM_CONFIG_DIR="${XDG_DATA_HOME:-$HOME/.config/nvim}"
VIM_INSTALL_DIR="${XDG_DATA_HOME:-$HOME/bin}"

install_nvim()
{
  if command -v nvim > /dev/null 2>&1
  then
    echo "nvim is already installed, skipping..."
    return
  fi

  # shellcheck disable=SC2164
  pushd "$HOME"

  mkdir -p "$VIM_INSTALL_DIR"

  echo "installing nvim..."

  if [ "$(uname)" = "Darwin" ]; then
    curl -sSL -O $DARWIN_PACKAGE
    tar xzf nvim-macos.tar.gz
    ln -s "$HOME/nvim-osx64/bin/nvim" "$HOME/bin/nvim"
    rm nvim-macos.tar.gz
  fi

  if [ "$(uname)" = "Linux" ]; then
    curl -sSL -O $LINUX_PACKAGE
    chmod u+x nvim.appimage
    ln -s "$HOME/nvim.appimage" "$HOME/bin/nvim"
  fi

  popd

  echo "adding $VIM_INSTALL_DIR to PATH..."

  # shellcheck disable=SC2016
  test -f "$HOME/.bashrc" && echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
  # shellcheck disable=SC2016
  test -f "$HOME/.zshrc" && echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.zshrc"
}

install_nvim_config()
{
  mkdir -p "$VIM_CONFIG_DIR"
  if [ -f "$VIM_CONFIG_DIR/init.vim" ]; then
    echo "init.vim already exists, renaming it to init.vim.old..."
    mv "$VIM_CONFIG_DIR/init.vim" "$VIM_CONFIG_DIR/init.vim.old"
  fi

  if test -f init.vim; then
    echo "copying $PWD/init.vim into $VIM_CONFIG_DIR..."
    cp init.vim "$VIM_CONFIG_DIR/init.vim"
  else
    echo "downloading init.vim into $VIM_CONFIG_DIR..."
    curl -L "$VIM_CONFIG" --output "$VIM_CONFIG_DIR/init.vim"
  fi
}

install_nvim
install_nvim_config
