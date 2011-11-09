How to install on fresh machine?

cd ~
git clone git://github.com/Pawka/VIM-configs.git ~/vim
ln -s ~/vim/.vim ~/.vim
ln -s ~/vim/.vim/.vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
