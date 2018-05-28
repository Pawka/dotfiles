.PHONY: install

CURRENT_DIR=${PWD}

LINKS = \
		ctags \
		gitconfig \
		gitignore_global \
		tmux.conf \
		zshenv \
		zshrc \

install:
	@echo Creating symlinks...
	@for file in $(LINKS); do \
		ln -sf "$(CURRENT_DIR)/$$file" "${HOME}/.$$file" ; \
	done

uninstall:
	@echo Removing symlinks...
	@for file in $(LINKS); do \
		rm "${HOME}/.$$file" ; \
	done
