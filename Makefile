CURRENT_DIR=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
LINKS = \
		config/i3 \
		config/nvim \
		ctags \
		editorconfig \
		gitconfig \
		gitignore_global \
		oh-my-zsh \
		taskrc \
		tmux \
		tmux.conf \
		urlview \
		vim \
		vimrc \
		vimrc.bundles \
		zsh_custom \
		zshenv \
		zshrc \

.PHONY: all
all: install vim

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
	git submodule update --init --recursive


# Configure VIM
.PHONY: vim
vim: vimplugins ycm

# Plugin manager for VIM
PLUG_DIR=vim/autoload/plug.vim
PLUG_URL=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
$(PLUG_DIR):
	curl -fLo $(PLUG_DIR) --create-dirs $(PLUG_URL)

.PHONY: vimplugins
vimplugins: $(PLUG_DIR)
	vim +PlugInstall +qall

# Compile YouCompleteMe server
.PHONY: ycm
ycm: vimplugins
	./vim/plugged/YouCompleteMe/install.py --go-completer --rust-completer
