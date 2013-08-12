.PHONY: update install source bundles symlinks

default: update

install: submodules bundles symlinks

symlinks:
	ln -s $(CURDIR)/vim $(HOME)/.vim
	ln -s $(CURDIR)/vimrc $(HOME)/.vimrc
	ln -s $(CURDIR)/vimrc.bundles $(HOME)/.vimrc.bundles

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
	git submodule update

submodules-update:
	git submodule foreach git pull origin master

