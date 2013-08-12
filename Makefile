INSTALL_PATH = ~/
CWD = `pwd`

default: update

install: source powerline
	ln -s $(INSTALL_PATH)/.vim ~/.vim
	ln -s $(INSTALL_PATH)/.vimrc ~/.vimrc
	ln -s $(INSTALL_PATH)/.vimrc.bundles ~/.vimrc.bundles
	@cd $(INSTALL_PATH)
	@git submodule init
	@git submodule update
	@cd $(CWD)

source:
	git clone git://github.com/Pawka/VIM.git $(INSTALL_PATH)
	touch $(INSTALL_PATH)

update: bundles powerline-source
	@echo Updating bundles...
	git submodule foreach git pull origin master
	vim +BundleUpdate +qa

#
# Fetch and install provided required bundles.
# 
bundles:
	vim -u .vimrc.bundles +BundleInstall +qa
