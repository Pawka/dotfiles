.PHONY: install

CURRENT_DIR=${PWD}

LINKS = ctags gitconfig gitignore_global

install:
	@for file in $(LINKS); do \
		ln -sf "$(CURRENT_DIR)/$$file" "${HOME}/.$$file" ; \
	done

uninstall:
	@for file in $(LINKS); do \
		rm "${HOME}/.$$file" ; \
	done
