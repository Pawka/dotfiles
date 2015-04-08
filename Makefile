.PHONY: update install source bundles symlinks

default: install

install: submodules bundles symlinks

symlinks:
	rm -f $(HOME)/.vim $(HOME)/.vimrc $(HOME)/.vimrc.bundles $(HOME)/.vimoutlinerrc
	ln -s $(CURDIR)/.vim $(HOME)/.vim
	ln -s $(CURDIR)/.vimrc $(HOME)/.vimrc
	ln -s $(CURDIR)/.vimrc.bundles $(HOME)/.vimrc.bundles
	ln -s $(CURDIR)/.vimoutlinerrc $(HOME)/.vimoutlinerrc

update: submodules-update bundles
	@echo Updating plugins
	vim +BundleUpdate +qa

#
# Fetch and install provided required bundles.
# 
bundles:
	vim -u .vimrc.bundles +BundleInstall +qa

# 
# Submodules
#
.PHONY: submodules submodules-update
submodules:
	git submodule init
	git submodule update -f

submodules-update: submodules
	git submodule foreach git pull origin master
