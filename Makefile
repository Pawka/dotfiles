default: install

.PHONY: install
install: vundle update

.PHONY: update
update: symlinks bundles
	@echo Updating plugins
	vim +BundleUpdate +qa

.PHONY: symlinks
symlinks:
	rm -f $(HOME)/.vim $(HOME)/.vimrc $(HOME)/.vimrc.bundles $(HOME)/.vimoutlinerrc
	ln -s $(CURDIR)/.vim $(HOME)/.vim
	ln -s $(CURDIR)/.vimrc $(HOME)/.vimrc
	ln -s $(CURDIR)/.vimrc.bundles $(HOME)/.vimrc.bundles
	ln -s $(CURDIR)/.vimoutlinerrc $(HOME)/.vimoutlinerrc

.PHONY: vundle
VUNDLE_DIR=".vim/bundle/Vundle.vim"
vundle:
	test -d $(VUNDLE_DIR) || git clone https://github.com/gmarik/Vundle.vim.git $(VUNDLE_DIR)

.PHONY: bundles
bundles:
	vim +PluginInstall +qall
