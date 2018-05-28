.PHONY: install

CURRENT_DIR=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

LINKS = \
		ctags \
		gitconfig \
		gitignore_global \
		tmux.conf \
		vim \
		vimrc \
		vimrc.bundles \
		zshenv \
		zshrc \

install:
	@echo Creating symlinks...
	@for file in $(LINKS); do \
		ln -sfn "$(CURRENT_DIR)/$$file" "${HOME}/.$$file" ; \
	done

uninstall:
	@echo Removing symlinks...
	@for file in $(LINKS); do \
		rm "${HOME}/.$$file" ; \
	done


# Configure VIM
vim: vundle
	vim +PluginInstall +qall


# Plugin manager for VIM
.PHONY: vundle
VUNDLE_DIR="vim/bundle/Vundle.vim"
vundle:
	test -d $(VUNDLE_DIR) || git clone https://github.com/gmarik/Vundle.vim.git $(VUNDLE_DIR)
