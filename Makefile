CURRENT_DIR=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
LINKS = \
		config/bat \
		config/mako \
		config/newsboat/config \
		config/newsboat/urls \
		config/nvim \
		config/rofi \
		config/sway \
		config/wlogout \
		ctags \
		editorconfig \
		fonts \
		gitconfig \
		gitignore_global \
		oh-my-zsh \
		ripgreprc \
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
all: install

.PHONY: install
install: submodules symlinks

.PHONY: symlinks
symlinks:
	@echo Creating symlinks...
	@for file in $(LINKS); do \
		ln -sfn "$(CURRENT_DIR)/$$file" "${HOME}/.$$file" ; \
	done
	@echo Done.

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

# List of files and directories which are modified locally but changes should be
# ignored. This can be required when OS specific changes are written to a file
# of other tools adds changes the file which should not be commited.
ASSUME_UNCHANGED = \
		gitconfig \
		oh-my-zsh \
		urlview \

.PHONY: assume-unchanged
assume-unchanged:
	git update-index --assume-unchanged $(ASSUME_UNCHANGED)

.PHONY: list-assumed
list-assumed:
	git ls-files -v | grep "^[a-z]"

.PHONY: clean-assumed
clean-assumed:
	git update-index --really-refresh
