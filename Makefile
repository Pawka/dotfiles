all:

update:
		@echo Updating bundles...
		git submodule foreach git pull origin master
