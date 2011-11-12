How to install on fresh machine?

cd ~
git clone git://github.com/Pawka/VIM.git ~/vim
ln -s ~/vim/.vim ~/.vim
ln -s ~/vim/.vimrc ~/.vimrc
cd ~/vim
git submodule init
git submodule update
