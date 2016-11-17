#!/bin/bash
makeLink()
{
    if [ ! -e ~/$1 ]; then
        ln -s ~/dotfiles/$1 ~/$1
        echo "make $1"
    else
        echo "$1 is already exist"
    fi
}

makeDir()
{
    if [ ! -d ~/$1 ]; then
        mkdir ~/$1
        echo "make $1 dir"
    else
        echo "$1 is already exist"
    fi
}

echo "make dotfile links"
makeLink .vimrc
makeLink .zshrc
makeLink .zshenv
makeLink .gitconfig
makeLink .gitignore_global
makeLink .tmux.conf

touch ~/.gitconfig.local

echo "make vim dir"
#vim dir
makeDir .vimswap
makeDir .vimbackup
makeDir .vimundo

echo "start dein install"
#dein vim
#:call dein#install()
makeDir .cache
makeDir .cache/dein
makeDir .vim
makeDir .vim/dein

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
sh ./dein_installer.sh ~/.vim/dein
rm dein_installer.sh
