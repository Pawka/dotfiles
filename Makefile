CURRENT_DIR=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
LINKS = \
		config/nvim \
		ctags \
		editorconfig \
		gitconfig \
		gitignore_global \
		oh-my-zsh \
		taskrc \
		tmux \
		tmux.conf \
		vim \
		vimrc \
		vimrc.bundles \
		zsh_custom \
		zshenv \
		zshrc \

.PHONY: install
install: submodules
	@echo Creating symlinks...
	@for file in $(LINKS); do \
		ln -sfn "$(CURRENT_DIR)/$$file" "${HOME}/.$$file" ; \
	done

.PHONY: uninstall
uninstall:
	@echo Removing symlinks...
	@for file in $(LINKS); do \
		rm "${HOME}/.$$file" ; \
	done

.PHONY: submodules
submodules:
	git submodule init


# Configure VIM
.PHONY: vim
vim: vundle ycm
	vim +PluginInstall +qall


# Plugin manager for VIM
.PHONY: vundle
VUNDLE_DIR="vim/bundle/Vundle.vim"
vundle:
	test -d $(VUNDLE_DIR) || git clone https://github.com/gmarik/Vundle.vim.git $(VUNDLE_DIR)

# Compile YouCompleteMe server
.PHONY: ycm
ycm:
	./vim/bundle/YouCompleteMe/install.py --go-completer
