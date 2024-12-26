#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "Starting the vim config install"

if [[ $EUID -ne 0 ]]; then
  echo "Ce script doit être exécuté en tant que root." >&2
  exit 1
fi


install_vim() {
  echo "Installation des dépendances..."
  apt-get update
  apt-get install -y vim curl || {
    echo "Erreur lors de l'installation des dépendances." >&2
    exit 1
  }
}


cp_config_file() {

    mkdir -p $HOME/.vim
    mv --backup=numbered --suffix=.bak ./vim_config/.vimrc $HOME
    mkdir -p $HOME/.vim/plugged
}


install_vim_plug() {
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}


main() {
    install_vim
    echo "Moving vim configuration files"
    cp_config_file
    echo "install plug"
    install_vim_plug
}

main "$@"
