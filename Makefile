INSTALL_PATH = ~/
CWD = `pwd`

default: update

install: source
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

update: bundles
	@echo Updating bundles...
	git submodule foreach git pull origin master
	vim +BundleUpdate +qa

bundles:
	vim -u .vimrc.bundles +BundleInstall +qa
